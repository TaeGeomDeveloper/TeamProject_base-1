package com.tp.farm.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController("HomeController")
@RequestMapping("/home")
public class HomeController {

    // 메인 페이지
    @RequestMapping(value = "/Main.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Main");
        return mav;
    }
    // 스마트팜 장비 리스트
    @RequestMapping(value = "/SmartfarmSalesList.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SmartfarmSalesList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/SmartfarmSalesList";
        mav.setViewName(viewName);
        return mav;
    }
    // 작성 페이지
    @RequestMapping(value = "/WriteSales.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView WriteSales(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/WriteSales";
        mav.setViewName(viewName);
        return mav;
    }
    // 스마트팜 이란
    @RequestMapping(value = "/SmartFarmInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView SmartFarmInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/SmartFarmInfo";
        mav.setViewName(viewName);
        return mav;
    }
    // 홍보 게시판
    @RequestMapping(value = "/Promote.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Promote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/Promote";
        mav.setViewName(viewName);
        return mav;
    }
    // 농업 정보
    @RequestMapping(value = "/FarmInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView FarmInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/FarmInfo";
        mav.setViewName(viewName);
        return mav;
    }
    // 서비스소개
    @RequestMapping(value = "/Service.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Service(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/Service";
        mav.setViewName(viewName);
        return mav;
    }
    // 공지사항
    @RequestMapping(value = "/Notice.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Notice(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName = "/home/Notice";
        mav.setViewName(viewName);
        return mav;
    }
    // 자유 게시판
    @RequestMapping(value = "/Board.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Board(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/Board";
        mav.setViewName(viewName);
        return mav;
    }
    // 자료실
    @RequestMapping(value = "/Reference.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Reference(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/Reference";
        mav.setViewName(viewName);
        return mav;
    }
    // 지원 사업
    @RequestMapping(value = "/Support.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Support(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/Support";
        mav.setViewName(viewName);
        return mav;
    }
    // 관련 뉴스
    @RequestMapping(value = "/News.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView News(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/News";
        mav.setViewName(viewName);
        return mav;
    }
    // 아이탬 정보
    @RequestMapping(value = "/ItemInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView ItemInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/home/ItemInfo";
        mav.setViewName(viewName);
        return mav;
    }

    // View 처리
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
