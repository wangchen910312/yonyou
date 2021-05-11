package chn.bhmc.dms.par.cpm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.cpm.service.LeaveItemInterfaceService;
import chn.bhmc.dms.par.cpm.service.dao.LeaveItemInterfaceDAO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemResultVO;
import chn.bhmc.dms.par.cpm.vo.LeaveItemVO;

/**
 * 방치품관리 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 27.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 27.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("leaveItemInterfaceService")
public class LeaveItemInterfaceServiceImpl extends HService implements LeaveItemInterfaceService {

    Logger logger = LoggerFactory.getLogger(LeaveItemInterfaceServiceImpl.class);

    @Resource(name="leaveItemInterfaceDAO")
    private LeaveItemInterfaceDAO leaveItemInterfaceDAO;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemInterfaceService#selectLeaveItemInterfacesByCondition(chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO)
     */
    @Override
    public List<LeaveItemInterfaceVO> selectLeaveItemInterfacesByCondition(LeaveItemInterfaceSearchVO searchVO)
            throws Exception {
        return leaveItemInterfaceDAO.selectLeaveItemInterfacesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemInterfaceService#selectLeaveItemInterfacesByConditionCnt(chn.bhmc.dms.par.cpm.vo.LeaveItemInterfaceSearchVO)
     */
    @Override
    public int selectLeaveItemInterfacesByConditionCnt(LeaveItemInterfaceSearchVO searchVO) throws Exception {
        return leaveItemInterfaceDAO.selectLeaveItemInterfacesByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.cpm.service.LeaveItemInterfaceService#multiLeaveItemSend(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiLeaveItemSend(List<LeaveItemVO> leaveItemVOList) throws Exception {

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("PTS512");//방치품전송 인터페이스 코드
        camelClient.setSender(LoginUtil.getDlrCd());// set sender dlrCd

        String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");

        List<Map<String, Object>> messages = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> fileMessages = new ArrayList<Map<String, Object>>();

        for(LeaveItemVO leaveItemVO: leaveItemVOList){

            Map<String, Object> message = new HashMap<String, Object>();
            message.put("PART_NO", leaveItemVO.getItemCd());
            message.put("NUMBER", String.valueOf(leaveItemVO.getAvlbStockQty()));
            message.put("PRICE", String.valueOf(leaveItemVO.getStockAmt()));

            String stayDt = "";
            if(leaveItemVO.getStayDt() != null){
                stayDt = DateUtil.convertToString(leaveItemVO.getStayDt(), dateFormat);
            }

            message.put("INVENTORY_TIME", stayDt);//format yyyy-MM-dd

            String lastGiDt = "";
            if(leaveItemVO.getLastGiDt() != null){
                lastGiDt = DateUtil.convertToString(leaveItemVO.getLastGiDt(), dateFormat);
            }

            message.put("BUY_DATE", lastGiDt);//format yyyy-MM-dd
            message.put("DESCRIBE", lastGiDt);//format yyyy-MM-dd

            fileMessages = new ArrayList<Map<String, Object>>();

            Map<String, Object> fileMessage01 = new HashMap<String, Object>();
            fileMessage01.put("FILEVALUE", leaveItemVO.getFileDataContBase64());
            fileMessage01.put("FILENAME", leaveItemVO.getFileName());
            fileMessage01.put("WIDTH", leaveItemVO.getFileWidth());
            fileMessage01.put("HEIGHT", leaveItemVO.getFileHeight());

            String isPrimary = "";
            if(!StringUtils.isEmpty(leaveItemVO.getFileName())){
                isPrimary = "1";//파일명 있을 때
            }

            fileMessage01.put("IS_PRIMARY", isPrimary);
            fileMessage01.put("DESC", leaveItemVO.getDesc());
            fileMessages.add(fileMessage01);

            message.put("FILE", fileMessages);

            messages.add(message);
        }

        Map<String, Object> msg = new HashMap<String, Object>();
        msg.put("GOODS", messages);

        // message add
        camelClient.addSendMessage(msg);

        String[] lblList = new String[1];
        try{
            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();

            if("Z".equals(ifResult)){//전송결과

                List<LeaveItemResultVO> leaveItemResultVOList = receiveData.readMessages(LeaveItemResultVO.class);

                if(leaveItemResultVOList.size() > 0){
                    LeaveItemResultVO leaveItemResultVO = leaveItemResultVOList.get(0);

                    //상태코드
                    String status = leaveItemResultVO.getStatus();

                    if("1".equals(status)){//success

                    }else{//error

                        if("0".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg00", null, LocaleContextHolder.getLocale());
                        }else if("-1".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg01", null, LocaleContextHolder.getLocale());
                        }else if("-2".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg02", null, LocaleContextHolder.getLocale());
                        }else if("-3".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg03", null, LocaleContextHolder.getLocale());
                        }else if("-4".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg04", null, LocaleContextHolder.getLocale());
                        }else if("-5".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg05", null, LocaleContextHolder.getLocale());
                        }else if("-6".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg06", null, LocaleContextHolder.getLocale());
                        }else if("-7".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg07", null, LocaleContextHolder.getLocale());
                        }else if("-8".equals(status)){
                            lblList[0] = messageSource.getMessage("par.lbl.leaveItemIfErrMsg08", null, LocaleContextHolder.getLocale());
                        }
                        if("-4".equals(status)){
                            logger.error("Not BMP Item");
                            throw processException("par.error.leaveItemNotBmpMsg");
                        }else{
                            logger.error("interface error message");
                            throw processException("par.info.skillQnaIfErrMsg", lblList);
                        }
                    }
                }

            }else{
               logger.error("leaveItem Interface Failed[multiLeaveItemSend]",receiveData.getFooter().getIfFailMsg());
                lblList[0] = messageSource.getMessage("par.info.ifErrRaiMsg", null, LocaleContextHolder.getLocale());
                throw processException("par.info.skillQnaIfErrMsg", lblList);
            }
        }catch(Exception ex){
            logger.error("leaveItem Interface Failed[multiLeaveItemSend]",ex);
            throw ex;
        }
    }


}
