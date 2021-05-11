package chn.bhmc.dms.ser.ro.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 작업중지 조회 SearchVO
 * </pre>
 *
 * @ClassName   : WorkPauseSearchVO.java
 * @Description : 작업중지 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkPauseSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3004904677018886118L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - RO문서번호
     */
    private String sRoDocNo;

    /**
     * 조회조건 - 수리유형
     */
    private String sRpipTp;

    /**
     * 조회조건 - 수리코드
     */
    private String sRpipCd;

    /**
     * 조회조건 - 라인번호
     */
    private String sLineNo;

    /**
     * 조회조건 - 배정여부
     */
    private String assignYn;

    /**
     * 작업시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sWrkStartDt;

    /**
     * 작업종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sWrkEndDt;

    public String getsDlrCd() {
        return sDlrCd;
    }

    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    public String getsRoDocNo() {
        return sRoDocNo;
    }

    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    public String getsRpipTp() {
        return sRpipTp;
    }

    public void setsRpipTp(String sRpipTp) {
        this.sRpipTp = sRpipTp;
    }

    public String getsRpipCd() {
        return sRpipCd;
    }

    public void setsRpipCd(String sRpipCd) {
        this.sRpipCd = sRpipCd;
    }

    public Date getsWrkStartDt() {
        return sWrkStartDt;
    }

    public void setsWrkStartDt(Date sWrkStartDt) {
        this.sWrkStartDt = sWrkStartDt;
    }

    public Date getsWrkEndDt() {
        return sWrkEndDt;
    }

    public void setsWrkEndDt(Date sWrkEndDt) {
        this.sWrkEndDt = sWrkEndDt;
    }

    public String getsLineNo() {
        return sLineNo;
    }

    public void setsLineNo(String sLineNo) {
        this.sLineNo = sLineNo;
    }

    public String getAssignYn() {
        return assignYn;
    }

    public void setAssignYn(String assignYn) {
        this.assignYn = assignYn;
    }


}
