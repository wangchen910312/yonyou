package chn.bhmc.dms.ser.svi.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayCalendarVO.java
 * @Description : Bay Calendar Base VO
 * @author Kwon Ki Hyun
 * @since 2016. 2. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 23.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class BayCalendarVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5606042656129031429L;

    /**
     * SEQ
     */
    private int seq;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * bay 번호
     */
    private String bayNo;

    /**
     * bay 명
     */
    private String bayNm;

    /**
     * 관리일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date mngDt;

    /**
     * 예외시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date excpStartDt;

    /**
     * 예외종료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date excpEndDt;

    /**
     * 비고
     */
    private String remark;

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
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
     * @return the bayNo
     */
    public String getBayNo() {
        return bayNo;
    }

    /**
     * @param bayNo the bayNo to set
     */
    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }

    /**
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }

    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    /**
     * @return the mngDt
     */
    public Date getMngDt() {
        return mngDt;
    }

    /**
     * @param mngDt the mngDt to set
     */
    public void setMngDt(Date mngDt) {
        this.mngDt = mngDt;
    }


    /**
     * @return the excpStartDt
     */
    public Date getExcpStartDt() {
        return excpStartDt;
    }

    /**
     * @param excpStartDt the excpStartDt to set
     */
    public void setExcpStartDt(Date excpStartDt) {
        this.excpStartDt = excpStartDt;
    }

    /**
     * @return the excpEndDt
     */
    public Date getExcpEndDt() {
        return excpEndDt;
    }

    /**
     * @param excpEndDt the excpEndDt to set
     */
    public void setExcpEndDt(Date excpEndDt) {
        this.excpEndDt = excpEndDt;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }


}
