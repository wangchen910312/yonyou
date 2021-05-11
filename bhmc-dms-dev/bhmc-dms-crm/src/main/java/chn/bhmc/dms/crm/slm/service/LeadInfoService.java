package chn.bhmc.dms.crm.slm.service;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.crm.cso.vo.SalesOpptMgmtSaveVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSaveVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoSearchVO;
import chn.bhmc.dms.crm.slm.vo.LeadInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustomerInfoService.java
 * @Description : 리드 정보관리 Service
 * @author Kyo Jin Lee
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public interface LeadInfoService {

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public int selectLeadInfoByConditionCnt(LeadInfoSearchVO searchVO) throws Exception;

    /**
     * Statements
     *
     * @param searchVO
     * @return
     */
    public List<LeadInfoVO> selectLeadInfoByCondition(LeadInfoSearchVO searchVO) throws Exception;

    /**
     * 리드정보를 입력 한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 LeadInfoVO
     * @return 등록된 목록수
     */
    public String insertLead(LeadInfoVO LeadInfoVO) throws Exception;

    /**
     * 리드정보를 수정한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 LeadInfoVO
     * @return 등록된 목록수
     */
    public int updateLead(LeadInfoVO LeadInfoVO) throws Exception;

    /**
     * 리드 상태 정보를 수정한다.
     *
     * @param LeadInfoVO - 등록 정보가 담긴 LeadInfoVO
     *  Required Field
     *    . dlrCd
     *    . leadNo
     *    . statCd
     * @return 등록된 목록수
     */
    public int updateLeadStat(LeadInfoVO LeadInfoVO) throws Exception;

    /**
     * 리드정보를 저장/수정한다.
     *
     * @param LeadInfoSaveVO -
     * @return leadNo 리드번호
     */
    public String multiLeads(LeadInfoSaveVO saveVO) throws Exception;

    /**
     * 리드정보를 저장/수정한다.
     *
     * @param LeadInfoSaveVO -
     * @return leadNo 리드번호
     */
    public String multiIDCCLeads(LeadInfoSaveVO saveVO) throws Exception;


    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param custNo - 고객번호
     * @param leadTp - 리드타입 (COMMON / IDCC / ALL)
     * @return 01:신규 , 04:리드중복, 05:기회중복
     */
    public String selectLeadDupByKey(String custNo, String leadTp) throws Exception;

    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param custNo - 고객번호
     * @param leadTp - 리드타입 (COMMON / IDCC / ALL)
     * @return count
     */
    public int selectLeadDupOutSideByKey(String dlrCd, String custNo, String leadTp) throws Exception;

    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param pltCd - 센터코드
     * @param hpNo - 이동전화번호
     * @param telNo - 전화번호
     * @return 조회한 리드 정보
     */
    public LeadInfoVO selectLeadByKey(String dlrCd, String pltCd, String hpNo, String telNo) throws Exception;

    /**
     * 리드번호를 채번한다.
     *
     * @param null
     * @return 리드번호
     */
    public String selectNextLeadNo() throws Exception;

    /*
     * @see chn.bhmc.dms.crm.slm.service.LeadInfoService#leadInfoReqValueChk(chn.bhmc.dms.crm.slm.vo.LeadInfoVO)
     */
    public boolean leadInfoReqValueChk(LeadInfoVO leadInfoVO) throws Exception;

    /**
     * 판매기회를 등록한다.
     *
     * @param LeSalesOpptMgmtSaveVOadInfoVO - 등록 정보가 담긴 SalesOpptMgmtSaveVO
     * @return 판매기회번호
     */
    public String insertLeadToSalesOppt(SalesOpptMgmtSaveVO saveVO) throws Exception;

    /**
     * Key에 해당하는 리드 정보를 조회한다.
     * @param list - 등록 정보가 담긴 LeadInfoVO
     * @return
     */
    public List<LeadInfoVO> selectLeadDupCheck(List<LeadInfoVO> list) throws Exception;

    /**
     * Statements
     *
     * @param saveVO
     */
    public void multiLeadUploadFileSave(BaseSaveVO<LeadInfoVO> saveVO) throws Exception;

}
