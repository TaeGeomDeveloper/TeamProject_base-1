package com.tp.farm.controller;

import com.tp.farm.service.BoardService;
import com.tp.farm.service.ReplyService;
import com.tp.farm.vo.BoardVO;
import com.tp.farm.vo.MemberVO;
import com.tp.farm.vo.ReplyVO;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/*
        작성자 : 이영록
        내용 : 자유게시판 작성

        일시 : 2022.11.01 ~
*/

@RestController ("boardController")
@RequestMapping("/board")
public class BoardController {

    private ServletContext context;

    @Autowired
    private BoardService boardService;
    @Autowired
    private ReplyService replyService;

    // 메인 페이지
    @RequestMapping(value = "/Main.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Main");
        System.out.println("hi"); // git 연습용.
        return mav;
    }
    //게시글 전체조회 페이지 - 이영록
    @RequestMapping(value="/BoardList.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("게시글 ");
        ModelAndView mav = new ModelAndView();
        String cb_category = request.getParameter("cb_category");
        if(cb_category==null) {
            List<BoardVO> list = boardService.selectAllBoard();
            mav.addObject("list", list);
        } else {
            List<BoardVO> list = boardService.selectCategoryBoard(cb_category);
            mav.addObject("list", list);
        }
        mav.setViewName("/board/Community");
        return mav;
    }
    //게시글 내용 페이지 - 이영록
    @RequestMapping(value="/ReadBoard.do", method=RequestMethod.GET)
    public ModelAndView readBoard(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mav = new ModelAndView();
        String cb_seq = request.getParameter("cb_seq");
        boolean flag = false;
        flag = boardService.readCount(cb_seq);
        BoardVO board = boardService.readBoard(cb_seq);
        List<ReplyVO> replyList = replyService.readAllReply(cb_seq);
        mav.addObject("board", board);
        mav.addObject("replyList", replyList);
        mav.setViewName("/board/CommnuityRead");
        return mav;
    }
    //게시글 생성 페이지 - 이영록
    @RequestMapping(value="/CreateNewBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView CreateNewBoard(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) throws Exception {
        System.out.println("게시글 작성");
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/board/CommunityWrite";
        mav.setViewName(viewName);
        return mav;
    }
    //게시글 생성 실행 주소(20221101수정판) - 이영록
    @RequestMapping(value="/createBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView createBoard(@RequestParam("cb_attachedFile") MultipartFile attachFile , HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        BoardVO board = new BoardVO();
        boolean flag = false;
        board.setCb_category(request.getParameter("cb_category"));
        board.setCb_id(request.getParameter("cb_id"));
        board.setCb_title(request.getParameter("cb_title"));
        board.setCb_content(request.getParameter("cb_content"));
        try {
            flag = boardService.createBoard(board, attachFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(flag) {
            System.out.println("게시글 생성 완료");
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }
    //게시글 첨부파일 다운 실행 주소 - 이영록
    @RequestMapping(value="/download.do", method=RequestMethod.GET)
    public ModelAndView download(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String cb_seq = request.getParameter("cb_seq");
        String token = request.getParameter("token");
        try {
            boolean flag = boardService.boardDownload(response, cb_seq, token);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }

    @RequestMapping(value="/viewUpdatePage.do", method=RequestMethod.GET)
    public ModelAndView viewUpdate(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String cb_seq = request.getParameter("cb_seq");
        BoardVO board = boardService.readBoard(cb_seq);
        mav.addObject("board", board);
        mav.setViewName("/board/UpdateBoard");
        return mav;
    }
    @RequestMapping(value="/updateBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(@RequestParam("cb_attachedFile") MultipartFile attachFile, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        BoardVO board = new BoardVO();
        boolean flag = false;
        board.setCb_seq(Integer.parseInt(request.getParameter("cb_seq")));
        board.setCb_title(request.getParameter("cb_title"));
        board.setCb_content(request.getParameter("cb_content"));
        try {
            flag = boardService.updateBoard(board, attachFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(flag) {
            System.out.println("게시글 수정 완료");
        }
        mav.setViewName("redirect:./ReadBoard.do?cb_seq=" + board.getCb_seq());
        return mav;
    }

    @RequestMapping(value="/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String cb_seq = request.getParameter("cb_seq");
        boolean flag = false;
        flag = boardService.deleteBoard(cb_seq);
        if(flag) {
            System.out.println("delete 완료");
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }

    @RequestMapping(value="summerimages.do", method=RequestMethod.POST)
    public ResponseEntity<?> summerimage(@RequestParam("file") MultipartFile img, HttpServletRequest request) throws IOException {
        String path =  request.getSession().getServletContext().getRealPath("resources/upload");
        //이미지 파일명 변경
        Random random = new Random();
        long currentTime = System.currentTimeMillis();
        int	randomValue = random.nextInt(100);
        String imgName = img.getOriginalFilename();
        String fileName = Long.toString(currentTime) + "-" + UUID.randomUUID().toString().substring(0,13) + imgName.substring(imgName.lastIndexOf("."));
        //업로드
        File file = new File(path , fileName);
        img.transferTo(file);
        return ResponseEntity.ok().body("/gwinongin/resources/upload/"+fileName);
    }

    //////////////////////////////////////////
    //      ↑게시판            ↓리플         //
    /////////////////////////////////////////

    @RequestMapping(value="/writeReply.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView writeReply(@ModelAttribute("info") ReplyVO reply, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        boolean flag = false;
        flag = replyService.writeReply(reply);
        if(flag) {
            System.out.println("reply 성공");
        } else {
            System.out.println("reply 실패");
        }
        mav.setViewName("redirect:./ReadBoard.do?cb_seq="+reply.getCb_seq());
        return mav;
    }

    @RequestMapping(value="/writeReReply.do", method={RequestMethod.GET, RequestMethod.POST}, produces="application/json")
    public ModelAndView writeReReply(@RequestBody ReplyVO reply, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        boolean flag = false;
        System.out.println("hi");
        System.out.println(reply);
        flag = replyService.writeReReply(reply);
        if(flag) {
            System.out.println("ReReply 성공");
        } else {
            System.out.println("ReReply 실패");
        }
        mav.setViewName("redirect:./ReadBoard.do?cb_seq="+reply.getCb_seq());
        return mav;
    }

    @RequestMapping(value="/viewUpdateReply.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView viewUpdateReply(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String cb_seq = request.getParameter("cb_seq");
        String cbr_seq = request.getParameter("cbr_seq");
        boolean flag = false;
        BoardVO board = boardService.readBoard(cb_seq);
        List<ReplyVO> replyList = replyService.readAllReply(cb_seq);
        mav.addObject("cbr_seq", cbr_seq);
        mav.addObject("board", board);
        mav.addObject("replyList", replyList);
        mav.setViewName("/board/ReplyUpdate");
        return mav;
    }

    @RequestMapping(value="/updateReply.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateReply(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        ReplyVO reply = new ReplyVO();
        reply.setCb_seq(Integer.parseInt(request.getParameter("cb_seq")));
        reply.setCbr_seq(Integer.parseInt(request.getParameter("cbr_seq")));
        reply.setCbr_content(request.getParameter("cbr_content"));
        boolean flag = replyService.updateReplyContent(reply);
        mav.setViewName("redirect:./ReadBoard.do?cb_seq="+reply.getCb_seq());
        return mav;
    }

    @RequestMapping(value="/deleteReply.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView deleteReply(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        //jsp에서 받는 파라메터
        String cbSeq = request.getParameter("cb_seq");
        int cbrSeq = Integer.parseInt(request.getParameter("cbr_seq"));
        String bundleSeq = request.getParameter("cbr_bundleSeq");
        int currentSeq = Integer.parseInt(request.getParameter("cbr_currentSeq"));
        //대댓글 확인
        int bundleSeqCount = replyService.countBundle(bundleSeq, cbSeq);
        //if문을 통한 delete분류
        boolean flag = false;
        if((currentSeq==1)&&(bundleSeqCount>1)) {
            flag = replyService.updateReplyDelText(cbrSeq);
        } else  {
            flag = replyService.deleteReply(cbrSeq);
        }
        if(flag) {
            System.out.println("삭제처리 완료");
        }
        mav.setViewName("redirect:./ReadBoard.do?cb_seq="+cbSeq);
        return mav;
    }

    private String getViewName(HttpServletRequest request) throws Exception {
        String contextPath = request.getContextPath();
        String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
        if (uri == null || uri.trim().equals("")) {
            uri = request.getRequestURI();
        }


        int begin = 0; //
        if (!((contextPath == null) || ("".equals(contextPath)))) {
            begin = contextPath.length();
        }

        int end;
        if (uri.indexOf(";") != -1) {
            end = uri.indexOf(";");
        } else if (uri.indexOf("?") != -1) {
            end = uri.indexOf("?");
        } else {
            end = uri.length();
        }


        String fileName = uri.substring(begin, end);
        if (fileName.indexOf(".") != -1) {
            fileName = fileName.substring(0, fileName.lastIndexOf("."));
        }
        if (fileName.lastIndexOf("/") != -1) {
            fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
        }
        return fileName;
    }

}
