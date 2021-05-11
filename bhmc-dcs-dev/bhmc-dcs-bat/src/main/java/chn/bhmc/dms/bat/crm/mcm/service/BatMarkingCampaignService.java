package chn.bhmc.dms.bat.crm.mcm.service;

import java.util.List;

import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignSearchVO;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatMarkingCampaignService.java
 * @Description : 캠페인관리 대상자 추출 배치서비스
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

public interface BatMarkingCampaignService {

    /**
     * 캠페인 대상자를 추출하는 프로시저 호출
     * @param batMarkingCampaignVO - 조회 조건을 포함하는 BatMarkingCampaignVO
     * @return
     * 1. 캠페인에 등록된 스케줄러 조회
     * 2. 생성된 대상자는 1003T, 1004T에 존재하는데 해당 tmp table에서 가지고 오는 select,insert를 실행
     * 3. 해당 tmp table에서 data삭제
     * 4. 캠페인 대상자 추출일 update
     * 5. 새롭게 Batch를 수행할 캠페인 대상자 마스터 신규생성
     */
    public int multiTargetExtract(BatMarkingCampaignVO batMarkingCampaignVO) throws Exception;

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
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
     * @param saveVO - 등록할 정보가 담긴 BatMarkingCampaignVO
     * @return 등록된 목록수
     */
    public int multiDcsIfCpoy(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 이후에 인터페이스를 호출한다.
     * @param saveVO - 등록할 정보가 담긴 BatMarkingCampaignVO
     * @return 등록된 목록수
     */
    public int multiDcsIfCpoyEAI() throws Exception;

    /**
     * DCS캠페인 데이터를 인터페이스 테이블에 이관처리 한다.
     * @param BatMarkingCampaignVO - BatMarkingCampaignVO
     * @return
     */
    public BatMarkingCampaignVO selectMarktingCampaignDcsIfCopy(BatMarkingCampaignVO saveVO) throws Exception;

    /**
     * DMS에서 DCS로 다시 이관된 DCS캠페인 대상자에 대한 결과치를 갱신한다.(추출대상자)
     * @return 없음
     */
    public void updateCrmDcsTargetResult()throws Exception;

}