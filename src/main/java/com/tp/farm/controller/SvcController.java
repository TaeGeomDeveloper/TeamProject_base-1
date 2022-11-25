/*
    작성자 : 윤태검
    
    귀농 지원 서비스 페이지

    1) 알바 모집
    2) 상담 문의
    3) 작물 선택
    4) 일손 구하기
    5) 귀농 절차
 */

package com.tp.farm.controller;

import com.tp.farm.dao.CsvDAO;
import com.tp.farm.dao.SvcDAO;
import com.tp.farm.service.SvcService;
import com.tp.farm.vo.BoardVO;
import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.CropSelectVO;
import java.io.*;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
        작성자 : 윤태검

        내용 : 귀농지원 서비스

 */

@RestController("SvcController")
@RequestMapping("/service")
public class SvcController {

    @Autowired
    private SvcDAO svcDao;
    private CsvDAO csvDAO;
    private CropSelectVO selectVO;
//    @Autowired
//    private SvcService service;

    // 메인 페이지
    @RequestMapping(value = "/Main.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Main(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("Main");
        return mav;
    }
    // 주산지 날씨 정보
    @RequestMapping(value = "/Weather.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Weather(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/Weather";
        mav.setViewName(viewName);
        return mav;
    }
    // 알바 모집
    @RequestMapping(value = "/Job.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Job(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/Job";
        mav.setViewName(viewName);
        return mav;
    }
    // 상담 문의
    @RequestMapping(value = "/Advice.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Advice(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/Advice";
        mav.setViewName(viewName);
        return mav;
    }
    // 일손 구하기
    @RequestMapping(value = "/Recruitment.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Recruitment(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/Recruitment";
        mav.setViewName(viewName);
        return mav;
    }
    // 농부 절차
    @RequestMapping(value = "/HowFarmer.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView HowFarmer(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/HowFarmer";
        mav.setViewName(viewName);
        return mav;
    }
    // 농업 용품
    @RequestMapping(value = "/AgriculturalSupplies.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView AgriculturalSupplies(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/AgriculturalSupplies";
        mav.setViewName(viewName);
        return mav;
    }
    // 작물 선택
    @RequestMapping(value = "/Farm.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView Farm(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);
        viewName= "/service/Farm";
        mav.setViewName(viewName);
        return mav;
    }
     // 작물 선택 절차
    @RequestMapping(value = "/FarmProcess.do", method = {RequestMethod.GET, RequestMethod.POST})
    public List<CropDataVO> FarmProcess(@RequestBody CropSelectVO selectVO) throws  Exception{

        if(selectVO == null){
            System.out.println("theres no VO founded");
        } else {
            System.out.println("VO ON");
        }
        System.out.println("작물 선택 절차");
        svcDao.insertFarmInfo(selectVO);

        System.out.println("작물 정보 리스트 받아오기");
        List<CropDataVO> list = svcDao.selectAll();

        return list;
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
