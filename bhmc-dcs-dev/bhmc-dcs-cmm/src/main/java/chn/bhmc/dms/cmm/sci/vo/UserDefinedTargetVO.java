package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedTargetVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class UserDefinedTargetVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1547151117365784073L;

    private String usrDefReqDocId;
    private String dlrCd;
    private String dlrNm;
    private String diviCd;
    private String diviNm;
    private String officeCd;
    private String officeNm;
    private String sdptCd;
    private String distOfficeCd;

    /**
     * @return the usrDefReqDocId
     */
    public String getUsrDefReqDocId() {
        return usrDefReqDocId;
    }
    /**
     * @param usrDefReqDocId the usrDefReqDocId to set
     */
    public void setUsrDefReqDocId(String usrDefReqDocId) {
        this.usrDefReqDocId = usrDefReqDocId;
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
     * @return the diviCd
     */
    public String getDiviCd() {
        return diviCd;
    }
    /**
     * @param diviCd the diviCd to set
     */
    public void setDiviCd(String diviCd) {
        this.diviCd = diviCd;
    }
    /**
     * @return the diviNm
     */
    public String getDiviNm() {
        return diviNm;
    }
    /**
     * @param diviNm the diviNm to set
     */
    public void setDiviNm(String diviNm) {
        this.diviNm = diviNm;
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
     * @return the distOfficeCd
     */
    public String getDistOfficeCd() {
        return distOfficeCd;
    }
    /**
     * @param distOfficeCd the distOfficeCd to set
     */
    public void setDistOfficeCd(String distOfficeCd) {
        this.distOfficeCd = distOfficeCd;
    }
}