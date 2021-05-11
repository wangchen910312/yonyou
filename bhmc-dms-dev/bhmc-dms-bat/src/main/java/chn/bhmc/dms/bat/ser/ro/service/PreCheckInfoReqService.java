package chn.bhmc.dms.bat.ser.ro.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckInfoReqService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim KyungMok
 * @since 2017. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 18.   Kim KyungMok     최초 생성
 * </pre>
 */

public interface PreCheckInfoReqService {

    /**
    *
    * 사전점검 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
   public void insertPreCheckReq(int day)throws Exception;

}
