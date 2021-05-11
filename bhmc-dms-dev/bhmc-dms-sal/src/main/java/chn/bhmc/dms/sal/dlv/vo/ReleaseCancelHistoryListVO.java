package chn.bhmc.dms.sal.dlv.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReleaseCancelJudgeResultVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 8. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 12.     Kim yewon             최초 생성
 *
 * </pre>
 */

public class ReleaseCancelHistoryListVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2199002449431552005L;

    private String dlrCd;

    private String kmopt;

    private String kmdate;

    private String kmstdy;

    private String kmvin;

    private String custNm;

    private String modelNm;

    private String carlineNm;

    private String kmuser;

    private String userId;

    private String kmcncd;

    private String custnm;

    private String ronum;

    /**
     * @return the ronum
     */
    public String getRonum() {
        return ronum;
    }

    /**
     * @param ronum the ronum to set
     */
    public void setRonum(String ronum) {
        this.ronum = ronum;
    }

    /**
     * @return the custnm
     */
    public String getCustnm() {
        return custnm;
    }

    /**
     * @param custnm the custnm to set
     */
    public void setCustnm(String custnm) {
        this.custnm = custnm;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
     * @return the kmopt
     */
    public String getKmopt() {
        return kmopt;
    }

    /**
     * @param kmopt the kmopt to set
     */
    public void setKmopt(String kmopt) {
        this.kmopt = kmopt;
    }

    /**
     * @return the kmdate
     */
    public String getKmdate() {
        return kmdate;
    }

    /**
     * @param kmdate the kmdate to set
     */
    public void setKmdate(String kmdate) {
        this.kmdate = kmdate;
    }

    /**
     * @return the kmstdy
     */
    public String getKmstdy() {
        return kmstdy;
    }

    /**
     * @param kmstdy the kmstdy to set
     */
    public void setKmstdy(String kmstdy) {
        this.kmstdy = kmstdy;
    }

    /**
     * @return the kmvin
     */
    public String getKmvin() {
        return kmvin;
    }

    /**
     * @param kmvin the kmvin to set
     */
    public void setKmvin(String kmvin) {
        this.kmvin = kmvin;
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
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the kmuser
     */
    public String getKmuser() {
        return kmuser;
    }

    /**
     * @param kmuser the kmuser to set
     */
    public void setKmuser(String kmuser) {
        this.kmuser = kmuser;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * @return the kmcncd
     */
    public String getKmcncd() {
        return kmcncd;
    }

    /**
     * @param kmcncd the kmcncd to set
     */
    public void setKmcncd(String kmcncd) {
        this.kmcncd = kmcncd;
    }

}