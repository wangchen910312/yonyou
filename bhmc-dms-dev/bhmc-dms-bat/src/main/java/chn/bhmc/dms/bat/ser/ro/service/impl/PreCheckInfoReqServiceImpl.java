package chn.bhmc.dms.bat.ser.ro.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.ro.service.PreCheckInfoReqService;
import chn.bhmc.dms.bat.ser.ro.service.dao.PreCheckInfoReqDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckInfoReqServiceImpl.java
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
@Service("preCheckInfoReqService")
public class PreCheckInfoReqServiceImpl extends HService implements PreCheckInfoReqService {

    @Resource(name="preCheckInfoReqDAO")
    PreCheckInfoReqDAO preCheckInfoReqDAO;

    @Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

    /**
    *
    * 사전점검 정보 인터페이스 테이블 에 등록
    *
    * @throws Exception
    */
    @Override
    public void insertPreCheckReq(int day) throws Exception {

        preCheckInfoReqDAO.insertPreCheckReq(day);

        HashMap<String, Object> message = new HashMap<String, Object>();
        // message.put("DLR_CD", LoginUtil.getDlrCd());

        int headerCnt = preCheckInfoReqDAO.selectPreCheckIfByConditionCnt();

        if(headerCnt > 0 )batServiceCmmCamelService.executeCamelClient(message, "SER112");

    }

}
