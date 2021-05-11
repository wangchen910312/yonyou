package chn.bhmc.dms.bat.ser.ro.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderHistoryService.java
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

public interface RepairOrderHistoryToSibelService {

    /**
    *
    * sibel RO 히스토리 전송
    *
    * @throws Exception
    */
   public void insertRoHistoryToSibelSend()throws Exception;

}
