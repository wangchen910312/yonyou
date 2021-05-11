package chn.bhmc.dms.bat.ser.rev.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.rev.service.ReservationInfoReqService;
import chn.bhmc.dms.bat.ser.rev.service.dao.ReservationInfoReqDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReservationInfoReqServiceImpl.java
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
@Service("reservationInfoReqService")
public class ReservationInfoReqServiceImpl extends HService implements ReservationInfoReqService {

    @Resource(name="reservationInfoReqDAO")
    ReservationInfoReqDAO reservationInfoReqDAO;

    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

    /**
    *
    * 예약 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
    @Override
    public void insertReservationReq(int day) throws Exception {

        reservationInfoReqDAO.insertReservationReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();

        int headerCnt = reservationInfoReqDAO.selectReservationIfByConditionCnt();
        int partCnt = reservationInfoReqDAO.selectReservationPartIfByConditionCnt();
        int lbrCnt = reservationInfoReqDAO.selectReservationLaborIfByConditionCnt();

        if(headerCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER110");
        if(partCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER005");
        if(lbrCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER006");

    }

}
