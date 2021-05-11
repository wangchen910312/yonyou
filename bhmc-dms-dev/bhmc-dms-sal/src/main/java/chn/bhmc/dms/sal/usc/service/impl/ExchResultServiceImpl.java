package chn.bhmc.dms.sal.usc.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import able.com.exception.BizException;
import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonService;
import chn.bhmc.dms.sal.usc.service.ExchResultService;
import chn.bhmc.dms.sal.usc.service.dao.ExchResultDAO;
import chn.bhmc.dms.sal.usc.vo.ExchResultSearchVO;
import chn.bhmc.dms.sal.usc.vo.ExchResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExchResultServiceImpl
 * @Description : 중고차치환판매심사결과조회
 * @author
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.      Kim yewon              최초 생성
 * </pre>
 */

@Service("exchResultService")
public class ExchResultServiceImpl extends HService implements ExchResultService ,JxlsSupport{

    /**
     * 중고차 - 매입평가관리 DAO 선언
     */
    @Resource(name="exchResultDAO")
    ExchResultDAO exchResultDAO;


    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;


    /**
     * 판매-공통 서비스
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;



    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<ExchResultVO> selectExchResultByCondition(ExchResultSearchVO searchVO){
        return exchResultDAO.selectExchResultByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectExchResultByConditionCnt(ExchResultSearchVO searchVO) {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        return exchResultDAO.selectExchResultByConditionCnt(searchVO);
    }



    @Override
    public void insertExchRegistUpload(List<ExchResultVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(ExchResultVO exchResultVO : list){
            exchResultVO.setRegUsrId(userId);

            //일자
            String ocarRcptPublDtS = StringUtils.replaceChars(exchResultVO.getOcarRcptPublDtS(),"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");
            exchResultVO.setOcarRcptPublDtS(ocarRcptPublDtS);

            //중복입력에 대한 제한 정의후 로직 추가.

            //본테이블에 저장(SA_0141T)
            exchResultDAO.insertExchRegist(exchResultVO);

            //I/F테이블에 저장(SA_0141IS)
            exchResultDAO.insertInterfaceExchRegist(exchResultVO);

        }
    }



    /*
     * @see chn.bhmc.dms.crm.cif.service.CustomerInfoService#selectCustDupCheck(java.util.List)
     */
    @SuppressWarnings("unused")
    @Override
    public List<ExchResultVO> selectExchResultValidate(List<ExchResultVO> list) throws Exception {

        try {
            ExchResultVO exchResultVO = new ExchResultVO();
            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
            List<ExchResultVO> resultList = new ArrayList<ExchResultVO>();
            String msg;
            String dlrCd = LoginUtil.getDlrCd();

            // Duplication Customer Check
            for(int i = 0, listLen = list.size(); i < listLen ; i++){
                exchResultVO = new ExchResultVO();
                errors         = new ArrayList<ExcelUploadError>();
                int totErrCnt = 0;


                //구분 널체크
                if(StringUtils.isBlank(list.get(i).getExchTp())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("global.lbl.gubun", null, LocaleContextHolder.getLocale())			//구분[区分]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {

                	/*[구분을 공통코드에서 조회를 해야 할지 협의. 테이블에 텍스로 들어갈지. 공통코드로 들어갈지 결정필요. ]*/

                	//구분(공통코드 값체크)
                    /*CommonCodeSearchVO searchVO1 = new CommonCodeSearchVO();
                    searchVO1.setsCmmGrpCd("SAL039");
                    searchVO1.setsLangCd(LoginUtil.getLangCd());
                    searchVO1.setsUseYn("Y");
                    List<CommonCodeVO> commonCodeVO1 = commonCodeService.selectCommonCodesByCmmGrpCd(searchVO1);
                    String exchTpChkTrue = "N";
                    for(int j = 0; j < commonCodeVO1.size() ; j++){
                        if(list.get(i).getExchTp().equals(commonCodeVO1.get(j).getCmmCdNm())){
                            exchTpChkTrue = "Y";
                            break;
                        }
                    }

                    if(exchTpChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclExchTpNotCommCode"  //{0}(은)는 공통코드에 정의되여있지 않은 구분값입니다.[[{0}]共同代码无此区分值]
                                , new String[]{
                                        messageSource.getMessage("global.lbl.gubun", null, LocaleContextHolder.getLocale())			//구분[区分]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));

                        totErrCnt = totErrCnt + 1;

                    }*/
                }





                /*********************************************************  구분  validation check 완료 **************************************************/


                //딜러코드 널체크
                if(StringUtils.isBlank(list.get(i).getDlrCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("par.lbl.ownDlrCd", null, LocaleContextHolder.getLocale())			//딜러코드[特约店代码]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 1, list.get(i).getDlrCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //딜러마스터에 없는 딜러코드
                    DealerSearchVO searchVO = new DealerSearchVO();
                    searchVO.setsDlrCd(list.get(i).getDlrCd());
                    DealerVO dealerVO = salesCommonService.selectDealerInfo(searchVO);

                    if(dealerVO == null){

                        msg = messageSource.getMessage(
                            "sal.info.exclDlrCdNotDealerMaster"				//딜러마스터에 존재하지 않는 딜러코드입니다.[不存在的经销商代码，请再次确认。]
                            , null
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 1, list.get(i).getDlrCd(), msg));

                        totErrCnt = totErrCnt + 1;

                    }
                }




                /*********************************************************  딜러코드  validation check 완료 **************************************************/



                //브랜드판단 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarMakerTp())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.brandGudge", null, LocaleContextHolder.getLocale())		//브랜드판단[品牌判断]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 7, list.get(i).getOcarMakerTp(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {

                	/*[브랜드판단을 공통코드에서 조회를 해야 할지 협의. 테이블에 텍스로 들어갈지. 공통코드로 들어갈지 결정필요. ]*/

                    //브랜드판단(공통코드 값체크)
                    /*CommonCodeSearchVO searchVO2 = new CommonCodeSearchVO();
                    searchVO2.setsCmmGrpCd("SAL181");
                    searchVO2.setsLangCd(LoginUtil.getLangCd());
                    searchVO2.setsUseYn("Y");
                    List<CommonCodeVO> commonCodeVO2 = commonCodeService.selectCommonCodesByCmmGrpCd(searchVO2);
                    String ocarMakerTpChkTrue = "N";
                    for(int j = 0; j < commonCodeVO2.size() ; j++){
                        if(list.get(i).getOcarMakerTp().equals(commonCodeVO2.get(j).getCmmCdNm())){
                            ocarMakerTpChkTrue = "Y";
                            break;
                        }
                    }

                    if(ocarMakerTpChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclExchTpNotCommCode"  //{0}(은)는 공통코드에 정의되여있지 않은 구분값입니다.[[{0}]共同代码无此区分值]
                                , new String[]{
                                        messageSource.getMessage("sal.lbl.brandGudge", null, LocaleContextHolder.getLocale())		//브랜드판단[品牌判断]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 7, list.get(i).getOcarMakerTp(), msg));

                        totErrCnt = totErrCnt + 1;

                    }*/
                }




                /*********************************************************  브랜드판단  validation check 완료 **************************************************/




                //이전차주명 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarOwnerNm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.oldCarOwnerNm", null, LocaleContextHolder.getLocale())		//기존차차주성명[旧车车主姓名]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 8, list.get(i).getOcarOwnerNm(), msg));

                    totErrCnt = totErrCnt + 1;

                }


                /*********************************************************  이전차주명  validation check 완료 **************************************************/



                //브랜드 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarMakerNm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("global.lbl.brand", null, LocaleContextHolder.getLocale())		//브랜드[品牌]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 9, list.get(i).getOcarMakerNm(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //브랜드 공통코드 등록하여 사용시 코드체크 추가적용
                }


