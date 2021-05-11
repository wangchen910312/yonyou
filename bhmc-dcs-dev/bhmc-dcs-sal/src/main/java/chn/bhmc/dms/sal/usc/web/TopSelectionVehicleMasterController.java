package chn.bhmc.dms.sal.usc.web;


import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.sal.usc.service.TopSelectionService;
import chn.bhmc.dms.sal.usc.vo.TopSelectionCustomerVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;



/**
 * 중고차 수선시스템 - 차량정보
 *
 * @author Kim yewon
 * @since 2016.06.07
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                    수정자                               수정내용
 *  -------------    ------------    ---------------------------
 *   2016.06.07       Kim yewon             최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/usc/topSelection")
public class TopSelectionVehicleMasterController extends HController {


    /**
     * 중고차 수선시스템 서비스
     */
    @Resource(name="topSelectionService")
    TopSelectionService topSelectionService;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 중고차수선시스템 - 차량마스터정보  View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleMasterMain.do", method = RequestMethod.GET)
    public String selectVehicleMain(Model model,
            @Param("carId") String carId,@Param("id") String id) throws Exception {

        //차량정보
        TopSelectionSearchVO searchVO = new TopSelectionSearchVO();
        searchVO.setsCarId(carId);
        searchVO.setsId(id);
        TopSelectionUsedCarVO topSelectionUsedCarVO = topSelectionService.selectVehicleMaster(searchVO);

        //매입채널$정보유통경로
/*        String buyFrom = topSelectionUsedCarVO.getBuyfrom();
        if(buyFrom != null){
            String[] buyFromArray = buyFrom.split("\\$");
            if(buyFromArray.length > 0){
                topSelectionUsedCarVO.setBuyfrom1(buyFromArray[0]);
                topSelectionUsedCarVO.setBuyfrom2(buyFromArray[1]);
            }else {
                topSelectionUsedCarVO.setBuyfrom1(topSelectionUsedCarVO.getBuyfrom());
            }
        }*/


        //상업보험
/*        String insurance = topSelectionUsedCarVO.getInsurance();
        if(insurance != null){
            //String array = insurance.replaceAll("\\$",",");
            String[] insuranceArray = insurance.split("\\$");
            if(insuranceArray.length > 0){
                topSelectionUsedCarVO.setInsurance1(insuranceArray[0]);
                topSelectionUsedCarVO.setInsurance2(insuranceArray[1]);
                topSelectionUsedCarVO.setInsurance3(insuranceArray[2]);
                topSelectionUsedCarVO.setInsurance4(insuranceArray[3]);
                topSelectionUsedCarVO.setInsurance5(insuranceArray[4]);
                topSelectionUsedCarVO.setInsurance6(insuranceArray[5]);
                topSelectionUsedCarVO.setInsurance7(insuranceArray[6]);
                topSelectionUsedCarVO.setInsurance8(insuranceArray[7]);
                topSelectionUsedCarVO.setInsurance9(insuranceArray[8]);
            }
        }*/


        //고객소유영수증
/*        String isregcard = topSelectionUsedCarVO.getIsregcard();
        if(isregcard != null){
            String[] isregcardArray = isregcard.split("\\$");

            if(isregcardArray.length > 0){
                topSelectionUsedCarVO.setIsregcard1(isregcardArray[0]);
                topSelectionUsedCarVO.setIsregcard2(isregcardArray[1]);
                topSelectionUsedCarVO.setIsregcard3(isregcardArray[2]);
                topSelectionUsedCarVO.setIsregcard4(isregcardArray[3]);
                topSelectionUsedCarVO.setIsregcard5(isregcardArray[4]);
                topSelectionUsedCarVO.setIsregcard6(isregcardArray[5]);
                topSelectionUsedCarVO.setIsregcard7(isregcardArray[6].substring(0,1));
            }
        }*/


        TopSelectionCustomerVO topSelectionCustomerVO = topSelectionService.selectVehicleCustomer(searchVO);

/*        //연계인1,2
        String commContactMan = topSelectionCustomerVO.getComcontactman();
        if(commContactMan != null){
            String[] commContactManArray = commContactMan.split(",");

            if(commContactManArray.length > 1){
                topSelectionCustomerVO.setComcontactman1(commContactManArray[0]);
                topSelectionCustomerVO.setComcontactman2(commContactManArray[1]);
            }else {
                topSelectionCustomerVO.setComcontactman1(topSelectionCustomerVO.getComcontactman());
            }
        }

        //집단고객 연락처 1,2
        String comPhone = topSelectionCustomerVO.getComphone();
        if(comPhone != null){
            String[] comPhoneArray = comPhone.split(",");
            if(comPhoneArray.length > 1){
                topSelectionCustomerVO.setComphone1(comPhoneArray[0]);
                topSelectionCustomerVO.setComphone2(comPhoneArray[1]);
            }else {
                topSelectionCustomerVO.setComphone1(topSelectionCustomerVO.getComphone());
            }
        }

        //개인고객 연락처1,2
        String perPhone = topSelectionCustomerVO.getPerphone();
        if(perPhone != null){
            String[] perPhoneArray = perPhone.split(",");
            if(perPhoneArray.length > 1){
                topSelectionCustomerVO.setPerphone1(perPhoneArray[0]);
                topSelectionCustomerVO.setPerphone2(perPhoneArray[1]);
            }else {
                topSelectionCustomerVO.setPerphone1(topSelectionCustomerVO.getPerphone());
            }
        }*/


        model.addAttribute("topSelectionUsedCarVO", topSelectionUsedCarVO);
        model.addAttribute("topSelectionCustomerVO", topSelectionCustomerVO);
        model.addAttribute("carId", carId);
        model.addAttribute("id", id);

        return "/sal/usc/topSelection/selectVehicleMasterMain";
    }





}
