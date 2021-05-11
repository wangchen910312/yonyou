package chn.bhmc.dms.bat.ser.ro.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.ro.service.RepairOrderInfoReqService;
import chn.bhmc.dms.bat.ser.ro.service.dao.RepairOrderInfoReqDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderInfoReqServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 31.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("repairOrderInfoReqService")
public class RepairOrderInfoReqServiceImpl extends HService implements RepairOrderInfoReqService {

    @Resource(name="repairOrderInfoReqDAO")
    RepairOrderInfoReqDAO repairOrderInfoReqDAO;

    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

    /**
    *
    * RO 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
    @Override
    public void insertRepairOrderReq(int day) throws Exception {

        repairOrderInfoReqDAO.insertRepairOrderReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();
        // message.put("DLR_CD", LoginUtil.getDlrCd());

        int headerCnt = repairOrderInfoReqDAO.selectRepairOrderIfByConditionCnt();
        int partCnt = repairOrderInfoReqDAO.selectRepairOrderPartIfByConditionCnt();
        int lbrCnt = repairOrderInfoReqDAO.selectRepairOrderLaborIfByConditionCnt();
        int repairCnt = repairOrderInfoReqDAO.selectRepairInfoIfByConditionCnt();

        if(headerCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER004");
        if(partCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER005");
        if(lbrCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER006");
        if(repairCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER113");

    }

}
