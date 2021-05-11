package chn.bhmc.dms.crm.cif.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustCouponInfoVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since     author    description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */



public class PackageCustInfoVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8529640860490529406L;

    /**
    * 딜러코드
    **/
    //@NotEmpty

    private  String         dlrCd;
    private  String         vinNo;

    /**
    * 쿠폰시퀀스
    **/
    //@NotEmpty

    private  int            cupnSeq;

    /**
    * 쿠폰명
    **/
    //CUPN_NM

    private  String         cupnNm;

    /**
    * 할인방식
    **/
    //DC_CD

    private  String         dcCd;

    /**
    * 할인사용구분
    **/
    //DC_USE_TP

    private  String         dcUseTp;

    /**
    * 사용여부
    **/
    //@NotEmpty

    private  String         useYn;

    /**
    * 유효시작일
    **/
    //CUPN_FROM_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           cupnFromDt;

    /**
    * 유효종료일
    **/
    //CUPN_TO_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           cupnToDt;

    /**
    * 기본유효일자
    **/
    //CUPN_VALID_PRID

    private  int            cupnValidPrid;

    /**
    * 공임할일율
    **/
    //LBR_DC_RATE

    private  Double         lbrDcRate;

    /**
    * 공임할인금액
    **/
    //LBR_DC_AMT

    private  Double         lbrDcAmt;

    /**
     * 부품할인율
     **/
    //PAR_DC_RATE

    private  Double         parDcRate;

    /**
     * 부품할인금액
     **/
    //LBR_DC_AMT

    private  Double         parDcAmt;

    /**
     * 총액할인율
     **/
    //TOT_DC_RATE

    private  Double         totDcRate;

    /**
     * 총액할인금액
     **/
    //TOT_DC_AMT

    private  Double         totDcAmt;

    private  String         itemCd;
    private  String         itemNm;
    private  int            goodsCnt;
    private  String         custNo;
    /**
     * 딜러 멤버십 여부
     **/
    private String membershipYn;
    /**
     * 블루 멤버십 여부
     **/
    private String blueMembershipYn;
    
    /**
     * 고객명
     **/
    private String custNm;
    
    
    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */

    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setCustNo(ExcelDataBinderUtil.toString(value).trim()); break;   //고객 번호 
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
    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        
        if(StringUtils.isBlank(this.getCustNo())){
        //if(StringUtils.isBlank(this.getVin())){
            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{  
                        messageSource.getMessage("global.lbl.bundle", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustNo(), msg));
        }
        return errors;
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
     * @return the cupnSeq
     */
    public int getCupnSeq() {
        return cupnSeq;
    }

    /**
     * @param cupnSeq the cupnSeq to set
     */
    public void setCupnSeq(int cupnSeq) {
        this.cupnSeq = cupnSeq;
    }

    /**
     * @return the cupnNm
     */
    public String getCupnNm() {
        return cupnNm;
    }

    /**
     * @param cupnNm the cupnNm to set
     */
    public void setCupnNm(String cupnNm) {
        this.cupnNm = cupnNm;
    }

    /**
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }

    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }

    /**
     * @return the dcUseTp
     */
    public String getDcUseTp() {
        return dcUseTp;
    }

    /**
     * @param dcUseTp the dcUseTp to set
     */
    public void setDcUseTp(String dcUseTp) {
        this.dcUseTp = dcUseTp;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * @return the cupnFromDt
     */
    public Date getCupnFromDt() {
        return cupnFromDt;
    }

    /**
     * @param cupnFromDt the cupnFromDt to set
     */
    public void setCupnFromDt(Date cupnFromDt) {
        this.cupnFromDt = cupnFromDt;
    }

    /**
     * @return the cupnToDt
     */
    public Date getCupnToDt() {
        return cupnToDt;
    }

    /**
     * @param cupnToDt the cupnToDt to set
     */
    public void setCupnToDt(Date cupnToDt) {
        this.cupnToDt = cupnToDt;
    }

    /**
     * @return the cupnValidPrid
     */
    public int getCupnValidPrid() {
        return cupnValidPrid;
    }

    /**
     * @param cupnValidPrid the cupnValidPrid to set
     */
    public void setCupnValidPrid(int cupnValidPrid) {
        this.cupnValidPrid = cupnValidPrid;
    }

    /**
     * @return the lbrDcRate
     */
    public Double getLbrDcRate() {
        return lbrDcRate;
    }

    /**
     * @param lbrDcRate the lbrDcRate to set
     */
    public void setLbrDcRate(Double lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    /**
     * @return the lbrDcAmt
     */
    public Double getLbrDcAmt() {
        return lbrDcAmt;
    }

    /**
     * @param lbrDcAmt the lbrDcAmt to set
     */
    public void setLbrDcAmt(Double lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    /**
     * @return the parDcRate
     */
    public Double getParDcRate() {
        return parDcRate;
    }

    /**
     * @param parDcRate the parDcRate to set
     */
    public void setParDcRate(Double parDcRate) {
        this.parDcRate = parDcRate;
    }

    /**
     * @return the parDcAmt
     */
    public Double getParDcAmt() {
        return parDcAmt;
    }

    /**
     * @param parDcAmt the parDcAmt to set
     */
    public void setParDcAmt(Double parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    /**
     * @return the totDcRate
     */
    public Double getTotDcRate() {
        return totDcRate;
    }

    /**
     * @param totDcRate the totDcRate to set
     */
    public void setTotDcRate(Double totDcRate) {
        this.totDcRate = totDcRate;
    }

    /**
     * @return the totDcAmt
     */
    public Double getTotDcAmt() {
        return totDcAmt;
    }

    /**
     * @param totDcAmt the totDcAmt to set
     */
    public void setTotDcAmt(Double totDcAmt) {
        this.totDcAmt = totDcAmt;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the goodsCnt
     */
    public int getGoodsCnt() {
        return goodsCnt;
    }

    /**
     * @param goodsCnt the goodsCnt to set
     */
    public void setGoodsCnt(int goodsCnt) {
        this.goodsCnt = goodsCnt;
    }

    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param membershipYn the membershipYn to set
     */
    public void setMembershipYn(String membershipYn) {
        this.membershipYn = membershipYn;
    }

    /**
     * @return the membershipYn
     */
    public String getMembershipYn() {
        return membershipYn;
    }

    /**
     * @param blueMembershipYn the blueMembershipYn to set
     */
    public void setBlueMembershipYn(String blueMembershipYn) {
        this.blueMembershipYn = blueMembershipYn;
    }

    /**
     * @return the blueMembershipYn
     */
    public String getBlueMembershipYn() {
        return blueMembershipYn;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }


    
    
    

   
    
    
    
    
    
    
    
    
    

}
