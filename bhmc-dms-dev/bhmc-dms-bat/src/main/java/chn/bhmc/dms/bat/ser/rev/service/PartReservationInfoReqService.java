package chn.bhmc.dms.bat.ser.rev.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationInfoReqService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Kyung Mok
 * @since 2017. 8. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 17.     Kim Kyung Mok     최초 생성
 * </pre>
 */

public interface PartReservationInfoReqService {

    /**
    *
    * 부품예약 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
   public void insertPartReservationReq(int day)throws Exception;

}
