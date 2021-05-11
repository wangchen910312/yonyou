package chn.bhmc.dms.ser.cmm.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartSearchVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface ServiceCommonService {

    /**
     *
     * 고객요구사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO)throws Exception;

    /**
     *
     * 수리건의 조회
     *
     * @param lbrSuggestVO
     * @return
     * @throws Exception
     */
    public List<LbrSuggestVO> selectLbrSuggestByCondition(TabInfoSearchVO searchVO)throws Exception;

    /**
     *
     * 고장설명  조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public TrobleDescVO selectTrobleDescsByKey(TabInfoSearchVO searchVO)throws Exception;

    /**
     *
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO)throws Exception;


    /**
     *
     * 고객요청사항/고장설명  저장
     *
     * @return
     * @throws Exception
     */
    public void multiTabInfos(TabInfoSaveVO saveVO)throws Exception;

    /**
     *
     * 고객요청사항
     *
     * @return
     * @throws Exception
     */
    public void multiCustDemand(List<CustDemandVO> obj , String jobNo , String preFixId)throws Exception;

    /**
     *
     * 고장설명  저장
     *
     * @return
     * @throws Exception
     */
    public void multiTrobleDesc(TrobleDescVO trobleDescVO , String jobNo)throws Exception;


     /**
     *
     * 기타사항 저장
     *
     * @return
     * @throws Exception
     */
    public void multiEtcIssue(List<EtcIssueVO> obj, String jobNo, String preFixId)throws Exception;

    /**
     *
     * 수리건의 저장
     *
     * @return
     * @throws Exception
     */
    public void multiLbrSuggest(List<LbrSuggestVO> lbrSuggestListVO, String jobNo, String preFixId)throws Exception;

    /**
     *
     * 수리건의 등록
     *
     * @param lbrSuggestVO
     * @return
     * @throws Exception
     */
    public int insertLbrSuggest(LbrSuggestVO lbrSuggestVO)throws Exception;


    /**
     *
     * 고객요청사항 삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteDemands(List<CustDemandVO> obj , String jobNo , String preFixId)throws Exception;

     /**
     *
     * 고객요청사항 삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteDemand(CustDemandVO custDemandVO)throws Exception;

    /**
     *
     * 고장설명  삭제
     *
     * @return
     * @throws Exception
     */
    public void deleteTrobleDesc(TrobleDescVO trobleDescVO , String jobNo)throws Exception;

    /**
    *
    * 기타사항 삭제
    *
    * @return
    * @throws Exception
    */
    public void deleteEtcIssues(List<EtcIssueVO> obj, String jobNo, String preFixId)throws Exception;

    /**
     *
     * 기타사항 삭제
     *
     * @param etcIssueVO
     * @return
     * @throws Exception
     */
    public int deleteEtcIssue(EtcIssueVO etcIssueVO)throws Exception;

    /**
     *
     * 수리건의 삭제
     *
     * @param lbrSuggestVO
     * @return
     * @throws Exception
     */
    public int deleteLbrSuggest(LbrSuggestVO lbrSuggestVO)throws Exception;


    /**
     *
     * CamelClent
     *
     * @param message
     * @param ifId
     * @return
     * @throws Exception
     */
    public boolean executeCamelClent(Map<String, Object> message , String ifId)throws Exception;

    /**
     *
     * CamelClent
     *
     * @param message
     * @param ifId
     * @return
     * @throws Exception
     */
    public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception;


    /**
     *
     * NPN PART 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<NpnPartVO> selectNpnPartByCondition(NpnPartSearchVO searchVO)throws Exception;


}
