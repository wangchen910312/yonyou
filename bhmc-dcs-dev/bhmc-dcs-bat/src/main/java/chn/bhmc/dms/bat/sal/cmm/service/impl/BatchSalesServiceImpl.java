package chn.bhmc.dms.bat.sal.cmm.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.oxm.Marshaller;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;
import chn.bhmc.dms.bat.sal.cmm.service.dao.BatchSalesCamelDAO;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesServiceImpl
 * @Description : camel 호출요청.
 * @author Kim Jin Suk
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.                        최초 생성
 * </pre>
 */

@Service("batchSalesService")
public class BatchSalesServiceImpl extends HService implements BatchSalesService {

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchSalesCamelDAO")
    BatchSalesCamelDAO batchSalesCamelDAO;

    @Resource(name="jaxb2Marshaller")
    Marshaller marshaller;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 프로시져 호출
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void executeSalesProcedure(String proId) throws Exception{
        batchSalesCamelDAO.executeSalesProcedure(proId);
    }
    @Override
    public void executeSalesProcedure(String proId, Map<String, ?> s1) throws Exception{
        int size = s1.size();

        //batchSalesCamelDAO.executeSalesProcedure1(proId, s1);

        switch (size){
            case 1:
                batchSalesCamelDAO.executeSalesProcedure(proId);
                break;
            case 2:
                batchSalesCamelDAO.executeSalesProcedure1(s1);
                break;
            case 3:
                batchSalesCamelDAO.executeSalesProcedure2(s1);
                break;
            case 4:
                batchSalesCamelDAO.executeSalesProcedure3(s1);
                break;
            case 5:
                batchSalesCamelDAO.executeSalesProcedure4(s1);
                break;
            default:
                break;
        }
    }

    /**
     * EAI Service Call
     */
    @Override
    public CommDMSDoc executeEaiService(String pgmId) throws Exception {
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId(pgmId)
        .company("H")
        .sender("SAL")
        .build()
        .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc);

        return reqCommDMSDoc;
    }

    public CommDMSDoc executeEaiService(String pgmId , String sender) throws Exception {
        CommDMSDoc reqCommDMSDoc = new EaiSimpleMessage.Builder()
        .ifId(pgmId)
        .company("H")
        .sender(sender)
        .build()
        .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc);

        return reqCommDMSDoc;
    }
}
