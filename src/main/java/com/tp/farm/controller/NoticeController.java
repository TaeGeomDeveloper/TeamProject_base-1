package com.tp.farm.controller;

import com.tp.farm.service.BoardService;
import com.tp.farm.service.NoticeBoardService;
import com.tp.farm.service.ReplyService;
import com.tp.farm.vo.BoardVO;
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
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

/*
        작성자 : 이영록, 윤태검
        내용 : 공지사항 작성 / NoticeController

        일시 : 2022.11.03(목) ~
*/

@RestController ("noticeController")
@RequestMapping("/notice")
public class NoticeController {

    private ServletContext context;

    @Autowired
    private NoticeBoardService noticeBoardService;

    @Autowired
    private ReplyService replyService;

    // 메인 페이지
    @RequestMapping(value = "/Main.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Main");
        return mav;
    }
    //공지사항 전체조회 페이지 - 이영록, 윤태검
    @RequestMapping(value="/BoardList.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(HttpServletRequest request, HttpServletResponse response) {
        System.out.println("공지사항 리스트 ");
        ModelAndView mav = new ModelAndView();
        List<BoardVO> list = noticeBoardService.selectAllBoard();
        mav.addObject("list", list);
        mav.setViewName("/notice/Notice");
        return mav;
    }
    //공지사항 내용 페이지 - 이영록, 윤태검
    @RequestMapping(value="/ReadBoard.do", method=RequestMethod.GET)
    public ModelAndView readBoard(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView mav = new ModelAndView();
        String seq = request.getParameter("seq");
        boolean flag = false;
        BoardVO board = noticeBoardService.readBoard(seq);
        mav.addObject("board", board);
        mav.setViewName("/notice/NoticeRead");
        return mav;
    }
    //공지사항 생성 페이지 - 이영록, 윤태검
    @RequestMapping(value="/CreateNewBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView CreateNewBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("공지사항 작성");
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/notice/NoticeWrite";
        mav.setViewName(viewName);
        return mav;
    }
    //공지사항 생성 실행 주소(20221101수정판) - 이영록, 윤태검
    @RequestMapping(value="/createBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView createBoard(@RequestParam("cb_attachedFile") MultipartFile attachFile , HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        BoardVO board = new BoardVO();
        boolean flag = false;
        board.setCb_id(request.getParameter("cb_id"));
        board.setCb_title(request.getParameter("cb_title"));
        board.setCb_content(request.getParameter("cb_content"));
        try {
            flag = noticeBoardService.createBoard(board, attachFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(flag) {
            System.out.println("게시글 생성 완료");
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }
    //공지사항 첨부파일 다운 실행 주소 - 이영록, 윤태검
    @RequestMapping(value="/download.do", method=RequestMethod.GET)
    public ModelAndView download(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String seq = request.getParameter("seq");
        String token = request.getParameter("token");
        try {
            boolean flag = noticeBoardService.boardDownload(response, seq, token);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }

    @RequestMapping(value="/viewUpdatePage.do", method=RequestMethod.GET)
    public ModelAndView viewUpdate(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String seq = request.getParameter("seq");
        mav.addObject("seq", seq);
        mav.setViewName("updateTest");
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
            flag = noticeBoardService.updateBoard(board, attachFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(flag) {
            System.out.println("게시글 생성 완료");
        }
        mav.setViewName("redirect:./ReadBoard.do?cb_seq=" + board.getCb_seq());
        return mav;
    }

    @RequestMapping(value="/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String seq = request.getParameter("seq");
        boolean flag = false;
        flag = noticeBoardService.deleteBoard(seq);
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
        int   randomValue = random.nextInt(100);
        String imgName = img.getOriginalFilename();
        String fileName = Long.toString(currentTime) + "-" + UUID.randomUUID().toString().substring(0,13) + imgName.substring(imgName.lastIndexOf("."));
        //업로드
        File file = new File(path , fileName);
        img.transferTo(file);
        return ResponseEntity.ok().body("/gwinongin/resources/upload/"+fileName);
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
