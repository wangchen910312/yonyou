package chn.bhmc.dms.mob.ser.ro.web;

import java.util.List;

import able.com.web.HController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mob.cmm.util.MobUtil;
import chn.bhmc.dms.mob.cmm.vo.MobLoginVO;
import chn.bhmc.dms.ser.ro.service.RepairOrderService;
import chn.bhmc.dms.ser.ro.vo.RepairOrderSearchVO;
import chn.bhmc.dms.ser.ro.vo.RepairOrderVO;
import chn.bhmc.dms.ser.svi.service.BayManageService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MobRepairOrderController.java
 * @Description : MobRepairOrderController
 * @author JongHee Lim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 23.     JongHee Lim     최초 생성
 * </pre>
 */
@Controller
public class MobRepairOrderController extends HController {

    /**
     * RO접수 서비스
     */
    @Autowired
    RepairOrderService repairOrderService;

    /**
     * BAY관리 마스터 서비스
     */
    @Autowired
    BayManageService bayManageService;

    /**
     * 공통코드 마스터 서비스
     */
    @Autowired
    CommonCodeService commonCodeService;


    /**
     * RO접수 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/repairOrder/selectRepairOrders.do",  method = RequestMethod.POST)
    public @ResponseBody SearchResult selectRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;

     }


    @RequestMapping(value="/mob/ser/ro/repairOrder/selectTreeRepairOrders.do",  method = RequestMethod.POST)
    @ResponseBody
    public List<RepairOrderVO> selectTreeRepairOrders(@RequestBody RepairOrderSearchVO searchVO) throws Exception {
        MobLoginVO mobLoginVO = MobUtil.getLoginVO();
        searchVO.setsDlrCd( mobLoginVO.getDlrCd() );
        /*
        SearchResult result = new SearchResult();

        result.setTotal(repairOrderService.selectRepairOrderByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            result.setData(repairOrderService.selectRepairOrderByCondition(searchVO));
        }

        return result;
        */


        return repairOrderService.selectRepairOrderByCondition(searchVO);


     }




    /**
     * RO접수 상세 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RepairOrderSearchVO
     * @return
     */
    @RequestMapping(value="/mob/ser/ro/repairOrder/selectRepairOrderByKey.do",  method = RequestMethod.POST)
    public @ResponseBody RepairOrderVO selectRepairOrderByKey(@RequestBody RepairOrderSearchVO searchVO) throws Exception {

        return repairOrderService.selectRepairOrderByKey(searchVO);

     }


}
