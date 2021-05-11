package chn.bhmc.dms.bat.ser.rcv.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.rcv.service.BatchServiceReceiveInfoService;
import chn.bhmc.dms.bat.ser.rcv.service.dao.BatchServiceReceiveInfoReqDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchServiceReceiveInfoServiceImpl.java
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
@Service("batchServiceReceiveInfoService")
public class BatchServiceReceiveInfoServiceImpl extends HService implements BatchServiceReceiveInfoService {

    
    @Resource(name="batchServiceReceiveInfoReqDAO")
    BatchServiceReceiveInfoReqDAO batchServiceReceiveInfoReqDAO;
    
    
    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;
    
    
    /**
     * 수납정보 저장
     */
    @Override
    public void spSerReceiveInfoReq(int day) throws Exception {
        
        batchServiceReceiveInfoReqDAO.spSerReceiveInfoReq(day);
        
        HashMap<String, Object> message = new HashMap<String, Object>();
        
        batServiceCmmCamelService.executeCamelClient(message, "SER075");
        batServiceCmmCamelService.executeCamelClient(message, "SER076");
        batServiceCmmCamelService.executeCamelClient(message, "SER077");

    }

}
