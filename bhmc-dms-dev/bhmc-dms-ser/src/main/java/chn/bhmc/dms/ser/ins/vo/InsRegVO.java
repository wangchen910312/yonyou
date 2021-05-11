package chn.bhmc.dms.ser.ins.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : InsRegVO.java
 * @Description : 보험관리 Master VO
 * @author Kwon ki hyun
 * @since 2016. 8. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since  author       description
 *  ===========    =============    ===========================
 *  2016. 8. 5.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class InsRegVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1945139430740503915L;

    /**
     *  시스템 설정정보
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    private int lineNo;
    /**
     * 차대번호
     **/
    private String vinNo;

    /**
     * 보험문서번호
     **/
    private String incDocNo;

    /**
     * 차량등록번호
     **/
    private String carRegNo;

    /**
     * 보험사코드
     **/
    private String incCmpCd;

    /**
     * 보험사약어코드
     **/
    private String incCmpShtCd;

    /**
     * 피보험자ID
     **/
    private String rincPrsnId;

    /**
     * 보험구분코드
     **/
    private String incDstinCd;

    /**
     * 보험총금액
     **/
    private Double incTotAmt;

    /**
     * 보험시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incStartDt;

    /**
     * 보험종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incEndDt;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 상업보험코드
     **/
    private String cmcIncCd;

    /**
     * 상업보험유형
     **/
    private String cmcIncTp;

    /**
     * 상업보험명
     **/
    private String cmcIncNm;

    /**
     * 상업보험비고
     **/
    private String cmcIncRemark;


    /**
     * 상업보험코드
     **/
    private String cmcIncTpCd;

    /**
     * 상업보험유형명
     **/
    private String cmcIncTpNm;

    /**
     * 변경금액율
     **/
    private Double chgAmtRate;

    /**
     * 보험금액
     **/
    private Double incAmt;

    /**
     * 보험비용합계금액
     **/
    private Double incCostSumAmt;

    /**
     * 보험할인율
     **/
    private Double incDcRate;

    /**
     * 보험수수료금액
     **/
    private Double incFeeAmt;



    /**
     * @return the cmcIncTpCd
     */
    public String getCmcIncTpCd() {
        return cmcIncTpCd;
    }

    /**
     * @param cmcIncTpCd the cmcIncTpCd to set
     */
    public void setCmcIncTpCd(String cmcIncTpCd) {
        this.cmcIncTpCd = cmcIncTpCd;
    }

    /**
     * @return the cmcIncTpNm
     */
    public String getCmcIncTpNm() {
        return cmcIncTpNm;
    }

    /**
     * @param cmcIncTpNm the cmcIncTpNm to set
     */
    public void setCmcIncTpNm(String cmcIncTpNm) {
        this.cmcIncTpNm = cmcIncTpNm;
    }

    /**
     * @return the chgAmtRate
     */
    public Double getChgAmtRate() {
        return chgAmtRate;
    }

    /**
     * @param chgAmtRate the chgAmtRate to set
     */
    public void setChgAmtRate(Double chgAmtRate) {
        this.chgAmtRate = chgAmtRate;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the incCostSumAmt
     */
    public Double getIncCostSumAmt() {
        return incCostSumAmt;
    }

    /**
     * @param incCostSumAmt the incCostSumAmt to set
     */
    public void setIncCostSumAmt(Double incCostSumAmt) {
        this.incCostSumAmt = incCostSumAmt;
    }

    /**
     * @return the incDcRate
     */
    public Double getIncDcRate() {
        return incDcRate;
    }

    /**
     * @param incDcRate the incDcRate to set
     */
    public void setIncDcRate(Double incDcRate) {
        this.incDcRate = incDcRate;
    }

    /**
     * @return the incFeeAmt
     */
    public Double getIncFeeAmt() {
        return incFeeAmt;
    }

    /**
     * @param incFeeAmt the incFeeAmt to set
     */
    public void setIncFeeAmt(Double incFeeAmt) {
        this.incFeeAmt = incFeeAmt;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the incDocNo
     */
    public String getIncDocNo() {
        return incDocNo;
    }

    /**
     * @param incDocNo the incDocNo to set
     */
    public void setIncDocNo(String incDocNo) {
        this.incDocNo = incDocNo;
    }

    /**
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }

    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    /**
     * @return the incCmpCd
     */
    public String getIncCmpCd() {
        return incCmpCd;
    }

    /**
     * @param incCmpCd the incCmpCd to set
     */
    public void setIncCmpCd(String incCmpCd) {
        this.incCmpCd = incCmpCd;
    }

    /**
     * @return the incCmpShtCd
     */
    public String getIncCmpShtCd() {
        return incCmpShtCd;
    }

    /**
     * @param incCmpShtCd the incCmpShtCd to set
     */
    public void setIncCmpShtCd(String incCmpShtCd) {
        this.incCmpShtCd = incCmpShtCd;
    }

    /**
     * @return the rincPrsnId
     */
    public String getRincPrsnId() {
        return rincPrsnId;
    }

    /**
     * @param rincPrsnId the rincPrsnId to set
     */
    public void setRincPrsnId(String rincPrsnId) {
        this.rincPrsnId = rincPrsnId;
    }

    /**
     * @return the incDstinCd
     */
    public String getIncDstinCd() {
        return incDstinCd;
    }

    /**
     * @param incDstinCd the incDstinCd to set
     */
    public void setIncDstinCd(String incDstinCd) {
        this.incDstinCd = incDstinCd;
    }

    /**
     * @return the incTotAmt
     */
    public Double getIncTotAmt() {
        return incTotAmt;
    }

    /**
     * @param incTotAmt the incTotAmt to set
     */
    public void setIncTotAmt(Double incTotAmt) {
        this.incTotAmt = incTotAmt;
    }

    /**
     * @return the incStartDt
     */
    public Date getIncStartDt() {
        return incStartDt;
    }

    /**
     * @param incStartDt the incStartDt to set
     */
    public void setIncStartDt(Date incStartDt) {
        this.incStartDt = incStartDt;
    }

    /**
     * @return the incEndDt
     */
    public Date getIncEndDt() {
        return incEndDt;
    }

    /**
     * @param incEndDt the incEndDt to set
     */
    public void setIncEndDt(Date incEndDt) {
        this.incEndDt = incEndDt;
    }

    /**
     * @return the cmcIncCd
     */
    public String getCmcIncCd() {
        return cmcIncCd;
    }

    /**
     * @param cmcIncCd the cmcIncCd to set
     */
    public void setCmcIncCd(String cmcIncCd) {
        this.cmcIncCd = cmcIncCd;
    }

    /**
     * @return the cmcIncTp
     */
    public String getCmcIncTp() {
        return cmcIncTp;
    }

    /**
     * @param cmcIncTp the cmcIncTp to set
     */
    public void setCmcIncTp(String cmcIncTp) {
        this.cmcIncTp = cmcIncTp;
    }

    /**
     * @return the cmcIncNm
     */
    public String getCmcIncNm() {
        return cmcIncNm;
    }

    /**
     * @param cmcIncNm the cmcIncNm to set
     */
    public void setCmcIncNm(String cmcIncNm) {
        this.cmcIncNm = cmcIncNm;
    }

    /**
     * @return the cmcIncRemark
     */
    public String getCmcIncRemark() {
        return cmcIncRemark;
    }

    /**
     * @param cmcIncRemark the cmcIncRemark to set
     */
    public void setCmcIncRemark(String cmcIncRemark) {
        this.cmcIncRemark = cmcIncRemark;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

  /*   DLR_CD              --딜러코드
    ,VIN_NO                --차대번호
    ,INC_DOC_NO            --보험문서번호
    ,CAR_REG_NO            --차량등록번호
    ,INC_CMP_CD            --보험사코드
    ,INC_CMP_SHT_CD        --보험사약어코드
    ,RINC_PRSN_ID          --피보험자ID
    ,INC_DSTIN_CD          --보험구분코드
    ,INC_TOT_AMT           --보험총금액
    ,INC_START_DT          --보험시작일자
    ,INC_END_DT            --보험종료일자
    ,CMC_INC_CD            --상업보험코드
    ,CMC_INC_TP            --상업보험유형
    ,CMC_INC_NM            --상업보험명
    ,CMC_INC_REMARK        --상업보험비고
    */

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            String dateFormat = systemConfigInfoService.selectStrValueByKey("dateFormat");
            String pattern = dateFormat + " HH:mm:ss";
            switch(cellNo){
                case 0:this.setCarRegNo(ExcelDataBinderUtil.toString(value).trim()); break;      //차량등록번호
                case 1:this.setVinNo(ExcelDataBinderUtil.toString(value).trim()); break;         //차대번호
                case 2:this.setIncCmpCd(ExcelDataBinderUtil.toString(value).trim()); break;      //보험사코드
                case 3:this.setIncCmpShtCd(ExcelDataBinderUtil.toString(value).trim()); break;   //보험사약어코드
                case 4:this.setRincPrsnId(ExcelDataBinderUtil.toString(value).trim()); break;    //피보험자ID
                case 5:this.setIncDstinCd(ExcelDataBinderUtil.toString(value).trim()); break;    //보험구분코드
                case 6:this.setIncTotAmt(ExcelDataBinderUtil.getDoubleValue(value)); break;      //보험총금액
                case 7:this.setIncStartDt(ExcelDataBinderUtil.getDateValue(value, pattern)); break;   //보험시작일자
                case 8:this.setIncEndDt(ExcelDataBinderUtil.getDateValue(value, pattern)); break;   //보험종료일자
                case 9:this.setCmcIncCd(ExcelDataBinderUtil.toString(value).trim()); break;   //상업보험코드
                case 10:this.setCmcIncTp(ExcelDataBinderUtil.toString(value).trim()); break;  //상업보험유형
                case 11:this.setCmcIncNm(ExcelDataBinderUtil.toString(value).trim()); break;  //상업보험명
                case 12:this.setCmcIncRemark(ExcelDataBinderUtil.toString(value).trim()); break;  //상업보험비고

                default :
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        //번들
        if(StringUtils.isBlank(this.getVinNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("ser.lbl.vinNo", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getVinNo(), msg));
        }
        /*
        //언어
        if(StringUtils.isBlank(this.getLangCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.langCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getLangCd(), msg));
        }

        //메시지키
        if(StringUtils.isBlank(this.getMesgKey())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.mesgKey", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getMesgKey(), msg));
        }

        //메시지
        if(StringUtils.isBlank(this.getMesgTxt())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.mesgTxt", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getMesgTxt(), msg));
        }
*/

        return errors;


    }

}
