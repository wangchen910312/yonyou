package chn.bhmc.dms.sal.acc.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.crm.cif.service.CustomerCouponMgmtService;
import chn.bhmc.dms.crm.cif.vo.CustPublishInfoVO;
import chn.bhmc.dms.crm.dmm.service.MembershipPointHisSupportService;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisSearchVO;
import chn.bhmc.dms.crm.dmm.vo.MembershipPointHisVO;
import chn.bhmc.dms.par.pmm.service.MvtDocService;
import chn.bhmc.dms.par.pmm.vo.MvtDocItemVO;
import chn.bhmc.dms.par.pmm.vo.MvtDocVO;
import chn.bhmc.dms.par.stm.service.ItemMovingAvgPrcService;
import chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryItemSalesDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesItemVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSaveVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesVO;
import chn.bhmc.dms.sal.cnt.service.ContractMntService;
import chn.bhmc.dms.sal.cnt.vo.ContractReGoodsVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReSearchVO;
import chn.bhmc.dms.sal.cnt.vo.ContractReVO;
import chn.bhmc.dms.sal.fin.service.PayInfoService;
import chn.bhmc.dms.sal.fin.vo.PayInfoDetailVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoVO;
import egovframework.rte.fdl.cmmn.exception.FdlException;

/**
 * <pre>
 * 용품정보관리 서비스
 * </pre>
 *
 * @ClassName   : AccessoryItemSalesServiceImpl
 * @Description : 용품판매관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("accessoryItemSalesService")
public class AccessoryItemSalesServiceImpl extends HService implements AccessoryItemSalesService, JxlsSupport {

    /**
     * 용품판매관리 DAO 선언
     */
    @Resource(name="accessoryItemSalesDAO")
    AccessoryItemSalesDAO accessoryItemSalesDAO;

    /**
     * 용품 Key 생성 id gen
     */
    @Resource(name="accessoryItemSalesIdGenService")
    TableIdGenService accessoryItemSalesIdGenService;

    /**
     * Part 수불 서비스
     */
    @Resource(name="mvtDocService")
    MvtDocService mvtDocService;

    /**
     * 계약관리 서비스
     */
    @Resource(name="contractMntService")
    private ContractMntService contractMntService;

    /**
     * 수납관리 서비스
     */
    @Resource(name="payInfoService")
    private PayInfoService payInfoService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    private CommonCodeService commonCodeService;

    /**
     * 창고 관리 서비스
     */
    @Resource(name="storageService")
    private StorageService storageService;

    /**
     * 부품이동평균가격 서비스
     */
    @Resource(name="itemMovingAvgPrcService")
    ItemMovingAvgPrcService itemMovingAvgPrcService;

    /**
     * 멤버십 포인트 이력
     */
    @Resource(name="membershipPointHisSupportService")
    MembershipPointHisSupportService membershipPointHisSupportService;

    /**
     * 고객쿠폰관리서비스
     */
    @Resource(name="customerCouponMgmtService")
    CustomerCouponMgmtService customerCouponMgmtService;

    /**
     * 시스템설정정보 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * {@inheritDoc}
     */
    @Override
    public AccessoryItemSalesVO selectAccessoryItemSalesByKey(String dlrCd, String goodsContractNo) throws Exception {
        return accessoryItemSalesDAO.selectAccessoryItemSalesByKey(dlrCd, goodsContractNo);
    }

    /*
     * @see chn.bhmc.dms.sal.acc.service.AccessoryItemSalesService#selectAccessoryItemStockOutItemsByKey(chn.bhmc.dms.sal.acc.vo.AccessoryItemSalesSearchVO)
     */
    @Override
    public List<AccessoryItemSalesItemVO> selectAccessoryItemStockOutItemsByKey(AccessoryItemSalesSearchVO searchVO) throws Exception{

        return accessoryItemSalesDAO.selectAccessoryItemStockOutItemsByKey(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesVO> selectDlrGoodsDcLevel(AccessoryItemSalesSearchVO searchVO) throws Exception{

        ContractReSearchVO contractReSearchVO = new ContractReSearchVO();
        contractReSearchVO.setsDlrCd(LoginUtil.getDlrCd());
        contractReSearchVO.setsContractNo(searchVO.getsSaleContractNo());
        List<ContractReVO> contList = contractMntService.selectContractResByCondition(contractReSearchVO);

        if(contList == null || contList.size() == 0){
            //계약정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.contractInfo", null, LocaleContextHolder.getLocale())});
        }

        searchVO.setsPrenSumAmt( searchVO.getsPrenSumAmt() + (contList.get(0).getDlrPromotionAmt() == null ? 0 : contList.get(0).getDlrPromotionAmt()) );
        searchVO.setsCarlineCd(contList.get(0).getCarlineCd());
        searchVO.setsModelCd(contList.get(0).getModelCd());
        searchVO.setsOcnCd(contList.get(0).getOcnCd());

        return accessoryItemSalesDAO.selectDlrGoodsDcLevel(searchVO);
    }

    /**
     * 용품판매품목의 수량 및 금액을 양수로 변환한다.
     */
    private void updateAbs(AccessoryItemSalesItemVO accessoryItemSalesItemVO){

        accessoryItemSalesItemVO.setGoodsCnt(Math.abs(accessoryItemSalesItemVO.getGoodsCnt()));       //용품수량
        accessoryItemSalesItemVO.setRetlPrc(Math.abs(accessoryItemSalesItemVO.getRetlPrc()));         //단가
        accessoryItemSalesItemVO.setSaleAmt(Math.abs(accessoryItemSalesItemVO.getSaleAmt()));         //실제판매가
        accessoryItemSalesItemVO.setTotAmt(Math.abs(accessoryItemSalesItemVO.getTotAmt()));           //금액
        accessoryItemSalesItemVO.setDcAmt(Math.abs(accessoryItemSalesItemVO.getDcAmt()));             //우대금액
        accessoryItemSalesItemVO.setDcRate(Math.abs(accessoryItemSalesItemVO.getDcRate()));           //우대율
        accessoryItemSalesItemVO.setRetlTotAmt(Math.abs(accessoryItemSalesItemVO.getRetlTotAmt()));   //용품총가격
        accessoryItemSalesItemVO.setEqipCostAmt(Math.abs(accessoryItemSalesItemVO.getEqipCostAmt())); //설치비용
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public void multiAccessoryItemSales(AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception{

        AccessoryItemSalesVO accessoryItemSalesVO = accessoryItemSalesSaveVO.getAccessoryItemSalesVO();

        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(new java.util.Date().getTime());

        if(StringUtils.isBlank(accessoryItemSalesVO.getGoodsContractNo())){
            accessoryItemSalesVO.setGoodsContractNo(accessoryItemSalesIdGenService.getNextStringId());
            //용품판매문서상태 출고대기(10)
            if(StringUtil.nullConvert(accessoryItemSalesVO.getContractStatCd()).equals("")){
                accessoryItemSalesVO.setContractStatCd("10");
            }
            //용품판매문서 등록
            accessoryItemSalesDAO.insertAccessoryItemSales(accessoryItemSalesVO);
        }else{
            if(!accessoryItemSalesSaveVO.isContractSave()){
                chkAccessorySaleUpdateSomebody(accessoryItemSalesVO);
            }
            //부분판매
            if(StringUtils.isBlank(accessoryItemSalesVO.getContractStatCd())){
                accessoryItemSalesVO.setContractStatCd("20");
            }
            //용품판매문서 변경
            accessoryItemSalesDAO.updateAccessoryItemSales(accessoryItemSalesVO);
        }

        /**
         *  저장시 포인트 사용.
         *  포인트 사용하기전에 기존에 사용했던 포인트가 있는지 확인
         *      있으면  해당 포인트 취소후 다시 사용
         */
        if( StringUtils.isNotEmpty(accessoryItemSalesVO.getMembershipNo()) &&
                StringUtil.nullConvert(accessoryItemSalesVO.getPointSaveYn()).equals("Y")
        ) {

            // 딜러포인트를 사용할경우에만
            Double occrPointVal = accessoryItemSalesVO.getPointVal();
            if(occrPointVal == null )occrPointVal = 0.00;

            //딜러포인트 취소
            MembershipPointHisSearchVO mphSearchVO = new MembershipPointHisSearchVO();
            mphSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            mphSearchVO.setsUseTp("02");        // 정비 : 03 / 부품 : 04
            mphSearchVO.setsUseNum(accessoryItemSalesVO.getGoodsContractNo());
            mphSearchVO.setsSrcSub1(accessoryItemSalesVO.getGoodsContractNo());
            membershipPointHisSupportService.cancelMembershipChargeInterface(mphSearchVO);

            //포인트 사용
            if(occrPointVal > 0 ){

                MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();
                membershipPointHisVO.setUseTp("02");                                           //사용처
                membershipPointHisVO.setUseNum(accessoryItemSalesVO.getGoodsContractNo());     //용품판매문서번호
                membershipPointHisVO.setSrcSub1(accessoryItemSalesVO.getGoodsContractNo());    //용품판매문서번호
                membershipPointHisVO.setDlrCd(LoginUtil.getDlrCd());
                membershipPointHisVO.setMembershipNo(accessoryItemSalesVO.getMembershipNo());
                membershipPointHisVO.setCardNo(accessoryItemSalesVO.getCardNo());              // 카드번호
                membershipPointHisVO.setPointCd("07");                                         // 产品(악세사리)  CRM802
                membershipPointHisVO.setOccrPointVal(accessoryItemSalesVO.getPointVal());      // 발생 포인트
                membershipPointHisVO.setOccrPointCost(accessoryItemSalesVO.getPointAmt());     // 해당포인트 사용금액
                membershipPointHisVO.setRealTotAmt(accessoryItemSalesVO.getGoodsRealAmt());    //판매합계금액
                MembershipPointHisVO rtnVO  = membershipPointHisSupportService.selectCallPointInterface(membershipPointHisVO);

                if(!StringUtil.nullConvert(rtnVO.getResultMsg()).equals("")){
                    throw processException(rtnVO.getResultMsg());
                }
            }
        }

        /**
         *  쿠폰정보 validation 확인
         *  저장시 쿠폰  사용.
         *  쿠폰 사용하기전에 기존에 사용했던 쿠폰이 있는지 확인
         *      있으면
         *          > 해당 쿠폰 취소후 다시 사용
         *      없으면
         *          > 쿠폰 사용.
         */
        if( ( StringUtils.isNotEmpty(accessoryItemSalesVO.getCupnPubliNo()) ||
              StringUtils.isNotEmpty(accessoryItemSalesVO.getCancCupnPubliNo())
            ) && StringUtil.nullConvert(accessoryItemSalesVO.getCupnSaveYn()).equals("Y")
         ) {


            String cupnNo = accessoryItemSalesVO.getCupnPubliNo();
            String cancCupnNo = accessoryItemSalesVO.getCancCupnPubliNo();


            //쿠폰 사용이력 취소
            CustPublishInfoVO custPublishCacInfoVO = new CustPublishInfoVO();
            custPublishCacInfoVO.setPubliNo( cupnNo.equals("") ? cancCupnNo : cupnNo );
            custPublishCacInfoVO.setUseYn("N");
            custPublishCacInfoVO.setChkUsrId("");
            custPublishCacInfoVO.setUseTp("");
            custPublishCacInfoVO.setUseNum("");
            customerCouponMgmtService.updateCustCouponPublish(custPublishCacInfoVO);

            if(StringUtils.isNotEmpty(cupnNo)){
                //딜러할인쿠폰을 사용할경우에만
                CustPublishInfoVO custPublishInfoVO = new CustPublishInfoVO();
                custPublishInfoVO.setPubliNo(cupnNo);
                custPublishInfoVO.setUseYn("Y");
                custPublishInfoVO.setChkUsrId(LoginUtil.getUserId());
                custPublishInfoVO.setUsedDt(calendar.getTime());
                custPublishInfoVO.setUseTp("02");
                custPublishInfoVO.setUseNum(accessoryItemSalesVO.getGoodsContractNo());
                customerCouponMgmtService.updateCustCouponPublish(custPublishInfoVO);
            }
        }

        //용품판매 품목정보 등록
        for(AccessoryItemSalesItemVO accessoryItemSalesItemVO : accessoryItemSalesSaveVO.getInsertList()){
            accessoryItemSalesItemVO.setDlrCd(LoginUtil.getDlrCd());
            accessoryItemSalesItemVO.setGoodsContractNo(accessoryItemSalesVO.getGoodsContractNo());
            accessoryItemSalesItemVO.setRegUsrId(LoginUtil.getUserId());
            accessoryItemSalesItemVO.setUpdtUsrId(LoginUtil.getUserId());

            //수량,금액 양수 전환
            updateAbs(accessoryItemSalesItemVO);

            accessoryItemSalesDAO.insertAccessoryItemSalesItem(accessoryItemSalesItemVO);
        }

        //용품판매 품목정보 변경
        for(AccessoryItemSalesItemVO accessoryItemSalesItemVO : accessoryItemSalesSaveVO.getUpdateList()){
            accessoryItemSalesItemVO.setRegUsrId(LoginUtil.getUserId());
            accessoryItemSalesItemVO.setUpdtUsrId(LoginUtil.getUserId());

            //수량,금액 양수 전환
            updateAbs(accessoryItemSalesItemVO);


            //반품일경우 참조 문서번호를 업데이트 한다.
            if(accessoryItemSalesItemVO.getStatCd().equals("30") || accessoryItemSalesItemVO.getStatCd().equals("40")){
                accessoryItemSalesItemVO.setRefDocNo(accessoryItemSalesItemVO.getGoodsContractNo());
                accessoryItemSalesItemVO.setRefDocLineNo(accessoryItemSalesItemVO.getSeq());
            }

            accessoryItemSalesDAO.updateAccessoryItemSalesItem(accessoryItemSalesItemVO);
        }

        //용품판매 품목정보 삭제
        for(AccessoryItemSalesItemVO accessoryItemSalesItemVO : accessoryItemSalesSaveVO.getDeleteList()){

            //수량,금액 양수 전환
            updateAbs(accessoryItemSalesItemVO);

            accessoryItemSalesDAO.deleteAccessoryItemSalesItem(accessoryItemSalesItemVO);
        }

        //완성차 용품판매
        //해당계약의 용품판매 정보를 변경한다.
        if(!accessoryItemSalesSaveVO.isContractSave()){

            if(StringUtils.isNotBlank(accessoryItemSalesVO.getSaleContractNo())){

                //계약문서정보 변경
                saveContractInfo(accessoryItemSalesVO);

            }else{
                //일반용품 판매인 경우
                //수납정보를 저장한다.
                PayInfoVO payInfoVO = new PayInfoVO();

                payInfoVO.setDlrCd(accessoryItemSalesVO.getDlrCd());                    //딜러코드
//              payInfoVO.setFinDocNo(null);                                            //수납문서번호
                payInfoVO.setJobTp("G");                                                //관련업무유형 (G:용품)
                payInfoVO.setJobContractNo(accessoryItemSalesVO.getGoodsContractNo());  //관련업무계약번호 (용품판매문서번호)
                payInfoVO.setVinNo(accessoryItemSalesVO.getVinNo());                    //VIN
                payInfoVO.setCustTp(accessoryItemSalesVO.getContractCustTp());          //고객유형
                payInfoVO.setCustNo(accessoryItemSalesVO.getContractCustNo());          //고객번호
                payInfoVO.setCustNm(accessoryItemSalesVO.getContractCustNm());          //고객명
                payInfoVO.setManageEmpNo(accessoryItemSalesVO.getRegUsrId());           //판매인번호
                payInfoVO.setRealPayAmt(accessoryItemSalesVO.getCustPayAmt());          //발생금액
                payInfoVO.setTotPayAmt(0.00);
                payInfoVO.setTotDcAmt(0.00);
                payInfoVO.setProAmt(0.00);
                payInfoVO.setRecvAmt(accessoryItemSalesVO.getCustPayAmt());
                payInfoVO.setOverAmt(0.00);
                payInfoVO.setRecpYn("N");
                payInfoVO.setPaymentTp("01");                   // 미결
                payInfoVO.setUpdtUsrId(LoginUtil.getUserId());
                payInfoService.multiPayInfoHeader(payInfoVO);
            }
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateAccessoryItemSalesContractStatCd(AccessoryItemSalesVO accessoryItemSalesVO , String statCd) throws Exception{

        chkAccessorySaleUpdateSomebody(accessoryItemSalesVO);

        if(statCd.equals("50")){
            AccessoryItemSalesSearchVO sVo = new AccessoryItemSalesSearchVO();
            sVo.setsGoodsContractNo( accessoryItemSalesVO.getGoodsContractNo() );
            sVo.setsDlrCd(LoginUtil.getDlrCd());
            List<AccessoryItemSalesVO> assList = accessoryItemSalesDAO.selectAccessoryItemSalesByCondition(sVo);
            if(assList != null && assList.size() > 0){
                if(!"10".equals(assList.get(0).getContractStatCd())){
                    throw processException("sal.info.exist.alreadyReleaseItem");
                }
            }
        }

        int updtCnt = accessoryItemSalesDAO.updateAccessoryItemSalesContractStatCd(
                accessoryItemSalesVO.getDlrCd(),
                accessoryItemSalesVO.getGoodsContractNo(),
                statCd,
                LoginUtil.getUserId()
        );

        //멤버십 포인트 적립
        if(statCd.equals("40") && StringUtils.isNotEmpty(accessoryItemSalesVO.getMembershipNo()) ) {
            MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();
            membershipPointHisVO.setOccrPointVal(accessoryItemSalesVO.getCustPayAmt());   //실 사용금액
            membershipPointHisVO.setMembershipNo(accessoryItemSalesVO.getMembershipNo()); // 멤버십 번호
            membershipPointHisVO.setUseTp("02");  //필수 / 전체 : 01 / 판매 : 02 / 정비 : 03 / 부품 : 04
            membershipPointHisVO.setUseNum(accessoryItemSalesVO.getGoodsContractNo()); //필수 용품 판매 문서번호
            membershipPointHisVO.setSrcSub3("GOODS_RATE");

            crmCallPointSaveInterface(membershipPointHisVO);
        }

        //취소시 적립금 , 쿠폰사용 취소
        if(statCd.equals("50")) {
            //딜러포인트 취소
            if(StringUtils.isNotEmpty(accessoryItemSalesVO.getMembershipNo())){
                MembershipPointHisSearchVO mphSearchVO = new MembershipPointHisSearchVO();
                mphSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                mphSearchVO.setsUseTp("02");        // 정비 : 03 / 부품 : 04
                mphSearchVO.setsUseNum(accessoryItemSalesVO.getGoodsContractNo());
                mphSearchVO.setsSrcSub1(accessoryItemSalesVO.getGoodsContractNo());
                membershipPointHisSupportService.cancelMembershipChargeInterface(mphSearchVO);
            }
            //쿠폰 취소
            if(StringUtils.isNotEmpty(accessoryItemSalesVO.getCupnPubliNo())){
                //쿠폰 사용이력 취소
                CustPublishInfoVO custPublishCacInfoVO = new CustPublishInfoVO();
                custPublishCacInfoVO.setPubliNo( accessoryItemSalesVO.getCupnPubliNo() );
                custPublishCacInfoVO.setUseYn("N");
                custPublishCacInfoVO.setChkUsrId("");
                custPublishCacInfoVO.setUseTp("");
                custPublishCacInfoVO.setUseNum("");
                customerCouponMgmtService.updateCustCouponPublish(custPublishCacInfoVO);
            }
        }
        return updtCnt;
    }


    public int updateAccessoryItemSalesContractStatCd(String dlrCd, String goodsContractNo, String statCd, String updtUsrId, String updtDtStr) throws Exception{

        AccessoryItemSalesVO accessoryItemSalesVO = new AccessoryItemSalesVO();
        accessoryItemSalesVO.setDlrCd(dlrCd);
        accessoryItemSalesVO.setGoodsContractNo(goodsContractNo);
        accessoryItemSalesVO.setUpdtDtStr(updtDtStr);
        chkAccessorySaleUpdateSomebody(accessoryItemSalesVO);

        return accessoryItemSalesDAO.updateAccessoryItemSalesContractStatCd(dlrCd, goodsContractNo, statCd, updtUsrId);
    }

    /**
     *
     * 포인트 적립
     *
     */
    @SuppressWarnings("unused")
    public void crmCallPointSaveInterface(MembershipPointHisVO membershipPointHisVO) throws Exception{

        //serviceReceiveSaveVO.getDlrPointAccuVO().setUseTp(useTp);        // 정비 : 03 / 부품 : 04
        //serviceReceiveSaveVO.getDlrPointAccuVO().setUseNum(serviceReceiveSaveVO.getServiceReceiveDetailVO().getRoDocNo());

        MembershipPointHisVO rtnPointHisVO =  membershipPointHisSupportService.selectCallPointSaveInterface(membershipPointHisVO);

    }


    /**
     * {@inheritDoc}
     */
    @Override
    public AccessoryItemSalesVO applySalesCnfm(AccessoryItemSalesVO accessoryItemSalesVO, List<AccessoryItemSalesItemVO> list) throws Exception {

        int resultCnt  = 0;
        int reqItemCnt = 0;
        String pltCd = LoginUtil.getPltCd();
        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();
        Double goodsCnt;

        // 수불 생성(판매출고)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = new MvtDocItemVO();

        // 수불 생성(판매반품)
        MvtDocVO returnMvtDocVO = new MvtDocVO();
        MvtDocItemVO returnMvtDocItemVO = new MvtDocItemVO();


        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //ItemMovingAvgPrcVO returnSearchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO returnItemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //int itemMovingAvgPrcSeq  = 0;


        List<MvtDocItemVO> mvtItemList = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> mvtSaveItemList = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> returnMvtItemList = new ArrayList<MvtDocItemVO>();
        List<MvtDocItemVO> returnMvtSaveItemList = new ArrayList<MvtDocItemVO>();

        mvtDocVO.setMvtTp("71");        //판매출고
        returnMvtDocVO.setMvtTp("73");  //판매반품

        accessoryItemSalesVO.setUpdtUsrId(userId);
        accessoryItemSalesVO.setDlrCd(dlrCd);

        chkAccessorySaleUpdateSomebody(accessoryItemSalesVO);

        if(accessoryItemSalesVO.getContractCustTp().equals("01")){ //거래처 유형이 '01': 일반인경우
            mvtDocVO.setCustNo(accessoryItemSalesVO.getContractCustNo());
            mvtDocVO.setBpCd(" ");
            returnMvtDocVO.setCustNo(accessoryItemSalesVO.getContractCustNo());
            returnMvtDocVO.setBpCd(" ");
        }else if(accessoryItemSalesVO.getContractCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
            mvtDocVO.setBpCd(accessoryItemSalesVO.getContractCustNo());
            mvtDocVO.setCustNo(" ");
            returnMvtDocVO.setBpCd(accessoryItemSalesVO.getContractCustNo());
            returnMvtDocVO.setCustNo(" ");
        }

        if( (accessoryItemSalesVO.getContractCustTp() == null) || (accessoryItemSalesVO.getContractCustTp().isEmpty())){
            //고객유형정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custTp", null, LocaleContextHolder.getLocale())});
        }

        if( (accessoryItemSalesVO.getContractCustNm() == null) || (accessoryItemSalesVO.getContractCustNm().isEmpty())){
            //고객정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.custNm", null, LocaleContextHolder.getLocale())});
        }

        if( (accessoryItemSalesVO.getCarBrandCd() == null) || (accessoryItemSalesVO.getCarBrandCd().isEmpty())){
            //브랜드가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("global.lbl.brand", null, LocaleContextHolder.getLocale())});
        }

        /*
        if( (accessoryItemSalesVO.getSalePrsnId() == null) || (accessoryItemSalesVO.getSalePrsnId().isEmpty())){
            //담당자정보가 존재하지 않습니다.
            throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.prsNm", null, LocaleContextHolder.getLocale())});
        }
        */

        /*if( (accessoryItemSalesVO.getGoodsRealAmt() == null) || (accessoryItemSalesVO.getGoodsRealAmt() < 0)){
            //할인전 총액이 0보다 작거나 같을 수 없습니다.
            throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmtBefDc", null, LocaleContextHolder.getLocale())});
        }*/

        //if( (accessoryItemSalesVO.getPrenAmt() == null) || (accessoryItemSalesVO.getAddPrenAmt() == null) || ( (accessoryItemSalesVO.getPrenAmt() + accessoryItemSalesVO.getAddPrenAmt())  < 0) ){
        if( (accessoryItemSalesVO.getPrenAmt() == null)){
            //할인금액이 0보다 작을 수 없습니다.
            throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("sal.lbl.dcAmt", null, LocaleContextHolder.getLocale())});
        }

        if( (accessoryItemSalesVO.getCustPayAmt() == null) || (accessoryItemSalesVO.getCustPayAmt() < 0)){
            //총금액이 0보다 작을 수 없습니다.
            throw processException("global.err.chkMinusParam", new String[]{messageSource.getMessage("par.lbl.totAmt", null, LocaleContextHolder.getLocale())});
        }


        // 4. 부품판매 부품정보를 수정한다.(완료수량 셋팅)
        for(int i = 0; i < list.size(); i++){
            mvtDocItemVO = new MvtDocItemVO();
            returnMvtDocItemVO = new MvtDocItemVO();

            /*  부품 상태 아직 사용안함(정의안됨)
            if( (list.get(i).getItemStatCd() == null) || (list.get(i).getItemStatCd().isEmpty())){
                //부품상태정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.itemStatCd", null, LocaleContextHolder.getLocale())});
            }*/

            if( (list.get(i).getGoodsCd() == null) || (list.get(i).getGoodsCd().isEmpty())){
                //부품정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("sal.lbl.goodsCd", null, LocaleContextHolder.getLocale())});
            }

            if( (list.get(i).getGiStrgeCd() == null) || (list.get(i).getGiStrgeCd().isEmpty())){
                //창고정보가 존재하지 않습니다.
                throw processException("par.info.itemInsertNotMsg", new String[]{messageSource.getMessage("par.lbl.strge", null, LocaleContextHolder.getLocale())});
            }

            goodsCnt = (double) list.get(i).getGoodsCnt();

            list.get(i).setUpdtUsrId(userId);
            /**********************************
             * 수불정보 생성 셋팅
             *********************************/
            if(list.get(i).getStatCd().equals("10")){

                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 ********************************************************************/
                /*
                searchItemMovingAvgPrcVO.setItemCd(list.get(i).getGoodsCd()); //부품코드
                searchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
                searchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(itemMovingAvgPrcVO != null){

                    itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt());               //이전발생일자
                    itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty());             //이전 총수량
                    itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() - Math.abs(goodsCnt));
                    itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                    resultCnt = itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                    }

                  //이동평균가격 정보가 없는 경우
                }else{
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

                itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

                if(resultCnt != 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                 }
                 */


                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 * 끝
                 ********************************************************************/

                list.get(i).setStatCd("20");

                mvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                mvtDocItemVO.setPltCd(pltCd);
                mvtDocItemVO.setCancStmtYn("N");
                mvtDocItemVO.setItemCd(list.get(i).getGoodsCd());
                mvtDocItemVO.setItemUnitCd(list.get(i).getGoodsUnitCd());
                mvtDocItemVO.setItemQty(goodsCnt);
                mvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
                mvtDocItemVO.setDdlnYn("N");
                mvtDocItemVO.setCurrCd("");
                mvtDocItemVO.setSalePrc(list.get(i).getRetlPrc()); //판매단가
                mvtDocItemVO.setSaleAmt(list.get(i).getTotAmt()); //((판매단가  - 할인단가) * 수량) + 설치금액
                mvtDocItemVO.setRefDocNo(list.get(i).getGoodsContractNo());
                mvtDocItemVO.setRefDocLineNo(list.get(i).getSeq());

                mvtItemList.add(mvtDocItemVO);
            //반품인경우
            }else if(list.get(i).getStatCd().equals("30")){
                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 ********************************************************************/
                /*
                returnSearchItemMovingAvgPrcVO.setItemCd(list.get(i).getGoodsCd());    //부품코드
                returnSearchItemMovingAvgPrcVO.setStrgeCd(list.get(i).getGiStrgeCd()); //창고코드
                returnSearchItemMovingAvgPrcVO.setDlrCd(dlrCd); //딜러코드

                returnItemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(returnSearchItemMovingAvgPrcVO);

                //이동평균가격 정보가 존재하는 경우
                if(returnItemMovingAvgPrcVO != null){

                    returnItemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                    returnItemMovingAvgPrcVO.setBefGenDt(returnItemMovingAvgPrcVO.getGenDt());               //이전발생일자
                    returnItemMovingAvgPrcVO.setBefTotQty(returnItemMovingAvgPrcVO.getTotQty());             //이전 총수량
                    returnItemMovingAvgPrcVO.setBefMovingAvgPrc(returnItemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                    returnItemMovingAvgPrcVO.setTotQty(returnItemMovingAvgPrcVO.getTotQty() + Math.abs(goodsCnt));
                    returnItemMovingAvgPrcVO.setMovingAvgPrc(returnItemMovingAvgPrcVO.getMovingAvgPrc());

                    resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(returnItemMovingAvgPrcVO);

                    if(resultCnt != 1){
                        //기타입고 확정 실패.
                        throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                    }

                  //이동평균가격 정보가 없는 경우
                }else{
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

                itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(returnItemMovingAvgPrcVO);

                returnItemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

                resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(returnItemMovingAvgPrcVO);

                if(resultCnt != 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                 }
                 */


                /********************************************************************
                 * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
                 * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
                 * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
                 * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
                 * 끝
                 ********************************************************************/

                list.get(i).setStatCd("40");

                returnMvtDocItemVO.setDlrCd(list.get(i).getDlrCd());
                returnMvtDocItemVO.setPltCd(pltCd);
                returnMvtDocItemVO.setCancStmtYn("N");
                returnMvtDocItemVO.setItemCd(list.get(i).getGoodsCd());
                returnMvtDocItemVO.setItemUnitCd(list.get(i).getGoodsUnitCd());
                returnMvtDocItemVO.setItemQty(goodsCnt);
                returnMvtDocItemVO.setStrgeCd(list.get(i).getGiStrgeCd());
                returnMvtDocItemVO.setDdlnYn("N");
                returnMvtDocItemVO.setCurrCd("");
                returnMvtDocItemVO.setSalePrc(list.get(i).getRetlPrc());
                returnMvtDocItemVO.setSaleAmt(list.get(i).getTotAmt());
                //returnMvtDocItemVO.setMovingAvgPrc(returnItemMovingAvgPrcVO.getMovingAvgPrc());
                //returnMvtDocItemVO.setMovingAvgAmt(returnItemMovingAvgPrcVO.getMovingAvgPrc() * returnMvtDocItemVO.getItemQty());
                returnMvtDocItemVO.setMvtReasonCont("Return SaleItem");
                returnMvtDocItemVO.setRefDocNo(list.get(i).getGoodsContractNo());
                returnMvtDocItemVO.setRefDocLineNo(list.get(i).getSeq());
                //修复精品出库退回BUG update by lyy 2018-09-19 start
                returnMvtDocItemVO.setGiDocNo(list.get(i).getRefDocNo());
                returnMvtDocItemVO.setGiDocLineNo(list.get(i).getRefDocLineNo());
                //修复精品出库退回BUG update by lyy 2018-09-19 end

                returnMvtItemList.add(returnMvtDocItemVO);
            }

            /**********************************
             * 수불정보 생성 셋팅
             *********************************/

            accessoryItemSalesDAO.updateAccessoryItemSaleItemCnfm(list.get(i));
        }

        AccessoryItemSalesSearchVO searchVO = new AccessoryItemSalesSearchVO();
        searchVO.setsDlrCd(accessoryItemSalesVO.getDlrCd());
        searchVO.setsGoodsContractNo(accessoryItemSalesVO.getGoodsContractNo());
        searchVO.setsContractStatCd("10");

        reqItemCnt = accessoryItemSalesDAO.selectAccessoryItemSalesItemsForStatChangeCnt(accessoryItemSalesVO);

        //용품마스터 상태 정보를 수정한다.
        if(reqItemCnt == 0){

            reqItemCnt = accessoryItemSalesDAO.selectAccessoryItemSalesItemsForStatCnt(searchVO);

            if(reqItemCnt > 0){
                accessoryItemSalesVO.setContractStatCd("30");
            }else{
                accessoryItemSalesVO.setContractStatCd("10");
            }
        }else{
            accessoryItemSalesVO.setContractStatCd("20");
        }


        accessoryItemSalesDAO.updateAccessoryItemSalesCnfm(accessoryItemSalesVO);

        mvtSaveItemList       = mvtDocService.multiSaveMvtDocs(mvtDocVO, mvtItemList);
        returnMvtSaveItemList = mvtDocService.multiSaveMvtDocs(returnMvtDocVO, returnMvtItemList);

        if((mvtSaveItemList.size() + returnMvtSaveItemList.size()) < 1){
            //출고 확정이 처리되지 않았습니다.
            throw processException("global.err.regFailedParam", new String[]{messageSource.getMessage("sal.lbl.ordNo", null, LocaleContextHolder.getLocale())});
        }

        //생성된 수불 정보를 내역에 반영한다.
        AccessoryItemSalesItemVO mvtAccessoryItemSalesItemVO = null;
        for(int i = 0,mvtSaveList = mvtSaveItemList.size(); i < mvtSaveList; i++){
            mvtAccessoryItemSalesItemVO = new AccessoryItemSalesItemVO();

            mvtAccessoryItemSalesItemVO.setDlrCd(dlrCd);
            mvtAccessoryItemSalesItemVO.setRegUsrId(userId);
            mvtAccessoryItemSalesItemVO.setMvtDocYyMm(mvtSaveItemList.get(i).getMvtDocYyMm());
            mvtAccessoryItemSalesItemVO.setMvtDocNo(mvtSaveItemList.get(i).getMvtDocNo());
            mvtAccessoryItemSalesItemVO.setMvtDocLineNo(mvtSaveItemList.get(i).getMvtDocLineNo());

            //toolGiVO.getToolGiTp()

            mvtAccessoryItemSalesItemVO.setGoodsContractNo(mvtSaveItemList.get(i).getRefDocNo());
            mvtAccessoryItemSalesItemVO.setSeq(mvtSaveItemList.get(i).getRefDocLineNo());

            //resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);
            // 용품 출고확정 시 수불 정보를 반영한다.
            resultCnt = accessoryItemSalesDAO.updateAccessoryItemSalesCnfmItemMvtInfo(mvtAccessoryItemSalesItemVO);

            if(resultCnt < 1){
                //기타출고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("sal.lbl.ordNo", null, LocaleContextHolder.getLocale())});
            }
        }

        //생성된 반품 수불 정보를 내역에 반영한다.
        AccessoryItemSalesItemVO returnMvtAccessoryItemSalesItemVO = null;
        for(int i = 0,returnMvtSaveList = returnMvtSaveItemList.size(); i < returnMvtSaveList; i++){
            returnMvtAccessoryItemSalesItemVO = new AccessoryItemSalesItemVO();

            returnMvtAccessoryItemSalesItemVO.setDlrCd(dlrCd);
            returnMvtAccessoryItemSalesItemVO.setRegUsrId(userId);
            returnMvtAccessoryItemSalesItemVO.setMvtDocYyMm(returnMvtSaveItemList.get(i).getMvtDocYyMm());
            returnMvtAccessoryItemSalesItemVO.setMvtDocNo(returnMvtSaveItemList.get(i).getMvtDocNo());
            returnMvtAccessoryItemSalesItemVO.setMvtDocLineNo(returnMvtSaveItemList.get(i).getMvtDocLineNo());

            //toolGiVO.getToolGiTp()

            returnMvtAccessoryItemSalesItemVO.setGoodsContractNo(returnMvtSaveItemList.get(i).getRefDocNo());
            returnMvtAccessoryItemSalesItemVO.setSeq(returnMvtSaveItemList.get(i).getRefDocLineNo());

            //resultCnt = partsSaleOrdDAO.updateParSaleOrdItemMvtInfo(mvtPartsSaleOrdItemVO);
            // 용품 출고확정 시 수불 정보를 반영한다.
            resultCnt = accessoryItemSalesDAO.updateAccessoryItemSalesCnfmItemMvtInfo(returnMvtAccessoryItemSalesItemVO);

            if(resultCnt < 1){
                //기타출고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("sal.lbl.ordNo", null, LocaleContextHolder.getLocale())});
            }
        }

        //용품 정보 계약정보 테이블  저장
        if(StringUtils.isNotBlank(accessoryItemSalesVO.getSaleContractNo())){
            saveContractInfo(accessoryItemSalesVO);
        }

        return accessoryItemSalesVO;
    }


    /**
     *
     * 완성차 용품판매
     * 해당계약의 용품판매 정보를 변경한다.
     * @param accessoryItemSalesVO
     * @throws Exception
     */
    public void saveContractInfo(AccessoryItemSalesVO accessoryItemSalesVO)throws Exception{


        //계약문서정보 변경
        ContractReVO contractReVO = new ContractReVO();
        contractReVO.setContractNo(accessoryItemSalesVO.getSaleContractNo());
        contractReVO.setDlrCd(accessoryItemSalesVO.getDlrCd());
        //contractReVO.setGoodsAmt(accessoryItemSalesVO.getCustPayAmt());
        contractReVO.setGoodsAmt(accessoryItemSalesVO.getGoodsRealAmt());

        //계약문서 품목정보
        List<ContractReGoodsVO> contractReItems = new ArrayList<ContractReGoodsVO>();

        AccessoryItemSalesSearchVO accessoryItemSalesSearchVO = new AccessoryItemSalesSearchVO();
        accessoryItemSalesSearchVO.setsDlrCd(accessoryItemSalesVO.getDlrCd());
        accessoryItemSalesSearchVO.setsGoodsContractNo(accessoryItemSalesVO.getGoodsContractNo());

        List<AccessoryItemSalesItemVO> accessoryItemSalesItems = selectAccessoryItemSalesContractByCondition(accessoryItemSalesSearchVO);

        for(AccessoryItemSalesItemVO accessoryItemSalesItemVO : accessoryItemSalesItems){
            ContractReGoodsVO contractReGoodsVO = new ContractReGoodsVO();

            contractReGoodsVO.setDlrCd(accessoryItemSalesItemVO.getDlrCd());
            contractReGoodsVO.setContractNo(accessoryItemSalesVO.getSaleContractNo());
            contractReGoodsVO.setSeq(accessoryItemSalesItemVO.getSeq());
            contractReGoodsVO.setGoodsCd(accessoryItemSalesItemVO.getGoodsCd());
            contractReGoodsVO.setGoodsNm(accessoryItemSalesItemVO.getGoodsNm());
            contractReGoodsVO.setGoodsPrc(accessoryItemSalesItemVO.getRetlPrc());
            contractReGoodsVO.setGoodsCnt(accessoryItemSalesItemVO.getGoodsCnt());
            contractReGoodsVO.setGoodsAmt(accessoryItemSalesItemVO.getSaleAmt());
            contractReGoodsVO.setDcAmt(accessoryItemSalesItemVO.getDcAmt());
            contractReGoodsVO.setRealGoodsAmt(accessoryItemSalesItemVO.getRetlTotAmt());
            contractReGoodsVO.setServiceYn("N");
            contractReGoodsVO.setDcRate(accessoryItemSalesItemVO.getDcRate());
            contractReGoodsVO.setPkgItemCd(accessoryItemSalesItemVO.getPkgItemCd());
            contractReGoodsVO.setGrStrgeCd(accessoryItemSalesItemVO.getGrStrgeCd());
            contractReGoodsVO.setGiStrgeCd(accessoryItemSalesItemVO.getGiStrgeCd());
            contractReGoodsVO.setGoodsUnitCd(accessoryItemSalesItemVO.getGoodsUnitCd());
            contractReGoodsVO.setStatCd(accessoryItemSalesItemVO.getStatCd());
            contractReGoodsVO.setRefDocNo(accessoryItemSalesItemVO.getRefDocNo());
            contractReGoodsVO.setRefDocLineNo(accessoryItemSalesItemVO.getRefDocLineNo());

            contractReGoodsVO.setMvtDocYyMm(accessoryItemSalesItemVO.getMvtDocYyMm());
            contractReGoodsVO.setMvtDocNo(accessoryItemSalesItemVO.getMvtDocNo());
            contractReGoodsVO.setMvtDocLineNo(accessoryItemSalesItemVO.getMvtDocLineNo());
            contractReGoodsVO.setExpcGiEndDt(accessoryItemSalesItemVO.getExpcGiEndDt());
            contractReGoodsVO.setEqipPrsnId(accessoryItemSalesItemVO.getEqipPrsnId());
            contractReGoodsVO.setRealDlDt(accessoryItemSalesItemVO.getRealDlDt());
            contractReGoodsVO.setEqipCostAmt(accessoryItemSalesItemVO.getEqipCostAmt());
            contractReGoodsVO.setExpcEqipDt(accessoryItemSalesItemVO.getExpcEqipDt());
            contractReGoodsVO.setEqipEndDt(accessoryItemSalesItemVO.getEqipEndDt());
            contractReGoodsVO.setTotAmt(accessoryItemSalesItemVO.getTotAmt());

            contractReGoodsVO.setRegUsrId(accessoryItemSalesItemVO.getRegUsrId());
            contractReGoodsVO.setUpdtUsrId(accessoryItemSalesItemVO.getUpdtUsrId());

            contractReItems.add(contractReGoodsVO);
        }
        contractMntService.contractGoodsApply(contractReVO, contractReItems);

    }

    /**
     * 출고취소
     */
    @Override
    public String applyCancel(AccessoryItemSalesSearchVO searchVO) throws Exception{

        //[이동평균가격]부품이동평균가격정보
        //ItemMovingAvgPrcVO searchItemMovingAvgPrcVO = new ItemMovingAvgPrcVO();
        //ItemMovingAvgPrcVO itemMovingAvgPrcVO       = new ItemMovingAvgPrcVO();

        //int itemMovingAvgPrcSeq  = 0;
        //int resultCnt            = 0;

        if( StringUtils.isEmpty(searchVO.getsGoodsContractNo()) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        List<AccessoryItemSalesVO> headList = selectAccessoryItemSalesByCondition(searchVO);

        if( headList == null || headList.size() == 0){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        // SA_0261T : 용품판매헤더 내역
        AccessoryItemSalesVO cntVO = headList.get(0);

        if( !"20".equals(cntVO.getContractStatCd()) ){
            // [출고상태]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.giState", null, LocaleContextHolder.getLocale())});
        }

        if( cntVO.getSaleContractNo() != null && !"".equals(cntVO.getSaleContractNo())){
            ContractReSearchVO contSearchVO = new ContractReSearchVO();
            contSearchVO.setsContractNo( cntVO.getSaleContractNo() );
            contSearchVO.setsDlrCd( LoginUtil.getDlrCd() );
            List<ContractReVO>  contList = contractMntService.selectContractResByCondition(contSearchVO);

            if(contList !=null && contList.size() > 0 && "50".equals( contList.get(0).getContractStatCd() ) ){
                //고객인도처리가 완료된 계약건입니다.
                throw processException("sal.info.deliveryWarningMsg");
            }
        }

        // 수불 생성(기타출고 취소)
        MvtDocVO mvtDocVO = new MvtDocVO();
        MvtDocItemVO mvtDocItemVO = null;

        List<MvtDocItemVO> mvtItemList     = new ArrayList<MvtDocItemVO>();

        mvtDocVO.setMvtTp("71");  //판매출고

        if(cntVO.getContractCustTp().equals("01")){       //거래처 유형이 '01': 일반인경우
            mvtDocVO.setCustNo(cntVO.getContractCustNo());
            mvtDocVO.setBpCd(" ");
        }else if(cntVO.getContractCustTp().equals("02")){ //거래처 유형이 '02': 거래처인경우
            mvtDocVO.setBpCd(cntVO.getContractCustNo());
            mvtDocVO.setCustNo(" ");
        }


        // SA_0262T : 용품판매아이템 내역
        List<AccessoryItemSalesItemVO> itemList = selectAccessoryItemSalesItemsByCondition(searchVO);

        double qty = 0;

        // 4. 기타출고 부품정보를 생성한다.
        for(int i = 0; i < itemList.size(); i++){
            mvtDocItemVO = new MvtDocItemVO();

            qty = itemList.get(i).getGoodsCnt();

            if( qty <= 0 ){
                //수량이 0보다 작거나 같을 수 없습니다
                throw processException("global.err.chkZeroQty");
            }

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             ********************************************************************/
            /*
            searchItemMovingAvgPrcVO.setItemCd(itemList.get(i).getGoodsCd());    //부품코드
            searchItemMovingAvgPrcVO.setStrgeCd(itemList.get(i).getGiStrgeCd()); //창고코드
            searchItemMovingAvgPrcVO.setDlrCd(LoginUtil.getDlrCd());             //딜러코드

            itemMovingAvgPrcVO = itemMovingAvgPrcService.selectItemMovingAvgPrcByKey(searchItemMovingAvgPrcVO);

            //이동평균가격 정보가 존재하는 경우
            if(itemMovingAvgPrcVO != null){


                itemMovingAvgPrcVO.setRegUsrId(LoginUtil.getUserId());
                itemMovingAvgPrcVO.setBefGenDt(itemMovingAvgPrcVO.getGenDt());               //이전발생일자
                itemMovingAvgPrcVO.setBefTotQty(itemMovingAvgPrcVO.getTotQty());             //이전 총수량
                itemMovingAvgPrcVO.setBefMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc()); //이전이동평균가격

                itemMovingAvgPrcVO.setTotQty(itemMovingAvgPrcVO.getTotQty() + Math.abs(qty));
                itemMovingAvgPrcVO.setMovingAvgPrc(itemMovingAvgPrcVO.getMovingAvgPrc());

                resultCnt =  itemMovingAvgPrcService.updateItemMovingAvgPrc(itemMovingAvgPrcVO);

                if(resultCnt != 1){
                    //기타입고 확정 실패.
                    throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
                }

                //이동평균가격 정보가 없는 경우
            }else{
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
            }

            itemMovingAvgPrcSeq = itemMovingAvgPrcService.selectItemMovingAvgPrcHistoryMaxLineNo(itemMovingAvgPrcVO);

            itemMovingAvgPrcVO.setSeq(itemMovingAvgPrcSeq);

            resultCnt =  itemMovingAvgPrcService.insertItemMovingAvgPrcHistory(itemMovingAvgPrcVO);

            if(resultCnt != 1){
                //기타입고 확정 실패.
                throw processException("global.err.modifyFailedParam", new String[]{messageSource.getMessage("par.lbl.etcIssue", null, LocaleContextHolder.getLocale())});
             }
             */

            /********************************************************************
             * 해당 부품이 이동평균가격 정보가 존재하는지 조회한다.
             * 조회 시 데이터가 없는 경우 처음으로 입고되는 정보라고 판단하여
             * 이동평균가격 테이블에 입고 정고를 기준으로 데이터를 생성하고
             * 데이터가 존재하는 경우 이동평균가(총평균가)를 수정한다.
             * 끝
             ********************************************************************/


            if(i == 0){
                mvtDocVO.setMvtDocYyMm(itemList.get(i).getMvtDocYyMm());
                mvtDocVO.setMvtDocNo(itemList.get(i).getMvtDocNo());
            }

            mvtDocItemVO.setDlrCd(itemList.get(i).getDlrCd());
            mvtDocItemVO.setPltCd(LoginUtil.getPltCd());
            mvtDocItemVO.setCancStmtYn("Y");
            //mvtDocItemVO.setLocCd("");
            mvtDocItemVO.setItemCd(itemList.get(i).getGoodsCd());
            mvtDocItemVO.setItemUnitCd(itemList.get(i).getGoodsUnitCd());
            mvtDocItemVO.setItemQty(qty);
            mvtDocItemVO.setStrgeCd(itemList.get(i).getGiStrgeCd());
            mvtDocItemVO.setDdlnYn("N");
            mvtDocItemVO.setCurrCd("");
            mvtDocItemVO.setMvtReasonCont("精品取消");      // 용품취소
            mvtDocItemVO.setSalePrc(itemList.get(i).getRetlPrc());
            mvtDocItemVO.setSaleAmt(itemList.get(i).getTotAmt());
            mvtDocItemVO.setRefDocNo(itemList.get(i).getMvtDocNo());
            mvtDocItemVO.setRefDocLineNo(itemList.get(i).getMvtDocLineNo());

            mvtItemList.add(mvtDocItemVO);

        }

        List<MvtDocItemVO> mvtSaveItemList = mvtDocService.multiCnclMvtDocs(mvtDocVO, mvtItemList);

        if(mvtSaveItemList.size() < 1){
            //기타출고부품의 출고 확정이 처리되지 않았습니다.
           throw processException("par.err.failedEtcIssueMsg");
        }

        //용품판매문서상태를 출고대기(10) 상태로 변경한다.
        accessoryItemSalesDAO.updateAccessoryItemSalesContractStatCd(cntVO.getDlrCd(), cntVO.getGoodsContractNo(), "10", LoginUtil.getUserId());

        return searchVO.getsGoodsContractNo();
    }

    /**
     * 소매계약건의 용품내역을 삭제한다.
     */
    @Override
    public int deleteContractSaleAccessoryItemSales(String contractNo)throws Exception{

        if( StringUtils.isEmpty(contractNo) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        AccessoryItemSalesSearchVO searchVO = new AccessoryItemSalesSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsSaleContractNo(contractNo);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        List<AccessoryItemSalesVO> accList = selectAccessoryItemSalesByCondition(searchVO);

        for(AccessoryItemSalesVO accVO : accList){
            accessoryItemSalesDAO.deleteContractAccessoryItemSalesItem(accVO);
            accessoryItemSalesDAO.deleteContractAccessoryItemSalesHeader(accVO);
        }
        return 1;
    }

    /**
     * 소매계약건의 용품ITEM내역을 삭제한다.
     */
    @Override
    public int deleteContractAccessoryItemSalesItem(AccessoryItemSalesVO deleteVO) throws Exception{
        if( StringUtils.isEmpty(deleteVO.getGoodsContractNo()) ){
            // [용품번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("sal.lbl.goodsContractNo", null, LocaleContextHolder.getLocale())});
        }
        if(StringUtils.isBlank(deleteVO.getDlrCd())){
           deleteVO.setDlrCd(LoginUtil.getDlrCd());
        }

        accessoryItemSalesDAO.deleteContractAccessoryItemSalesItem(deleteVO);
        return 1;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        String sListType = params.get("sListType").toString();

        AccessoryItemSalesSearchVO searchVO = new AccessoryItemSalesSearchVO();
        searchVO.setsLangCd(langCd);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if(!StringUtils.isBlank(params.get("sStartRegDt").toString())){
            searchVO.setsStartRegDt(java.sql.Date.valueOf(params.get("sStartRegDt").toString()));
        }

        if(!StringUtils.isBlank(params.get("sEndRegDt").toString())){
            searchVO.setsEndRegDt(java.sql.Date.valueOf(params.get("sEndRegDt").toString()));
        }

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if("H".equals(sListType)){
            List<AccessoryItemSalesVO> list = selectAccessoryItemSalesByCondition(searchVO);

            //용품업무유형
            List<CommonCodeVO> goodsTpList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL158", null, langCd);

            //용품판매상태
            List<CommonCodeVO> contractStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL185", null, langCd);

            //고객유형(개인, 법인)
            List<CommonCodeVO> custTpList = commonCodeService.selectCommonCodesByCmmGrpCd("CRM001", null, langCd);

            //공통코드 명칭 변환
            for(AccessoryItemSalesVO accessoryItemSalesVO : list){
                //용품업무유형
                for(CommonCodeVO cmmCodeVO : goodsTpList){
                    if(cmmCodeVO.getCmmCd().equals(accessoryItemSalesVO.getGoodsTp())){
                        accessoryItemSalesVO.setGoodsTp(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }

                //용품판매상태
                for(CommonCodeVO cmmCodeVO : contractStatCdList){
                    if(cmmCodeVO.getCmmCd().equals(accessoryItemSalesVO.getContractStatCd())){
                        accessoryItemSalesVO.setContractStatCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }

                //고객유형
                for(CommonCodeVO cmmCodeVO : custTpList){
                    if(cmmCodeVO.getCmmCd().equals(accessoryItemSalesVO.getContractCustTp())){
                        accessoryItemSalesVO.setContractCustTp(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        } else {
            List<AccessoryItemSalesItemVO> list = selectAccessoryItemSalesItemsByCondition(searchVO);

            //품목유형
            List<CommonCodeVO> itemDstinCdList = commonCodeService.selectCommonCodesByCmmGrpCd("PAR101", null, langCd);

            //창고목록
            StorageSearchVO storageSearchVO = new StorageSearchVO();
            storageSearchVO.setsPltCd(LoginUtil.getPltCd());
            storageSearchVO.setsDlrCd(LoginUtil.getDlrCd());
            storageSearchVO.setsStrgeTp("20");  //창고유형(판매용품창고)
            List<StorageVO> storageList = storageService.selectStoragesByCondition(storageSearchVO);

            //문서상태
            List<CommonCodeVO> itemStatCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL199", null, langCd);

            //공통코드 명칭 변환
            for(AccessoryItemSalesItemVO accessoryItemSalesItemVO : list){
                //품목유형
                for(CommonCodeVO cmmCodeVO : itemDstinCdList){
                    if(cmmCodeVO.getCmmCd().equals(accessoryItemSalesItemVO.getItemDstinCd())){
                        accessoryItemSalesItemVO.setItemDstinCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }

                //출고창고
                for(StorageVO storageVO : storageList){
                    if(storageVO.getStrgeNm().equals(accessoryItemSalesItemVO.getGiStrgeCd())){
                        accessoryItemSalesItemVO.setGiStrgeCd(storageVO.getStrgeNm());
                        break;
                    }
                }

                //판매문서품목상태
                for(CommonCodeVO cmmCodeVO : itemStatCdList){
                    if(cmmCodeVO.getCmmCd().equals(accessoryItemSalesItemVO.getStatCd())){
                        accessoryItemSalesItemVO.setStatCd(cmmCodeVO.getCmmCdNm());
                        break;
                    }
                }
            }
            context.putVar("items", list);
        }
    }

    /**
     * 완성차 출고 - 용품판매문서 차량정보를 변경한다.
     * @param saveVO
     * @return
     * @throws Exception
     */
    public int updateAccessoryItemSalesVehicleInfoChange(AccessoryItemSalesVO saveVO) throws Exception{
        if(StringUtils.isBlank(saveVO.getDlrCd())){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        }
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        return accessoryItemSalesDAO.updateAccessoryItemSalesVehicleInfoChange(saveVO);
    }

    public void chkAccessorySaleUpdateSomebody(AccessoryItemSalesVO accessoryItemSalesVO) throws Exception {

        String updtDtStrNow;
        String[] lblList = new String[3];

        try {
            updtDtStrNow = accessoryItemSalesDAO.selectAccessorySaleUpdtDtByKey(accessoryItemSalesVO);

            if(!updtDtStrNow.equals(accessoryItemSalesVO.getUpdtDtStr())){
                lblList[0] = messageSource.getMessage("global.lbl.update", null, LocaleContextHolder.getLocale());
                lblList[1] = messageSource.getMessage("sal.lbl.ordNo", null, LocaleContextHolder.getLocale());
                lblList[2] = messageSource.getMessage("global.btn.search", null, LocaleContextHolder.getLocale());
                throw processException("global.info.reTryInfo", lblList);
            }

        } catch (FdlException e) {
            throw processException("global.err.idgen", new String[]{messageSource.getMessage("sal.lbl.ordNo", null, LocaleContextHolder.getLocale())});
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemSalesByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception {
        return accessoryItemSalesDAO.selectAccessoryItemSalesByConditionCnt(searchVO);
    }
    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesVO> selectAccessoryItemSalesByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception {
        return accessoryItemSalesDAO.selectAccessoryItemSalesByCondition(searchVO);
    }

     /**
      *
      * 계약 화면 용품 판매 관리 조회
      *
      * @param searchVO
      * @return
      * @throws Exception
      */
     public List<AccessoryItemSalesItemVO> selectAccessoryItemSalesContractByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception{

         return accessoryItemSalesDAO.selectAccessoryItemSalesContractByCondition(searchVO);
     }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAccessoryItemSalesItemsByConditionCnt(AccessoryItemSalesSearchVO searchVO) throws Exception{
        return accessoryItemSalesDAO.selectAccessoryItemSalesItemsByConditionCnt(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AccessoryItemSalesItemVO> selectAccessoryItemSalesItemsByCondition(AccessoryItemSalesSearchVO searchVO) throws Exception{
        return accessoryItemSalesDAO.selectAccessoryItemSalesItemsByCondition(searchVO);
    }

    /**
     * 포인트 교환 - CRM 멤버십에서 호출
     *
     * 포인트 교환 요청이 온경우 용품판매관리 등록 > 출고 > 수납 > 완성 처리를 한꺼번에 처리한다.
     *
     * @param AccessoryItemSalesSaveVO accessoryItemSalesSaveVO
     * @return
     * @throws Exception
     */
    @Override
    public void updateMembershipPointGoodsExchange(AccessoryItemSalesSaveVO accessoryItemSalesSaveVO) throws Exception {

        /**
         * 1. 용품판매관리 저장
         */
        if ( StringUtil.isEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getDlrCd()) ) {
            // {딜러코드}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        }
        if ( StringUtil.isEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getContractCustNm()) ) {
            // {고객명}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())});
        }
        if ( StringUtil.isEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getContractCustNo()) ) {
            // {고객번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())});
        }
        if ( StringUtil.isEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getMembershipNo()) ) {
            // {멤버십 번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.membershipNo", null, LocaleContextHolder.getLocale())});
        }
        if ( StringUtil.isEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getCardNo()) ) {
            // {카드번호}을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("crm.lbl.cardNo", null, LocaleContextHolder.getLocale())});
        }

        String goodsContractNo = "";
        String dlrCd = accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getDlrCd();

        // 용품판매관리 저장
        multiAccessoryItemSales(accessoryItemSalesSaveVO);

        // 용품판매 문서번호 생성되었는지 확인.
        if(StringUtils.isNotEmpty(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getGoodsContractNo())){

            // 용품판매문서번호
            goodsContractNo = accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getGoodsContractNo();

            /**
             * 2. 용품출고
             *  용품판매문서번호로 용품목록을 불러온다 ( 라인번호를 가져오기위함 )
             */
            AccessoryItemSalesSearchVO accessoryItemSalesSearchVO = new AccessoryItemSalesSearchVO();
            accessoryItemSalesSearchVO.setsDlrCd(dlrCd);
            accessoryItemSalesSearchVO.setsGoodsContractNo(goodsContractNo);
            List<AccessoryItemSalesItemVO> list = selectAccessoryItemSalesItemsByCondition(accessoryItemSalesSearchVO);

            // 수정이력 비교하는 날짜
            String updtDtStrNow = accessoryItemSalesDAO.selectAccessorySaleUpdtDtByKey(accessoryItemSalesSaveVO.getAccessoryItemSalesVO());
            accessoryItemSalesSaveVO.getAccessoryItemSalesVO().setUpdtDtStr(updtDtStrNow);
            // 출고 완료일 / 수납일자 설정
            Date toDay = Calendar.getInstance().getTime();
            accessoryItemSalesSaveVO.getAccessoryItemSalesVO().setRealDlDt(toDay);
            applySalesCnfm(accessoryItemSalesSaveVO.getAccessoryItemSalesVO(), list);

            /*
             * 용품 출고 완료시 포인트 사용
             *  - 마스터 기준이 아닌 디테일 기준으로 포인트 사용.
             */

            for (AccessoryItemSalesItemVO accessoryItemSalesItemVO : list) {

                // 용품 포인트 사용
                MembershipPointHisVO membershipPointHisVO = new MembershipPointHisVO();
                membershipPointHisVO.setUseTp("02");                                                //사용처
                membershipPointHisVO.setUseNum(goodsContractNo);                                    //송장번호
                membershipPointHisVO.setSrcSub1(goodsContractNo);                                   //수납번호
                membershipPointHisVO.setSrcSub2(String.valueOf(accessoryItemSalesItemVO.getSeq())); //수납번호
                membershipPointHisVO.setDlrCd(dlrCd);
                membershipPointHisVO.setMembershipNo(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getMembershipNo());
                membershipPointHisVO.setCardNo(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getCardNo());   // 카드번호
                membershipPointHisVO.setPointCd("23");                                              // 积分兑换(용품교환)  CRM802
                membershipPointHisVO.setOccrPointVal(accessoryItemSalesItemVO.getItemPointVal());   // 발생 포인트 ( 사용 포인트 )
                membershipPointHisVO.setOccrPointCost(0.0);                                         // 해당포인트 사용금액
                membershipPointHisVO.setPointMaxChk("N");
                membershipPointHisSupportService.selectCallPointInterface(membershipPointHisVO);

            }

            /**
             * 3. 수납관리 > 수납 ( 기존 수납 프로세스 말고 0원 수납 새로 만듬 )
             *  -용품판매문서번호로 수납정보를 불러온다.
             *  -포인트교환이기 때문에 현금, 0원 수납처리
             *  -수납에 포인트가 없어졌으므로 포인트 정보 저장은 불필요.
             */
            PayInfoSearchVO searchVO = new PayInfoSearchVO();
            searchVO.setsJobContractNo(goodsContractNo);
            PayInfoVO vo = payInfoService.selectPayInfosByKey(searchVO);

            PayInfoDetailVO saveVO = new PayInfoDetailVO();
            saveVO.setColTp("01");  // 입금
            saveVO.setDlrCd(dlrCd);
            saveVO.setCustNm(accessoryItemSalesSaveVO.getAccessoryItemSalesVO().getContractCustNm());
            saveVO.setFinDocNo(vo.getFinDocNo());
            saveVO.setJobContractNo(goodsContractNo);
            saveVO.setJobTp("G");                       // 업무유형 : 용품(G)
            saveVO.setPayAmt(0.0);                      // 수납금액
            saveVO.setRctTp("01");                      // 지불방식 : ( 현금 - 0원 수납 )
            saveVO.setPaymentTp("02");                  // 수납완료
            saveVO.setRctDt(toDay);                     // 수납일자
            payInfoService.saveCrmGoodsPointPayInfo(saveVO);

            /**
             * 4. 용품판매관리 > 완성
             */
            //용품판매문서 변경
            accessoryItemSalesSaveVO.getAccessoryItemSalesVO().setContractStatCd("40");
            accessoryItemSalesDAO.updateAccessoryItemSales(accessoryItemSalesSaveVO.getAccessoryItemSalesVO());

        }


    }

}
