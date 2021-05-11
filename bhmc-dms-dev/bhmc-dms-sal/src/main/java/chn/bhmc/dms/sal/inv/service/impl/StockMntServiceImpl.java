package chn.bhmc.dms.sal.inv.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.DBMessageSourceService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cso.service.TestDriveCarService;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.crm.cso.vo.TestDriveCarVO;
import chn.bhmc.dms.par.pmm.service.BinLocationMasterService;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.BinLocationMasterVO;
import chn.bhmc.dms.sal.ctl.service.DeadlineCtrlMngService;
import chn.bhmc.dms.sal.ctl.vo.DeadlineCtrlMngSearchVO;
import chn.bhmc.dms.sal.inv.service.StockMntService;
import chn.bhmc.dms.sal.inv.service.dao.StockMntDAO;
import chn.bhmc.dms.sal.inv.vo.StockMntSaveVO;
import chn.bhmc.dms.sal.inv.vo.StockMntSearchVO;
import chn.bhmc.dms.sal.inv.vo.StockMntVO;

/**
 *
 * @ClassName   : StockMntServiceImpl
 * @Description : 재고관리
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.11.24          최초 생성
 * </pre>
 */

@Service("stockMntService")
public class StockMntServiceImpl extends HService implements StockMntService, JxlsSupport{

    /**
     * 재고상태관리 DAO 선언
     */
    @Resource(name="stockMntDAO")
    StockMntDAO stockMntDAO;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;
    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    StorageService storageService;
    /**
     * 위치 서비스
     */
    @Resource(name="binLocationMasterService")
    BinLocationMasterService binLocationMasterService;

    /**
     * 마감시간 체크
     */
    @Resource(name="deadlineCtrlMngService")
    DeadlineCtrlMngService deadlineCtrlMngService;

    /**
     * CRM 시승 차량 관리 서비스
     */
    @Resource(name="testDriveCarService")
    TestDriveCarService testDriveCarService;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /**
     * 메세지소스 관리 서비스
     */
    @Resource(name="dbMessageSourceService")
    DBMessageSourceService dbMessageSourceService;
    
    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return
     */
    @Override
    public int selectStockMntsByConditionCnt(StockMntSearchVO searchVO) throws Exception{
        return stockMntDAO.selectStockMntsByConditionCnt(searchVO);
    }
    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 StockStateSearchVO
     * @return 조회 목록
     */
    @Override
    public List<StockMntVO> selectStockMntsByCondition(StockMntSearchVO searchVO) throws Exception{
        return stockMntDAO.selectStockMntsByCondition(searchVO);
    }

