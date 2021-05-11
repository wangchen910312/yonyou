package chn.bhmc.dms.sal.inc.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.DBMessageSourceService;

import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceSearchVO;
import chn.bhmc.dms.cmm.sci.vo.DBMessageSourceVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cnt.service.ContractReOutBoundService;
import chn.bhmc.dms.sal.cnt.vo.ContractReSupportVO;
import chn.bhmc.dms.sal.fin.service.PayInfoOutBoundService;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundSearchVO;
import chn.bhmc.dms.sal.fin.vo.PayInfoOutBoundVO;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.service.dao.IncJoinInfoDAO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncProcessVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.      Kim yewon              최초 생성
 * </pre>
 */

@Service("incJoinInfoService")
public class IncJoinInfoServiceImpl extends HService implements IncJoinInfoService, JxlsSupport{

    /**
     * 마감시간통제 DAO 선언
     */
    @Resource(name="incJoinInfoDAO")
    IncJoinInfoDAO incJoinInfoDAO;

    /**
     * 계약 서비스
     */
    @Resource(name="contractReOutBoundService")
    ContractReOutBoundService contractReOutBoundService;

    /**
     * 수납 서비스
     */
    @Resource(name="payInfoOutBoundService")
    PayInfoOutBoundService payInfoOutBoundService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 메세지소스 관리 서비스
     */
    @Resource(name="dbMessageSourceService")
    DBMessageSourceService dbMessageSourceService;

