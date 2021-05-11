package chn.bhmc.dms.sal.usc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.usc.vo.TopSelectionCertifyImgInfoVO;

import chn.bhmc.dms.sal.usc.service.TopSelectionService;
import chn.bhmc.dms.sal.usc.service.dao.TopSelectionDAO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionCustomerVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TopSelectionServiceImpl
 * @Description : 중고차 - 수선차량
 * @author
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.      Kim yewon              최초 생성
 * </pre>
 */

@Service("topSelectionService")
public class TopSelectionServiceImpl extends HService implements TopSelectionService {

    /**
     * 중고차 - 수선차량 DAO 선언
     */
    @Resource(name="topSelectionDAO")
    TopSelectionDAO topSelectionDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<TopSelectionVO> selectCreditListByCondition(TopSelectionSearchVO searchVO){
        return topSelectionDAO.selectCreditListByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectCreditListByConditionCnt(TopSelectionSearchVO searchVO) {
        return topSelectionDAO.selectCreditListByConditionCnt(searchVO);
    }


    /**
     * 수선시스템 - 차량정보(단건) 조회
     */
    @Override
    public TopSelectionVO selectVehicleInfo(TopSelectionSearchVO searchVO) throws Exception {
        return topSelectionDAO.selectVehicleInfo(searchVO);
    }


    /**
     * 수선시스템 - 차량마스터(단건) 조회
     */
    @Override
    public TopSelectionUsedCarVO selectVehicleMaster(TopSelectionSearchVO searchVO) throws Exception {
        return topSelectionDAO.selectVehicleMaster(searchVO);
    }


    /**
     * 수선시스템 - 고객정보(단건) 조회
     */
    @Override
    public TopSelectionCustomerVO selectVehicleCustomer(TopSelectionSearchVO searchVO) throws Exception {
        return topSelectionDAO.selectVehicleCustomer(searchVO);
    }

    //수선시스템 - 차량이미지정보 조회
    @Override
    public TopSelectionCertifyImgInfoVO selectVehicleCertify(TopSelectionSearchVO searchVO)throws Exception{

        return topSelectionDAO.selectVehicleCertify(searchVO);
    }

}
