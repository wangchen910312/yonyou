package chn.bhmc.dms.bat.ser.cmm.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.oxm.Marshaller;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatServiceCmmEaiServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("batServiceCmmEaiService")
public class BatServiceCmmEaiServiceImpl extends HService implements BatServiceCmmEaiService{


    @Resource(name="jaxb2Marshaller")
    Marshaller marshaller;

    @Resource(name="eaiClient")
    EaiClient eaiClient;


    /**
     * EAI Service Call
     */
    @Override
    public CommDMSDoc executeEaiService(String pgmId) throws Exception {

        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId(pgmId)
        .company("H")
        .sender("SER")
        .addAttachment("", "", "")
        .build()
        .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc);



        return reqCommDMSDoc;
    }



}
