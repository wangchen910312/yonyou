package chn.bhmc.dms.ser.svi.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * 테크멘 기능관리 VO
 * </pre>
 *
 * @ClassName   : TechManFnMasterVO.java
 * @Description : 테크멘 기능관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class TechManFnMasterVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3447232715620214035L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String dlrCd;

    /**
     * TechManId
     */
    @NotEmpty
    private String tecId;

    /**
     * TechMan 명
     */
    private String tecNm;

    /**
     * TechMan 주기능명
     */
    private String tecMfnNm;

    /**
     * TechMan 부기능명1
     */
    private String tecSfnNm1;

    /**
     * TechMan 부기능명2
     */
    private String tecSfnNm2;

    /**
     * TechMan 부기능명3
     */
    private String tecSfnNm3;

    /**
     * 업무구분
     */
    private String wrkTp;

    /**
     * 시스템번호
     */
    private String sysNo;

    private String tskCd;

    private String tskNm;

    private String deptCd;

    private String deptNm;

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getTecId() {
        return tecId;
    }

    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    public String getTecNm() {
        return tecNm;
    }

    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }

    public String getTecMfnNm() {
        return tecMfnNm;
    }

    public void setTecMfnNm(String tecMfnNm) {
        this.tecMfnNm = tecMfnNm;
    }

    public String getTecSfnNm1() {
        return tecSfnNm1;
    }

    public void setTecSfnNm1(String tecSfnNm1) {
        this.tecSfnNm1 = tecSfnNm1;
    }

    public String getTecSfnNm2() {
        return tecSfnNm2;
    }

    public void setTecSfnNm2(String tecSfnNm2) {
        this.tecSfnNm2 = tecSfnNm2;
    }

    public String getTecSfnNm3() {
        return tecSfnNm3;
    }

    public void setTecSfnNm3(String tecSfnNm3) {
        this.tecSfnNm3 = tecSfnNm3;
    }

    /**
     * @return the wrkTp
     */
    public String getWrkTp() {
        return wrkTp;
    }

    /**
     * @param wrkTp the wrkTp to set
     */
    public void setWrkTp(String wrkTp) {
        this.wrkTp = wrkTp;
    }

    /**
     * @return the sysNo
     */
    public String getSysNo() {
        return sysNo;
    }

    /**
     * @param sysNo the sysNo to set
     */
    public void setSysNo(String sysNo) {
        this.sysNo = sysNo;
    }

    /**
     * @return the tskCd
     */
    public String getTskCd() {
        return tskCd;
    }

    /**
     * @param tskCd the tskCd to set
     */
    public void setTskCd(String tskCd) {
        this.tskCd = tskCd;
    }

    /**
     * @return the tskNm
     */
    public String getTskNm() {
        return tskNm;
    }

    /**
     * @param tskNm the tskNm to set
     */
    public void setTskNm(String tskNm) {
        this.tskNm = tskNm;
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
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }

    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

}
