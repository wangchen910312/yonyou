package chn.bhmc.dms.par.pmm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemMasterSendService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterSendDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO;

/**
 * 품목마스터 전송 정보 관리 서비스 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.27         In Bo Shim            최초 생성
 * </pre>
 */

@Service("itemMasterSendService")
public class ItemMasterSendServiceImpl extends HService implements ItemMasterSendService {

    /**
     * 품목마스터 전송정보 관리 DAO
     */
    @Resource(name="itemMasterSendDAO")
    ItemMasterSendDAO itemMasterSendDAO;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    private static final Logger LOGGER = LoggerFactory.getLogger(ItemMasterSendServiceImpl.class);

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#insertItemMasterSend(chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO)
     */
    @Override
    public int insertItemMasterSend(ItemMasterSendVO itemMasterVO) throws Exception {
        return itemMasterSendDAO.insertItemMasterSend(itemMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#updateItemMasterSend(chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO)
     */
    @Override
    public int updateItemMasterSend(ItemMasterSendVO itemMasterVO) throws Exception {
        return itemMasterSendDAO.updateItemMasterSend(itemMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#deleteItemMasterSend(chn.bhmc.dms.par.pmm.vo.ItemMasterSendVO)
     */
    @Override
    public int deleteItemMasterSend(ItemMasterSendVO itemMasterVO) throws Exception {
        return itemMasterSendDAO.deleteItemMasterSend(itemMasterVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#multiItemMasterSend(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemMasterSend(BaseSaveVO<ItemMasterSendVO> obj) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS102"); //Parts Info Send Code
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd
        Map<String, Object> message = null;

        for(ItemMasterSendVO itemMasterSendVO: obj.getUpdateList()){

            ItemMasterSendSearchVO searchVO = new ItemMasterSendSearchVO();
            searchVO.setsDpsDlrCd(itemMasterSendVO.getDpsDlrCd());
            searchVO.setsDpsPno(itemMasterSendVO.getDpsPno());
            if(itemMasterSendDAO.selectItemMasterSendsByConditionCnt(searchVO) == 0){
                itemMasterSendDAO.insertItemMasterSend(itemMasterSendVO);
            }
            else{
                itemMasterSendDAO.updateItemMasterSend(itemMasterSendVO);
            }

            ItemMasterSendVO itemMasterSendByKeyVO = itemMasterSendDAO.selectItemMasterSendByKey(searchVO);

            message = new HashMap<String, Object>();
            message.put("DPS_CRP", itemMasterSendByKeyVO.getDpsCrp());
            message.put("DPS_CMP_KND", itemMasterSendByKeyVO.getDpsCmpKnd());
            message.put("DPS_DLR_CD", itemMasterSendByKeyVO.getDpsDlrCd());
            message.put("DPS_PNO", itemMasterSendByKeyVO.getDpsPno());
            message.put("DPS_ENT_TYP", itemMasterSendByKeyVO.getDpsEntTyp());
            message.put("DPS_LOC", itemMasterSendByKeyVO.getDpsLoc());
            message.put("DPS_PNM_CHN", itemMasterSendByKeyVO.getDpsPnmChm());
            message.put("DPS_CAR", itemMasterSendByKeyVO.getDpsCar());
            message.put("DPS_OHAD_QT", itemMasterSendByKeyVO.getDpsOhadQt());
            message.put("DPS_DPS_QT", itemMasterSendByKeyVO.getDpsDpsQt());
            message.put("DPS_BO", itemMasterSendByKeyVO.getDpsBo());
            message.put("DPS_OORD", itemMasterSendByKeyVO.getDpsOord());
            message.put("DPS_NON_MOV", itemMasterSendByKeyVO.getDpsNonMov());
            message.put("DPS_CLS", itemMasterSendByKeyVO.getDpsCls());
            message.put("DPS_AMD3", itemMasterSendByKeyVO.getDpsAmd3());
            message.put("DPS_AMD6", itemMasterSendByKeyVO.getDpsAmd6());
            message.put("DPS_AMD12", itemMasterSendByKeyVO.getDpsAmd12());
            message.put("DPS_DMD_FRQ", itemMasterSendByKeyVO.getDpsDmdFrq());
            message.put("DPS_OLD_PNO", itemMasterSendByKeyVO.getDpsOldPno());
            message.put("DPS_OLD_ITC", itemMasterSendByKeyVO.getDpsOldItc());
            message.put("DPS_NEW_PNO", itemMasterSendByKeyVO.getDpsNewPno());
            message.put("DPS_NEW_ITC", itemMasterSendByKeyVO.getDpsNewItc());
            message.put("DPS_QFP", itemMasterSendByKeyVO.getDpsQfp());

            // message add
            camelClient.addSendMessage(message);
        }

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){
                for(ItemMasterSendVO itemMasterSendVO: obj.getUpdateList()){
                    itemMasterSendVO.setIfresult(ifResult);
                    itemMasterSendDAO.updateItemMasterSend(itemMasterSendVO);
                }
            }
        }catch(Exception ex){
            LOGGER.error("itemMaster Interface Failed[multiItemMasterSend]",ex);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
            throw processException("par.lbl.ifErrMsg", lblList);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#multiItemMasterStockSend(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemMasterStockSend(BaseSaveVO<ItemMasterSendVO> obj) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS002"); //Parts Inventory RealTime Send Code
        Map<String, Object> message = null;

        for(ItemMasterSendVO itemMasterSendVO: obj.getUpdateList()){

            message = new HashMap<String, Object>();
            message.put("IVR_PNO", itemMasterSendVO.getDpsPno());

            // message add
            camelClient.addSendMessage(message);
        }

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){

            }
        }catch(Exception ex){
            LOGGER.error("itemMaster Interface Failed[multiItemMasterStockSend]",ex);
            lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
            throw processException("par.lbl.ifErrMsg", lblList);
        }
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#selectItemMasterSendByKey(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public ItemMasterSendVO selectItemMasterSendByKey(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception {
        return itemMasterSendDAO.selectItemMasterSendByKey(itemMasterSendSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#selectItemMasterSendsByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterSendVO> selectItemMasterSendsByCondition(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception {
        return itemMasterSendDAO.selectItemMasterSendsByCondition(itemMasterSendSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterSendService#selectItemMasterSendsByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO)
     */
    @Override
    public int selectItemMasterSendsByConditionCnt(ItemMasterSendSearchVO itemMasterSendSearchVO) throws Exception {
        return itemMasterSendDAO.selectItemMasterSendsByConditionCnt(itemMasterSendSearchVO);
    }
}