                /*********************************************************  브랜드  validation check 완료 **************************************************/



                //VIN NO 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarVinNo())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.carVinNo", null, LocaleContextHolder.getLocale())			//VIN NO[车辆VIN码]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 10, list.get(i).getOcarVinNo(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //차량마스터정보 혹은 중고차마스터정보에 있는 VIN NO를  체크시 추가적용.
                }


                /*********************************************************  VIN NO validation check 완료 **************************************************/



                //중고차영수증번호 널값 체크
                if(StringUtils.isBlank(list.get(i).getOcarRcptNo())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.usedCarBillingNo", null, LocaleContextHolder.getLocale())		//중고차영수증번호[二手车发票号]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 11, list.get(i).getOcarRcptNo(), msg));

                    totErrCnt = totErrCnt + 1;

                }


                /*********************************************************  중고차영수증번호 validation check 완료 **************************************************/


                //중고차영수증발행일자 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarRcptPublDtS())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.usedCarBillingDate", null, LocaleContextHolder.getLocale())				//중고차영수증일자[二手车发票日期]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 12, list.get(i).getOcarRcptPublDtS(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //발행일자 yyyy.mm.dd 형식으로 들어와야 함. (포멧체크)
                    String ocarRcptPublDt = list.get(i).getOcarRcptPublDtS();
                    String num,year,month,day;
                    num = StringUtils.replaceChars(ocarRcptPublDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"		//{0}(은)는 날짜형식에 맞는지 확인하세요.[[{0}]录入的日期格式不正确]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.usedCarBillingDate", null, LocaleContextHolder.getLocale()) 		//중고차영수증일자[二手车发票日期]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(!num.equals(0) && num.length() == 8){
                        year = num.substring(0, 4);
                        month = num.substring(4, 6);
                        day = num.substring(6);

                        if(isValidDay(year, month, day) == false){
                             errors.add(new ExcelUploadError(i, 12, list.get(i).getOcarRcptPublDtS(), msg));
                             totErrCnt = totErrCnt + 1;
                        }
                    }else {
                        errors.add(new ExcelUploadError(i, 12, list.get(i).getOcarRcptPublDtS(), msg));
                        totErrCnt = totErrCnt + 1;
                    }


                }


                /*********************************************************  중고차영수증발행일자 validation check 완료 **************************************************/


                //차량번호 널값체크
                if(StringUtils.isBlank(list.get(i).getOcarNo())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("global.lbl.carNo", null, LocaleContextHolder.getLocale())			//차량번호[车牌号]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 13, list.get(i).getOcarNo(), msg));

                    totErrCnt = totErrCnt + 1;

                }


                /*********************************************************  차량번호 validation check 완료 **************************************************/



                //딜러코드
                if(StringUtils.isBlank(list.get(i).getOcarDlrCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.
                        , new String[]{
                                messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())			//딜러코드[经销商编码]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 14, list.get(i).getOcarDlrCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //딜러마스터에 없는 딜러코드
                    DealerSearchVO searchVO = new DealerSearchVO();
                    searchVO.setsDlrCd(list.get(i).getOcarDlrCd());
                    DealerVO dealerVO = salesCommonService.selectDealerInfo(searchVO);

                    if(dealerVO == null){

                        msg = messageSource.getMessage(
                            "sal.info.exclDlrCdNotDealerMaster"				//딜러마스터에 존재하지 않는 딜러코드입니다.[不存在的经销商代码，请再次确认。]
                            , null
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 1, list.get(i).getOcarDlrCd(), msg));

                        totErrCnt = totErrCnt + 1;

                    }
                }


                /*********************************************************  차량번호 validation check 완료 **************************************************/


                //신차차주명
                if(StringUtils.isBlank(list.get(i).getNcarOwnerNm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("global.lbl.carNo", null, LocaleContextHolder.getLocale())			//차량번호[车牌号]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 15, list.get(i).getNcarOwnerNm(), msg));

                    totErrCnt = totErrCnt + 1;

                }


                /*********************************************************  신차차주명 validation check 완료 **************************************************/



                //신분증번호
                if(StringUtils.isBlank(list.get(i).getSsnCrnNo())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.perPapaerNo", null, LocaleContextHolder.getLocale())		//신분증번호[证件号码]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 16, list.get(i).getSsnCrnNo(), msg));

                    totErrCnt = totErrCnt + 1;

                }else{
                    //신분증번호는 숫자여야만 함. (포멧체크)
                    char charVal ;
                    String ssnCrnNoChkTrue = "N";
                    for (int k=0; k<list.get(i).getSsnCrnNo().length(); k++) {

                        charVal = list.get(i).getSsnCrnNo().charAt(k);

                        if (charVal<48 || charVal>57) {
                            break;
                        }else {
                            ssnCrnNoChkTrue = "Y";
                        }
                    }
/*
                    if(ssnCrnNoChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclNumberCheck"			//{0}은(는) 숫자형식이여야만 합니다.
                                , new String[]{
                                        messageSource.getMessage("sal.lbl.perPapaerNo", null, LocaleContextHolder.getLocale()) //신분증번호[证件号码]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 16, list.get(i).getSsnCrnNo(), msg));

                        totErrCnt = totErrCnt + 1;

                    }*/
                }


                /*********************************************************  신분증번호 validation check 완료 **************************************************/



                //신차 VIN NO
                if(StringUtils.isBlank(list.get(i).getNcarVinNo())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.perPapaerNo", null, LocaleContextHolder.getLocale())			//신분증번호[证件号码]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 17, list.get(i).getNcarVinNo(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //차량마스터정보 혹은 중고차마스터정보에 있는 VIN NO를  체크시 추가적용.
                }


                /*********************************************************  신차 VIN NO validation check 완료 **************************************************/



                //신차차종
                if(StringUtils.isBlank(list.get(i).getNcarCarlineCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.
                        , new String[]{
                                messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())		//차종[车种]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 18, list.get(i).getNcarCarlineCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //차량마스터정보 혹은 중고차마스터정보 유무를 체크시 추가적용.
                }


                /*********************************************************  신차차종 validation check 완료 **************************************************/



                //신차등급
                if(StringUtils.isBlank(list.get(i).getNcarGradeCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.newCarGrade", null, LocaleContextHolder.getLocale())		//신차등급[新车等级]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 19, list.get(i).getNcarGradeCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }


                /*********************************************************  신차등급 validation check 완료 **************************************************/




                //단말
                if(StringUtils.isBlank(list.get(i).getTmrCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminal", null, LocaleContextHolder.getLocale())		//단말기[终端]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 20, list.get(i).getTmrCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyymm형식으로 입력.(포멧체크)
                    String tmrCd = list.get(i).getTmrCd();
                    String num = StringUtils.replaceChars(tmrCd,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(은)는 날짜형식에 맞는지 확인하세요.
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminal", null, LocaleContextHolder.getLocale()) 	//단말기[终端]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() == 6){
                        int year = Integer.parseInt(num.substring(0, 4),10);
                        int month = Integer.parseInt(num.substring(4, 6),10);

                        if(month <  1 || month > 12){
                             errors.add(new ExcelUploadError(i, 20, list.get(i).getTmrCd(), msg));
                             totErrCnt = totErrCnt + 1;
                        }
                    }else {
                        errors.add(new ExcelUploadError(i, 20, list.get(i).getTmrCd(), msg));
                        totErrCnt = totErrCnt + 1;
                    }


                }


                /*********************************************************  단말 validation check 완료 **************************************************/


                //단말기월
                if(StringUtils.isBlank(list.get(i).getTmrMm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminalMonth", null, LocaleContextHolder.getLocale())			//단말기월[终端月份]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 21, list.get(i).getTmrMm(), msg));

                    totErrCnt = totErrCnt + 1;

                }else{
                    //mm형식으로 입력.(포멧체크)
                    String tmrMm = list.get(i).getTmrMm();
                    String num = StringUtils.replaceChars(tmrMm,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(은)는 날짜형식에 맞는지 확인하세요.[[{0}]录入的日期格式不正确]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminalMonth", null, LocaleContextHolder.getLocale()) 		//단말기월[终端月份]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() == 2){
                        int month = Integer.parseInt(num,10);

                        if(month <  1 || month > 12){
                             errors.add(new ExcelUploadError(i, 21, list.get(i).getTmrMm(), msg));
                             totErrCnt = totErrCnt + 1;
                        }
                    }else {
                        errors.add(new ExcelUploadError(i, 21, list.get(i).getTmrMm(), msg));
                        totErrCnt = totErrCnt + 1;
                    }

                }


                /*********************************************************  단말기월 validation check 완료 **************************************************/


                //단말기년
                if(StringUtils.isBlank(list.get(i).getTmrYy())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminalYear", null, LocaleContextHolder.getLocale())		//단말기년[终端年份]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 22, list.get(i).getTmrYy(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyy형식으로 입력.(포멧체크)
                    String tmrYy = list.get(i).getTmrYy();
                    String num = StringUtils.replaceChars(tmrYy,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(은)는 날짜형식에 맞는지 확인하세요.[[{0}]录入的日期格式不正确]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminalYear", null, LocaleContextHolder.getLocale()) 		//단말기년[终端年份]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() != 4){
                        errors.add(new ExcelUploadError(i, 22, list.get(i).getTmrYy(), msg));

                        totErrCnt = totErrCnt + 1;
                    }



                }


                /*********************************************************  단말기년 validation check 완료 **************************************************/




                //판단여부
                if(StringUtils.isBlank(list.get(i).getEvalRsltCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("global.lbl.faultDecisionTp", null, LocaleContextHolder.getLocale())			//판단[判断]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 23, list.get(i).getEvalRsltCd(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {

                	/*[판단여부를 공통코드에서 조회를 해야 할지 협의. 테이블에 텍스트로 들어갈지. 공통코드로 들어갈지 결정필요. ]*/

                    //합격/불합격 공통코드에 있는 코드인지를 체크.
                    /*CommonCodeSearchVO searchVO3 = new CommonCodeSearchVO();
                    searchVO3.setsCmmGrpCd("SAL148");
                    searchVO3.setsLangCd(LoginUtil.getLangCd());
                    searchVO3.setsUseYn("Y");
                    List<CommonCodeVO> commonCodeVO3 = commonCodeService.selectCommonCodesByCmmGrpCd(searchVO3);
                    String evalRsltChkTrue = "N";
                    for(int j = 0; j < commonCodeVO3.size() ; j++){

                        if(list.get(i).getEvalRsltCd().equals(commonCodeVO3.get(j).getCmmCdNm())){
                            evalRsltChkTrue = "Y";
                            break;
                        }
                    }

                    if(evalRsltChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclExchTpNotCommCode"  //{0}(은)는 공통코드에 정의되여있지 않은 구분값입니다.
                                , new String[]{
                                        messageSource.getMessage("global.lbl.faultDecisionTp", null, LocaleContextHolder.getLocale())		//판단[判断]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 23, list.get(i).getEvalRsltCd(), msg));

                        totErrCnt = totErrCnt + 1;

                    }*/
                }


                /*********************************************************  판단여부 validation check 완료 **************************************************/




                //지불금액
                if(StringUtils.isBlank(list.get(i).getPayAmt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("crm.lbl.amount", null, LocaleContextHolder.getLocale())				//지불금액[支付金额]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getPayAmt(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //지불금액은 숫자여야만 함. (포멧체크)
                    char charVal ;
                    String payAmtChkTrue = "N";
                    for (int k=0; k<list.get(i).getPayAmt().length(); k++) {

                        charVal = list.get(i).getPayAmt().charAt(k);

                        if (charVal<48 || charVal>57) {
                            break;
                        }else {
                            payAmtChkTrue = "Y";
                        }
                    }

                    if(payAmtChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclNumberCheck"  //{0}은(는) 숫자형식이여야만 합니다.[{0} 只能录数字]
                                , new String[]{
                                        messageSource.getMessage("crm.lbl.amount", null, LocaleContextHolder.getLocale())				//지불금액[支付金额]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 24, list.get(i).getPayAmt(), msg));

                        totErrCnt = totErrCnt + 1;

                    }

                }


                /*********************************************************  지불금액 validation check 완료 **************************************************/



                //자재년월
                if(StringUtils.isBlank(list.get(i).getMatYyMmDt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.mayYyMmDt", null, LocaleContextHolder.getLocale())			//자재년월[材料月份]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 25, list.get(i).getMatYyMmDt(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyymm형식으로 입력.(포멧체크)
                    String mayYyMmDt = list.get(i).getMatYyMmDt();
                    String num = StringUtils.replaceChars(mayYyMmDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(은)는 날짜형식에 맞는지 확인하세요.[[{0}]录入的日期格式不正确]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.mayYyMmDt", null, LocaleContextHolder.getLocale())		 //자재년월[材料月份]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() == 6){
                        int year = Integer.parseInt(num.substring(0, 4),10);
                        int month = Integer.parseInt(num.substring(4, 6),10);

                        if(month <  1 || month > 12){
                             errors.add(new ExcelUploadError(i, 25, list.get(i).getMatYyMmDt(), msg));
                             totErrCnt = totErrCnt + 1;
                        }
                    }else {
                        errors.add(new ExcelUploadError(i, 25, list.get(i).getMatYyMmDt(), msg));
                        totErrCnt = totErrCnt + 1;
                    }

                }


                /*********************************************************  재료월분 validation check 완료 **************************************************/



                //지불년월
                if(StringUtils.isBlank(list.get(i).getPayYyMmDt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.payYyMmDt", null, LocaleContextHolder.getLocale())					//지불년월[支付月份]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 26, list.get(i).getPayYyMmDt(), msg));

                    totErrCnt = totErrCnt + 1;
                }else {
                    //yyyymm형식으로 입력.(포멧체크)
                    String payYyMmDt = list.get(i).getPayYyMmDt();
                    String num = StringUtils.replaceChars(payYyMmDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(은)는 날짜형식에 맞는지 확인하세요.	[[{0}]录入的日期格式不正确]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.payYyMmDt", null, LocaleContextHolder.getLocale()) 			//지불년월[支付月份]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() == 6){
                        int year = Integer.parseInt(num.substring(0, 4),10);
                        int month = Integer.parseInt(num.substring(4, 6),10);

                        if(month <  1 || month > 12){
                             errors.add(new ExcelUploadError(i, 26, list.get(i).getPayYyMmDt(), msg));
                             totErrCnt = totErrCnt + 1;
                        }
                    }else {
                        errors.add(new ExcelUploadError(i, 26, list.get(i).getPayYyMmDt(), msg));
                        totErrCnt = totErrCnt + 1;
                    }

                }


                /*********************************************************  지불월분 validation check 완료 **************************************************/

                list.get(i).setErrors(errors);
                list.get(i).setErrorCount(totErrCnt);

                resultList.add(list.get(i));

                continue;

            }

            return resultList;

        }catch(Exception e){
            throw new BizException(e.getMessage());
        }
    }

    public boolean isValidDay(String yy,String mm,String dd) throws Exception {

        int year = Integer.parseInt(yy,10);
        int month = Integer.parseInt(mm,10) -1;
        int day = Integer.parseInt(dd,10);
        int[] end = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};


        if(year % 4 == 0 && year % 100 !=0 || year % 400 == 0){
            end[1] = 29;
        }

        return (day >=1 && day <= end[month]);

    }
    
    // Q21012900007二手车置换审核结果查询也增加下载功能 jiaMing 2021-2-8 
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		ExchResultSearchVO searchVO = new ExchResultSearchVO();
		searchVO.setsDlrCd(LoginUtil.getDlrCd());
		searchVO.setsUploadStartDt(DateUtil.convertToDate((String)params.get("sUploadStartDt")));
		searchVO.setsUploadEndDt(DateUtil.convertToDate((String)params.get("sUploadEndDt")));
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		List<ExchResultVO>  list = new ArrayList<ExchResultVO>();
		list = selectExchResultByCondition(searchVO); 
		context.putVar("items", list);
	}




}
