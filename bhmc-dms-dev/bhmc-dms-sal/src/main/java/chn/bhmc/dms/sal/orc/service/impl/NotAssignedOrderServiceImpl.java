package chn.bhmc.dms.sal.orc.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.orc.service.NotAssignedOrderService;
import chn.bhmc.dms.sal.orc.service.dao.NotAssignedOrderDAO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSaveVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderSearchVO;
import chn.bhmc.dms.sal.orc.vo.NotAssignedOrderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotAssignedOrderServiceImpl.java
 * @Description : 미배정 주문조회 Service
 * @author
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 10.      Bong               최초 생성
 * </pre>
 */

@Service("notAssignedOrderService")
public class NotAssignedOrderServiceImpl extends HService implements NotAssignedOrderService, JxlsSupport {

    /**
     * 미배정 주문조회 DAO 선언
     */
    @Resource(name="notAssignedOrderDAO")
    NotAssignedOrderDAO notAssignedOrderDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    // 실시간 I/F
    @Resource(name="salesCommonCamelService")
    private SalesCommonCamelService serviceCommonService;


    /**
     * 조회 건수
     */
    @Override
    public int selectNotAssignedOrderCnt(NotAssignedOrderSearchVO searchVO)  throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrderCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 정보를 조회한다.
     */
    @Override
    public List<NotAssignedOrderVO> selectNotAssignedOrder(NotAssignedOrderSearchVO searchVO) throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrder(searchVO);
    }

    /**
     * 미배정 주문조회 합계 조회
     */
    @Override
    public NotAssignedOrderVO selectNotAssignedOrderSumSearch(NotAssignedOrderSearchVO searchVO) throws Exception{
        return notAssignedOrderDAO.selectNotAssignedOrderSumSearch(searchVO);
    }

    @Override
    public int updateNotAssignedOrder(NotAssignedOrderSaveVO saveVO) throws Exception{

        for(NotAssignedOrderVO updateVO : saveVO.getUpdateList()){
            updateVO.setUpdtUsrId(LoginUtil.getUserId());
            updateVO.setDlrCd(LoginUtil.getDlrCd());

            Map<String, Object> message = new HashMap<String, Object>();

            message.put("ZCHKGB", "H");
            message.put("ZCDEST", "A07AA");
            message.put("ZERDAT", DateUtil.getDate("yyyy-MM-dd"));
            message.put("KUNNR", updateVO.getDlrCd());
            message.put("SPMON", updateVO.getOrdYymmS());
            message.put("WEEKN", updateVO.getOrdWeek());
            message.put("ZCCAR", updateVO.getCarlineCd());
            message.put("VBELN", updateVO.getSalesNo());
            message.put("AUGRU", updateVO.getOrdType());
            message.put("ZCMCG", updateVO.getModelCd());
            message.put("ZCOCN", updateVO.getOcnCd());
            message.put("ZCEXTC", updateVO.getExtColorCd());
            message.put("ZCINTC", updateVO.getIntColorCd());
            message.put("ZRMTYPE", updateVO.getPaym());
            message.put("ZDREQ", DateUtil.getDate("yyyy-MM-dd"));
            message.put("ZTREQ", DateUtil.getDate("HH:mm:ss"));
            message.put("ZERNAM", updateVO.getUpdtUsrId());

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("SAL147");
            camelClient.setSender(LoginUtil.getDlrCd());
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();

            if (!receiveData.getFooter().getIfResult().equals("Z")) {
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }

            notAssignedOrderDAO.updateNotAssignedOrder(updateVO);
        }
        return 1;
    }

    /**
     * 미배정취소 계획 조회
     */
    @Override
    public boolean orderCancelPlanChk(NotAssignedOrderVO searchVO) throws Exception{
        int cnt = notAssignedOrderDAO.orderCancelPlanSerchCnt(searchVO);
        if(cnt <= 0){
            throw processException("sal.info.orderNoCancelMsg");
        }
        return true;
    }

    /**
     * 미배정 취소신청
     * @param saveVO
     * @return
     * @throws Exception
     **/
    @Override
    public boolean notAssignedOrderCancelAsk(NotAssignedOrderVO saveVO) throws Exception{
        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());

        Map<String, Object> message = new HashMap<String, Object>();
        message.put("ZDREQC", DateUtil.getDate("yyyy-MM-dd"));
        message.put("ZTREQC", DateUtil.getDate("HH:mm:ss"));
        message.put("VBELN", saveVO.getSalesNo());
        message.put("KUNNR", saveVO.getDlrCd());
        message.put("AUGRU", saveVO.getSord());
        message.put("SPMON", saveVO.getOrdYyMm());
        message.put("WEEKN", saveVO.getOrdWeek());
        message.put("ZCORDGD", saveVO.getOrdGradeCd());
        message.put("ZCCAR", saveVO.getCarlineCd());
        message.put("ZCMCG", saveVO.getModelCd());
        message.put("ZCOCN", saveVO.getOcnCd());
        message.put("ZCEXTC", saveVO.getExtColorCd());
        message.put("ZCINTC", saveVO.getIntColorCd());
        message.put("ZCADJST", saveVO.getAdjStatCd());

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL194");      // SAP로 주문취소 신청
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.addSendMessage(message);

        Data receiveData = camelClient.sendRequest();

        if (!receiveData.getFooter().getIfResult().equals("Z")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        // SA_0453T, SA_0453IS
        notAssignedOrderDAO.insertOrderCancelAsk(saveVO);
        notAssignedOrderDAO.orderCancelAskIF(saveVO);
        serviceCommonService.executeCamelClent(new HashMap<String, Object>(),"SAL195"); // SA_0453IS

        return true;
    }

    /**
     * 엑셀 다운로드
     * @param list
     * @throws Exception
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        NotAssignedOrderSearchVO searchVO = new NotAssignedOrderSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<NotAssignedOrderVO> list = notAssignedOrderDAO.selectNotAssignedOrder(searchVO);

        context.putVar("items", list);
    }


    /**
     * 조회 건수
     */
    @Override
    public int selectNotAssignedOrderCancelSearchCnt(NotAssignedOrderSearchVO searchVO)  throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrderCancelSearchCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 정보를 조회한다.
     */
    @Override
    public List<NotAssignedOrderVO> selectNotAssignedOrderCancelSearch(NotAssignedOrderSearchVO searchVO) throws Exception {
        return notAssignedOrderDAO.selectNotAssignedOrderCancelSearch(searchVO);
    }

}
