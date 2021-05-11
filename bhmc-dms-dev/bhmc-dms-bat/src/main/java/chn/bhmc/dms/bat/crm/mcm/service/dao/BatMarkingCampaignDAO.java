package chn.bhmc.dms.bat.crm.mcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignSearchVO;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMarkingCampaignDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Hyoung Jun An
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.    Hyoung Jun An     최초 생성
 * </pre>
 */

@Mapper("batMarkingCampaignDAO")
public interface BatMarkingCampaignDAO {

    public int selectSysOwnerDlrCdCnt() throws Exception;

    /**
     * 자동으로 Batch 를 수행할 목록이 있는지 조회한다(캠페인 대상자 추출목록).
     * @param searchVO - 조회 조건을 포함하는 BatMarkingCampaignSearchVO
     * @return BatMarkingCampaignVO
     */
    public List<BatMarkingCampaignVO> selectMarkingCampaignScheduleCondition(BatMarkingCampaignSearchVO searchVO) throws Exception;

    /**
     * Batch 를 수행하여 추출한 대상자를 등록 한다.
     * @param saveVO - 등록할 정보가 담긴 BatMarkingCampaignVO
     * @return 등록된 목록수
     */
    public int insertBatTargetExtractSave(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * Batch 를 수행한 이후에 마케팅 캠페인(대상자) 정보를 수정한다.(대상자 마스터 업데이트)
     * @param saveVO - 등록할 정보가 담긴 BatMarkingCampaignVO
     * @return 수정된 목록수
     */
    public int updateBatTargetExtractMaster(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * Batch 를 수행한 이후에 새롭게 Batch를 수행할 마케팅 캠페인(대상자) 정보를 등록한다.
     * @param saveVO - 등록할 정보가 담긴 BatMarkingCampaignVO
     * @return 등록된 목록수
     */
    public int insertBatTarget(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(캠페인 마스터)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyMaster(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(추출고객)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyCust(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(목표)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyGoal(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(부품정보)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyItem(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(공임정보)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyPay(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(대상차량정보)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyTargCar(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * 인터페이스를 통해 DCS에서 DMS로 가져온 데이터를 본 테이블에 이관처리 한다.(리콜대상차종)
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDmsIfCopyRecellCar(BatMarkingCampaignVO saveVO) throws Exception;
}
