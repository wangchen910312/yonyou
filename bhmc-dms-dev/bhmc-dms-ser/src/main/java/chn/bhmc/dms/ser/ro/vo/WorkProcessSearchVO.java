package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * 작업진도관리 조회 SearchVO
 * </pre>
 *
 * @ClassName   : WorkProcessSearchVO.java
 * @Description : 작업진도관리 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkProcessSearchVO extends WorkAssignSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6383457040495759328L;

    /**
     * 조회조건 - 일련번호
     */
    private int sSeq;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     *  RO번호
     **/
    private String sRoDocNo;

    /**
     * 공임 코드
     */
    private String sRpirCd;



    /**
     * 조회조건 - 차량인도시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sExpcDlDt;

    public int getsSeq() {
        return sSeq;
    }

    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sExpcDlDt
     */
    public Date getsExpcDlDt() {
        return sExpcDlDt;
    }

    /**
     * @param sExpcDlDt the sExpcDlDt to set
     */
    public void setsExpcDlDt(Date sExpcDlDt) {
        this.sExpcDlDt = sExpcDlDt;
    }

    public String getsRpirCd() {
        return sRpirCd;
    }

    public void setsRpirCd(String sRpirCd) {
        this.sRpirCd = sRpirCd;
    }

    public String getsRoDocNo() {
        return sRoDocNo;
    }

    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

}
