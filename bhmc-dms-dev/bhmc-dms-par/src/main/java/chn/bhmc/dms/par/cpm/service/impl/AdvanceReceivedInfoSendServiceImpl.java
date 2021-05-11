package chn.bhmc.dms.par.cpm.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoDetailService;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoSendService;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoDetailVO;
import chn.bhmc.dms.par.cpm.vo.AdvanceReceivedInfoHeaderVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AdvanceReceivedInfoSendServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 7. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 1.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("advanceReceivedInfoSendService")
public class AdvanceReceivedInfoSendServiceImpl extends HService implements AdvanceReceivedInfoSendService {

    Logger logger = LoggerFactory.getLogger(AdvanceReceivedInfoSendServiceImpl.class);

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 선수금 헤더 서비스
     */
    @Resource(name="advanceReceivedInfoHeaderService")
    AdvanceReceivedInfoHeaderService advanceReceivedInfoHeaderService;

    /**
     * 선수금 상세 서비스
     */
    @Resource(name="advanceReceivedInfoDetailService")
    AdvanceReceivedInfoDetailService advanceReceivedInfoDetailService;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoSendService#multiAdvanceReceivedInfoSend(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiAdvanceReceivedInfoSend(BaseSaveVO<DealerVO> obj)
            throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS003"); //Parts Info Send Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
        Map<String, Object> message = null;

        for(DealerVO dealerVO: obj.getUpdateList()){

            message = new HashMap<String, Object>();
            message.put("APR_DLR_CD", dealerVO.getDlrCd());

            // message add
            camelClient.addSendMessage(message);
        }

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){

                for(DealerVO dealerVO: obj.getUpdateList()){
                    //선수금 상세 수정.
                    AdvanceReceivedInfoDetailVO advanceReceivedInfoDetailVO = new AdvanceReceivedInfoDetailVO();
                    advanceReceivedInfoDetailVO.setDlrCd(dealerVO.getDlrCd());

                    //선수금 헤더 수정.
                    AdvanceReceivedInfoHeaderVO advanceReceivedInfoHeaderVO = new AdvanceReceivedInfoHeaderVO();
                    advanceReceivedInfoHeaderVO.setDlrCd(dealerVO.getDlrCd());

                }
            }
        }catch(Exception ex){
            logger.error("advancedReceiveInfo Interface Failed[multiAdvanceReceivedInfoSend]",ex);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
            throw processException("par.lbl.ifErrMsg", lblList);
        }

    }


}
