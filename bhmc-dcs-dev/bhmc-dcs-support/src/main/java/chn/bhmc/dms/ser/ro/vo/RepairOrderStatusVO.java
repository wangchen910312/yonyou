package chn.bhmc.dms.ser.ro.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderStatusVO.java
 * @Description : 정비 현황 VO
 * @author JUNG Jin
 * @since 2018. 6. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 6. 20.     JUNG Jin     최초 생성
 * </pre>
 */

public class RepairOrderStatusVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8103308523877435576L;


    /**
     *  인터페이스 일자
     **/
//    @JsonDeserialize(using=JsonDateDeserializer.class)
//    private Date ifDate;

    private String ifDate;
    private String dlrCd;
    private String dlrNm;
    private Integer roCnt;


    /**
     * @return the ifDate
     */
    public String getIfDate() {
        return ifDate;
    }
    /**
     * @param ifDate the ifDate to set
     */
    public void setIfDate(String ifDate) {
        this.ifDate = ifDate;
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
     * @return the roCnt
     */
    public Integer getRoCnt() {
        return roCnt;
    }
    /**
     * @param roCnt the roCnt to set
     */
    public void setRoCnt(Integer roCnt) {
        this.roCnt = roCnt;
    }



}
