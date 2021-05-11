package chn.bhmc.dms.sal.usc.service.impl;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.ObjectUtil;

import javax.annotation.Resource;

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
 * @Description : 欷戧碃彀箻頇橅寪毵れ嫭靷舶瓿检“須�
 * @author
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.      Kim yewon              斓滌磮 靸濎劚
 * </pre>
 */

@Service("exchResultService")
public class ExchResultServiceImpl extends HService implements ExchResultService,JxlsSupport {

    /**
     * 欷戧碃彀� - 毵れ瀰韽夑皜甏�毽� DAO 靹犾柛
     */
    @Resource(name="exchResultDAO")
    ExchResultDAO exchResultDAO;

    /**
     * 瓿淀喌旖旊摐 甏�毽� 靹滊箘鞀�
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 韺愲Г-瓿淀喌 靹滊箘鞀�
     */
    @Resource(name="salesCommonService")
    private SalesCommonService salesCommonService;

    /**
     * 臁绊殞 臁瓣贝鞐� 頃措嫻頃橂姅  鞝曤炒毳� 臁绊殞頃滊嫟.
     */
    @Override
    public List<ExchResultVO> selectExchResultByCondition(ExchResultSearchVO searchVO){
        return exchResultDAO.selectExchResultByCondition(searchVO);
    }

    /**
     * 臁绊殞 臁瓣贝鞐� 頃措嫻頃橂姅 齑� 臧垬毳� 臁绊殞頃滊嫟.
     */
    @Override
    public int selectExchResultByConditionCnt(ExchResultSearchVO searchVO) {
        return exchResultDAO.selectExchResultByConditionCnt(searchVO);
    }

    @Override
    public void insertExchRegistUpload(List<ExchResultVO> list) throws Exception {

        String userId = LoginUtil.getUserId();

        for(ExchResultVO exchResultVO : list){
            exchResultVO.setRegUsrId(userId);

            //鞚检瀽
            String ocarRcptPublDtS = StringUtils.replaceChars(exchResultVO.getOcarRcptPublDtS(),"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");
            exchResultVO.setOcarRcptPublDtS(ocarRcptPublDtS);

            //欷戨车鞛呺牓鞐� 雽�頃� 鞝滍暅 鞝曥潣頉� 搿滌 於旉皜.
            //氤疙厡鞚措笖鞐� 鞝�鞛�(SA_0141T)
            exchResultDAO.insertExchRegist(exchResultVO);
            //I/F韰岇澊敫旍棎 鞝�鞛�(SA_0141IS)
            exchResultDAO.insertInterfaceExchRegist(exchResultVO);
        }
    }

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


                //甑秳 雱愳泊韥�
                /*
                if(StringUtils.isBlank(list.get(i).getExchTp())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("global.lbl.gubun", null, LocaleContextHolder.getLocale())			//甑秳[鍖哄垎]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                    totErrCnt = totErrCnt + 1;

                }
                */