    /**
     * 조회 조건에 해당하는 보험가입정보를 조회한다.
     */
    @Override
    public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncJoinInfoByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 보험가입정보 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncJoinInfoByConditionCnt(searchVO);
    }

    //성코드
    @Override
    public List<IncJoinInfoVO> selectSungCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectSungCd(vo);
    }


    //도시코드
    @Override
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectCityCd(vo);
    }


    //성코드
    @Override
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectDistCd(vo);
    }


    /**
     * 보험가입정보
     */
    @Override
    public IncJoinInfoVO multiSaveIncJoinInfo(IncJoinInfoSaveVO saveVO) throws Exception{

        if(saveVO.getIncJoinInfoVO().getIncNo() == null || saveVO.getIncJoinInfoVO().getIncNo().equals("")){
            saveVO.getIncJoinInfoVO().setRegUsrId(LoginUtil.getUserId());          // 등록자
            saveVO.getIncJoinInfoVO().setDlrCd(LoginUtil.getDlrCd());
            incJoinInfoDAO.insertIncJoinInfo(saveVO.getIncJoinInfoVO());
        }else {
            saveVO.getIncJoinInfoVO().setUpdtUsrId(LoginUtil.getUserId());         // 수정자
            saveVO.getIncJoinInfoVO().setDlrCd(LoginUtil.getDlrCd());
            if(!saveVO.isContract()){
                incJoinInfoDAO.updateIncJoinInfo(saveVO.getIncJoinInfoVO());
            }else{
                incJoinInfoDAO.updateIncJoinInfoContract(saveVO.getIncJoinInfoVO());
            }
        }

        if(saveVO.getIncDtlVO() != null){
            IncJoinInfoVO iVO = new IncJoinInfoVO();
            iVO.setDlrCd(saveVO.getIncJoinInfoVO().getDlrCd());
            iVO.setIncNo(saveVO.getIncJoinInfoVO().getIncNo());
            incJoinInfoDAO.deleteContractSaleDetailItem(iVO);
            saveIncDetailItem(saveVO.getIncDtlVO(),saveVO.getIncJoinInfoVO());
        }

         // 완성 - 속보험 - 재무수납 여부 체크 시.
        if("20".equals( saveVO.getIncJoinInfoVO().getIncStat())
           && StringUtils.isEmpty(saveVO.getIncJoinInfoVO().getContractNo())
           && "Y".equals( saveVO.getIncJoinInfoVO().getFinImplyYn())
        ){
            //  보험료 = 실보험총금액 + 보험수수료
            double incIncTot = saveVO.getIncJoinInfoVO().getRealIncTotAmt() != null ? saveVO.getIncJoinInfoVO().getRealIncTotAmt() : 0.0;
            double incFreeTot = saveVO.getIncJoinInfoVO().getIncFeeTotAmt() != null ? saveVO.getIncJoinInfoVO().getIncFeeTotAmt() : 0.0;
            double incAmt = incIncTot + incFreeTot;

            PayInfoOutBoundVO payVO = null;

            PayInfoOutBoundSearchVO paySerchVO = new PayInfoOutBoundSearchVO();
            paySerchVO.setsDlrCd( LoginUtil.getDlrCd() );
            paySerchVO.setsJobTp("I");  // 보험
            paySerchVO.setsJobContractNo( saveVO.getIncJoinInfoVO().getIncNo() );
            PayInfoOutBoundVO pVO = null;
            List<PayInfoOutBoundVO> payList = payInfoOutBoundService.selectPayInfosByCondition(paySerchVO);
            if(payList != null && payList.size() > 0){
                pVO = payList.get(0);

                payVO = new PayInfoOutBoundVO();
                payVO.setDlrCd( LoginUtil.getDlrCd() );
                payVO.setFinDocNo( pVO.getFinDocNo() );
                payVO.setJobTp("I");
                payVO.setJobContractNo(saveVO.getIncJoinInfoVO().getIncNo());
                payVO.setVinNo(saveVO.getIncJoinInfoVO().getVinNo());
                payVO.setCustTp(saveVO.getIncJoinInfoVO().getCustTp());
                payVO.setCustNo(saveVO.getIncJoinInfoVO().getCustNo());
                payVO.setCustNm(saveVO.getIncJoinInfoVO().getCustNm());
                payVO.setManageEmpNo(saveVO.getIncJoinInfoVO().getIncPrsnId());

                // 지불상태:01-미결, 02-수납완료
                String paymentTp = pVO.getPaymentTp();
                String compYn    = pVO.getCompYn();
                Date compDt      = pVO.getCompDt();

                if( "02".equals(paymentTp) ){
                    if(incAmt != pVO.getRealPayAmt()){
                        paymentTp = "01";
                        compYn = "N";
                        compDt = null;
                    }
                }
                payVO.setCompYn(compYn);
                payVO.setCompDt(compDt);
                payVO.setPaymentTp(paymentTp);
                payVO.setRealPayAmt(incAmt);
                payVO.setUpdtUsrId(LoginUtil.getUserId());
                payInfoOutBoundService.updatePayInfoHeader(payVO);
                payInfoOutBoundService.updatePayInfoHeader(payVO);
            }else{
                // SA_0451T : 수납헤더 생성
                payVO = new PayInfoOutBoundVO();
                payVO.setDlrCd( LoginUtil.getDlrCd() );
                payVO.setJobTp("I");
                payVO.setJobContractNo(saveVO.getIncJoinInfoVO().getIncNo());
                payVO.setVinNo(saveVO.getIncJoinInfoVO().getVinNo());
                payVO.setCustTp(saveVO.getIncJoinInfoVO().getCustTp());
                payVO.setCustNo(saveVO.getIncJoinInfoVO().getCustNo());
                payVO.setCustNm(saveVO.getIncJoinInfoVO().getCustNm());
                payVO.setManageEmpNo(saveVO.getIncJoinInfoVO().getIncPrsnId());
                payVO.setPaymentTp("01");                   // 미결
                payVO.setRealPayAmt(incAmt);
                payVO.setTotPayAmt(0.00);
                payVO.setTotDcAmt(0.00);
                payVO.setProAmt(0.00);
                payVO.setRecvAmt(incAmt);
                payVO.setOverAmt(0.00);
                payVO.setRecpYn("N");
                payVO.setRegUsrId(LoginUtil.getUserId());
                payVO.setUpdtUsrId(LoginUtil.getUserId());
                payInfoOutBoundService.insertPayInfoHeader(payVO);
            }
        }

        // 차량 계약건은 재반영.
        // SA_0201T(계약), SA_0221T(계약-보험Header), SA_0222T(계약-보험Item) 반영
        if(saveVO.getIncJoinInfoVO().getContractNo() != null && !saveVO.getIncJoinInfoVO().getContractNo().equals("") && !saveVO.isContract() ){
            ContractReSupportVO saleVO = new ContractReSupportVO();
            saleVO.setContractNo(saveVO.getIncJoinInfoVO().getContractNo());
            saleVO.setDlrCd( saveVO.getIncJoinInfoVO().getDlrCd() );
            saleVO.setIncExpcAmt( saveVO.getIncJoinInfoVO().getIncExpcTotAmt() );
            saleVO.setIncFeeAmt( saveVO.getIncJoinInfoVO().getIncFeeTotAmt() );
            saleVO.setRealIncAmt( saveVO.getIncJoinInfoVO().getRealIncTotAmt() );
            saleVO.setIncCmpCd( saveVO.getIncJoinInfoVO().getIncCmpCd() );
            saleVO.setIncProfitNm( saveVO.getIncJoinInfoVO().getIncProfitNm() );
            saleVO.setIncJoinDt( saveVO.getIncJoinInfoVO().getIncJoinDt() );
            saleVO.setImplyYn( saveVO.getIncJoinInfoVO().getImplyYn() );
            saleVO.setFinImplyYn(StringUtils.isEmpty(saveVO.getIncJoinInfoVO().getFinImplyYn()) ? "N" : saveVO.getIncJoinInfoVO().getFinImplyYn()); //재무수납포함여부
            saleVO.setIncCustNm( saveVO.getIncJoinInfoVO().getIncCustNm() );
            saleVO.setIncCustTelNo( saveVO.getIncJoinInfoVO().getIncCustTelNo() );            // 피보험인전화
            saleVO.setIncPconCustNm( saveVO.getIncJoinInfoVO().getIncPconCustNm() );          //연계인
            saleVO.setIncPconCustTelNo( saveVO.getIncJoinInfoVO().getIncPconCustTelNo() );    //연계인전화
            saleVO.setFrcIncAmt( saveVO.getIncJoinInfoVO().getFrcIncAmt() );
            saleVO.setBusIncAmt( saveVO.getIncJoinInfoVO().getBusIncAmt() );
            saleVO.setRemark( saveVO.getIncJoinInfoVO().getRemark() );
            saleVO.setTransIncTaxAmt( saveVO.getIncJoinInfoVO().getTransTaxAmt() );
            IncJoinInfoSearchVO incSearchVO = new IncJoinInfoSearchVO();
            incSearchVO.setsDlrCd( saveVO.getIncJoinInfoVO().getDlrCd() );
            incSearchVO.setsIncNo( saveVO.getIncJoinInfoVO().getIncNo() );
            incSearchVO.setsCustNo( saveVO.getIncJoinInfoVO().getCustNo() );
            incSearchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

            List<IncJoinInfoVO> incItemList = selectIncDetailItem(incSearchVO);
            if(incItemList.size() > 0){
                contractReOutBoundService.contractIncSave(saleVO, incItemList);
            }

        }

        return saveVO.getIncJoinInfoVO();
    }

    /**
     * 고객인도 시, 보험정보의 vin번호 update
     */
    public void updateVinNoIncJoinInfo(IncJoinInfoSaveVO saveVO) throws Exception{
        saveVO.getIncJoinInfoVO().setUpdtUsrId(LoginUtil.getUserId());         // 수정자
        saveVO.getIncJoinInfoVO().setDlrCd(LoginUtil.getDlrCd());
        incJoinInfoDAO.updateIncJoinInfo(saveVO.getIncJoinInfoVO());
    }


    /**
     * 보험가입정보관리상태를 변경한다.
     **/
    @Override
    public String updateSateIncJoinInfo(IncJoinInfoVO saveVO) throws Exception{

        if( StringUtils.isEmpty(saveVO.getIncNo() ) ){
            // [보험증서번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.incNo", null, LocaleContextHolder.getLocale())});
        }

        if( StringUtils.isEmpty(saveVO.getDlrCd()) ){
            saveVO.setDlrCd(LoginUtil.getDlrCd());
        };

        if( StringUtils.isEmpty(saveVO.getContractNo())
          && "Y".equals(saveVO.getFinImplyYn())){
            PayInfoOutBoundSearchVO paySerchVO = new PayInfoOutBoundSearchVO();
            paySerchVO.setsDlrCd( saveVO.getDlrCd() );
            paySerchVO.setsJobTp("I");  // 보험
            paySerchVO.setsJobContractNo( saveVO.getIncNo() );
            List<PayInfoOutBoundVO> payList = payInfoOutBoundService.selectPayInfosByCondition(paySerchVO);
            if(payList != null && payList.size()>0){
                if(payList.get(0).getTotPayAmt() > 0 || "02".equals(payList.get(0).getPaymentTp())){
                    throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("ser.menu.receiveMng", null, LocaleContextHolder.getLocale())});                }
            }
        }

        if(!StringUtils.isEmpty(saveVO.getContractNo())){
            contractReOutBoundService.contractIncDelete(saveVO);  // 보험계약을 지운다.
        }

        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        incJoinInfoDAO.updateSateIncJoinInfo(saveVO);

        return saveVO.getIncNo();
    }

    /**
     * 계약과 연계된 보험가입자의 고객정보를 변경한다.
     */
    @Override
    public int updateIncCustInfo(IncJoinInfoVO saveVO) throws Exception{
        incJoinInfoDAO.updateIncCustInfo(saveVO);
        return 1;
    }

    //선택한 고객이 인도한 차량 VIN NO 조회.
    @Override
    public List<IncJoinInfoVO> selectCustContractNo(IncJoinInfoSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        return incJoinInfoDAO.selectCustContractNo(searchVO);
    }
    @Override
    public int selectCustContractNoCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectCustContractNoCnt(searchVO);
    }



    //보험신청명세(ITEM)목록 데이터를 조회한다.
    @Override
    public List<IncJoinInfoVO> selectIncDetailItem(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncDetailItem(searchVO);
    }
    @Override
    public int selectIncDetailItemCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncDetailItemCnt(searchVO);
    }



    /**
     * 보험신청명세 내용 저장.
     */
    public void saveIncDetailItem(BaseSaveVO<IncJoinInfoVO> obj,IncJoinInfoVO incJoinInfoVO) throws Exception{

        // 등록
        for(IncJoinInfoVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());

            IncJoinInfoSearchVO searchVO = new IncJoinInfoSearchVO();
            searchVO.setsDlrCd(vo.getDlrCd());
            searchVO.setsIncNo(vo.getIncNo());
            searchVO.setsIncTp(vo.getIncTp());
            if( incJoinInfoDAO.selectIncDetailItemCnt(searchVO) > 0){
                throw processException("global.err.duplicate");
            }

            incJoinInfoDAO.insertIncDetailItem(vo);
        }

        // 수정
        for(IncJoinInfoVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());

            IncJoinInfoSearchVO searchVO = new IncJoinInfoSearchVO();
            searchVO.setsDlrCd(vo.getDlrCd());
            searchVO.setsIncNo(vo.getIncNo());
            searchVO.setsIncTp(vo.getIncTp());
            if( incJoinInfoDAO.selectIncDetailItemCnt(searchVO) > 0){
                throw processException("global.err.duplicate");
            }
            incJoinInfoDAO.updateIncDetailItem(vo);
        }

        // 삭제
        for(IncJoinInfoVO vo : obj.getDeleteList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());
            incJoinInfoDAO.deleteIncDetailItem(vo);

        }

    }

    /**
     * 보험가입정보관리 상세 POP-UP
     */
    @Override
    public IncJoinInfoVO selectIncDetail(IncJoinInfoSearchVO searchVO) throws Exception {
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        IncJoinInfoVO a = incJoinInfoDAO.selectIncDetail(searchVO);
        return a;
    }

    //보험가입정보 COUNT조회. (DLR_CD,CONTRACT_NO,CUST_NO별)
    @Override
    public IncJoinInfoVO selectIncNo(IncJoinInfoSearchVO vo) throws Exception {
        return incJoinInfoDAO.selectIncNo(vo);
    }



    /**
     * 보험 추적 이력을 조회한다.
     **/
    @Override
    public int selectIncProcessByConditionCnt(IncProcessSearchVO searchVO) throws Exception{
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return incJoinInfoDAO.selectIncProcessByConditionCnt(searchVO);
    }
    @Override
    public List<IncProcessVO> selectIncProcessByCondition(IncProcessSearchVO searchVO) throws Exception{
        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsLangCd())){searchVO.setsLangCd(LoginUtil.getLangCd());}
        return incJoinInfoDAO.selectIncProcessByCondition(searchVO);
    }

    /**
     * 보험 추적을 저장한다.
     **/
    @Override
    public int multiIncProcess(IncProcessVO vo) throws Exception{

        if(StringUtils.isEmpty(vo.getIncNo())){
            // [보험번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.incNo", null, LocaleContextHolder.getLocale())});
        }

        vo.setRegUsrId(LoginUtil.getUserId());      // 등록자
        vo.setUpdtUsrId(LoginUtil.getUserId());     // 수정자
        if(StringUtil.nullConvert(vo.getDlrCd()).equals("")){
            vo.setDlrCd(LoginUtil.getDlrCd());
        }

        if(StringUtils.isEmpty(vo.getSeq())){
            incJoinInfoDAO.insertIncProcess(vo);
        }else{
            incJoinInfoDAO.updateIncProcess(vo);
        }
        return 1;
    }

    /**
     * 소매계약건의 보험가입정보를 삭제한다.
     */
    @Override
    public int deleteContractSaleIncInfo(String contractNo) throws Exception{

        if( StringUtils.isEmpty(contractNo) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        IncJoinInfoSearchVO searchVO = new IncJoinInfoSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsContractNo(contractNo);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<IncJoinInfoVO> incList = incJoinInfoDAO.selectIncJoinInfoByCondition(searchVO);

        for(IncJoinInfoVO incVO : incList){
            incJoinInfoDAO.deleteContractSaleDetailItem(incVO);
            incJoinInfoDAO.deleteIncProcess(incVO);
            incJoinInfoDAO.deleteContractSaleHeader(incVO);
        }
        return 1;
    }

    /**
     * 소매계약번호로 보험가입정보 문서번호를 조회한다.
     * @param contractNo
     * @return
     * @throws Exception
     */
    @Override
    public String selectContractIncNo(String contractNo) throws Exception{
        if( StringUtils.isEmpty(contractNo) ){
            // [계약번호]을(를) 확인하여 주세요.
            throw processException("global.info.confirmMsgParam", new String[]{messageSource.getMessage("global.lbl.contractNo", null, LocaleContextHolder.getLocale())});
        }

        IncJoinInfoSearchVO searchVO = new IncJoinInfoSearchVO();
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        searchVO.setsContractNo(contractNo);
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        List<IncJoinInfoVO> incList = incJoinInfoDAO.selectIncJoinInfoByCondition(searchVO);
        String incNo = "";
        if(incList != null && incList.size() > 0){
            incNo = incList.get(0).getIncNo();
        }
        return incNo;
    }


    /**
     * 엑셀다운로드
     **/
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        IncJoinInfoSearchVO searchVO = new IncJoinInfoSearchVO();
        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if (StringUtils.isNotEmpty((String)params.get("sIncJoinStartDt"))) {
            searchVO.setsIncJoinStartDt(DateUtil.convertToDate((String)params.get("sIncJoinStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sIncJoinEndDt"))) {
            searchVO.setsIncJoinEndDt(DateUtil.convertToDate((String)params.get("sIncJoinEndDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCarSaleStartDt"))) {
            searchVO.setsCarSaleStartDt(DateUtil.convertToDate((String)params.get("sCarSaleStartDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sCarSaleEndDt"))) {
            searchVO.setsCarSaleEndDt(DateUtil.convertToDate((String)params.get("sCarSaleEndDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sIncEndFromDt"))) {
            searchVO.setsIncEndFromDt(DateUtil.convertToDate((String)params.get("sIncEndFromDt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sIncEndToDt"))) {
            searchVO.setsIncEndToDt(DateUtil.convertToDate((String)params.get("sIncEndToDt")));
        }

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }

        List<IncJoinInfoVO> list = selectIncJoinInfoByCondition(searchVO);

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        //보험회사코드 SAL127
        HashMap<String, String> incCmpCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL127", null, langCd)){
            incCmpCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }

        //금융회사코드 SAL055
        HashMap<String, String> fincCmpCdMap = new HashMap<String, String>();
        for(CommonCodeVO vo : commonCodeService.selectCommonCodesByCmmGrpCd("SAL055", null, langCd)){
            fincCmpCdMap.put(vo.getCmmCd(), vo.getCmmCdNm());
        }
        fincCmpCdMap.put("BHAF", "北现金融");

        String instPayMsg = "";
        String nonInstPayMsg = "";
        DBMessageSourceSearchVO messageSearchVO = new DBMessageSourceSearchVO();
        List<DBMessageSourceVO> messageList = null;
        messageSearchVO.setsLangCd(langCd);
        messageSearchVO.setsMesgKey("sal.lbl.instPay");
        messageList = dbMessageSourceService.selectDBMessageSourcesByCondition(messageSearchVO);
        if(messageList != null && messageList.size() > 0){
            instPayMsg = messageList.get(0).getMesgTxt();
        }
        messageSearchVO.setsMesgKey("sal.lbl.nonInstPay");
        messageList = dbMessageSourceService.selectDBMessageSourcesByCondition(messageSearchVO);
        if(messageList != null && messageList.size() > 0){
            nonInstPayMsg = messageList.get(0).getMesgTxt();
        }

        for(IncJoinInfoVO vo : list){
            vo.setIncCmpCd(incCmpCdMap.get(vo.getIncCmpCd()));    //보험회사
            vo.setFincCmpCd(fincCmpCdMap.get(vo.getFincCmpCd())); //금융회사
            if(StringUtils.isNotBlank(vo.getFincYn())){
                vo.setFincYn("Y".equals(StringUtils.trimToEmpty(vo.getFincYn()))?instPayMsg:nonInstPayMsg );
            }
        }

        context.putVar("items", list);
    }

}
