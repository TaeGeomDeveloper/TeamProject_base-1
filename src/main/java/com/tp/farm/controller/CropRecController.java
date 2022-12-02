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

import com.tp.farm.dao.CropRecDAO;
import com.tp.farm.dao.SurveyInputDAO;
import com.tp.farm.service.CropRecService;
import com.tp.farm.vo.CropDataVO;
import com.tp.farm.vo.SurveyInputVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    @Autowired
    private CropRecService cropRecService;

    @Autowired
    private CropRecDAO cropRecDAO;

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
    @RequestMapping(value = "/FarmProcess.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
    public List<CropDataVO> FarmProcess(@RequestBody SurveyInputVO surveyInput) throws  Exception{

        if(surveyInput == null){
            System.out.println("theres no VO founded");
        } else {
            System.out.println("VO ON");
            System.out.println(surveyInput.toString());
        }
        System.out.println("작물 선택 절차");
        surveyInputDAO.insertSurveyInput(surveyInput);

        System.out.println("작물 정보 리스트 받아오기");
        List<CropDataVO> list = cropRecDAO.select(surveyInput);
        System.out.println("리스트 크기 : " + list.size());

        return list;
    }

    @RequestMapping(value = "/CropRecIdCheck.do", method = RequestMethod.GET)
    public ResponseEntity<String> cropRecIdCheck(@RequestParam("msi_id") String msi_id) {
        boolean flag = false;
        System.out.println("idCheck : " + msi_id);
        flag = cropRecService.cropRecIdCheck(msi_id);
        return new ResponseEntity<String>(String.valueOf(flag), HttpStatus.OK);
    }

    @RequestMapping(value = "/DeleteSurvey.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> deleteSurvey(@RequestParam("msi_id") String msi_id, HttpServletRequest request){
        boolean flag = false;
//        System.out.println("controller " + msi_id);
        flag = cropRecService.deleteSurvey(msi_id);
//        System.out.println("controller flag " + flag);
        return new ResponseEntity<String>(String.valueOf(flag), HttpStatus.OK);
    }


    // 작물 선택 결과지 페이지
    @RequestMapping(value = "/FarmInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView FarmInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String viewName = this.getViewName(request);

        // 회원 정보
        String mi_id = request.getParameter("mi_id");
        // 작물 정보
        String cd_idx = request.getParameter("cd_idx");

        viewName= "/service/FarmInfo";
        mav.setViewName(viewName);
        return mav;
    }

//    @RequestMapping(value = "/FarmProcess.do", method = {RequestMethod.GET, RequestMethod.POST}, produces="application/json")
//     public List<CropDataVO> FarmProcess(@RequestBody SurveyInputVO vo) throws  Exception{
//        if(vo == null){
//            System.out.println("theres no VO found");
//        } else {
//            System.out.println("VO ON");
//            System.out.println("id: "+vo.getMsi_id());
//        }
//        System.out.println("작물 선택 절차");
////        System.out.println(selectVO.getCs_location());
//        surveyInputDAO.insertFarmInfo(vo);
//
//         return list;
//    }

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