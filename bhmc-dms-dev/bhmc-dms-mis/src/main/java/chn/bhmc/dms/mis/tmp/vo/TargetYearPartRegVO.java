package chn.bhmc.dms.mis.tmp.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
/**
 * <pre>
 * [제조사] 년간 목표 등록 부분 엑셀 업로드 데이터
 * </pre>
 *
 * @ClassName   : TargetYearPartRegVO.java
 * @Description : [제조사] 년간 목표 등록 부분 엑셀 업로드 데이터
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */

public class TargetYearPartRegVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // 조회조건
    private String sBbsId;
    private String sGoalYy;         // 목표년도
    private String sSdptCd;         // 사업부코드
    private String sOfficeCd;       // 사무소코드
    private String sDealerCd;       // 딜러코드

    // 데이터
    private String inputStandard;   // 입력기준
    private String goalYy;          // 목표년도
    private String sdptCd;          // 사업부코드
    private String sdptNm;          // 사업부명
    private String officeCd;        // 사무소코드
    private String officeNm;        // 사무소명
    private String dlrCd;           // 딜러코드
    private String dlrNm;           // 딜러명
    private String carLineCd;       // 차종코드
    private String carLineNm;       // 차종명
    private String goalPrefVal;     // 목표설정값
    private String prefTp;          // 설정유형
    private String delYn;           // 삭제여부
    private String regUsrId;        // 등록자ID
    private Date regDt;             // 등록일자
    private String updtUsrId;       // 수정자ID
    private Date updtDt;            // 수정일자

    /**
     * @return the sBbsId
     */
    public String getsBbsId() {
        return sBbsId;
    }

    /**
     * @param sBbsId the sBbsId to set
     */
    public void setsBbsId(String sBbsId) {
        this.sBbsId = sBbsId;
    }

    /**
     * @return the sGoalYy
     */
    public String getsGoalYy() {
        return sGoalYy;
    }

    /**
     * @param sGoalYy the sGoalYy to set
     */
    public void setsGoalYy(String sGoalYy) {
        this.sGoalYy = sGoalYy;
    }

    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }

    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }

    /**
     * @return the sOfficeCd
     */
    public String getsOfficeCd() {
        return sOfficeCd;
    }

    /**
     * @param sOfficeCd the sOfficeCd to set
     */
    public void setsOfficeCd(String sOfficeCd) {
        this.sOfficeCd = sOfficeCd;
    }

    /**
     * @return the sDealerCd
     */
    public String getsDealerCd() {
        return sDealerCd;
    }

    /**
     * @param sDealerCd the sDealerCd to set
     */
    public void setsDealerCd(String sDealerCd) {
        this.sDealerCd = sDealerCd;
    }

    /**
     * @return the inputStandard
     */
    public String getInputStandard() {
        return inputStandard;
    }

    /**
     * @param inputStandard the inputStandard to set
     */
    public void setInputStandard(String inputStandard) {
        this.inputStandard = inputStandard;
    }

    /**
     * @return the goalYy
     */
    public String getGoalYy() {
        return goalYy;
    }

    /**
     * @param goalYy the goalYy to set
     */
    public void setGoalYy(String goalYy) {
        this.goalYy = goalYy;
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
     * @return the carLineCd
     */
    public String getCarLineCd() {
        return carLineCd;
    }

    /**
     * @param carLineCd the carLineCd to set
     */
    public void setCarLineCd(String carLineCd) {
        this.carLineCd = carLineCd;
    }

    /**
     * @return the carLineNm
     */
    public String getCarLineNm() {
        return carLineNm;
    }

    /**
     * @param carLineNm the carLineNm to set
     */
    public void setCarLineNm(String carLineNm) {
        this.carLineNm = carLineNm;
    }

    /**
     * @return the goalPrefVal
     */
    public String getGoalPrefVal() {
        return goalPrefVal;
    }

    /**
     * @param goalPrefVal the goalPrefVal to set
     */
    public void setGoalPrefVal(String goalPrefVal) {
        this.goalPrefVal = goalPrefVal;
    }

    /**
     * @return the prefTp
     */
    public String getPrefTp() {
        return prefTp;
    }

    /**
     * @param prefTp the prefTp to set
     */
    public void setPrefTp(String prefTp) {
        this.prefTp = prefTp;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setGoalYy(ExcelDataBinderUtil.toString(value).trim()); break;           // 목표년도
                case 1:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim()); break;            // 딜러 코드
                case 2:this.setCarLineCd(ExcelDataBinderUtil.toString(value).trim()); break;        // 차종 코드
                case 3:this.setGoalPrefVal(ExcelDataBinderUtil.toString(value).trim()); break;      // 목표설정값
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

        // 목표 년도
        if(StringUtils.isBlank(this.getGoalYy())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.goalYy", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getGoalYy(), msg));
        }

        // 딜러 코드
        if(StringUtils.isBlank(this.getDlrCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.dlrCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getDlrCd(), msg));
        }

        // 차종 코드
        if(StringUtils.isBlank(this.getCarLineCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.carlineCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getCarLineCd(), msg));
        }

        // 목표설정값
        if(StringUtils.isBlank(this.getGoalPrefVal())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("mis.lbl.goalPrefVal", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getGoalPrefVal(), msg));
        }

        return errors;

    }
}
