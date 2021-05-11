package chn.bhmc.dms.sal.stm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.stm.service.CorpStockConditionDlrService;
import chn.bhmc.dms.sal.stm.service.dao.CorpStockConditionDlrDAO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionDlrIFVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionDlrVO;
import chn.bhmc.dms.sal.stm.vo.CorpStockConditionSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CorpStockConditionServiceImpl
 * @Description : 법인재고현황(전략오더)
 * @author
 * @since 2016. 7. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("corpStockConditionDlrService")
public class CorpStockConditionDlrServiceImpl extends HService implements CorpStockConditionDlrService {

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;


    /**
     * [딜러]법인재고현황(전략오더) DAO 선언
     */
    @Resource(name="corpStockConditionDlrDAO")
    CorpStockConditionDlrDAO corpStockConditionDlrDAO;


    /**
     * [딜러]법인재고현황(전략오더) 조회
     */
    @Override
    public List<CorpStockConditionDlrVO> selectCorpStockConditionDlrsByCondition(CorpStockConditionSearchVO searchVO) throws Exception{

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("STCK_CARL_CD", searchVO.getsCarlineCd());
        message.put("STCK_MODEL_CD", searchVO.getsModelCd());
        message.put("STCK_OCN_CD", searchVO.getsOcnCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL106");           // service id
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();
        List<CorpStockConditionDlrIFVO> results = null;
        List<CorpStockConditionDlrVO> rList = null;

        if (receiveData.getFooter().getIfResult().equals("Z")) {
            results = receiveData.readMessages(CorpStockConditionDlrIFVO.class);
            // {"CARLINE_CD":"B3","MODEL_CD":"B3S42G61F   G","OCN_CD":"A010","DISP_GRADE_CD":null,"RETL_PRC":"0","TOT_STOCK_QTY":"8","ORD_QTY":"0","PSNT_STOCK_QTY":"0"}

            // 차종명, 모델명, OCN명
            rList = new ArrayList<CorpStockConditionDlrVO>();
            CorpStockConditionDlrVO resultVO = null;        // 결과VO
            CorpStockConditionDlrVO sVO = null;

            for(int i=0; i<results.size(); i++){
                resultVO = new CorpStockConditionDlrVO();
                resultVO.setCarlineCd(results.get(i).getCarlineCd());
                resultVO.setModelCd(results.get(i).getModelCd());
                resultVO.setOcnCd(results.get(i).getOcnCd());
                resultVO.setDispGradeCd(results.get(i).getDispGradeCd());
                resultVO.setRetlPrc(results.get(i).getRetlPrc());
                resultVO.setTotStockQty(results.get(i).getTotStockQty());
                resultVO.setOrdQty(results.get(i).getOrdQty());
                resultVO.setPsntStockQty(results.get(i).getPsntStockQty());

                sVO = corpStockConditionDlrDAO.selectCorpStockCarNmSearch(resultVO);
                resultVO.setCarlineNm(sVO.getCarlineNm());
                resultVO.setModelNm(sVO.getModelNm());
                resultVO.setOcnNm(sVO.getOcnNm());
                rList.add(resultVO);
            }

        } else {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfFailMsg() });
        }

        return rList;
    }

}
