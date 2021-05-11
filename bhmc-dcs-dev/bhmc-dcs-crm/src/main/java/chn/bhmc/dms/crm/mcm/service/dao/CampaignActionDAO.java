package chn.bhmc.dms.crm.mcm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.crm.mcm.vo.CampaignActionSearchVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignActionVO;

/**
 * 마케팅 캠페인에 관한 데이터처리 매퍼 클래스
 *
 * @author hyoung jun an
 * @since 2016. 3. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.04         hyoung jun an            최초 생성
 * </pre>
 */

@Mapper("campaignActionDAO")
public interface CampaignActionDAO {

    /**
     * 조회 조건에 해당하는 캠페인실행 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    public int selectCampaignActionsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return 조회 목록
     */
    public List<CampaignActionVO> selectCampaignActionsByCondition(CampaignActionSearchVO searchVO) throws Exception;





    /**
     * 조회 조건에 해당하는 캠페인실행 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    public int selectActionsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인실행 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return 조회 목록
     */
    public List<CampaignActionVO> selectActionsByCondition(CampaignActionSearchVO searchVO) throws Exception;

    /**
     * 대상자에게 SMS 전송후 SMS 전송일을 수정한다.
     * @param CampaignActionVO
     * @return update count
     */
    public int updateCampaignExtrTargetSmsSend(CampaignActionVO campaignActionVO) throws Exception;

    /**
     * [그룹전송] 대상자에게 SMS 전송후 SMS 전송일을 수정한다. ( SMS 전송 대상자 임시 테이블에서 select insert )
     * @param CampaignActionVO
     * @return update count
     */
    public int updateGroupCampaignExtrTargetSmsSend(CampaignActionVO campaignActionVO) throws Exception;

    /**
     * 대상자 정보를 콜센터로 전송한다.
     */
    public List<CampaignActionVO> selectCallCenterSends(CampaignActionVO campaignActionVO) throws Exception;





    /**
     * 조회 조건에 해당하는 캠페인실행이력 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return
     */
    public int selectActionRecordsByConditionCnt(CampaignActionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인실행이력 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return 조회 목록
     */
    public List<CampaignActionVO> selectActionRecordsByCondition(CampaignActionSearchVO searchVO) throws Exception;





    /**
     * 콜센터 콜처리완료여부(CALL_PROC_END_YN)가 Y 이면 콜내용(CALL_CONT)을 각 업무 콜센터결과내용(CALL_CEN_RSLT_CONT) 에 업데이트 해준다.
     *
     * @param campaignActionVO
     * @return
     */
    public int updateCallCenRsltCont(CampaignActionVO campaignActionVO) throws Exception;

    /**
     * 판매결과내용(SALE_RSLT_CONT)을 업데이트 해준다.
     *
     * @param campaignActionVO
     * @return
     */
    public int updateSaleRsltCont(CampaignActionVO campaignActionVO) throws Exception;

    /**
     * 정비결과내용(SER_RSLT_CONT)을 업데이트 해준다.
     *
     * @param campaignActionVO
     * @return
     */
    public int updateSerRsltCont(CampaignActionVO campaignActionVO) throws Exception;

    /**
     * 조회 조건에 해당하는 캠페인실행자 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CampaignActionSearchVO
     * @return 조회 목록
     */
    public CampaignActionVO selectActionByKey(CampaignActionSearchVO searchVO) throws Exception;
}