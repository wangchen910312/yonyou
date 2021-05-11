package chn.bhmc.dms.sal.ond.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrEvalSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrEvalDAO.java
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

@Mapper("logisticsTpAddrEvalDAO")
public interface LogisticsTpAddrEvalDAO {
    
    /**
     * 조회 조건에 해당하는 물류운송주소 심사 정보를 조회한다.
     */ 
    public List<LogisticsTpAddrEvalVO> selectLogisticsTpAddrEvalList(LogisticsTpAddrEvalSearchVO searchVO);
    
    public int confirmLogisticsTpAddrEvalList(LogisticsTpAddrEvalVO updateVO);
    
    public int denyLogisticsTpAddrEvalList(LogisticsTpAddrEvalVO updateVO);
    
    public int terminateLogisticsTpAddrEvalList(LogisticsTpAddrEvalVO updateVO);

}
