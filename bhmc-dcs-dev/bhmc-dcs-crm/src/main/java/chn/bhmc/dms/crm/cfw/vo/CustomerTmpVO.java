package chn.bhmc.dms.crm.cfw.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 고객정보 VO
 *
 * @ClassName   : CustomerTmpVO.java
 * @Description : CustomerTmpVO Class
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     in moon lee     최초 생성
 * </pre>
 */

public class CustomerTmpVO extends SearchVO {


	/**
	 *
	 */
	private static final long serialVersionUID = 4834201495387732047L;

	private String scId;
	private String custNo;
	private String custNm;
	private String hpNo;
	private String custCd;
	private String sTxt;
	private Date visitDt;
    /**
     * @return the scId
     */
    public String getScId() {
        return scId;
    }
    /**
     * @param scId the scId to set
     */
    public void setScId(String scId) {
        this.scId = scId;
    }
    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }
    /**
     * @param custNo the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }
    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }
    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }
    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }
    /**
     * @return the sTxt
     */
    public String getsTxt() {
        return sTxt;
    }
    /**
     * @param sTxt the sTxt to set
     */
    public void setsTxt(String sTxt) {
        this.sTxt = sTxt;
    }
    /**
     * @return the visitDt
     */
    public Date getVisitDt() {
        return visitDt;
    }
    /**
     * @param visitDt the visitDt to set
     */
    public void setVisitDt(Date visitDt) {
        this.visitDt = visitDt;
    }
    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "CustomerTmpVO [scId=" + scId + ", custNo=" + custNo + ", custNm=" + custNm + ", hpNo=" + hpNo
                + ", custCd=" + custCd + ", sTxt=" + sTxt + ", visitDt=" + visitDt + "]";
    }





}
