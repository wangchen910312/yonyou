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

public class MigVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8306506703629900157L;

    private String dlrCd;
    private String pid;
    private int skipRows;
    private String useCenterDmsYn;
    private int partRunNum;
    private int partRunNum2;
    private String membershipPolicy;        // 멤버십 운영기준
    private String partRunStr;
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
     * @return the skipRows
     */
    public int getSkipRows() {
        return skipRows;
    }
    /**
     * @param skipRows the skipRows to set
     */
    public void setSkipRows(int skipRows) {
        this.skipRows = skipRows;
    }
    /**
     * @return the useCenterDmsYn
     */
    public String getUseCenterDmsYn() {
        return useCenterDmsYn;
    }
    /**
     * @param useCenterDmsYn the useCenterDmsYn to set
     */
    public void setUseCenterDmsYn(String useCenterDmsYn) {
        this.useCenterDmsYn = useCenterDmsYn;
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
     * @return the partRunNum2
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
     * @return the membershipPolicy
     */
    public String getMembershipPolicy() {
        return membershipPolicy;
    }
    /**
     * @param membershipPolicy the membershipPolicy to set
     */
    public void setMembershipPolicy(String membershipPolicy) {
        this.membershipPolicy = membershipPolicy;
    }
    /**
     * @return the partRunStr
     */
    public String getPartRunStr() {
        return partRunStr;
    }
    /**
     * @param partRunStr the partRunStr to set
     */
    public void setPartRunStr(String partRunStr) {
        this.partRunStr = partRunStr;
    }
}
