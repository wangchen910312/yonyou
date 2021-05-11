package chn.bhmc.dms.bat.ser.rev.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.rev.service.PartReservationInfoReqService;
import chn.bhmc.dms.bat.ser.rev.service.dao.PartReservationInfoReqDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PartReservationInfoReqServiceImpl.java
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
@Service("partReservationInfoReqService")
public class PartReservationInfoReqServiceImpl extends HService implements PartReservationInfoReqService {

    @Resource(name="partReservationInfoReqDAO")
    PartReservationInfoReqDAO partReservationInfoReqDAO;

    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

    /**
    *
    * 부품예약 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
    @Override
    public void insertPartReservationReq(int day) throws Exception {

        partReservationInfoReqDAO.insertPartReservationReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();

        int headerCnt = partReservationInfoReqDAO.selectPartReservationIfByConditionCnt();
        int partCnt = partReservationInfoReqDAO.selectPartReservationPartIfByConditionCnt();

        if(headerCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER111");
        if(partCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER005");
    }

}
