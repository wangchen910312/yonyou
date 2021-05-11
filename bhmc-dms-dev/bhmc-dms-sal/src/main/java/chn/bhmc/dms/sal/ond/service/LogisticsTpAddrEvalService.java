package chn.bhmc.dms.sal.ond.service;

import java.util.List;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSaveVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSearchVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrEvalService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 8.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface LogisticsTpAddrEvalService {
    
    public List<LogisticsTpAddrEvalVO> selectLogisticsTpAddrEvalList(LogisticsTpAddrEvalSearchVO searchVO) throws Exception;
    
     /**
     * 비준 신청 
     **/
    public int confirmLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception;
    
     /**
     * 비준 거절 
     **/
    public int denyLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception;
    
     /**
     * 비준 폐기 
     **/
    public int terminateLogisticsTpAddrEvalList(LogisticsTpAddrEvalSaveVO saveVO) throws Exception;

}
