package chn.bhmc.dms.bat.sal.cmm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.inc.service.dao.BatchIncJoinInfoDAO;

import chn.bhmc.dms.bat.sal.inc.vo.BatSysOwnerDlrVO;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;
import chn.bhmc.dms.bat.sal.cmm.service.dao.BatchSalesCamelDAO;
import chn.bhmc.dms.bat.sal.inc.service.BatchIncJoinInfoService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;

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
     * Camel Factory
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 판매공통 DAO 선언
     */
    @Resource(name="batchSalesCamelDAO")
    BatchSalesCamelDAO batchSalesCamelDAO;

    /**
     * 해당 배치의 딜러 찾기1
     */
    @Resource(name="batchIncJoinInfoService")
    BatchIncJoinInfoService batchIncJoinInfoService;

    /**
     * 해당 배치의 딜러 찾기2
     */
    @Resource(name="batchIncJoinInfoDAO")
    BatchIncJoinInfoDAO batchIncJoinInfoDAO;



    /**
     * camel 호출
     * @param serviceId
     * @throws Exception
     */
    @Override
    public void executeCamel(String serviceId) throws Exception{
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId(serviceId);
        camelClient.sendRequest();
    }


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
     * 딜러코드를 인자값으로 받는 프로시져 호출
     */
    @Override
    public void executeSalesDlrCheckProcedure() throws Exception{

        BatSysOwnerDlrVO dlrVO = batchIncJoinInfoService.selectOnlyDlrInfosearch();
        String sDlrCd = "";
        if(dlrVO != null){      // 단일딜러
            sDlrCd = dlrVO.getDlrCd();
            batchSalesCamelDAO.executeSalesDlrCheckProcedure(sDlrCd);
        }
        else{                   // 멀티딜러
            List<BatSysOwnerDlrVO> dlrList = batchIncJoinInfoDAO.selectSysOwnerDlrByCondition(null, "Y");
            for(BatSysOwnerDlrVO multiVO : dlrList){
                sDlrCd = multiVO.getDlrCd();
                batchSalesCamelDAO.executeSalesDlrCheckProcedure(sDlrCd);
            }
        }
    }
}
