package chn.bhmc.dms.bat.ser.rev.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationInfoReqDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim KyungMok
 * @since 2017. 8. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 18.     Kim KyungMok     최초 생성
 * </pre>
 */
@Mapper("partReservationInfoReqDAO")
public interface PartReservationInfoReqDAO {

    /**
     *
     * 부품예약 정보 인터페이스 테이블 에 등록
     *
     * @throws Exception
     */
    public void insertPartReservationReq(int day)throws Exception;

    public int selectPartReservationIfByConditionCnt()throws Exception;

    public int selectPartReservationPartIfByConditionCnt()throws Exception;

}
