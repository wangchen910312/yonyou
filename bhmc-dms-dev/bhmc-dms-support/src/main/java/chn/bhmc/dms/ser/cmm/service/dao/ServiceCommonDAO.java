package chn.bhmc.dms.ser.cmm.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.ser.cmm.vo.CustDemandVO;
import chn.bhmc.dms.ser.cmm.vo.EtcIssueVO;
import chn.bhmc.dms.ser.cmm.vo.LbrSuggestVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartSearchVO;
import chn.bhmc.dms.ser.cmm.vo.NpnPartVO;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSearchVO;
import chn.bhmc.dms.ser.cmm.vo.TrobleDescVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonDAO.java
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
@Mapper("serviceCommonDAO")
public interface ServiceCommonDAO {

    /**
     *
     * 고객요구사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO)throws Exception;

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
     * 고객 요구사항 저장
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int insertCustDemands(CustDemandVO custDemandVO)throws Exception;

    /**
     *
     * 고객 요구사항 수정
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int updateCustDemands(CustDemandVO custDemandVO)throws Exception;

    /**
     *
     * 고객 요구사항 삭제
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int deleteCustDemands(CustDemandVO custDemandVO)throws Exception;

    /**
     *
     * 고장설명 입력
     *
     * @param trobleDescVO
     * @return
     * @throws Exception
     */
    public int insertTrobleDescs(TrobleDescVO trobleDescVO)throws Exception;

    /**
     *
     * 고장설명 삭제
     *
     * @param trobleDescVO
     * @return
     * @throws Exception
     */
    public int deleteTrobleDescs(TrobleDescVO trobleDescVO)throws Exception;

    /**
     *
     * 기타사항 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO)throws Exception;

    /**
     *
     * 기타사항 저장
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int insertEtcIssue(EtcIssueVO etcIssueVO)throws Exception;
    
    /**
     *
     * 기타사항 수정
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int updateEtcIssue(EtcIssueVO etcIssueVO)throws Exception;
    
    /**
     *
     * 기타사항 삭제
     *
     * @param custDemandVO
     * @return
     * @throws Exception
     */
    public int deleteEtcIssue(EtcIssueVO etcIssueVO)throws Exception;
    
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
     * 수리건의 삭제
     *
     * @param lbrSuggestVO
     * @return
     * @throws Exception
     */
    public int deleteLbrSuggest(LbrSuggestVO lbrSuggestVO)throws Exception;
    
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
     * NPN PART 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<NpnPartVO> selectNpnPartByCondition(NpnPartSearchVO searchVO)throws Exception;

    
}
