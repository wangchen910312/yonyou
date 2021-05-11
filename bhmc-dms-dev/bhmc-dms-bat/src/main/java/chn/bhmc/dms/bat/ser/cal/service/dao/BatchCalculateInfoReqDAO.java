package chn.bhmc.dms.bat.ser.cal.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchCalculateInfoReqDAO.java
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
@Mapper("batchCalculateInfoReqDAO")
public interface BatchCalculateInfoReqDAO {
    
    /**
     * 
     * 정산정보 procedure
     *
     * @param day
     * @throws Exception
     */
    public void spSerCalulateInfoReq(int day)throws Exception;
    
    /**
     * 
     * 정산정보 Tab 정보 procedure
     *
     * @param day
     * @throws Exception
     */
    public void spSerTabInfoReq(int day)throws Exception;

}