              //根据羚延描述去掉区分的校验 update by lyy 2019-05-05 start 
                /*if(list.get(i).getExchTp().getBytes("UTF-8").length > 30){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.gubun", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }*/
              //根据羚延描述去掉区分的校验 update by lyy 2019-05-05 end 

/*********************************************************  甑秳  validation check 鞕勲 **************************************************/
                //霐滊煬旖旊摐 雱愳泊韥�
                if(StringUtils.isBlank(list.get(i).getDlrCd())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("par.lbl.ownDlrCd", null, LocaleContextHolder.getLocale())			//霐滊煬旖旊摐[鐗圭害搴椾唬鐮乚
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 1, list.get(i).getDlrCd(), msg));
                    totErrCnt = totErrCnt + 1;
                }else {
                    //霐滊煬毵堨姢韯办棎 鞐嗠姅 霐滊煬旖旊摐
                    DealerSearchVO searchVO = new DealerSearchVO();
                    searchVO.setsDlrCd(list.get(i).getDlrCd());
                    DealerVO dealerVO = salesCommonService.selectDealerInfo(searchVO);

                    if(dealerVO == null){

                        msg = messageSource.getMessage(
                            "sal.info.exclDlrCdNotDealerMaster"				//霐滊煬毵堨姢韯办棎 臁挫灛頃橃 鞎婋姅 霐滊煬旖旊摐鞛呺媹雼�.[涓嶅瓨鍦ㄧ殑缁忛攢鍟嗕唬鐮侊紝璇峰啀娆＄‘璁ゃ�俔
                            , null
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 1, list.get(i).getDlrCd(), msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }
/*********************************************************  霐滊煬旖旊摐  validation check 鞕勲 **************************************************/
                //敫岆灉霌滍寪雼� 雱愱皰觳错伂
                /*
                if(StringUtils.isBlank(list.get(i).getOcarMakerTp())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.brandGudge", null, LocaleContextHolder.getLocale())		//敫岆灉霌滍寪雼╗鍝佺墝鍒ゆ柇]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 7, list.get(i).getOcarMakerTp(), msg));

                    totErrCnt = totErrCnt + 1;

                }
                */
                if(list.get(i).getOcarMakerTp()==null) {
                	list.get(i).setOcarMakerTp("");
                }
                if(list.get(i).getOcarMakerTp().getBytes("UTF-8").length > 30){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.brandGudge", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  敫岆灉霌滍寪雼�  validation check 鞕勲 **************************************************/

                //鞚挫爠彀＜氇� 雱愱皰觳错伂
                /*
                if(StringUtils.isBlank(list.get(i).getOcarOwnerNm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.oldCarOwnerNm", null, LocaleContextHolder.getLocale())		//旮办〈彀皑欤检劚氇匸鏃ц溅杞︿富濮撳悕]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 8, list.get(i).getOcarOwnerNm(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                if(list.get(i).getOcarOwnerNm()==null) {
                	list.get(i).setOcarOwnerNm("");
                }
                if(list.get(i).getOcarOwnerNm().getBytes("UTF-8").length > 100){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.oldCarOwnerNm", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞚挫爠彀＜氇�  validation check 鞕勲 **************************************************/
                //敫岆灉霌� 雱愱皰觳错伂
                /*
                if(StringUtils.isBlank(list.get(i).getOcarMakerNm())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("global.lbl.brand", null, LocaleContextHolder.getLocale())		//敫岆灉霌淸鍝佺墝]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 9, list.get(i).getOcarMakerNm(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                if(list.get(i).getOcarMakerNm()==null) {
                	list.get(i).setOcarMakerNm("");
                }
                if(list.get(i).getOcarMakerNm().getBytes("UTF-8").length > 200){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.brand", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  敫岆灉霌�  validation check 鞕勲 **************************************************/
                //VIN NO 雱愱皰觳错伂
                /*if(StringUtils.isBlank(list.get(i).getOcarVinNo())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}은(는) 필수 입력사항 입니다.[{0}是必输项目]
                        , new String[]{
                                messageSource.getMessage("sal.lbl.carVinNo", null, LocaleContextHolder.getLocale())			//VIN NO[车辆VIN码]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 10, list.get(i).getOcarVinNo(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                if(list.get(i).getOcarVinNo().getBytes("UTF-8").length > 17){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.carVinNo", null, LocaleContextHolder.getLocale())         //구분[区分]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }*/
/*********************************************************  VIN NO validation check 鞕勲 **************************************************/
                //欷戧碃彀榿靾橃氩堩樃 雱愱皰 觳错伂
              /*  if(StringUtils.isBlank(list.get(i).getOcarRcptNo())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.usedCarBillingNo", null, LocaleContextHolder.getLocale())		//欷戧碃彀榿靾橃氩堩樃[浜屾墜杞﹀彂绁ㄥ彿]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 11, list.get(i).getOcarRcptNo(), msg));
                    totErrCnt = totErrCnt + 1;
                }*/
                if(list.get(i).getOcarRcptNo()==null) {
                	list.get(i).setOcarRcptNo("");
                }
                if(list.get(i).getOcarRcptNo().getBytes("UTF-8").length > 20){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.usedCarBillingNo", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  欷戧碃彀榿靾橃氩堩樃 validation check 鞕勲 **************************************************/

                //欷戧碃彀榿靾橃氚滍枆鞚检瀽 雱愱皰觳错伂
                /*
                if(StringUtils.isBlank(list.get(i).getOcarRcptPublDtS())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.usedCarBillingDate", null, LocaleContextHolder.getLocale())				//欷戧碃彀榿靾橃鞚检瀽[浜屾墜杞﹀彂绁ㄦ棩鏈焆
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 12, list.get(i).getOcarRcptPublDtS(), msg));
                    totErrCnt = totErrCnt + 1;
                }else {
                    //氚滍枆鞚检瀽 yyyy.mm.dd 順曥嫕鞙茧 霌れ柎鞕�鞎� 頃�. (韽┃觳错伂)
                    String ocarRcptPublDt = list.get(i).getOcarRcptPublDtS();
                    String num,year,month,day;
                    num = StringUtils.replaceChars(ocarRcptPublDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"		//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.[[{0}]褰曞叆鐨勬棩鏈熸牸寮忎笉姝ｇ‘]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.usedCarBillingDate", null, LocaleContextHolder.getLocale()) 		//欷戧碃彀榿靾橃鞚检瀽[浜屾墜杞﹀彂绁ㄦ棩鏈焆
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
                */
/*********************************************************  欷戧碃彀榿靾橃氚滍枆鞚检瀽 validation check 鞕勲 **************************************************/

                //彀焿氩堩樃 雱愱皰觳错伂
                /*
                if(StringUtils.isBlank(list.get(i).getOcarNo())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("global.lbl.carNo", null, LocaleContextHolder.getLocale())			//彀焿氩堩樃[杞︾墝鍙穄
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 13, list.get(i).getOcarNo(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                /*if(list.get(i).getOcarRcptNo().getBytes("UTF-8").length > 20){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.carNo", null, LocaleContextHolder.getLocale())         //구분[区分]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }*/
/*********************************************************  彀焿氩堩樃 validation check 鞕勲 **************************************************/
                //霐滊煬旖旊摐
                /*
                if(StringUtils.isBlank(list.get(i).getOcarDlrCd())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.
                        , new String[]{
                                messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())			//霐滊煬旖旊摐[缁忛攢鍟嗙紪鐮乚
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 14, list.get(i).getOcarDlrCd(), msg));
                    totErrCnt = totErrCnt + 1;
                }else {
                    //霐滊煬毵堨姢韯办棎 鞐嗠姅 霐滊煬旖旊摐
                    DealerSearchVO searchVO = new DealerSearchVO();
                    searchVO.setsDlrCd(list.get(i).getOcarDlrCd());
                    DealerVO dealerVO = salesCommonService.selectDealerInfo(searchVO);

                    if(dealerVO == null){

                        msg = messageSource.getMessage(
                            "sal.info.exclDlrCdNotDealerMaster"				//霐滊煬毵堨姢韯办棎 臁挫灛頃橃 鞎婋姅 霐滊煬旖旊摐鞛呺媹雼�.[涓嶅瓨鍦ㄧ殑缁忛攢鍟嗕唬鐮侊紝璇峰啀娆＄‘璁ゃ�俔
                            , null
                            , LocaleContextHolder.getLocale()
                        );
                        errors.add(new ExcelUploadError(i, 1, list.get(i).getOcarDlrCd(), msg));
                        totErrCnt = totErrCnt + 1;
                    }
                }
                */
/*********************************************************  彀焿氩堩樃 validation check 鞕勲 **************************************************/
                //鞁犾皑彀＜氇�
                /*
                if(StringUtils.isBlank(list.get(i).getNcarOwnerNm())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("global.lbl.carNo", null, LocaleContextHolder.getLocale())			//彀焿氩堩樃[杞︾墝鍙穄
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 15, list.get(i).getNcarOwnerNm(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                if(list.get(i).getNcarOwnerNm()==null) {
                	list.get(i).setNcarOwnerNm("");
                }
                if(list.get(i).getNcarOwnerNm().getBytes("UTF-8").length > 100){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.newCarOwnerNm", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞁犾皑彀＜氇� validation check 鞕勲 **************************************************/
                //鞁犽秳歃濍矆順�
                /*
                if(StringUtils.isBlank(list.get(i).getSsnCrnNo())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.perPapaerNo", null, LocaleContextHolder.getLocale())		//鞁犽秳歃濍矆順竅璇佷欢鍙风爜]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 16, list.get(i).getSsnCrnNo(), msg));
                    totErrCnt = totErrCnt + 1;
                }else{
                    //鞁犽秳歃濍矆順鸽姅 靾瀽鞐暭毵� 頃�. (韽┃觳错伂)
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
                }
                */
                if(list.get(i).getSsnCrnNo()==null) {
                	list.get(i).setSsnCrnNo("");
                }
                if(list.get(i).getSsnCrnNo().getBytes("UTF-8").length > 20){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.idCardNo", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
 /*********************************************************  鞁犽秳歃濍矆順� validation check 鞕勲 **************************************************/
                //鞁犾皑 VIN NO
                if(list.get(i).getNcarVinNo()==null) {
                	list.get(i).setNcarVinNo("");
                }
                if(StringUtils.isBlank(list.get(i).getNcarVinNo())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.newCarVinNo", null, LocaleContextHolder.getLocale())			//鞁犽秳歃濍矆順竅璇佷欢鍙风爜]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 17, list.get(i).getNcarVinNo(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                if(list.get(i).getNcarVinNo().getBytes("UTF-8").length > 17){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.newCarVinNo", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞁犾皑 VIN NO validation check 鞕勲 **************************************************/
                //鞁犾皑彀
                /*
                if(StringUtils.isBlank(list.get(i).getNcarCarlineCd())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.
                        , new String[]{
                                messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())		//彀[杞︾]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 18, list.get(i).getNcarCarlineCd(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                if(list.get(i).getNcarCarlineCd()==null) {
                	list.get(i).setNcarCarlineCd("");
                }
                if(list.get(i).getNcarCarlineCd().getBytes("UTF-8").length > 50){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.carLine", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞁犾皑彀 validation check 鞕勲 **************************************************/
                //鞁犾皑霌标笁
                /*
                if(StringUtils.isBlank(list.get(i).getNcarGradeCd())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.newCarGrade", null, LocaleContextHolder.getLocale())		//鞁犾皑霌标笁[鏂拌溅绛夌骇]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 19, list.get(i).getNcarGradeCd(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
                if(list.get(i).getNcarGradeCd()==null) {
                	list.get(i).setNcarGradeCd("");
                }
                if(list.get(i).getNcarGradeCd().getBytes("UTF-8").length > 30){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("global.lbl.gradeCd", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞁犾皑霌标笁 validation check 鞕勲 **************************************************/
                //雼
                /*
                if(StringUtils.isBlank(list.get(i).getTmrCd())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminal", null, LocaleContextHolder.getLocale())		//雼旮癧缁堢]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 20, list.get(i).getTmrCd(), msg));
                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyymm順曥嫕鞙茧 鞛呺牓.(韽┃觳错伂)
                    String tmrCd = list.get(i).getTmrCd();
                    String num = StringUtils.replaceChars(tmrCd,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminal", null, LocaleContextHolder.getLocale()) 	//雼旮癧缁堢]
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
                */
                if(list.get(i).getTmrCd()==null) {
                	list.get(i).setTmrCd("");
                }
                if(list.get(i).getTmrCd().getBytes("UTF-8").length > 6){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminal", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  雼 validation check 鞕勲 **************************************************/
                //雼旮办洈
                /*
                if(StringUtils.isBlank(list.get(i).getTmrMm())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminalMonth", null, LocaleContextHolder.getLocale())			//雼旮办洈[缁堢鏈堜唤]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 21, list.get(i).getTmrMm(), msg));

                    totErrCnt = totErrCnt + 1;

                }else{
                    //mm順曥嫕鞙茧 鞛呺牓.(韽┃觳错伂)
                    String tmrMm = list.get(i).getTmrMm();
                    String num = StringUtils.replaceChars(tmrMm,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.[[{0}]褰曞叆鐨勬棩鏈熸牸寮忎笉姝ｇ‘]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminalMonth", null, LocaleContextHolder.getLocale()) 		//雼旮办洈[缁堢鏈堜唤]
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
                */
/*********************************************************  雼旮办洈 validation check 鞕勲 **************************************************/
                //雼旮半厔
                /*
                if(StringUtils.isBlank(list.get(i).getTmrYy())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.terminalYear", null, LocaleContextHolder.getLocale())		//雼旮半厔[缁堢骞翠唤]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 22, list.get(i).getTmrYy(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyy順曥嫕鞙茧 鞛呺牓.(韽┃觳错伂)
                    String tmrYy = list.get(i).getTmrYy();
                    String num = StringUtils.replaceChars(tmrYy,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.[[{0}]褰曞叆鐨勬棩鏈熸牸寮忎笉姝ｇ‘]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.terminalYear", null, LocaleContextHolder.getLocale()) 		//雼旮半厔[缁堢骞翠唤]
                            }
                            , LocaleContextHolder.getLocale()
                        );


                    if(num.length() != 4){
                        errors.add(new ExcelUploadError(i, 22, list.get(i).getTmrYy(), msg));

                        totErrCnt = totErrCnt + 1;
                    }
                }
                */
/*********************************************************  雼旮半厔 validation check 鞕勲 **************************************************/
                //韺愲嫧鞐秬
                /*
                if(StringUtils.isBlank(list.get(i).getEvalRsltCd())){
                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("global.lbl.faultDecisionTp", null, LocaleContextHolder.getLocale())			//韺愲嫧[鍒ゆ柇]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 23, list.get(i).getEvalRsltCd(), msg));
                    totErrCnt = totErrCnt + 1;
                }
                */
/*********************************************************  韺愲嫧鞐秬 validation check 鞕勲 **************************************************/
                //歆�攵堦笀鞎�
                /*
                if(StringUtils.isBlank(list.get(i).getPayAmt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("crm.lbl.amount", null, LocaleContextHolder.getLocale())				//歆�攵堦笀鞎鏀粯閲戦]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 24, list.get(i).getPayAmt(), msg));

                    totErrCnt = totErrCnt + 1;

                }else {
                    //歆�攵堦笀鞎§潃 靾瀽鞐暭毵� 頃�. (韽┃觳错伂)
                    char charVal2 ;
                    String payAmtChkTrue = "N";
                    for (int k=0; k<list.get(i).getPayAmt().length(); k++) {

                        charVal2 = list.get(i).getPayAmt().charAt(k);

                        if (charVal2<48 || charVal2>57) {
                            break;
                        }else {
                            payAmtChkTrue = "Y";
                        }
                    }

                    if(payAmtChkTrue.equals("N")){
                        msg = messageSource.getMessage(
                                "sal.info.exclNumberCheck"  //{0}鞚�(電�) 靾瀽順曥嫕鞚挫棳鞎茧 頃╇媹雼�.[{0} 鍙兘褰曟暟瀛梋
                                , new String[]{
                                        messageSource.getMessage("crm.lbl.amount", null, LocaleContextHolder.getLocale())				//歆�攵堦笀鞎鏀粯閲戦]
                                }
                                , LocaleContextHolder.getLocale()
                            );

                        errors.add(new ExcelUploadError(i, 24, list.get(i).getPayAmt(), msg));

                        totErrCnt = totErrCnt + 1;

                    }
                }
                */
                if(list.get(i).getPayAmt()==null) {
                	list.get(i).setPayAmt("");
                }
                if(list.get(i).getPayAmt().getBytes("UTF-8").length > 10){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.imsAmt", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  歆�攵堦笀鞎� validation check 鞕勲 **************************************************/
                //鞛愳灛雲勳洈
                /*
                if(StringUtils.isBlank(list.get(i).getMatYyMmDt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.mayYyMmDt", null, LocaleContextHolder.getLocale())			//鞛愳灛雲勳洈[鏉愭枡鏈堜唤]
                        }
                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(i, 25, list.get(i).getMatYyMmDt(), msg));
                    totErrCnt = totErrCnt + 1;

                }else {
                    //yyyymm順曥嫕鞙茧 鞛呺牓.(韽┃觳错伂)
                    String mayYyMmDt = list.get(i).getMatYyMmDt();
                    String num = StringUtils.replaceChars(mayYyMmDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.[[{0}]褰曞叆鐨勬棩鏈熸牸寮忎笉姝ｇ‘]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.mayYyMmDt", null, LocaleContextHolder.getLocale())		 //鞛愳灛雲勳洈[鏉愭枡鏈堜唤]
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
                */
                if(list.get(i).getMatYyMmDt()==null) {
                	list.get(i).setMatYyMmDt("");
                }
                if(list.get(i).getMatYyMmDt().getBytes("UTF-8").length > 6){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.mayYyMmDt", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  鞛鞗旊秳 validation check 鞕勲 **************************************************/
                //歆�攵堧厔鞗�
                /*
                if(StringUtils.isBlank(list.get(i).getPayYyMmDt())){

                    msg = messageSource.getMessage(
                        "global.info.required.field"				//{0}鞚�(電�) 頃勳垬 鞛呺牓靷暛 鞛呺媹雼�.[{0}鏄繀杈撻」鐩甝
                        , new String[]{
                                messageSource.getMessage("sal.lbl.payYyMmDt", null, LocaleContextHolder.getLocale())					//歆�攵堧厔鞗擺鏀粯鏈堜唤]
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(i, 26, list.get(i).getPayYyMmDt(), msg));

                    totErrCnt = totErrCnt + 1;
                }else {
                    //yyyymm順曥嫕鞙茧 鞛呺牓.(韽┃觳错伂)
                    String payYyMmDt = list.get(i).getPayYyMmDt();
                    String num = StringUtils.replaceChars(payYyMmDt,"-_+=!@#^*(){}[]|\\:;'\"<>,/~`)?.&$%","");

                    msg = messageSource.getMessage(
                            "global.info.cnfmDateFormatMsg"				//{0}(鞚�)電� 雮犾順曥嫕鞐� 毵炿姅歆� 頇曥澑頃橃劯鞖�.	[[{0}]褰曞叆鐨勬棩鏈熸牸寮忎笉姝ｇ‘]
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.payYyMmDt", null, LocaleContextHolder.getLocale()) 			//歆�攵堧厔鞗擺鏀粯鏈堜唤]
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
                */
                if(list.get(i).getPayYyMmDt()==null) {
                	list.get(i).setPayYyMmDt("");
                }
                if(list.get(i).getPayYyMmDt().getBytes("UTF-8").length > 6){
                    msg = messageSource.getMessage(
                            "sal.lbl.columnLengthChk"
                            , new String[]{
                                    messageSource.getMessage("sal.lbl.payYyMmDt", null, LocaleContextHolder.getLocale())         //甑秳[鍖哄垎]
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(i, 0, list.get(i).getExchTp(), msg));
                        totErrCnt = totErrCnt + 1;
                }
/*********************************************************  歆�攵堨洈攵� validation check 鞕勲 **************************************************/

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
    
    //Q21012900008 DCS二手车置换审核结果上传加Excel下载 jiaMing 2021-2-8 start
	@Override
	public void initJxlsContext(Context context, HMap params) throws Exception {
		ExchResultSearchVO searchVO = new ExchResultSearchVO();
		//searchVO.setsDlrCd(LoginUtil.getDlrCd());
		searchVO.setsUploadStartDt(DateUtil.convertToDate((String)params.get("sUploadStartDt")));
		searchVO.setsUploadEndDt(DateUtil.convertToDate((String)params.get("sUploadEndDt")));
		ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
		List<ExchResultVO>  list = new ArrayList<ExchResultVO>();
		list = selectExchResultByCondition(searchVO); 
		context.putVar("items", list);
	}




}
