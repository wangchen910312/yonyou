package chn.bhmc.dms.crm.css.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO;
import chn.bhmc.dms.crm.mcm.vo.CampaignResultSearchVO;


/**
 * 만족도 조사 관리에 관한 데이터처리 매퍼 클래스
 *
 *    File Name : SatisFactionResultMgmtDAO
 *    Description : 만족도 조사 결과관리
 *    author LEE Kyo Jin
 *    since 2016. 03. 04.
 *    version 1.0
 *    Modification Information
 *       since          author              description
 *    ===========    =============    ===========================
 *    2016. 03. 04.    LEE Kyo Jin    최초 생성
 */

public interface SatisFactionResultMgmtService {


    /**
     * 만족도 조사 결과관리 목록수를 조회한다.
     */
    public int selectSatisFactionResultMgmtByConditionCnt(SatisFactionResultMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과관리 정보 목록을 조회한다.
     */
    public List<SatisFactionResultMgmtVO> selectSatisFactionResultMgmtByCondition(SatisFactionResultMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과관리 등록한다.
     * @param SatisFactionResultMgmtVO - 등록할 정보가 담긴 SatisFactionResultMgmtVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionResultMgmt(SatisFactionResultMgmtVO satisFactionResultMgmtVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 목록수를 조회한다.
     */
    public int selectSatisFactionResultDtlMgmtByConditionCnt(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 정보 목록을 조회한다.
     */
    public List<SatisFactionResultDtlMgmtVO> selectSatisFactionResultDtlMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과상세관리 등록한다.
     * @param SatisFactionResultDtlMgmtVO - 등록할 정보가 담긴 SatisFactionResultDtlMgmtVO
     * @return 등록된 목록수
     */
    public int insertSatisFactionResultDtlMgmt(SatisFactionResultDtlMgmtVO satisFactionResultDtlMgmtVO) throws Exception;


    public List<String> selectSatisFactionResultDtlHeaderMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    //public Map<String, List<SatisFactionResultDtlMgmtVO>> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;
    public Map<String, List> selectSatisFactionResultDtlDataSetMgmtByCondition(SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception;

    /**
     * 만족도 조사 결과 데이터를 조회한다. - 만족도 조사 설문지 및 결과 조회 [OB실행>상세팝업>만족도조사탭], [캠페인결과관리>업체평가], ]캠페인관리>결과>업체평가 ]
     * @param SatisFactionResultDtlMgmtVO - 등록할 정보가 담긴 SatisFactionResultDtlMgmtVO
     * seq, BizCd
     * @return
     */
    public Map<String, Object> selectSurveyAnswerResultByCodition(CampaignResultSearchVO searchVO) throws Exception;

}
