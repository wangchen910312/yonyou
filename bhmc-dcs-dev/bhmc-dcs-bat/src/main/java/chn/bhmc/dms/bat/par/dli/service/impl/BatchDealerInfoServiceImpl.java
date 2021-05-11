package chn.bhmc.dms.bat.par.dli.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

import chn.bhmc.dms.bat.par.dli.service.BatchDealerInfoService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchDealerInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Hyeong Gyun
 * @since 2017. 7. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 20.     Lee Hyeong Gyun     최초 생성
 * </pre>
 */

@Service("batchDealerInfoService")
public class BatchDealerInfoServiceImpl extends HService implements BatchDealerInfoService{

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    @Override
    public int batDealerInfo() throws Exception{

        //EAI 호출
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()

        .ifId("PTS411")
        .company("H")
        .sender("DCS")
        .receiver("ALL")
        .build()
        .buildCommDMSDoc();

        eaiClient.sendRequest(reqCommDMSDoc);

        return 1;
    }

}
