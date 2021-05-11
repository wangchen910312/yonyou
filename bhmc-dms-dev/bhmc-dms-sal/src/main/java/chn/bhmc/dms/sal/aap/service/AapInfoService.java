package chn.bhmc.dms.sal.aap.service;

import java.util.List;

import chn.bhmc.dms.sal.aap.vo.AapInfoSearchVO;
import chn.bhmc.dms.sal.aap.vo.AapInfoVO;

/**
 * 계약대행업무관리 서비스
 *
 * @author KimJinSuk
 * @since 2016. 4. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일              수정자               수정내용
 *  ----------------   ------------    ---------------------------
 *   2016.04.17         KimJinSuk            최초 생성
 * </pre>
 */

public interface AapInfoService {

    /**
     * 계약 대행업무 이력 갯수조회 
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAapInfoSearchsByConditionCnt(AapInfoSearchVO searchVO) throws Exception;
    
    /**
     * 계약 대행업무 이력조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<AapInfoVO> selectAapInfoSearchsByCondition(AapInfoSearchVO searchVO) throws Exception;
    
    /**
     * 계약 대행업무 삭제한다.
     * @param saveVO
     * @throws Exception
     */    
    public int deleteContractAapInfo(AapInfoVO saveVO) throws Exception;
    
    /**
     * 계약 대행업무 저장한다.
     * @param saveVO
     * @throws Exception
     */    
    public int insertContractAapInfo(AapInfoVO saveVO) throws Exception;
}
