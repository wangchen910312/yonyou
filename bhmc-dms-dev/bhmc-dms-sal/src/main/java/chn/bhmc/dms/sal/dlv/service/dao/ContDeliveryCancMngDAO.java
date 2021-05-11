package chn.bhmc.dms.sal.dlv.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.dlv.vo.ContDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.ContDeliveryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliveryMngDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 10. 23
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23     yewon.kim              최초 생성
 * </pre>
 */

@Mapper("contDeliveryCancMngDAO")
public interface ContDeliveryCancMngDAO {

    /**
      * 조회 조건에 해당하는 고객인도 정보를 조회한다.
      */
    public List<ContDeliveryVO> selectContDeliveryCancByCondition(ContDeliverySearchVO searchVO);

    /**
     *  조회 조건에 해당하는 고객인도목록 총 갯수를 조회한다.
     */
    public int selectContDeliveryCancByConditionCnt(ContDeliverySearchVO searchVO);


    //출고취소
    public boolean insertCancelDelivery(ContDeliveryVO contDeliveryVO);
    public boolean updateCancelDelivery(ContDeliveryVO contDeliveryVO);

    public boolean updateCnclVehicleContDelivery(ContDeliveryVO contDeliveryVO);

    //딜러이월소매취소신청수신
    public int procRetailCancelReq(ContDeliveryVO contDeliveryVO) throws Exception;

    public boolean updateCleanContMaster(ContDeliveryVO contDeliveryVO);
    public boolean updateCleanVinMaster(ContDeliveryVO contDeliveryVO);
    public boolean updateCleanRfidReq(ContDeliveryVO contDeliveryVO);

    public String selectTemp4(ContDeliveryVO contDeliveryVO) throws Exception;

    public int selectActiveRoCnt(ContDeliveryVO contDeliveryVO);

    public boolean updateResetOwnerInfo(ContDeliveryVO contDeliveryVO);
    public boolean updateResetDriverInfo(ContDeliveryVO contDeliveryVO);

}
