package chn.bhmc.dms.bat.ser.cal.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cal.service.BatchCalculateInfoReqService;
import chn.bhmc.dms.bat.ser.cal.service.dao.BatchCalculateInfoReqDAO;
import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchCalculateInfoReqServiceImpl.java
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
@Service("batchCalculateInfoReqService")
public class BatchCalculateInfoReqServiceImpl extends HService implements BatchCalculateInfoReqService {

    @Resource(name="batchCalculateInfoReqDAO")
    BatchCalculateInfoReqDAO batchCalculateInfoReqDAO;

    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

    /**
     *
     * 정산정보 procedure
     *
     * @param day
     * @throws Exception
     */
    @Override
    public void spSerCalulateInfoReq(int day) throws Exception {

        batchCalculateInfoReqDAO.spSerCalulateInfoReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();

        batServiceCmmCamelService.executeCamelClient(message, "SER073");
        batServiceCmmCamelService.executeCamelClient(message, "SER074");
        //batServiceCmmCamelService.executeCamelClient(message, "SER005");
        //batServiceCmmCamelService.executeCamelClient(message, "SER006");



    }

    /**
     *
     * 정산정보 Tab 정보 procedure
     *
     * @param day
     * @throws Exception
     */
    @Override
    public void spSerTabInfoReq(int day) throws Exception {

        batchCalculateInfoReqDAO.spSerTabInfoReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();


        batServiceCmmCamelService.executeCamelClient(message, "SER078");
        batServiceCmmCamelService.executeCamelClient(message, "SER079");
        batServiceCmmCamelService.executeCamelClient(message, "SER080");

    }

}
