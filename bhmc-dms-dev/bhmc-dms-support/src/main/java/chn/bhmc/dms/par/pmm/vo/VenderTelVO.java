package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 거래처 연락처 VO
 *
 * @ClassName   : VendorTelVO.java
 * @Description : VendorTelVO Class
 * @author In Bo Shim
 * @since 2016. 4. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 21.     In Bo Shim     최초 생성
 * </pre>
 */
public class VenderTelVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1732415706952415958L;

    /**
     * dlrCd
     */
    @NotEmpty
    private String dlrCd;

    /**
     * 거래처코드
     */
    private String bpCd;

    /**
     * 라인번호
     */
    private int lineNo;

    /**
     * DB저장 담당자명
     */
    private String dbPrsnNm;

    /**
     * 담당자명
     */
    private String prsnNm;

    /**
     * 담당자휴대폰번호
     */
    private String prsnHpNo;

    /**
     * 담당자이메일명
     */
    private String prsnEmailNm;

    /**
     * 담당자전화번호
     */
    private String prsnTelNo;

    /**
     * 성별코드
     */
    private String sexCd;

    /**
     * 기타연락방법코드
     */
    private String etcCommMthCd;

    /**
     * 기타연락번호
     */
    private String etcCommNo;

    /**
     * 담당자FAX번호
     */
    private String prsnFaxNo;

    /**
     * DB저장유무
     */
    private String dbYn;

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
     * @return the dbPrsnNm
     */
    public String getDbPrsnNm() {
        return dbPrsnNm;
    }

    /**
     * @param dbPrsnNm the dbPrsnNm to set
     */
    public void setDbPrsnNm(String dbPrsnNm) {
        this.dbPrsnNm = dbPrsnNm;
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
     * @return the prsnEmailNm
     */
    public String getPrsnEmailNm() {
        return prsnEmailNm;
    }

    /**
     * @param prsnEmailNm the prsnEmailNm to set
     */
    public void setPrsnEmailNm(String prsnEmailNm) {
        this.prsnEmailNm = prsnEmailNm;
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
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }

    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }

    /**
     * @return the etcCommMthCd
     */
    public String getEtcCommMthCd() {
        return etcCommMthCd;
    }

    /**
     * @param etcCommMthCd the etcCommMthCd to set
     */
    public void setEtcCommMthCd(String etcCommMthCd) {
        this.etcCommMthCd = etcCommMthCd;
    }

    /**
     * @return the etcCommNo
     */
    public String getEtcCommNo() {
        return etcCommNo;
    }

    /**
     * @param etcCommNo the etcCommNo to set
     */
    public void setEtcCommNo(String etcCommNo) {
        this.etcCommNo = etcCommNo;
    }

    /**
     * @return the prsnFaxNo
     */
    public String getPrsnFaxNo() {
        return prsnFaxNo;
    }

    /**
     * @param prsnFaxNo the prsnFaxNo to set
     */
    public void setPrsnFaxNo(String prsnFaxNo) {
        this.prsnFaxNo = prsnFaxNo;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }
}
