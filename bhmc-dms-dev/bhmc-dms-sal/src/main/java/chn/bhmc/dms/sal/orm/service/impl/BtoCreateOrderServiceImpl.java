package chn.bhmc.dms.sal.orm.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.orm.service.BtoCreateOrderService;
import chn.bhmc.dms.sal.orm.service.dao.BtoCreateOrderDAO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCarInfoVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderAmtPopupVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSaveVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderSearchVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderVO;
import chn.bhmc.dms.sal.orm.vo.OrderChartSearchVO;
import chn.bhmc.dms.sal.orm.vo.OrderChartVO;

/**
 * @ClassName   : BtoCreateOrderServiceImpl
 * @Description : BTO 주문생성
 * @author Bong
 * @since 2016. 2. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.16           Bong                 최초 생성
 * </pre>
 */

@Service("btoCreateOrderService")
public class BtoCreateOrderServiceImpl extends HService implements BtoCreateOrderService {

    /**
     * BTO주문생성 DAO 선언
     */
    @Resource(name="btoCreateOrderDAO")
    BtoCreateOrderDAO btoCreateOrderDAO;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 주차 및 메모 정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectWeekRemark(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectWeekRemark(searchVO);
    };

    /**
     * 납기예시일를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectPfpExamDt(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectPfpExamDt(searchVO);
    };

    /**
     * 참고수량  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectRefOrdQty(BtoCreateOrderSearchVO searchVO) throws Exception {
        searchVO.setsDeptCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectRefOrdQty(searchVO);
    };

    /**
     * 오더등급  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderEtcVO> selectOrdGradeCd(BtoCreateOrderSearchVO searchVO) throws Exception {
        return btoCreateOrderDAO.selectOrdGradeCd(searchVO);
    };


    /**
     * 전략오더를 제외한 모든 오더 OCN 갯수조회
     */
    @Override
    public int selectBtoOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoOcnListsByConditionCnt(searchVO);
    }

    /**
     * 전략오더를 제외한 모든 오더 OCN조회 (블락적용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoOcnListsByCondition(searchVO);
    }

    /**
     * 전략오더 OCN 갯수조회
     */
    @Override
    public int selectStrOcnListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectStrOcnListsByConditionCnt(searchVO);
    }

    /**
     * 전략오더 OCN 조회 (블락적용)
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectStrOcnListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectStrOcnListsByCondition(searchVO);
    }

    /**
     * 블락 적용된 외장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectBtoExtColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoExtColorListsByConditionCnt(searchVO);
    }

    /**
     * 블락 적용된 외장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoExtColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoExtColorListsByCondition(searchVO);
    }

    /**
     * 블락 적용된 내장색 갯수조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectBtoIntColorListsByConditionCnt(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoIntColorListsByConditionCnt(searchVO);
    }

    /**
     * 블락 적용된 내장색 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBtoIntColorListsByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBtoIntColorListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderVO> selectBtoCreateOrderByCondition(BtoCreateOrderSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectBtoCreateOrderByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectBtoCreateOrderByConditionCnt(BtoCreateOrderSearchVO searchVO)  throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return btoCreateOrderDAO.selectBtoCreateOrderByConditionCnt(searchVO);
    }

    /**
     * 주문 우선순위  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderVO> selectOrdProrCd(BtoCreateOrderVO searchVO) throws Exception {

        searchVO.setDlrCd(LoginUtil.getDlrCd());

        return btoCreateOrderDAO.selectOrdProrCd(searchVO);
    }

    /**
     * BTO 주문을 삭제한다.(실제 데이터 업데이트)
     */
    @Override
    public void delBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception {
        List<BtoCreateOrderVO> checkList = null;
        //인터페이스 전송 메세지
        List<Map<String, Object>> messages = new ArrayList<Map<String, Object>>();
        int cnt = 0;

        for(BtoCreateOrderVO vo : saveVO.getDeleteList()){

            if( vo.getOrdTp().equals("N1") ){
                if( "N".equals(btoCreateOrderDAO.selectChkCreateYn(vo)) ){
                    String strDelOrder = messageSource.getMessage("global.lbl.deleteOrder", null, LocaleContextHolder.getLocale());
                    throw processException("global.lbl.createOrder", new String[]{strDelOrder});
                }
            }

            if(  vo.getOrdNo() != null && !"".equals(vo.getOrdNo()) ){
                checkList = btoCreateOrderDAO.selectBtoCreateOrderValueSearch(vo);
                if( checkList != null && "N".equals(checkList.get(0).getIfresultRtn()) ){
                    // 미전송건은 삭제할 수 없습니다.  - ERP 미전송 여부
                    throw processException("sal.info.erpResultRtn");
                }
            }

            vo.setOrdStatCd("1A");
            vo.setStrOrdQty("0");
            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setUpdtUsrId(LoginUtil.getUserId());
            vo.setErpTargYn("Y");
            vo.setErpSendYn("N");

            cnt++;
            messages.add(buildMessage(vo, cnt));

        }

        Data receiveData = sendRequest(saveVO, messages);

        //인터페이스 성공시
        if("Z".equals(receiveData.getFooter().getIfResult())){
            //삭제건
            for(BtoCreateOrderVO vo : saveVO.getDeleteList()){
                vo.setIfresultRtn("Z");
                vo.setIffailmsgRtn("");
                btoCreateOrderDAO.updateBtoCreateOrderDelete(vo);
            }
        //인터페이스 실패시
        }else{
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }
    }

    /**
     * BTO 주문을 등록 및 수정한다.
     */
    @Override
    public void saveBtoCreateOrder(BtoCreateOrderSaveVO saveVO) throws Exception {

        //인터페이스 전송 메세지
        List<Map<String, Object>> messages = new ArrayList<Map<String, Object>>();

        int cnt = 0;
        int ordNo = 0;

        for(BtoCreateOrderVO vo : saveVO.getInsertList()){

            // 전략오더 마감체크.
            if( vo.getOrdTp().equals("AS") ){
                DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
                deadLineVO.setsCtrlGrpCd("A");                      // 오더
                deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
                deadLineVO.setsCtrlTargCd("AS");                    // 전략오더
                if(deadlineCtrlMngService.selectDeadLineCheck(deadLineVO) > 0){
                    // [전략오더]는 마감되었습니다.
                    throw processException("sal.info.deadLineCheckMsg", new String[]{messageSource.getMessage("sal.menu.strageOrder", null, LocaleContextHolder.getLocale())});
                }
            }

            if( vo.getOrdTp().equals("N1") ){
                if( "N".equals(btoCreateOrderDAO.selectChkCreateYn(vo)) ){
                    String strCreateOrder = messageSource.getMessage("global.lbl.createOrder", null, LocaleContextHolder.getLocale());
                    throw processException("sal.err.chkOrdDtBtoCreateOrd", new String[]{strCreateOrder});
                }
            }

            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setStrOrdQty("1");
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());
            vo.setErpTargYn("Y");
            vo.setErpSendYn("N");
            vo.setOrdStatCd("1D");

            int dupCheck = btoCreateOrderDAO.selectDupOrderPropCd(vo);

            if( dupCheck > 0){
                throw processException("global.info.ordDuplicateCheckNew");
                //throw processException("global.info.duplicateCheck", new String[]{messageSource.getMessage("sal.lbl.assignPror", null, LocaleContextHolder.getLocale())});
            }

            if(ordNo == 0){
                ordNo = btoCreateOrderDAO.selectNextOrdNo(vo);
            }

            vo.setOrdNo(StringUtils.leftPad(ordNo+"", 4, "0"));

            ordNo++;

            cnt++;
            messages.add(buildMessage(vo, cnt));
        }

        for(BtoCreateOrderVO vo : saveVO.getUpdateList()){
            vo.setDlrCd(LoginUtil.getDlrCd());
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());
            vo.setStrOrdQty("1");
            vo.setErpTargYn("N");
            vo.setErpSendYn("N");

            cnt++;
            messages.add(buildMessage(vo, cnt));
        }

        Data receiveData = sendRequest(saveVO, messages);

        //인터페이스 성공시
        if("Z".equals(receiveData.getFooter().getIfResult())){
            //신규건
            for(BtoCreateOrderVO vo : saveVO.getInsertList()){
                vo.setIfresultRtn("Z");
                vo.setIffailmsgRtn("");
                btoCreateOrderDAO.insertBtoCreateOrder(vo);
            }

            //변경건
            for(BtoCreateOrderVO vo : saveVO.getUpdateList()){
                vo.setIfresultRtn("Z");
                vo.setIffailmsgRtn("");
                btoCreateOrderDAO.updateBtoCreateOrder(vo);
            }
        //인터페이스 실패시
        }else{
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

    }

    private Data sendRequest(BtoCreateOrderSaveVO saveVO, List<Map<String, Object>> messages) throws Exception {
      //인터페이스 호출
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL059");
        camelClient.setCompany("H");
        camelClient.setSender(LoginUtil.getDlrCd());
        camelClient.setReceiver("ERP");
        camelClient.setContextId("1");
        camelClient.setTotCount(messages.size());
        camelClient.setTranCount(messages.size());

        camelClient.addSendMessages(messages);
        Data receiveData;

        try{
            receiveData = camelClient.sendRequest();
        }catch(Exception e){
            //인터페이스 통신 시 에러가 발생되었습니다1.
            throw processException("par.info.ifErrRaiMsg");
        }

        return receiveData;
    }

    private Map<String, Object> buildMessage(BtoCreateOrderVO vo, int cnt){
        Map<String, Object> message = new HashMap<String, Object>();
        message.put("SEQ", DateUtil.getDate("yyyyMMddHHmmss" +StringUtils.leftPad(cnt+"", 4, "0")));
        message.put("DLR_CD", vo.getDlrCd());
        message.put("ORD_TP", vo.getOrdTp());
        message.put("ORD_YY_MM_DT", vo.getOrdYyMmDt());
        message.put("ORD_PRID", vo.getOrdPrid());
        message.put("ORD_NO", vo.getOrdNo());
        message.put("CARLINE_CD", vo.getCarlineCd());
        message.put("MODEL_CD", vo.getModelCd());
        message.put("OCN_CD", vo.getOcnCd());
        message.put("EXT_COLOR_CD", vo.getExtColorCd());
        message.put("INT_COLOR_CD", vo.getIntColorCd());
        message.put("ORD_QTY", vo.getStrOrdQty());
        message.put("FST_CONFIRM_QTY", 0);
        message.put("SCND_CONFIRM_QTY", 0);
        message.put("SCND_PAR_ISFF_ADJ_QTY", 0);
        message.put("ORD_GRADE_CD", vo.getOrdGradeCd());

        if(vo.getOrdTp().equals("N1")){ //일반오더이면 우선순위를 입력한다.
            message.put("ORD_PROR_CD", vo.getOrdProrCd());
        }else{
            message.put("ORD_PROR_CD", "");
        }

        message.put("TRSF_DLR_CD", vo.getDlrCd());
        message.put("DL_DIST_CD", "");
        message.put("ORD_STAT_CD", vo.getOrdStatCd());
        message.put("ORD_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
        message.put("PROD_ARRG_YN", "N");
        message.put("PFP_EXAM_DT", vo.getPfpExamDt());
        message.put("ERP_TARG_YN", vo.getErpTargYn());
        message.put("ERP_TRSF_DT", "");
        message.put("ERP_SEND_YN", vo.getErpSendYn());
        message.put("SCND_CONFIRM_DT", null);
        message.put("FST_CONFIRM_DT", null);
        message.put("NAPPROVE_REASON_CD", null);
        message.put("SCRN_ID", null);
        message.put("APPLY_STAT_CD", null);
        message.put("SALE_RGST_ID", vo.getSaleRgstId());
        message.put("REMARK", vo.getRemark());
        message.put("OCN_CD_OLD", null);
        message.put("EX_COLOR_CD_OLD", null);
        message.put("REG_USR_ID", vo.getRegUsrId());
        message.put("REG_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));
        message.put("UPDT_USR_ID", vo.getUpdtUsrId());
        message.put("UPDT_DT", DateUtil.getDate("yyyy-MM-dd HH:mm:ss"));

        return message;
    }

    /**
     * 주문 우선순위  정보를 조회한다.
     */
    @Override
    public List<BtoCreateOrderAmtPopupVO> selectBtoCreateOrderAmtPopup(BtoCreateOrderVO searchVO) throws Exception {

        return btoCreateOrderDAO.selectBtoCreateOrderAmtPopup(searchVO);
    }

    /**
     * 주문유형 : 전략오더 일경우 참고수량 조회
     */
    @Override
    public int selectASOrdRefOrdQtyChkSearch(BtoCreateOrderSearchVO searchVO) throws Exception{
        return btoCreateOrderDAO.selectASOrdRefOrdQtyChkSearch(searchVO);
    }

    /**
     * 전략오더를 제외한 모든 오더 차관조회 (블락적용) 차관적용버젼
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectBlockNewCarLooksModelListByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectBlockNewCarLooksModelListByCondition(searchVO);
    }

    /**
     * 전략오더를 제외한 모든 오더 OCN조회 (블락적용) 차관적용버젼 N1
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectN1BlockNewCarLooksOcnListByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectN1BlockNewCarLooksOcnListByCondition(searchVO);
    }

    /**
     * 전략오더를 제외한 모든 오더 OCN조회 (블락적용) 차관적용버젼 AD
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public List<BtoCarInfoVO> selectADBlockNewCarLooksOcnListByCondition(BtoCarInfoSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectADBlockNewCarLooksOcnListByCondition(searchVO);
    }

    /**
     * 정규자원표를 조회한다.
     */
    @Override
    public int selectnormolOrdChartsByConditionCnt(OrderChartSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectnormolOrdChartsByConditionCnt(searchVO);
    }
    @Override
    public List<OrderChartVO> selectnormolOrdChartsByCondition(OrderChartSearchVO searchVO)throws Exception{
        return btoCreateOrderDAO.selectnormolOrdChartsByCondition(searchVO);
    }

}
