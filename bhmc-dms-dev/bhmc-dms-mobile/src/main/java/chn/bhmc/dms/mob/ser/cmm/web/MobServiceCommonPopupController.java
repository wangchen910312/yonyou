package chn.bhmc.dms.mob.ser.cmm.web;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.cmm.service.VehOfCustInfoService;
import chn.bhmc.dms.ser.cmm.vo.VehOfCustInfoSearchVO;
import chn.bhmc.dms.ser.rev.service.ReservationReceiptService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonPopupController.java
 * @Description : 서비스 팝업 컨트롤러
 * @author Sung sin Park
 * @since 2016. 2. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 22.     Sung sin Park     최초 생성
 * </pre>
 */
@Controller
public class MobServiceCommonPopupController extends HController{

    @Autowired
    VehOfCustInfoService vehOfCustInfoService;

    @Autowired
    ReservationReceiptService reservationReceiptService;


    /**
     *
     * 고객 통합 정보(차량마스터, 고객정보, 차량소유주)를 조회한다.
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/mob/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do" , method=RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehOfCustInfo(@RequestBody VehOfCustInfoSearchVO searchVO)throws Exception{

        SearchResult result = new SearchResult();

        result.setTotal(vehOfCustInfoService.selectVehOfCustInfoByConditionCnt(searchVO));


        if(result.getTotal() !=0 ){
            result.setData(vehOfCustInfoService.selectVehOfCustInfoByCondition(searchVO));
        }

        return result;
    }


}
