package com.tp.farm.controller;

import com.tp.farm.dao.MemberDAO;
import com.tp.farm.service.CsvService;
import com.tp.farm.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Iterator;
import java.util.List;

@RestController("adminController")
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CsvService csvService;

    @Autowired
    private MemberDAO memberDAO;

    @RequestMapping(value = "/deleteMember.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView();

        String mi_id = request.getParameter("mi_id");
        System.out.println("memberID--->" + mi_id);
        memberDAO.deleteOneMember(mi_id);
        mav.setViewName("redirect:/admin/Manager.do");
        return mav;
    }

    // 관리자 페이지
    @RequestMapping(value = {"/Manager.do"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView membersInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        List<MemberVO> List = this.memberDAO.selectAllMemeber();
        mav.addObject("List", List);
        mav.setViewName("/admin/Manager");
        return mav;
    }
    // CSV 삽입
    @RequestMapping(value = {"/InputCSV.do"}, method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView csvService(@RequestParam("files") List<MultipartFile> files, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mav = new ModelAndView();
        String uploadFolder = "C:\\upload";
        Iterator var6 = files.iterator();

        while (var6.hasNext()) {
            MultipartFile file = (MultipartFile) var6.next();
            String originalName = file.getOriginalFilename();
            String filePath = uploadFolder + "/" + originalName;
            File dest = new File(filePath);
            file.transferTo(dest);
        }

        csvService.insertDataTraditionalMarket();
        csvService.insertDataFarmlandPrice();
        csvService.insertCropData();
        mav.setViewName("redirect:/admin/Manager.do");
        return mav;
    }
    // CSV 데이터 삭제
    @RequestMapping(value = "/DeleteTraditionalMarket.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void DeleteTraditionalMarket() throws  Exception{
        System.out.println("전국전통시장표준데이터_수정본 삭제");
        csvService.deleteDataTraditionalMarket();
    }
    @RequestMapping(value = "/DeleteFarmlandPriceData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void DeleteFarmlandPriceData() throws  Exception{
        System.out.println("농지_시세_테이블 삭제");
        csvService.deleteDataFarmlandPrice();
    }
    @RequestMapping(value = "/DeleteCropData.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void DeleteCropData() throws  Exception{
        System.out.println("농작물_자료조사표 삭제");
        csvService.deleteCropData();
    }

}
