package chn.bhmc.dms.ser.cmm.service;

import java.util.List;
import java.util.Map;

import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
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
     * 고장설명  조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public TrobleDescVO selectTrobleDescsByKey(TabInfoSearchVO searchVO)throws Exception;

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
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO)throws Exception;

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
   * EAI Client
   *
   * @param dlrCd
   * @param message
   * @return
   * @throws Exception
   */
    public boolean executeEaiCall( String dlrCd  ,String ifId , Map<String, Object> message,String flag)throws Exception;

}
