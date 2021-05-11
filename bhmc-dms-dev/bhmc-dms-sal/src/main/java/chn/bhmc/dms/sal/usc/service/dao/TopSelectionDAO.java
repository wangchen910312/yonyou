package chn.bhmc.dms.sal.usc.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.usc.vo.TopSelectionCertifyImgInfoVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionCustomerVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionSearchVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TopSelectionDAO.java
 * @Description : 중고수선차량 DAO
 * @author Kim yewon
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.     Kim yewon              최초 생성
 * </pre>
 */

@Mapper("topSelectionDAO")
public interface TopSelectionDAO {
    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    public List<TopSelectionVO> selectCreditListByCondition(TopSelectionSearchVO searchVO);

   /**
    *  조회 조건에 해당하는  총 갯수를 조회한다.
    */
    public int selectCreditListByConditionCnt(TopSelectionSearchVO searchVO);


    //수선시스템 - 차량정보(단건) 조회
    public TopSelectionVO selectVehicleInfo(TopSelectionSearchVO searchVO);


    //수선시스템 - 차량마스터(단건) 조회
    public TopSelectionUsedCarVO selectVehicleMaster(TopSelectionSearchVO searchVO);

    //수선시스템 - 고객정보조(단건) 조회
    public TopSelectionCustomerVO selectVehicleCustomer(TopSelectionSearchVO searchVO);

   //수선시스템 - 차량이미지정보 조회
    public TopSelectionCertifyImgInfoVO selectVehicleCertify(TopSelectionSearchVO searchVO);

}
