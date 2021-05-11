package chn.bhmc.dms.mob.api.part.service.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.exception.BizException;
import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.mob.api.part.dao.PartPurcOrdDAO;
import chn.bhmc.dms.mob.api.part.service.PartCommonCodeService;
import chn.bhmc.dms.mob.api.part.service.PartPurcOrdService;
import chn.bhmc.dms.mob.api.part.vo.CommonCodeVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdItemVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdSearchVO;
import chn.bhmc.dms.mob.api.part.vo.PurcOrdVO;
import chn.bhmc.dms.par.pcm.vo.AmosPurcOrdItemVO;


/**
 * 구매오더 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ju Won Lee      최초 생성
 * </pre>
 */
@Service("PartPurcOrdService")
public class PartPurcOrdServiceImpl extends HService implements PartPurcOrdService, JxlsSupport {

    @Resource(name="PartPurcOrdDAO")
    private PartPurcOrdDAO PartPurcOrdDAO;


  
    /**
     * 구매제시 서비스
     */

    @Resource(name="PartCommonCodeService")
    PartCommonCodeService PartCommonCodeService;

    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

 
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public PurcOrdVO selectPurcOrdByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception {

        return PartPurcOrdDAO.selectPurcOrdByKey(purcOrdSearchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdesByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdVO> selectPurcOrdsByCondition(PurcOrdSearchVO searchVO) throws Exception {
        return PartPurcOrdDAO.selectPurcOrdsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdsByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdsByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {
        return PartPurcOrdDAO.selectPurcOrdsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdItemByKey(chn.bhmc.dms.par.pcm.vo.PurcOrdVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdItemByKey(PurcOrdSearchVO purcOrdSearchVO) throws Exception {

        return PartPurcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByCondition(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public List<PurcOrdItemVO> selectPurcOrdStatusByCondition(PurcOrdSearchVO searchVO) throws Exception {

        return PartPurcOrdDAO.selectPurcOrdStatusByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusByConditionCnt(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public int selectPurcOrdStatusByConditionCnt(PurcOrdSearchVO searchVO) throws Exception {

        return PartPurcOrdDAO.selectPurcOrdStatusByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initJxlsContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();

        PurcOrdSearchVO searchVO = new PurcOrdSearchVO();

        List<String> sPurcOrdStatLst = new ArrayList<String>();
        String sPurcOrdStatCd;
        String[] arrayPurcOrdStatCdStr;

        List<String> sBpCdLst = new ArrayList<String>();
        String sBpCd;
        String[] arrayBpCdStr;

        String sListType = params.get("sListType").toString();

        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsDelYn("Y");

        if (StringUtils.isNotEmpty((String)params.get("sPurcOrdStatLst"))) {
            sPurcOrdStatCd = (String)params.get("sPurcOrdStatLst");
            arrayPurcOrdStatCdStr = sPurcOrdStatCd.split(",");
            sPurcOrdStatLst = Arrays.asList(arrayPurcOrdStatCdStr);

            searchVO.setsPurcOrdStatLst(sPurcOrdStatLst);
        }

        if (StringUtils.isNotEmpty((String)params.get("sBpCdList"))) {
            sBpCd = (String)params.get("sBpCdList");
            arrayBpCdStr = sBpCd.split(",");
            sBpCdLst = Arrays.asList(arrayBpCdStr);
            searchVO.setsBpCdList(sBpCdLst);
        }

        if(!StringUtils.isBlank(params.get("sPurcRegDtFr").toString())){
            String sPurcRegDtFr = params.get("sPurcRegDtFr").toString();
            Date dPurcRegDtFr = Date.valueOf(sPurcRegDtFr);
            searchVO.setsPurcRegDtFr(dPurcRegDtFr);
        }

        if(!StringUtils.isBlank(params.get("sPurcRegDtTo").toString())){
            String sPurcRegDtTo = params.get("sPurcRegDtTo").toString();
            Date dPurcRegDtTo = Date.valueOf(sPurcRegDtTo);
            searchVO.setsPurcRegDtTo(dPurcRegDtTo);
        }

        if(!StringUtils.isBlank(params.get("sArrvDtFr").toString())){
            String sArrvDtFr = params.get("sArrvDtFr").toString();
            Date dArrvDtFr = Date.valueOf(sArrvDtFr);
            searchVO.setsArrvDtFr(dArrvDtFr);
        }

        if(!StringUtils.isBlank(params.get("sArrvDtTo").toString())){
            String sArrvDtTo = params.get("sArrvDtTo").toString();
            Date dArrvDtTo = Date.valueOf(sArrvDtTo);
            searchVO.setsArrvDtTo(dArrvDtTo);
        }


        if(!StringUtils.isBlank(params.get("sConfirmFr").toString())){
            String sConfirmFr = params.get("sConfirmFr").toString();
            Date dConfirmFr = Date.valueOf(sConfirmFr);
            searchVO.setsConfirmFr(dConfirmFr);
        }

        if(!StringUtils.isBlank(params.get("sConfirmTo").toString())){
            String sConfirmTo = params.get("sConfirmTo").toString();
            Date dConfirmTo = Date.valueOf(sConfirmTo);
            searchVO.setsConfirmTo(dConfirmTo);
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<CommonCodeVO> purcOrdTpList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR203", null, langCd);
        List<CommonCodeVO> purcOrdStatList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR204", null, langCd);
        HashMap<String, String> purcOrdStatMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : purcOrdStatList ){
            purcOrdStatMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> dlPdcCdList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR214", null, langCd);
        HashMap<String, String> dlPdcCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : dlPdcCdList ){
            dlPdcCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> purcPgssCdList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR210", null, langCd);
        HashMap<String, String> purcPgssCdMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : purcPgssCdList ){
            purcPgssCdMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }
        List<CommonCodeVO> trsfTpList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR205", null, langCd);
        HashMap<String, String> trsfTpMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : trsfTpList ){
            trsfTpMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        List<CommonCodeVO> ammendCodeList = PartCommonCodeService.selectCommonCodesByCmmGrpCd("PAR207", null, langCd);
        HashMap<String, String> ammendCodeMap = new HashMap<String, String>();
        for( CommonCodeVO cmmVO : ammendCodeList ){
            ammendCodeMap.put(cmmVO.getCmmCd(), cmmVO.getCmmCdNm());
        }

        if(StringUtil.nullConvert(sListType).equals("H")){
            List<PurcOrdVO> list = selectPurcOrdsByCondition(searchVO);

            //공통코드 또는 코드 명칭  변환 처리.
            for(PurcOrdVO purcOrdVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdVO.getPurcOrdTp())){
                        purcOrdVO.setPurcOrdTp("["+purcOrdVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }

                for(CommonCodeVO purcOrdStat : purcOrdStatList){
                    if(purcOrdStat.getCmmCd().equals(purcOrdVO.getPurcOrdStatCd())){
                        purcOrdVO.setPurcOrdStatCd("["+purcOrdVO.getPurcOrdStatCd()+"]"+purcOrdStat.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        }else if(StringUtil.nullConvert(sListType).equals("RT")){
            @SuppressWarnings("unchecked")
            List<PurcOrdItemVO> list = (List<PurcOrdItemVO>) selectPurcOrdStatusInterfaceRealTime(searchVO).getData();
            for(PurcOrdItemVO purcOrdItemVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdItemVO.getPurcOrdTp())){
                        purcOrdItemVO.setPurcOrdTp("["+purcOrdItemVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }
                purcOrdItemVO.setDlDistCd(dlPdcCdMap.get(String.valueOf(purcOrdItemVO.getDlDistCd())));
                purcOrdItemVO.setPurcPgssCd(purcPgssCdMap.get(String.valueOf(purcOrdItemVO.getPurcPgssCd())));
                purcOrdItemVO.setTrsfTp(trsfTpMap.get(String.valueOf(purcOrdItemVO.getTrsfTp())));
            }
            context.putVar("items",list);
        }else {
            List<PurcOrdItemVO> list = selectPurcOrdStatusByCondition(searchVO);
            //공통코드 또는 코드 명칭  변환 처리.
            for(PurcOrdItemVO purcOrdVO : list){
                for(CommonCodeVO purcOrdTp : purcOrdTpList){
                    if(purcOrdTp.getCmmCd().equals(purcOrdVO.getPurcOrdTp())){
                        purcOrdVO.setPurcOrdTp("["+purcOrdVO.getPurcOrdTp()+"]"+purcOrdTp.getCmmCdNm());
                        break;
                    }
                }
                purcOrdVO.setPurcItemStatCd(purcOrdStatMap.get(String.valueOf(purcOrdVO.getPurcItemStatCd())));
                purcOrdVO.setDlDistCd(dlPdcCdMap.get(String.valueOf(purcOrdVO.getDlDistCd())));
                purcOrdVO.setTrsfTp(trsfTpMap.get(String.valueOf(purcOrdVO.getTrsfTp())));
                purcOrdVO.setEditCd(ammendCodeMap.get(String.valueOf(purcOrdVO.getEditCd())));
                purcOrdVO.setPurcPgssCd(purcPgssCdMap.get(String.valueOf(purcOrdVO.getPurcPgssCd())));

            }
            context.putVar("items", list);
        }
    }
    
    /*
     * @see chn.bhmc.dms.par.pcm.service.PurcOrdService#selectPurcOrdStatusInterfaceRealTime(chn.bhmc.dms.par.pcm.vo.PurcOrdSearchVO)
     */
    @Override
    public SearchResult selectPurcOrdStatusInterfaceRealTime(PurcOrdSearchVO searchVO) throws Exception {

        List<PurcOrdItemVO> purcOrdItemVOList = new ArrayList<PurcOrdItemVO>();
        List<AmosPurcOrdItemVO> results = null;
        PurcOrdItemVO purcOrdItemVO = null;
        PurcOrdSearchVO purcOrdSearchVO = null; //부품명 검색(DB 조회)을 위해 만듦
        SearchResult result = new SearchResult();

        try{
            Map<String, Object> message = new HashMap<String, Object>();

            message.put("ORH_DLR_CD", searchVO.getsDlrCd());
            message.put("ORH_ORD_NO", searchVO.getsBmpOrdNo());
            message.put("ORH_INS_START_DT", searchVO.getsBmpOrdDtFr());
            message.put("ORH_INS_END_DT", searchVO.getsBmpOrdDtTo());

            CamelClient camelClient = camelClientFactory.createCamelClient();
            camelClient.setIfId("PTS005");
            camelClient.setSender(LoginUtil.getDlrCd());
            camelClient.addSendMessage(message);

            Data receiveData = camelClient.sendRequest();
            String ifResult = receiveData.getFooter().getIfResult();
            String ifFailMsg = receiveData.getFooter().getIfFailMsg();

            // success : Z, error : E
            // ifFailMsg를 넣은 이유 : 인터페이스에 없는 오더번호를 입력하여 가져온 경우 ifResult는 Z이나 IfFailMsg는 No data라서 이클립스 Error 발생.(화면에서는 보이지 않음)
            if("Z".equals(ifResult) && "SUCCESS".equals(ifFailMsg)){
                results = receiveData.readMessages(AmosPurcOrdItemVO.class);
                if(results.size() > 0) {
                    //구매오더상태에 있는 bmp오더인지 확인 (있으면 DB 데이터 보여줌, 없으면 실시간 데이터 보여줌)
                    searchVO.setsConfirmFr(searchVO.getsConfirmFr());
                    searchVO.setsConfirmTo(searchVO.getsConfirmTo());
                    int purcOrdResult = PartPurcOrdDAO.selectPurcOrdStatusByConditionCnt(searchVO);
                    if(purcOrdResult > 0 ){
                        purcOrdItemVOList = PartPurcOrdDAO.selectPurcOrdStatusByCondition(searchVO);
                    }else{
                        for(AmosPurcOrdItemVO amosPurcOrdItemVO : results) {
                            purcOrdItemVO = new PurcOrdItemVO();
                            purcOrdSearchVO = new PurcOrdSearchVO();
                            purcOrdItemVO.setDlrCd(searchVO.getsDlrCd());
                            purcOrdItemVO.setPurcOrdTp(amosPurcOrdItemVO.getOrhOrdTyp());
                            //Confirm Flag를 이용해서 구매오더상태를 알아낸다. ("05" : 취소(전체) , "03" : 처리)
                            //if(amosPurcOrdItemVO.getOrdCfmAplFlg().equals("N")){
                            //    purcOrdItemVO.setPurcItemStatCd("05");
                            //}else{
                            //    purcOrdItemVO.setPurcItemStatCd("03");
                            //}
                            //넘어온 날짜는 string, purcOrdItemVO는 date 타입이기 때문에 사용함.
                            //purcOrdItemVO.setPurcRegDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getOrhOrdRcveDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getOrhOrdRcveDt().substring(4,6)+"-"+amosPurcOrdItemVO.getOrhOrdRcveDt().substring(6,8)));
                            purcOrdItemVO.setConfirmDt(amosPurcOrdItemVO.getOrhCfmDt());
                            purcOrdItemVO.setPurcOrdNo(amosPurcOrdItemVO.getOrhDlrOrdNo());
                            purcOrdItemVO.setBmpOrdNo(amosPurcOrdItemVO.getOrdOrdNo());
                            purcOrdItemVO.setBpCd("A10AA001");    //프로시저에 공급업체는 무조건 BMP로 함. (AMOS 것만 구매함)
                            purcOrdItemVO.setBpNm("BMP");
                            purcOrdItemVO.setItemCd(amosPurcOrdItemVO.getOrdOrdPno());
                            //itemCd를 이용, 구매오더 부품 정보를 조회(쿼리)하여 부품이름을 가져옴. 우리 DB에 없는 부품일 경우 Error
                            purcOrdSearchVO.setsDlrCd(purcOrdItemVO.getDlrCd());
                            purcOrdSearchVO.setsPurcOrdNo(purcOrdItemVO.getPurcOrdNo());
                            purcOrdSearchVO.setsItemCd(purcOrdItemVO.getItemCd());
                            if(PartPurcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO).size() > 0){
                                purcOrdItemVO.setItemNm(PartPurcOrdDAO.selectPurcOrdItemByKey(purcOrdSearchVO).get(0).getItemNm());
                            }else{
                                purcOrdItemVO.setItemNm("");
                            }

                            purcOrdItemVO.setConfirmParNo(amosPurcOrdItemVO.getCfPno());
                            purcOrdItemVO.setPurcQty(amosPurcOrdItemVO.getOrdOrdQt());
                            purcOrdItemVO.setConfirmQty(amosPurcOrdItemVO.getCfQt());
                            purcOrdItemVO.setPurcPrc(amosPurcOrdItemVO.getOrdUpceCur());
                            //Confirm Flag를 이용하여 구매금액을 결정함. ("N" : 취소)
                            //if(amosPurcOrdItemVO.getOrdCfmAplFlg().equals("N")){
                            //    purcOrdItemVO.setPurcPrc(0.0);
                            //}else {
                            //    purcOrdItemVO.setPurcPrc(amosPurcOrdItemVO.getOrdUpceNdp()+amosPurcOrdItemVO.getOrdVatAmt());
                            //}
                            //취소 수량이 0, 구매오더 상태가 전체취소 ("05") 인경우 : 오더수량 = 취소수량
                            //if(amosPurcOrdItemVO.getOrdXclQt()== 0.0){
                            //    if(purcOrdItemVO.getPurcItemStatCd().equals("05")){
                            //        purcOrdItemVO.setCancQty(purcOrdItemVO.getPurcQty());
                            //    }else{
                            //        purcOrdItemVO.setCancQty(0.0);
                            //    }
                            //}
                            purcOrdItemVO.setDlDistCd(amosPurcOrdItemVO.getOrdPdc());
                            //Order Processing Code가 " "인 경우 : PURC_PGSS_CD = "P", 나머지 경우 : 넘어온 값
                            if(amosPurcOrdItemVO.getOrdOrdDtlPrc().equals(" ")){
                                purcOrdItemVO.setPurcPgssCd("P");
                            }else{
                                purcOrdItemVO.setPurcPgssCd(amosPurcOrdItemVO.getOrdOrdDtlPrc());
                            }
                            //설정된 PURC_PGSS_CD에 따라 confirmQty를 달리 해줌.
                            //if(purcOrdItemVO.getPurcPgssCd().equals("C") || purcOrdItemVO.getPurcPgssCd().equals("D")
                            //        || purcOrdItemVO.getPurcPgssCd().equals("Y")){
                            //    if(amosPurcOrdItemVO.getCfQt() > 0){
                            //        purcOrdItemVO.setCalcConfirmQty(amosPurcOrdItemVO.getCfQt()-amosPurcOrdItemVO.getOrdXclQt());
                            //    }else {
                            //        purcOrdItemVO.setCalcConfirmQty(0.0);
                            //    }
                            //}else if(purcOrdItemVO.getPurcPgssCd().equals("X") || purcOrdItemVO.getPurcPgssCd().equals("Z")){
                            //    purcOrdItemVO.setCalcConfirmQty(amosPurcOrdItemVO.getOrdShpQt()+amosPurcOrdItemVO.getOrdAlcQt()
                            //            +amosPurcOrdItemVO.getOrdOpicQt()+amosPurcOrdItemVO.getOrdPakdQt()+amosPurcOrdItemVO.getOrdInvQt());
                            //}else {
                            //    purcOrdItemVO.setCalcConfirmQty((double)amosPurcOrdItemVO.getCfQt());
                            //}
                            purcOrdItemVO.setCalcConfirmQty((double)amosPurcOrdItemVO.getCfQt());
                            purcOrdItemVO.setCancReqQty((int)amosPurcOrdItemVO.getOrdXclQt());
                            purcOrdItemVO.setEditCd(amosPurcOrdItemVO.getOrdLstAmcd());
                            purcOrdItemVO.setBoQty(amosPurcOrdItemVO.getOrdLstBoQt());
                            purcOrdItemVO.setOdrAlcQt((int)amosPurcOrdItemVO.getOrdAlcQt());
                            purcOrdItemVO.setOdrOpicQt((int)amosPurcOrdItemVO.getOrdOpicQt());
                            purcOrdItemVO.setOdrOpacQt((int)amosPurcOrdItemVO.getOrdOpacQt());
                            purcOrdItemVO.setOdrPakdQt((int)amosPurcOrdItemVO.getOrdPakdQt());
                            purcOrdItemVO.setOdrInvQt((int)(amosPurcOrdItemVO.getOrdInvQt()+amosPurcOrdItemVO.getOrdShpQt()));
                            purcOrdItemVO.setMobisInvcNo(amosPurcOrdItemVO.getIvdInvNo());
                            purcOrdItemVO.setBoxNo(amosPurcOrdItemVO.getCaseNo());
                            purcOrdItemVO.setTrsfTp(amosPurcOrdItemVO.getTrnDesc());
                            purcOrdItemVO.setTrsfUsrId(amosPurcOrdItemVO.getTrncd());
                            //넘어온 날짜는 string, purcOrdItemVO는 date 타입이기 때문에 사용함.
                            //purcOrdItemVO.setInvcDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getInsInvDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getInsInvDt().substring(4,6)+"-"+amosPurcOrdItemVO.getInsInvDt().substring(6,8)));
                            //purcOrdItemVO.setArrvDt(DateUtil.convertToSqlDate(amosPurcOrdItemVO.getInsSndDt().substring(0,4)+"-"
                            //        +amosPurcOrdItemVO.getInsSndDt().substring(4,6)+"-"+amosPurcOrdItemVO.getInsSndDt().substring(6,8)));   //구매오더상태와 다름.
                            purcOrdItemVO.setPurcOrdLineNo(amosPurcOrdItemVO.getOrdOrdLn());

                            purcOrdItemVOList.add(purcOrdItemVO);
                        }
                    }

                    result.setTotal(results.size());
                    result.setData(purcOrdItemVOList);
                }
            }else {
                result.setTotal(0);
                //throw processException("par.lbl.ifErrMsgParam"); //인터페이스 실패
            }
        }catch(Exception e){
            throw new BizException(e.getMessage());
        }

        return result;
    }

}
