package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayDetailVO.java
 * @Description : Bay상세 VO
 * @author KyungMok Kim
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.    KyungMok Kim     최초 생성
 * </pre>
 */

public class BayDetailVO extends BaseVO {

	private static final long serialVersionUID = -5417103990923041745L;

	private String dlrCd;          // 딜러코드
	private String bayGrpTp;       // BAY그룹구분
	private String bayNo;          // Bay번호
    private Integer lineNo;        // 라인번호
    private String tecId;          // Techman ID
    private String tecNm;          // Techman명
    private String resourceKey;
    private String resourceName;
    private String sysNo;          //시스템번호
    private String deptCd;         //부서코드
    private String deptNm;         //부서명칭
    private String tskCd;          //직무코드
    private String tskNm;          //직무명칭
    private String sexCd;          //성별


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
     * @return the bayGrpTp
     */
    public String getBayGrpTp() {
        return bayGrpTp;
    }
    /**
     * @param bayGrpTp the bayGrpTp to set
     */
    public void setBayGrpTp(String bayGrpTp) {
        this.bayGrpTp = bayGrpTp;
    }
    /**
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }
    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }
    /**
     * @return the lineNo
     */
    public Integer getLineNo() {
        return lineNo;
    }
    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(Integer lineNo) {
        this.lineNo = lineNo;
    }
    /**
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }
    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
    }
    /**
     * @return the tecNm
     */
    public String getTecNm() {
        return tecNm;
    }
    /**
     * @param tecNm the tecNm to set
     */
    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }
    /**
     * @return the resourceKey
     */
    public String getResourceKey() {
        return resourceKey;
    }
    /**
     * @param resourceKey the resourceKey to set
     */
    public void setResourceKey(String resourceKey) {
        this.resourceKey = resourceKey;
    }
    /**
     * @return the resourceName
     */
    public String getResourceName() {
        return resourceName;
    }
    /**
     * @param resourceName the resourceName to set
     */
    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }
    public String getSysNo() {
        return sysNo;
    }
    public void setSysNo(String sysNo) {
        this.sysNo = sysNo;
    }
    
    public String getDeptCd() {
        return deptCd;
    }
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }
    public String getDeptNm() {
        return deptNm;
    }
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }
    public String getTskCd() {
        return tskCd;
    }
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }
    public String getTskNm() {
        return tskNm;
    }
    public void setTskNm(String tskNm) {
        this.tskNm = tskNm;
    }
    public String getSexCd() {
        return sexCd;
    }
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }
    
    

}
