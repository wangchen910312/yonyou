package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairServiceCommonDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceCommonService;
import chn.bhmc.dms.mob.api.repair.vo.CustDemandVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceCommonServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("RepairServiceCommonService")
public class RepairServiceCommonServiceImpl extends HService implements RepairServiceCommonService{

    @Resource(name="RepairServiceCommonDAO")
    RepairServiceCommonDAO RepairServiceCommonDAO;
    
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    public List<CustDemandVO> selectCustDemandsByCondition(TabInfoSearchVO searchVO) throws Exception {


        String dlrCd = LoginUtil.getDlrCd();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(dlrCd);
        }

        return RepairServiceCommonDAO.selectCustDemandsByCondition(searchVO);
    }

    public List<CustDemandVO> selectEtcIssuesByCondition(TabInfoSearchVO searchVO) throws Exception {


        String dlrCd = LoginUtil.getDlrCd();
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
            searchVO.setsDlrCd(dlrCd);
        }

        return RepairServiceCommonDAO.selectEtcIssuesByCondition(searchVO);
    }
    
    public Data executeCamelClentSearchResult(Map<String, Object> message , String ifId)throws Exception{

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.addSendMessage(message);
        camelClient.setSender(LoginUtil.getDlrCd());


        camelClient.setIfId(ifId);

        Data receiveData =  null;

        try{
             receiveData =  camelClient.sendRequest();
            if(!receiveData.getFooter().getIfResult().equals("Z")){
                throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
            }
        }catch(Exception e){
            //throw new Exception(e.getMessage()); messageSource.getMessage("ser.lbl.quest", null, LocaleContextHolder.getLocale())}
            //throw processException("global.err.dcsIfErrMsg", new String[]{"Can not find the I/F data!"});
            throw processException("global.err.dcsIfErrMsg", new String[]{e.getMessage()});
        }

        return receiveData;
    }

   
}
