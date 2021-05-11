package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupDetailVO.java
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

public class WorkGroupDetailVO extends BaseVO {

	private static final long serialVersionUID = -5417103990923041745L;

	private String dlrCd;          // 딜러코드
	private String wkgrpNo;        // 소조번호
    private Integer lineNo;        // 라인번호
    private String tecId;          // Techman ID
    private String tecNm;          // Techman명
    private String sysNo;          //시스템번호
    private String deptCd;         //부서코드
    private String deptNm;         //부서명칭
    private String tskCd;          //직무코드
    private String tskNm;          //직무명칭

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
     * @return the wkgrpNo
     */
    public String getWkgrpNo() {
        return wkgrpNo;
    }
    /**
     * @param wkgrpNo the wkgrpNo to set
     */
    public void setWkgrpNo(String wkgrpNo) {
        this.wkgrpNo = wkgrpNo;
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

    
}
