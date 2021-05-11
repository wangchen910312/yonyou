package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MigVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class MigTgtInfoVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5568789084364906846L;

    private String dlrCd;

    private String rnum;

    private String allRunYn;

    private int partRunNum;

    private int partRunNum2;

    private String pid;

    private String pnm;

    private String pstep;

    private String prepid;

    private String canYN;

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
     * @return the allRunYn
     */
    public String getAllRunYn() {
        return allRunYn;
    }

    /**
     * @param allRunYn the allRunYn to set
     */
    public void setAllRunYn(String allRunYn) {
        this.allRunYn = allRunYn;
    }

    /**
     * @return the rnum
     */
    public String getRnum() {
        return rnum;
    }

    /**
     * @param rnum the rnum to set
     */
    public void setRnum(String rnum) {
        this.rnum = rnum;
    }

    /**
     * @return the partRunNum
     */
    public int getPartRunNum() {
        return partRunNum;
    }

    /**
     * @param partRunNum the partRunNum to set
     */
    public void setPartRunNum(int partRunNum) {
        this.partRunNum = partRunNum;
    }

    /**
     * @return the partRunNum
     */
    public int getPartRunNum2() {
        return partRunNum2;
    }

    /**
     * @param partRunNum2 the partRunNum2 to set
     */
    public void setPartRunNum2(int partRunNum2) {
        this.partRunNum2 = partRunNum2;
    }

    /**
     * @return the pid
     */
    public String getPid() {
        return pid;
    }

    /**
     * @param pid the pid to set
     */
    public void setPid(String pid) {
        this.pid = pid;
    }

    /**
     * @return the pnm
     */
    public String getPnm() {
        return pnm;
    }

    /**
     * @param pnm the pnm to set
     */
    public void setPnm(String pnm) {
        this.pnm = pnm;
    }

    /**
     * @return the pstep
     */
    public String getPstep() {
        return pstep;
    }

    /**
     * @param pstep the pstep to set
     */
    public void setPstep(String pstep) {
        this.pstep = pstep;
    }

    /**
     * @return the prepid
     */
    public String getPrepid() {
        return prepid;
    }

    /**
     * @param prepid the prepid to set
     */
    public void setPrepid(String prepid) {
        this.prepid = prepid;
    }

    /**
     * @return the canYN
     */
    public String getCanYN() {
        return canYN;
    }

    /**
     * @param canYN the canYN to set
     */
    public void setCanYN(String canYN) {
        this.canYN = canYN;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "MigTgtInfoVO [dlrCd=" + dlrCd + ", rnum=" + rnum + ", partRunNum=" + partRunNum + ", pid=" + pid
                + ", pnm=" + pnm + ", pstep=" + pstep + ", prepid=" + prepid + ", canYN=" + canYN + "]";
    }
}
