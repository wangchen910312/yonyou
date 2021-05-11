package chn.bhmc.dms.mis.tot.web;

import java.util.Calendar;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.mis.tot.service.TotalMisStatusService;
import chn.bhmc.dms.mis.tot.vo.TotalMisStatusVO;

/**
 * <pre>
 * [딜러사] 종합 경영 현황
 * </pre>
 *
 * @ClassName   : TotalMisStatusController.java
 * @Description : [딜러사] 종합 경영 현황
 * @author chibeom.song
 * @since 2016. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 15.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TotalMisStatusController extends HController {

    /**
     * [딜러사] 종합 경영 현황 서비스
     */
    @Resource(name="totalMisStatusService")
    TotalMisStatusService TotalMisStatusService;

    /**
     * [딜러사] 종합 경영 현황
     * @return
     */
    @RequestMapping(value = "/mis/tot/selectTotalMisStatus.do", method = RequestMethod.GET)
    public String selectTotalMisStatus(Model model) throws Exception {

        return "/mis/tot/selectTotalMisStatus";
    }

    /**
     * [딜러사] 종합 경영 현황 - 종합현황
     * @return
     */
    @RequestMapping(value = "/mis/tot/selectTotalStatus.do")
    public String selectTotalStatus(Model model, TotalMisStatusVO totalMisStatusVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        String newStatusDate = "";

        totalMisStatusVO.setsMisSaleDate(totalMisStatusVO.getsMisSaleDate());

        if(totalMisStatusVO.getsMisSaleDate() == null || totalMisStatusVO.getsMisSaleDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            if(statusDate < 10 ) {
                newStatusDate = "0" + String.valueOf(statusDate);
            } else {
                newStatusDate = String.valueOf(statusDate);
            }
            totalMisStatusVO.setsMisSaleDate(String.valueOf(statusYear)+newStatusMonth+newStatusDate);
        }

        return "/mis/tot/selectTotalStatus";
    }

    /**
     * [딜러사] 종합 경영 현황 - 판매현황
     * @return
     */
    @RequestMapping(value = "/mis/tot/selectSaleStatus.do")
    public String selectSaleStatus(Model model, TotalMisStatusVO totalMisStatusVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;

        String newStatusMonth = "";

        totalMisStatusVO.setsMisSaleDate(totalMisStatusVO.getsMisSaleDate());

        if(totalMisStatusVO.getsMisSaleDate() == null || totalMisStatusVO.getsMisSaleDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            totalMisStatusVO.setsMisSaleDate(String.valueOf(statusYear)+newStatusMonth);
        }

        return "/mis/tot/selectSaleStatus";
    }

    /**
     * [딜러사] 종합 경영 현황 - 고객현황
     * @return
     */
    @RequestMapping(value = "/mis/tot/selectCustStatus.do")
    public String selectCustStatus(Model model, TotalMisStatusVO totalMisStatusVO) throws Exception {

        java.util.Calendar cal = java.util.Calendar.getInstance();

        int statusYear = cal.get(Calendar.YEAR);
        int statusMonth = cal.get(Calendar.MONTH)+1;
        //int statusDate = cal.get(Calendar.DATE);

        String newStatusMonth = "";
        //String newStatusDate = "";

        totalMisStatusVO.setsMisCustDate(totalMisStatusVO.getsMisCustDate());

        if(totalMisStatusVO.getsMisCustDate() == null || totalMisStatusVO.getsMisCustDate() == ""){
            if(statusMonth < 10 ) {
                newStatusMonth = "0" + String.valueOf(statusMonth);
            } else {
                newStatusMonth = String.valueOf(statusMonth);
            }
            //if(statusDate < 10 ) {
            //    newStatusDate = "0" + String.valueOf(statusDate);
            //} else {
            //    newStatusDate = String.valueOf(statusDate);
            //}
            totalMisStatusVO.setsMisCustDate(String.valueOf(statusYear)+newStatusMonth);
        }

        return "/mis/tot/selectCustStatus";
    }

}
