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

import com.tp.farm.dao.SurveyInputDAO;
import com.tp.farm.vo.SurveyInputVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/*
        작성자 : 윤태검

        내용 : 귀농지원 서비스

 */

@RestController("SupServiceController")
@RequestMapping("/service")
public class CropRecController {

    @Autowired
    private SurveyInputDAO surveyInputDAO;

//    @Autowired
//    private CropRecommendService service;

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
    public ModelAndView FarmProcess(HttpServletRequest request, HttpServletResponse response) throws  Exception{
        ModelAndView mav = new ModelAndView();
        String msi_id = request.getParameter("msi_id");
        String msi_memberName = request.getParameter("msi_memberName");
        int msi_memberAge = Integer.parseInt(request.getParameter("msi_memberAge"));
        String msi_memberGender = request.getParameter("msi_memberGender");
        String msi_desiredArea = request.getParameter("msi_desiredArea");
        String msi_desiredAreaDetail = request.getParameter("msi_desiredAreaDetail");
        int msi_desiredTimeSowing = Integer.parseInt(request.getParameter("msi_desiredTimeSowing"));
        String msi_desiredTimeSowingPart = request.getParameter("msi_desiredTimeSowingPart");
        int msi_desiredHarvestTime = Integer.parseInt(request.getParameter("msi_desiredHarvestTime"));
        String msi_desiredHarvestTimePart = request.getParameter("msi_desiredHarvestTimePart");
        String msi_cropClassification = request.getParameter("msi_cropClassification");
        String msi_cultivationMethod = request.getParameter("msi_cultivationMethod");
        String msi_farmingExperience = request.getParameter("msi_farmingExperience");
        String msi_hadMachinery = request.getParameter("msi_hadMachinery");
        int msi_capital = Integer.parseInt(request.getParameter("msi_capital"));
        int msi_holdingLand = Integer.parseInt(request.getParameter("msi_holdingLand"));
        SurveyInputVO surveyInput = new SurveyInputVO(msi_id, msi_memberName, msi_memberAge, msi_memberGender, msi_desiredArea, msi_desiredAreaDetail,
                                                        msi_desiredTimeSowing, msi_desiredTimeSowingPart, msi_desiredHarvestTime, msi_desiredHarvestTimePart,
                                                        msi_cropClassification, msi_cultivationMethod, msi_farmingExperience, msi_hadMachinery,
                                                        msi_capital, msi_holdingLand);

        if(surveyInput==null){
            mav.setViewName("/service/Farm");
        }else{
            surveyInputDAO.insertFarmInfo(surveyInput);
            mav.setViewName("/service/Farm");
        }

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
