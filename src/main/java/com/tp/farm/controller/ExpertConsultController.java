package com.tp.farm.controller;

import com.tp.farm.service.ExpertConsultService;
import com.tp.farm.service.ExpertReplyService;
import com.tp.farm.vo.ExpertConsultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/*
        작성자 : 이영록, 윤태검
        내용 : 전문가 상담 / consultController

        일시 : 2022.12.07(수) ~
*/

@RestController ("consultController")
@RequestMapping("/consult")
public class ExpertConsultController {

    private ServletContext context;

    @Autowired
    private ExpertConsultService expertConsultService;

    @Autowired
    private ExpertReplyService expertReplyService;

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
        List<ExpertConsultVO> list = expertConsultService.selectAllBoard();
        mav.addObject("list", list);
        mav.setViewName("/service/Advice");
        return mav;
    }
    //공지사항 내용 페이지 - 이영록, 윤태검
    @RequestMapping(value="/ReadBoard.do", method=RequestMethod.GET)
    public ModelAndView readBoard(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String ecb_seq = request.getParameter("ecb_seq");
        boolean flag = false;
        flag = expertConsultService.readCount(ecb_seq);
        ExpertConsultVO consultation = expertConsultService.readBoard(ecb_seq);
        mav.addObject("consultation", consultation);
        mav.setViewName("/notice/NoticeRead");
        return mav;
    }
    //공지사항 생성 페이지 - 이영록, 윤태검
    @RequestMapping(value="/CreateNewBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView CreateNewBoard(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/notice/NoticeWrite";
        mav.setViewName(viewName);
        return mav;
    }
    //공지사항 생성 실행 주소(20221101수정판) - 이영록, 윤태검
    @RequestMapping(value="/createBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView createBoard(@RequestParam("ecb_attachedFile") MultipartFile attachFile , HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        ExpertConsultVO consultation = new ExpertConsultVO();
        boolean flag = false;
        consultation.setEcb_id(request.getParameter("ecb_id"));
        consultation.setEcb_title(request.getParameter("ecb_title"));
        consultation.setEcb_content(request.getParameter("ecb_content"));
        try {
            flag = expertConsultService.createBoard(consultation, attachFile);
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
        String ecb_seq = request.getParameter("ecb_seq");
        String token = request.getParameter("token");
        try {
            boolean flag = expertConsultService.boardDownload(response, ecb_seq, token);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        mav.setViewName("redirect:./BoardList.do");
        return mav;
    }

    @RequestMapping(value="/viewUpdatePage.do", method=RequestMethod.GET)
    public ModelAndView viewUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mav = new ModelAndView();
        String ecb_seq = request.getParameter("ecb_seq");
        ExpertConsultVO consultation = expertConsultService.readBoard(ecb_seq);
        mav.addObject("consultation", consultation);
        mav.setViewName("/notice/NoticeUpdate");
        return mav;
    }
    @RequestMapping(value="/updateBoard.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateBoard(@RequestParam("ecb_attachedFile") MultipartFile attachFile, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        ExpertConsultVO consultation = new ExpertConsultVO();
        boolean flag = false;
        consultation.setEcb_seq(Integer.parseInt(request.getParameter("ecb_seq")));
        consultation.setEcb_title(request.getParameter("ecb_title"));
        consultation.setEcb_content(request.getParameter("ecb_content"));
        try {
            flag = expertConsultService.updateBoard(consultation, attachFile);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if(flag) {
            System.out.println("게시글 생성 완료");
        }
        mav.setViewName("redirect:./ReadBoard.do?nb_seq=" + consultation.getEcb_seq());
        return mav;
    }

    @RequestMapping(value="/delete.do", method=RequestMethod.GET)
    public ModelAndView delete(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();
        String ecb_seq = request.getParameter("ecb_seq");
        boolean flag = false;
        flag = expertConsultService.deleteBoard(ecb_seq);
        if(flag) {
            System.out.println("delete 완료");
        }
        mav.setViewName("redirect:./BoardList.do");
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