    @Override
    public int multiStockMnt(StockMntSaveVO saveVO) throws Exception{
        String langCd = LocaleContextHolder.getLocale().getLanguage();

        String damageCd = "";          // 차량상태
        //String blockYn = "";         // Block상태:저장안함
        //String blockSaleAdvNo = "";  // 판매고문:저장안함
        String cmpCarYn = "";          // 회사차여부
        String cmpCarDstinCd = "";     // 회사차구분
        String strgeCd = "";           // 창고
        String locCd = "";             // 위치

        String bfDamageCd = "";         // 차량상태(변경전)
        //String bfBlockYn = "";        // Block상태(변경전)
        //String bfBlockSaleAdvNo = ""; // 판매고문(변경전)
        String bfCmpCarYn = "";         // 회사차여부(변경전)
        String bfCmpCarDstinCd = "";    // 회사차구분(변경전)
        String bfStrgeCd = "";          // 창고(변경전)
        String bfLocCd = "";            // 위치(변경전)


        //차량상태 (손상여부 SAL049)
        HashMap<String, String> damageCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd)){
            damageCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        // 회사차구분 SAL053
        HashMap<String, String> cmpCarDstinCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd)){
            cmpCarDstinCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        // 창고
        HashMap<String, String> storageMap = new HashMap<String, String>();
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        for(StorageVO vo : storageService.selectStoragesByCondition(storageSearchVO)){
            storageMap.put(vo.getStrgeCd(), vo.getStrgeNm());
        }
        // 위치
        HashMap<String, String> locMap = new HashMap<String, String>();
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        for(BinLocationMasterVO vo : binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO)){
            locMap.put(vo.getLocCd(), vo.getLocNm());
        }


        for(StockMntVO updateVO : saveVO.getUpdateList()){
            updateVO.setRegUsrId( LoginUtil.getUserId() );
            updateVO.setUpdtUsrId( LoginUtil.getUserId() );

            stockMntDAO.updateStockMntStates(updateVO);      // SA_0121T : 차량마스터 update

            damageCd = updateVO.getDamageCd() == null ? "" : updateVO.getDamageCd().trim();
            //blockYn= updateVO.getBlockYn() == null ? "" : updateVO.getBlockYn().trim();
            //blockSaleAdvNo= updateVO.getBlockSaleAdvNo() == null ? "" : updateVO.getBlockSaleAdvNo().trim();
            cmpCarYn = updateVO.getCmpCarYn() == null ? "" : updateVO.getCmpCarYn().trim();
            cmpCarDstinCd = updateVO.getCmpCarDstinCd() == null ? "" : updateVO.getCmpCarDstinCd().trim();
            strgeCd = updateVO.getStrgeCd() == null ? "" : updateVO.getStrgeCd().trim();
            locCd = updateVO.getLocCd() == null ? "" : updateVO.getLocCd().trim();

            bfDamageCd = updateVO.getBfDamageCd() == null ? "" : updateVO.getBfDamageCd().trim();
            //bfBlockYn = updateVO.getBfBlockYn() == null ? "" : updateVO.getBfBlockYn().trim();
            //bfBlockSaleAdvNo = updateVO.getBfBlockSaleAdvNo() == null ? "" : updateVO.getBfBlockSaleAdvNo().trim();
            bfCmpCarYn = updateVO.getBfCmpCarYn() == null ? "" : updateVO.getBfCmpCarYn().trim();
            bfCmpCarDstinCd = updateVO.getBfCmpCarDstinCd() == null ? "" : updateVO.getBfCmpCarDstinCd().trim();
            bfStrgeCd = updateVO.getBfStrgeCd() == null ? "" : updateVO.getBfStrgeCd().trim();
            bfLocCd = updateVO.getBfLocCd() == null ? "" : updateVO.getBfLocCd().trim();

            // 차량상태(손상여부) 유형 : SA_0208T 변경 이력 저장
            if( !damageCd.equals(bfDamageCd) ){
                updateVO.setStatChgCd("99");            // 상태변경코드(SAL009) : 차량상태 - 99
                //updateVO.setStatChgBefCont(bfStockTp);                    // 차량상태유형 변경전 코드
                //updateVO.setStatChgAftCont(stockTp);                      // 차량상태유형 변경후 코드
                updateVO.setStatChgBefCont(damageCdMap.get(bfDamageCd) == null ? "" : damageCdMap.get(bfDamageCd));    // 차량상태유형 변경전 명칭
                updateVO.setStatChgAftCont(damageCdMap.get(damageCd) == null ? "" : damageCdMap.get(damageCd));        // 차량상태유형 변경후 명칭
                stockMntDAO.insertStockMntHis(updateVO);
            }

            // 회사차여부 : SA_0208T 변경 이력 저장
            if(!cmpCarYn.equals(bfCmpCarYn) ){
                updateVO.setStatChgCd("53");            // 상태변경코드(SAL009) : 회사차여부 - 53
                updateVO.setStatChgBefCont(bfCmpCarYn);
                updateVO.setStatChgAftCont(cmpCarYn);
                stockMntDAO.insertStockMntHis(updateVO);
            }

            // 회사차구분 : SA_0208T 변경 이력 저장
            if(!cmpCarDstinCd.equals(bfCmpCarDstinCd) ){
                updateVO.setStatChgCd("54");            // 상태변경코드(SAL009) : 회사차구분 - 54
                //updateVO.setStatChgBefCont(bfCmpCarDstinCd);
                //updateVO.setStatChgAftCont(cmpCarDstinCd);
                updateVO.setStatChgBefCont(cmpCarDstinCdMap.get(bfCmpCarDstinCd) == null ? "" : cmpCarDstinCdMap.get(bfCmpCarDstinCd));    // 회사차 변경전 명칭
                updateVO.setStatChgAftCont(cmpCarDstinCdMap.get(cmpCarDstinCd) == null ? "" : cmpCarDstinCdMap.get(cmpCarDstinCd));        // 회사차 변경후 명칭
                stockMntDAO.insertStockMntHis(updateVO);
            }

            // 창고 : SA_0208T 변경 이력 저장
            if(!strgeCd.equals(bfStrgeCd) ){
                updateVO.setStatChgCd("50");            // 상태변경코드(SAL009) : 창고 - 50
                //updateVO.setStatChgBefCont(bfStrgeCd);
                //updateVO.setStatChgAftCont(strgeCd);
                updateVO.setStatChgBefCont(storageMap.get(bfStrgeCd) == null ? "" : storageMap.get(bfStrgeCd));    // 창고 변경전 명칭
                updateVO.setStatChgAftCont(storageMap.get(strgeCd) == null ? "" : storageMap.get(strgeCd));        // 창고 변경후 명칭
                stockMntDAO.insertStockMntHis(updateVO);
            }

            // 위치 : SA_0208T 변경 이력 저장
            if(!locCd.equals(bfLocCd) ){
                updateVO.setStatChgCd("51");            // 상태변경코드(SAL009) : 위치 - 51
                //updateVO.setStatChgBefCont(bfLocCd);
                //updateVO.setStatChgAftCont(locCd);
                updateVO.setStatChgBefCont(locMap.get(bfLocCd) == null ? "" : locMap.get(bfLocCd));   // 위치 변경전 명칭
                updateVO.setStatChgAftCont(locMap.get(locCd) == null ? "" : locMap.get(locCd));       // 위치 변경후 명칭
                stockMntDAO.insertStockMntHis(updateVO);
            }

            // 회사차를 시승차로 변경하거나, 시승차를 다른 구분으로 변경했을 경우.
            if(!bfCmpCarDstinCd.equals( updateVO.getCmpCarDstinCd() )){
                TestDriveCarVO tCarVO = new TestDriveCarVO();
                tCarVO.setDlrCd( LoginUtil.getDlrCd() );
                tCarVO.setPltCd( LoginUtil.getPltCd());
                tCarVO.setRegUsrId(LoginUtil.getUserId());

                // 시승차 입고
                if("01".equals(updateVO.getCmpCarDstinCd())){
                    tCarVO.setTdrvVinNo( updateVO.getVinNo() );
                    tCarVO.setUseYn("Y");
                    testDriveCarService.insertTdrvCar(tCarVO);
                }

                if("01".equals(bfCmpCarDstinCd) ){
                    TestDriveCarSearchVO tSearchVO = new TestDriveCarSearchVO();
                    tSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                    tSearchVO.setsPltCd(LoginUtil.getPltCd());
                    tSearchVO.setsTdrvVinNo(updateVO.getVinNo());

                    // crm에서 시승차 사용중인지 확인 후 삭제
                    if(!testDriveCarService.selectTdrvCarByKeyCnt(tSearchVO)){

                        // [예약] 된 [시승정보]가 있습니다.
                        throw processException("global.info.stInfo"
                                , new String[]{
                                        messageSource.getMessage("global.lbl.resv", null, LocaleContextHolder.getLocale())
                                        ,messageSource.getMessage("global.lbl.tdrvInfo", null, LocaleContextHolder.getLocale())
                                    }
                                );

                    }
                    testDriveCarService.deleteTestDriveCar(tSearchVO);
                }
            }

        }
        return 1;
    }


    /**
     * 전략출고 신청
     **/
    @Override
    public int insertStockStrategyAsk(StockMntSaveVO saveVO) throws Exception{

        // 전략출고신청 마감확인
        DeadlineCtrlMngSearchVO deadLineVO = new DeadlineCtrlMngSearchVO();
        deadLineVO.setsCtrlGrpCd("X");                      // 전략출고
        deadLineVO.setsCtrlDlrCd(LoginUtil.getDlrCd());     // 딜러코드
        deadLineVO.setsCtrlTargCd("X01");                   // 소매처리
        if(deadlineCtrlMngService.selectOneShotCheck(deadLineVO) > 0){
            // [전략출고신청은]는 마감되었습니다.
            //throw processException("sal.info.deadLineCheckMsg", new String[]{messageSource.getMessage("sal.btn.stockStrategyAsk", null, LocaleContextHolder.getLocale())});
            throw processException("sal.info.strategyCheckMsg");
        }

        StockMntSearchVO searchVO = null;
        for(StockMntVO insertVO : saveVO.getInsertList()){
            searchVO = new StockMntSearchVO();
            if(StringUtils.isBlank(insertVO.getDlrCd())){
                searchVO.setsDlrCd(LoginUtil.getDlrCd());
            }
            searchVO.setsCarId(insertVO.getCarId());
            List<StockMntVO> list = stockMntDAO.selectStockMntsByCondition(searchVO);
            if(list != null && list.size() > 0){
                StockMntVO mntVO = list.get(0);
                
                if("Y".equals(mntVO.getStrYn())){
                    //처리건이 존재합니다.
                    throw processException("sal.info.CoercionApprovChkMsg"); 
                }
                
                if("R".equals(mntVO.getReqStatCd())){
                    //이상출고처리 심사중입니다.
                    throw processException("sal.info.excpDelivery");
                }
            }
        }
        
        
        for(StockMntVO insertVO : saveVO.getInsertList()){
            insertVO.setRegUsrId( LoginUtil.getUserId() );
            insertVO.setUpdtUsrId( LoginUtil.getUserId() );
            if(StringUtils.isEmpty(insertVO.getDlrCd())){
                insertVO.setDlrCd(LoginUtil.getDlrCd());
                insertVO.setDlrNm(LoginUtil.getDlrNm());
            }
            stockMntDAO.insertStockStrategyAsk(insertVO);
            insertVO.setStrYn("Y");
            stockMntDAO.updateCarStrStat(insertVO);

            callStockStrategy(insertVO);
        }

        return 1;
    }


    // DMS -> DCS 전략재고 신청
    private boolean callStockStrategy(StockMntVO insertVO) throws Exception{

        String toDay = DateUtil.getDate("yyyy-MM-dd HH:mm:ss");

        Map<String, Object> message = new HashMap<String, Object>();

        message.put("DLR_CD", insertVO.getDlrCd());
        message.put("STR_NO", insertVO.getStrNo());
        message.put("CAR_ID", insertVO.getCarId());
        message.put("VIN_NO", insertVO.getVinNo());
        message.put("STR_STAT", "A"); //신청상태
        message.put("STR_ASK_DT", insertVO.getStrAskDt());
        message.put("STR_CONFIRM_DT", insertVO.getStrConfirmDt());
        message.put("CONFIRM_USR_ID", insertVO.getConfirmUsrId());
        message.put("CONFIRM_REMARK", insertVO.getConfirmRemark());
        message.put("CARLINE_CD", insertVO.getCarlineCd());
        message.put("MODEL_CD", insertVO.getModelCd());
        message.put("OCN_CD", insertVO.getOcnCd());
        message.put("EXT_COLOR_CD", insertVO.getExtColorCd());
        message.put("INT_COLOR_CD", insertVO.getIntColorCd());
        message.put("ORD_TP", insertVO.getOrdTp());
        message.put("CUST_CD", insertVO.getCustCd());
        message.put("CUST_NM", insertVO.getDlrCd()+insertVO.getDlrNm());
        message.put("REMARK", insertVO.getRemark());
        message.put("CONTRACT_NO", insertVO.getContractNo());
        message.put("CANC_DT", insertVO.getCancDt());
        message.put("CAANC_RESON", insertVO.getCaancReson());
        message.put("REG_USR_ID", insertVO.getRegUsrId());
        message.put("REG_DT", toDay);
        message.put("UPDT_USR_ID", insertVO.getUpdtUsrId());
        message.put("UPDT_DT", toDay);
        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("SAL141");           // service id
        camelClient.setSender(insertVO.getDlrCd());
        camelClient.addSendMessage(message);
        Data receiveData = camelClient.sendRequest();

        if (receiveData.getFooter().getIfResult().equals("E")) {
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }

        return true;
    }


    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        StockMntSearchVO searchVO = new StockMntSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        
        if (StringUtils.isNotEmpty((String)params.get("sStartGrDt"))) {
            searchVO.setsStartGrDt(DateUtil.convertToDate((String)params.get("sStartGrDt")));
        }
        
        //if (params.get("sStartGrDt") != null) {
        if (StringUtils.isNotEmpty((String)params.get("sStartGrDt"))) {
            searchVO.setsStartGrDt(DateUtil.convertToDate((String)params.get("sStartGrDt")));
        }
        //if (params.get("sEndGrDt") != null) {
        if (StringUtils.isNotEmpty((String)params.get("sEndGrDt"))) {
            searchVO.setsEndGrDt(DateUtil.convertToDate((String)params.get("sEndGrDt")));
        }

        List<StockMntVO> list = selectStockMntsByCondition(searchVO);

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //update by lyy 查询下载增加承兑汇票信息 2018-12-19 start
        //여부COM020
        HashMap<String, String> ynMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("COM020", null, langCd)){
            ynMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        //update by lyy 查询下载增加承兑汇票信息 2018-12-19 end
        //손상여부 SAL049
        HashMap<String, String> damageMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL049", null, langCd)){
            damageMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        // 창고
        StorageSearchVO storageSearchVO    = new StorageSearchVO();
        storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        HashMap<String, String> StrgeMap = new HashMap<String, String>();
        for(StorageVO vo : storageService.selectStoragesByCondition(storageSearchVO)){
            StrgeMap.put(vo.getStrgeCd(), vo.getStrgeNm());
        }
        // 위치
        BinLocationMasterSearchVO locSearchVO = new BinLocationMasterSearchVO();
        locSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        HashMap<String, String> locMap = new HashMap<String, String>();
        for(BinLocationMasterVO vo : binLocationMasterService.selectBinLocationMastersByCondition(locSearchVO)){
            locMap.put(vo.getLocCd(), vo.getLocNm());
        }
        //회사차구분 SAL053
        HashMap<String, String> cmpCarDstinMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL053", null, langCd)){
            cmpCarDstinMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        String blockSaleAdvNoMsg = "";
        String damageCdMsg = "";
        String ownStatCdMsg = "";
        String userId = LoginUtil.getUserId();
        DBMessageSourceSearchVO messageSearchVO = new DBMessageSourceSearchVO();
        List<DBMessageSourceVO> messageList = null;
        messageSearchVO.setsLangCd(langCd);
        messageSearchVO.setsMesgKey("sal.lbl.blockSaleEmp");
        messageList = dbMessageSourceService.selectDBMessageSourcesByCondition(messageSearchVO);
        if(messageList != null && messageList.size() > 0){
            blockSaleAdvNoMsg = messageList.get(0).getMesgTxt();
        }
        messageSearchVO.setsMesgKey("sal.lbl.blokDamage");
        messageList = dbMessageSourceService.selectDBMessageSourcesByCondition(messageSearchVO);
        if(messageList != null && messageList.size() > 0){
            damageCdMsg = messageList.get(0).getMesgTxt();
        }
        messageSearchVO.setsMesgKey("sal.lbl.blokCont");
        messageList = dbMessageSourceService.selectDBMessageSourcesByCondition(messageSearchVO);
        if(messageList != null && messageList.size() > 0){
            ownStatCdMsg = messageList.get(0).getMesgTxt();
        }
        
        for(StockMntVO vo : list){
            String str = "";
            if( StringUtils.isNotBlank(vo.getBlockSaleAdvNo()) 
                && !userId.equals(StringUtils.trimToEmpty(vo.getBlockSaleAdvNo())) 
            ){
                str += blockSaleAdvNoMsg;
            }
            if("01".equals(StringUtils.trimToEmpty(vo.getDamageCd()))){
                str += str.length()>0?", "+damageCdMsg:damageCdMsg;
            }
            if("A".equals(StringUtils.trimToEmpty(vo.getOwnStatCd()))){
                str += str.length()>0?", "+ownStatCdMsg:ownStatCdMsg;
            }
            vo.setLockKindNm(str);
            
            vo.setStrYn(ynMap.get(vo.getStrYn()));  //전략여부
            vo.setDamageCd(damageMap.get(vo.getDamageCd()));    //손상여부
            vo.setBlockYn(ynMap.get(vo.getBlockYn()));   //Block상태
            vo.setStrgeCd(StrgeMap.get(vo.getStrgeCd()));   //창고
            vo.setLocCd(locMap.get(vo.getLocCd()));     //위치
            vo.setCmpCarYn(ynMap.get(vo.getCmpCarYn()));  //회사차여부
            vo.setCmpCarDstinCd(cmpCarDstinMap.get(vo.getCmpCarDstinCd())); //회사차유형
            vo.setOpenYn(ynMap.get(vo.getOpenYn()));    //공개여부
            //update by lyy 查询下载增加承兑汇票信息 2018-12-19 start
            vo.setVinmRepayYn(ynMap.get(vo.getVinmRepayYn()));    //是否还款
            //update by lyy 查询下载增加承兑汇票信息 2018-12-19 end
        }

        context.putVar("items", list);
    }
    
    
    /**
     * 모바일 APP 그룹 재고관리 목록 조회
     * @param searchVO
     * @return
     * @throws Exception
     */
    @Override
    public int selectAppStockMntGroupsByConditionCnt(StockMntSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return stockMntDAO.selectAppStockMntGroupsByConditionCnt(searchVO);
    }
    
    @Override
    public List<StockMntVO> selectAppStockMntGroupsByCondition(StockMntSearchVO searchVO) throws Exception{
        if(StringUtils.isBlank(searchVO.getsDlrCd())){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return stockMntDAO.selectAppStockMntGroupsByCondition(searchVO);
    }

    
    
}
