package chn.bhmc.dms.bat.ser.rcv.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchServiceReceiveInfoReqDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2017. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 1. 4.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Mapper("batchServiceReceiveInfoReqDAO")
public interface BatchServiceReceiveInfoReqDAO {
    
    /**
     * 
     * 수납정보 PROCEDURE
     *
     * @param day
     * @throws Exception
     */
    public void spSerReceiveInfoReq(int day)throws Exception;

}
