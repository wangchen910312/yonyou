package chn.bhmc.dms.bat.ser.ro.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderHistoryDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Mapper("repairOrderHistoryDAO")
public interface RepairOrderHistoryDAO {

    /**
     *
     * 블루 멤버 RO 히스토리 전송
     *
     * @throws Exception
     */
    public void insertRoHistorySend()throws Exception;
}
