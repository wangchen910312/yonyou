package chn.bhmc.dms.sal.dsc.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalesAllowanceVO
 * @Description : 일상업무 권한 관리(권한설정) 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.04.27      Kim Jin Suk        최초 생성
 * </pre>
 */

public class AuthorityFixVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2615789416672060710L;

    private String dlrCd;
    private String usrId;
    private String usrNm;
    private String deptCd;
    private String pstnCd;
    private String wrkDstinCd;
    private String wrkDstinNm;
    private String evalGradeCd;

    private String regUsrId;
    private String updtUsrId;

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
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
    /**
     * @return the deptCd
     */
    public String getDeptCd() {
        return deptCd;
    }
    /**
     * @param deptCd the deptCd to set
     */
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }
    /**
     * @return the pstnCd
     */
    public String getPstnCd() {
        return pstnCd;
    }
    /**
     * @param pstnCd the pstnCd to set
     */
    public void setPstnCd(String pstnCd) {
        this.pstnCd = pstnCd;
    }
    /**
     * @return the wrkDstinCd
     */
    public String getWrkDstinCd() {
        return wrkDstinCd;
    }
    /**
     * @param wrkDstinCd the wrkDstinCd to set
     */
    public void setWrkDstinCd(String wrkDstinCd) {
        this.wrkDstinCd = wrkDstinCd;
    }
    /**
     * @return the wrkDstinNm
     */
    public String getWrkDstinNm() {
        return wrkDstinNm;
    }
    /**
     * @param wrkDstinNm the wrkDstinNm to set
     */
    public void setWrkDstinNm(String wrkDstinNm) {
        this.wrkDstinNm = wrkDstinNm;
    }
    /**
     * @return the evalGradeCd
     */
    public String getEvalGradeCd() {
        return evalGradeCd;
    }
    /**
     * @param evalGradeCd the evalGradeCd to set
     */
    public void setEvalGradeCd(String evalGradeCd) {
        this.evalGradeCd = evalGradeCd;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
