package chn.bhmc.dms.bat.crm.crq.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.crq.vo.BatCampaignActionVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatContactHistoryVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCrmTargExtractVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareExtrTargetSearchVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareExtrTargetVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareSearchVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatCustomerCareVO;
import chn.bhmc.dms.bat.crm.crq.vo.BatSmsTmplUserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerCareBatchDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author In Moon LEE
 * @since 2016.08.05.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.08.05.     In Moon LEE     최초 생성
 * </pre>
 */

@Mapper("batCustomerCareBatchDAO")
public interface BatCustomerCareBatchDAO {

    /**
     * 배치 작업할 고객케어 목록을 조회한다.
     * @param CustomerCareSearchVO - dlrCd
     * @return 고객케어 목록
     */
    public List<BatCustomerCareVO> selectCustomerCareMgmtsByCondition(BatCustomerCareSearchVO searchVO) throws Exception;

    /**
     * 고객케어 대상자 추출 프로시저 호출
     * @param CrmTargExtractVO - dlrCd, custCareSeq, custExtrTermCd, custExtrTermPrid, extrDgreCnt, regUsrId, updtUsrId
     * @return 고객캐어
     */
    public BatCrmTargExtractVO callCustCareTargExtr(BatCrmTargExtractVO crmTargExtractVO) throws Exception;

    /**
     * 고객케어 대상자 콜센터 전송
     *
     * @param saveVO
     */
    public BatCampaignActionVO selectCallCenterSends(BatCampaignActionVO campaignActionVO);

    /**
     * 메시지 템플릿 내용
     *
     * @param int sMesgTmplNo
     * @return MESG_TMPL_NM
     */
    public String selectMessageTemplateByKey(int sMesgTmplNo);

    /**
     * SMS 발송 대상자 목록 조회
     *
     * @param custCareSearchVO
     * @return
     */
    public List<BatSmsTmplUserVO> selectCustomerCareExtrTargetsByCondition(
            BatCustomerCareExtrTargetSearchVO batCustomerCareExtrTargetSearchVO);

    /**
     * 문자 전송후 컨택히스토리 등록
     *
     * @param contactHistoryVO
     * @return
     */
    public int insertContactHistory(BatContactHistoryVO batContactHistoryVO) throws Exception;

    /**
     * 고객케어 문자 전송일 업데이트
     *
     * @param customerCareExtrTargetVO
     * @return
     */
    public int updateCustomerCareExtrTargetSmsSendDt(BatCustomerCareExtrTargetVO batCustomerCareExtrTargetVO);



    /**
     * 문자 전송후 컨택히스토리 등록 ( select insert )
     *
     * @param contactHistoryVO
     * @return
     */
    //public int insertGroupContactHistory(BatContactHistoryVO batContactHistoryVO);

    /**
     * 고객케어 문자 전송일 업데이트 ( select update )
     *
     * @param customerCareExtrTargetVO
     * @return
     */
    //public int updateGroupCustomerCareExtrTargetSmsSendDt(BatCustomerCareVO customerCareVO);



}
