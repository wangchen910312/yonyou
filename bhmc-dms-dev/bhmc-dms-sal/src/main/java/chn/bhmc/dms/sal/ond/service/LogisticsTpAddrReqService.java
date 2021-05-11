package chn.bhmc.dms.sal.ond.service;

import java.util.List;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSaveVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqVO;

import chn.bhmc.dms.sal.ond.vo.LogisticsTpAddrReqSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LogisticsTpAddrReqService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 3.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public interface LogisticsTpAddrReqService {
    
    public List<LogisticsTpAddrReqVO> selectLogisticsTpAddrReqList(LogisticsTpAddrReqSearchVO searchVO) throws Exception;
    
    public void saveLogisticsTpAddrReqList(LogisticsTpAddrReqSaveVO saveVO) throws Exception;

}
