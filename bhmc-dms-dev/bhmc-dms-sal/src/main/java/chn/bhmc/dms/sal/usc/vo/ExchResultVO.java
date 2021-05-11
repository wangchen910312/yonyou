package chn.bhmc.dms.sal.usc.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

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
 * @ClassName   : ExchResultVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 6. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 10.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class ExchResultVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date uploadDt;                                              //업로드일자
    private int seq;                                                    //일련번호
    private String dlrCd;                                               //딜러코드
    private String exchTp;                                              //교환유형
    private String dlrNm;                                               //딜러명
    private String cityCd;                                              //도시코드
    private String cityNm;                                              //도시명
    private String sungCd;                                              //성코드
    private String sungNm;                                              //성이름
    private String officeCd;                                            //사무소코드
    private String officeNm;                                            //사무소명
    private String sdptCd;                                              //사업부코드
    private String sdptNm;                                              //사업부명
    private String ocarMakerTp;                                         //중고차량메이커유형
    private String ocarOwnerNm;                                         //중고차량소유자명
    private String ocarMakerNm;                                         //중고차량메이커명
    private String ocarVinNo;                                           //중고차량차대번호
    private String ocarRcptNo;                                          //중고차량영수증번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ocarRcptPublDt;                                        //중고차량영수증발행일자

    private String ocarRcptPublDtS;                                      //중고차량여수증발행일자(string)

    private String ocarNo;                                              //중고차량번호
    private String ocarDlrCd;                                           //중고차량딜러코드
    private String ocarDlrNm;                                           //중고차량딜러명
    private String ncarOwnerNm;                                         //신차량소유자명
    private String ssnCrnNo;                                            //주민사업자등록번호
    private String ncarVinNo;                                           //신차량차대번호
    private String ncarCarlineCd;                                       //신차량차종코드
    private String ncarCarlineNm;                                       //신차량차종명
    private String ncarGradeCd;                                         //신차량등급코드
    private String ncarGradeNm;                                         //신차량등급명
    private String tmrCd;                                               //단말기코드
    private String tmrMm;                                               //단말기월
    private String tmrYy;                                               //단말기년
    private String evalRsltCd;                                          //심사결과코드
    private String evalRsltNm;                                          //심사결과명
    private String payAmt;                                              //지불금액
    private String matYyMmDt;                                           //자재년월일자
    private String payYyMmDt;                                           //지불년월일자
    private String regUsrId;                                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                                 //등록일자
    private String updtUsrId;                                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                                //수정일자





    /**
     * @return the ocarRcptPublDtS
     */
    public String getOcarRcptPublDtS() {
        return ocarRcptPublDtS;
    }
    /**
     * @param ocarRcptPublDtS the ocarRcptPublDtS to set
     */
    public void setOcarRcptPublDtS(String ocarRcptPublDtS) {
        this.ocarRcptPublDtS = ocarRcptPublDtS;
    }
    /**
     * @return the ocarDlrNm
     */
    public String getOcarDlrNm() {
        return ocarDlrNm;
    }
    /**
     * @param ocarDlrNm the ocarDlrNm to set
     */
    public void setOcarDlrNm(String ocarDlrNm) {
        this.ocarDlrNm = ocarDlrNm;
    }
    /**
     * @return the ncarCarlineNm
     */
    public String getNcarCarlineNm() {
        return ncarCarlineNm;
    }
    /**
     * @param ncarCarlineNm the ncarCarlineNm to set
     */
    public void setNcarCarlineNm(String ncarCarlineNm) {
        this.ncarCarlineNm = ncarCarlineNm;
    }
    /**
     * @return the ncarGradeNm
     */
    public String getNcarGradeNm() {
        return ncarGradeNm;
    }
    /**
     * @param ncarGradeNm the ncarGradeNm to set
     */
    public void setNcarGradeNm(String ncarGradeNm) {
        this.ncarGradeNm = ncarGradeNm;
    }
    /**
     * @return the evalRsltNm
     */
    public String getEvalRsltNm() {
        return evalRsltNm;
    }
    /**
     * @param evalRsltNm the evalRsltNm to set
     */
    public void setEvalRsltNm(String evalRsltNm) {
        this.evalRsltNm = evalRsltNm;
    }
    /**
     * @return the officeNm
     */
    public String getOfficeNm() {
        return officeNm;
    }
    /**
     * @param officeNm the officeNm to set
     */
    public void setOfficeNm(String officeNm) {
        this.officeNm = officeNm;
    }
    /**
     * @return the sdptNm
     */
    public String getSdptNm() {
        return sdptNm;
    }
    /**
     * @param sdptNm the sdptNm to set
     */
    public void setSdptNm(String sdptNm) {
        this.sdptNm = sdptNm;
    }
    /**
     * @return the uploadDt
     */
    public Date getUploadDt() {
        return uploadDt;
    }
    /**
     * @param uploadDt the uploadDt to set
     */
    public void setUploadDt(Date uploadDt) {
        this.uploadDt = uploadDt;
    }
    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }
    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
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
     * @return the exchTp
     */
    public String getExchTp() {
        return exchTp;
    }
    /**
     * @param exchTp the exchTp to set
     */
    public void setExchTp(String exchTp) {
        this.exchTp = exchTp;
    }
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }
    /**
     * @return the cityCd
     */
    public String getCityCd() {
        return cityCd;
    }
    /**
     * @param cityCd the cityCd to set
     */
    public void setCityCd(String cityCd) {
        this.cityCd = cityCd;
    }
    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }
    /**
     * @param cityNm the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }
    /**
     * @return the sungCd
     */
    public String getSungCd() {
        return sungCd;
    }
    /**
     * @param sungCd the sungCd to set
     */
    public void setSungCd(String sungCd) {
        this.sungCd = sungCd;
    }
    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }
    /**
     * @param sungNm the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }
    /**
     * @return the officeCd
     */
    public String getOfficeCd() {
        return officeCd;
    }
    /**
     * @param officeCd the officeCd to set
     */
    public void setOfficeCd(String officeCd) {
        this.officeCd = officeCd;
    }
    /**
     * @return the sdptCd
     */
    public String getSdptCd() {
        return sdptCd;
    }
    /**
     * @param sdptCd the sdptCd to set
     */
    public void setSdptCd(String sdptCd) {
        this.sdptCd = sdptCd;
    }
    /**
     * @return the ocarMakerTp
     */
    public String getOcarMakerTp() {
        return ocarMakerTp;
    }
    /**
     * @param ocarMakerTp the ocarMakerTp to set
     */
    public void setOcarMakerTp(String ocarMakerTp) {
        this.ocarMakerTp = ocarMakerTp;
    }
    /**
     * @return the ocarOwnerNm
     */
    public String getOcarOwnerNm() {
        return ocarOwnerNm;
    }
    /**
     * @param ocarOwnerNm the ocarOwnerNm to set
     */
    public void setOcarOwnerNm(String ocarOwnerNm) {
        this.ocarOwnerNm = ocarOwnerNm;
    }
    /**
     * @return the ocarMakerNm
     */
    public String getOcarMakerNm() {
        return ocarMakerNm;
    }
    /**
     * @param ocarMakerNm the ocarMakerNm to set
     */
    public void setOcarMakerNm(String ocarMakerNm) {
        this.ocarMakerNm = ocarMakerNm;
    }
    /**
     * @return the ocarVinNo
     */
    public String getOcarVinNo() {
        return ocarVinNo;
    }
    /**
     * @param ocarVinNo the ocarVinNo to set
     */
    public void setOcarVinNo(String ocarVinNo) {
        this.ocarVinNo = ocarVinNo;
    }
    /**
     * @return the ocarRcptNo
     */
    public String getOcarRcptNo() {
        return ocarRcptNo;
    }
    /**
     * @param ocarRcptNo the ocarRcptNo to set
     */
    public void setOcarRcptNo(String ocarRcptNo) {
        this.ocarRcptNo = ocarRcptNo;
    }
    /**
     * @return the ocarRcptPublDt
     */
    public Date getOcarRcptPublDt() {
        return ocarRcptPublDt;
    }
    /**
     * @param ocarRcptPublDt the ocarRcptPublDt to set
     */
    public void setOcarRcptPublDt(Date ocarRcptPublDt) {
        this.ocarRcptPublDt = ocarRcptPublDt;
    }
    /**
     * @return the ocarNo
     */
    public String getOcarNo() {
        return ocarNo;
    }
    /**
     * @param ocarNo the ocarNo to set
     */
    public void setOcarNo(String ocarNo) {
        this.ocarNo = ocarNo;
    }
    /**
     * @return the ocarDlrCd
     */
    public String getOcarDlrCd() {
        return ocarDlrCd;
    }
    /**
     * @param ocarDlrCd the ocarDlrCd to set
     */
    public void setOcarDlrCd(String ocarDlrCd) {
        this.ocarDlrCd = ocarDlrCd;
    }
    /**
     * @return the ncarOwnerNm
     */
    public String getNcarOwnerNm() {
        return ncarOwnerNm;
    }
    /**
     * @param ncarOwnerNm the ncarOwnerNm to set
     */
    public void setNcarOwnerNm(String ncarOwnerNm) {
        this.ncarOwnerNm = ncarOwnerNm;
    }
    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }
    /**
     * @param ssnCrnNo the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }
    /**
     * @return the ncarVinNo
     */
    public String getNcarVinNo() {
        return ncarVinNo;
    }
    /**
     * @param ncarVinNo the ncarVinNo to set
     */
    public void setNcarVinNo(String ncarVinNo) {
        this.ncarVinNo = ncarVinNo;
    }
    /**
     * @return the ncarCarlineCd
     */
    public String getNcarCarlineCd() {
        return ncarCarlineCd;
    }
    /**
     * @param ncarCarlineCd the ncarCarlineCd to set
     */
    public void setNcarCarlineCd(String ncarCarlineCd) {
        this.ncarCarlineCd = ncarCarlineCd;
    }
    /**
     * @return the ncarGradeCd
     */
    public String getNcarGradeCd() {
        return ncarGradeCd;
    }
    /**
     * @param ncarGradeCd the ncarGradeCd to set
     */
    public void setNcarGradeCd(String ncarGradeCd) {
        this.ncarGradeCd = ncarGradeCd;
    }
    /**
     * @return the tmrCd
     */
    public String getTmrCd() {
        return tmrCd;
    }
    /**
     * @param tmrCd the tmrCd to set
     */
    public void setTmrCd(String tmrCd) {
        this.tmrCd = tmrCd;
    }
    /**
     * @return the tmrMm
     */
    public String getTmrMm() {
        return tmrMm;
    }
    /**
     * @param tmrMm the tmrMm to set
     */
    public void setTmrMm(String tmrMm) {
        this.tmrMm = tmrMm;
    }
    /**
     * @return the tmrYy
     */
    public String getTmrYy() {
        return tmrYy;
    }
    /**
     * @param tmrYy the tmrYy to set
     */
    public void setTmrYy(String tmrYy) {
        this.tmrYy = tmrYy;
    }
    /**
     * @return the evalRsltCd
     */
    public String getEvalRsltCd() {
        return evalRsltCd;
    }
    /**
     * @param evalRsltCd the evalRsltCd to set
     */
    public void setEvalRsltCd(String evalRsltCd) {
        this.evalRsltCd = evalRsltCd;
    }
    /**
     * @return the payAmt
     */
    public String getPayAmt() {
        return payAmt;
    }
    /**
     * @param payAmt the payAmt to set
     */
    public void setPayAmt(String payAmt) {
        this.payAmt = payAmt;
    }
    /**
     * @return the matYyMmDt
     */
    public String getMatYyMmDt() {
        return matYyMmDt;
    }
    /**
     * @param matYyMmDt the matYyMmDt to set
     */
    public void setMatYyMmDt(String matYyMmDt) {
        this.matYyMmDt = matYyMmDt;
    }
    /**
     * @return the payYyMmDt
     */
    public String getPayYyMmDt() {
        return payYyMmDt;
    }
    /**
     * @param payYyMmDt the payYyMmDt to set
     */
    public void setPayYyMmDt(String payYyMmDt) {
        this.payYyMmDt = payYyMmDt;
    }
    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }
    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
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
    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }
    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }
    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }
    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub
        try{
            switch(cellNo){
                case 0:this.setExchTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setDlrNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setCityCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setSungCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setOfficeCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setSdptCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7:this.setOcarMakerTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8:this.setOcarOwnerNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setOcarMakerNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setOcarVinNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 11:this.setOcarRcptNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 12:this.setOcarRcptPublDtS(ExcelDataBinderUtil.toString(value).trim()); break;
                case 13:this.setOcarNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 14:this.setOcarDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 15:this.setNcarOwnerNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 16:this.setSsnCrnNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 17:this.setNcarVinNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 18:this.setNcarCarlineCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 19:this.setNcarGradeCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 20:this.setTmrCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 21:this.setTmrMm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 22:this.setTmrYy(ExcelDataBinderUtil.toString(value).trim()); break;
                case 23:this.setEvalRsltCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 24:this.setPayAmt(ExcelDataBinderUtil.toString(value).trim()); break;
                case 25:this.setMatYyMmDt(ExcelDataBinderUtil.toString(value).trim()); break;
                case 26:this.setPayYyMmDt(ExcelDataBinderUtil.toString(value).trim()); break;
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
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();


        return errors;
    }


}
