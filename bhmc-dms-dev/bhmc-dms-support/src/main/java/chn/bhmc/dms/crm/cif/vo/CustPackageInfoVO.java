package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

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
 * @ClassName   : CustPackageInfoVO
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



public class CustPackageInfoVO extends AbstractExcelDataBinder {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5212377850470480139L;

    /**
    * 딜러코드
    **/
    //@NotEmpty

    private  String     dlrCd;

    /**
    * 패키지일련번호
    **/
    //@NotEmpty

    private  int        pkgSeq;

    /**
    * 패키지명
    **/
    //PKG_NM

    private  String     pkgNm;

    /**
    * 사용유무
    **/
    //@NotEmpty

    private  String     useYn;

    /**
    * 등록자ID
    **/
    //@NotEmpty

    private  String     regUsrId;

    /**
    * 등록일자
    **/
    //@NotEmpty
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       regDt;

    /**
    * 수정자ID
    **/
    //UPDT_USR_ID

    private  String     updtUsrId;

    /**
    * 수정일자
    **/
    //UPDT_DT
    //@JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       updtDt;

    private  int       pkgPubCnt;

    private int cupnSeq;

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        // TODO Auto-generated method stub

    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        // TODO Auto-generated method stub
        return null;
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
     * @return the pkgSeq
     */
    public int getPkgSeq() {
        return pkgSeq;
    }

    /**
     * @param pkgSeq the pkgSeq to set
     */
    public void setPkgSeq(int pkgSeq) {
        this.pkgSeq = pkgSeq;
    }

    /**
     * @return the pkgNm
     */
    public String getPkgNm() {
        return pkgNm;
    }

    /**
     * @param pkgNm the pkgNm to set
     */
    public void setPkgNm(String pkgNm) {
        this.pkgNm = pkgNm;
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
     * @return the pkgPubCnt
     */
    public int getPkgPubCnt() {
        return pkgPubCnt;
    }

    /**
     * @param pkgPubCnt the pkgPubCnt to set
     */
    public void setPkgPubCnt(int pkgPubCnt) {
        this.pkgPubCnt = pkgPubCnt;
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

}
