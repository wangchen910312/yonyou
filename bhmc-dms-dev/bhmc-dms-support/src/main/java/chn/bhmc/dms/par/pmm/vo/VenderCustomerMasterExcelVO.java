package chn.bhmc.dms.par.pmm.vo;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * 고객관리 액셀 업로드 VO
 *
 * @ClassName   : VenderCustomerMasterExcelVO.java
 * @Description : VenderCustomerMasterExcelVO Class
 * @author In Bo Shim
 * @since 2016. 8. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 08.     In Bo Shim     최초 생성
 * </pre>
 */

public class VenderCustomerMasterExcelVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7048575160571689250L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 추가/수정구분
     **/
    private String insertUpdateTp = "U";

    /**
     * 거래처유형
     */
    private String bpTp;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 거래처전명
     */
    private String bpFullNm;

    /**
     * 계약번호
     */
    private String contractNo;

    /**
     * 계약시작일자
     */
    private String contractStartDt;

    /**
     * 지역
     */
    private String distCd;

    /**
     * 지역명
     */
    private String distNm;

    /**
     * 대표자명
     */
    private String ownRgstNm;

    /**
     * 담당자명
     */
    private String prsnNm;

    /**
     * 담당자전화
     */
    private String prsnTelNo;

    /**
     * 담당자H.P
     */
    private String prsnHpNo;

    /**
     * 성코드
     */
    private String sungCd;

    /**
     * 성 명
     */
    private String sungNm;

    /**
     * 주소
     */
    private String addr;

    /**
     * 우편번호
     */
    private String zipCd;

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
     * @return the insertUpdateTp
     */
    public String getInsertUpdateTp() {
        return insertUpdateTp;
    }

    /**
     * @param insertUpdateTp the insertUpdateTp to set
     */
    public void setInsertUpdateTp(String insertUpdateTp) {
        this.insertUpdateTp = insertUpdateTp;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the bpFullNm
     */
    public String getBpFullNm() {
        return bpFullNm;
    }

    /**
     * @param bpFullNm the bpFullNm to set
     */
    public void setBpFullNm(String bpFullNm) {
        this.bpFullNm = bpFullNm;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the contractStartDt
     */
    public String getContractStartDt() {
        return contractStartDt;
    }

    /**
     * @param contractStartDt the contractStartDt to set
     */
    public void setContractStartDt(String contractStartDt) {
        this.contractStartDt = contractStartDt;
    }

    /**
     * @return the distCd
     */
    public String getDistCd() {
        return distCd;
    }

    /**
     * @param distCd the distCd to set
     */
    public void setDistCd(String distCd) {
        this.distCd = distCd;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the ownRgstNm
     */
    public String getOwnRgstNm() {
        return ownRgstNm;
    }

    /**
     * @param ownRgstNm the ownRgstNm to set
     */
    public void setOwnRgstNm(String ownRgstNm) {
        this.ownRgstNm = ownRgstNm;
    }

    /**
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
    }

    /**
     * @return the prsnTelNo
     */
    public String getPrsnTelNo() {
        return prsnTelNo;
    }

    /**
     * @param prsnTelNo the prsnTelNo to set
     */
    public void setPrsnTelNo(String prsnTelNo) {
        this.prsnTelNo = prsnTelNo;
    }

    /**
     * @return the prsnHpNo
     */
    public String getPrsnHpNo() {
        return prsnHpNo;
    }

    /**
     * @param prsnHpNo the prsnHpNo to set
     */
    public void setPrsnHpNo(String prsnHpNo) {
        this.prsnHpNo = prsnHpNo;
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
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setBpTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1:this.setBpCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2:this.setBpNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3:this.setBpFullNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4:this.setContractNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5:this.setContractStartDt(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6:this.setOwnRgstNm(ExcelDataBinderUtil.toString(value).trim());  break;
                case 7:this.setPrsnNm(ExcelDataBinderUtil.toString(value).trim());  break;
                case 8:this.setPrsnTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 9:this.setPrsnHpNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 10:this.setSungNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 11:this.setDistNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 12:this.setAddr(ExcelDataBinderUtil.toString(value).trim()); break;
                case 13:this.setZipCd(ExcelDataBinderUtil.toString(value).trim()); break;

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

        //bpNm
        if(StringUtils.isBlank(this.getBpNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.bpNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getBpNm(), msg));
        }

        return errors;

    }
}
