package chn.bhmc.dms.bat.crm.cso.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;

import chn.bhmc.dms.bat.crm.cso.service.BatSalesOpptStatisticsService;
import chn.bhmc.dms.bat.crm.cso.service.dao.BatSalesOpptDAO;
import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

/**
 * BatIfSalesOpptDmsDcsServiceImpl
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batSalesOpptStatisticsService")
public class BatSalesOpptStatisticsServiceImpl extends HService implements BatSalesOpptStatisticsService {

    /**
     * batSalesOpptDAO
     */
    @Resource(name="batSalesOpptDAO")
    BatSalesOpptDAO batSalesOpptDAO;

    /**
     * DealerService
     */
    @Resource(name="dealerService")
    DealerService dealerService;


    /*
     * @see chn.bhmc.dms.bat.crm.slm.service.BatIfSalesOpptDmsDcsServiceImpl#selectSalesOpptDmsDcs
     */
    @Override
    public int selectSalesOpptTrackingCollectMonth() throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("month", "");

        int i = 0;
        DealerSearchVO dealerSearchVO = new DealerSearchVO();
        List<DealerVO> dealerVOList = new ArrayList<DealerVO>();

        dealerSearchVO.setsSysOwnerYn("Y");
        int resultCnt = dealerService.selectDealersByConditionCnt(dealerSearchVO);

        if (resultCnt != 0 ) {  // DMS 시스템 보유 딜러
            dealerVOList = dealerService.selectDealersByCondition(dealerSearchVO);

            for ( i = 0; i < dealerVOList.size() ; i++) {
                map.put("dlrCd", dealerVOList.get(i).getDlrCd());
                batSalesOpptDAO.selectSalesOpptTrackingCollectMonth(map);
            }
        } else {  // DMS 시스템 미보유 딜러
            dealerSearchVO.setsSysOwnerYn("");
            dealerSearchVO.setsUseCenterDmsYn("Y");
            resultCnt = 0;
            resultCnt = dealerService.selectDealersByConditionCnt(dealerSearchVO);

            if (resultCnt != 0) {
                dealerVOList = dealerService.selectDealersByCondition(dealerSearchVO);

                for ( i = 0; i < dealerVOList.size() ; i++) {
                    map.put("dlrCd", dealerVOList.get(i).getDlrCd());
                    batSalesOpptDAO.selectSalesOpptTrackingCollectMonth(map);
                }
            }
        }
        return 0;
    }

}
