package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkGroupMasterVO.java
 * @Description : 소조마스터 VO
 * @author KyungMok Kim
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.    KyungMok Kim     최초 생성
 * </pre>
 */

public class WorkGroupMasterVO extends BaseVO {

    private static final long serialVersionUID = -4691080138511732369L;

    private String dlrCd;          // 딜러코드
    private String wkgrpNo;        // 소조번호
    private String wkgrpNm;        // 소조명
    private String useYn;          // 사용여부
    private String mngSaId;        // SA관리ID
    private String mngSaNm;        // SA관리명
    private String bayGrpTp;       // bay그룹유형

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
     * @return the wkgrpNm
     */
    public String getWkgrpNm() {
        return wkgrpNm;
    }
    /**
     * @param wkgrpNm the wkgrpNm to set
     */
    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
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
     * @return the mngSaId
     */
    public String getMngSaId() {
        return mngSaId;
    }
    /**
     * @param mngSaId the mngSaId to set
     */
    public void setMngSaId(String mngSaId) {
        this.mngSaId = mngSaId;
    }
    /**
     * @return the mngSaNm
     */
    public String getMngSaNm() {
        return mngSaNm;
    }
    /**
     * @param mngSaNm the mngSaNm to set
     */
    public void setMngSaNm(String mngSaNm) {
        this.mngSaNm = mngSaNm;
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

}
