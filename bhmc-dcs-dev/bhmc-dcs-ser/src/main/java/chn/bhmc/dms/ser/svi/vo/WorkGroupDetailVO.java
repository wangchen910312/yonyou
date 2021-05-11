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

}
