package chn.bhmc.dms.mob.api.repair.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 작업배정 조회 SearchVO
 * </pre>
 *
 * @ClassName   : WorkAssignSearchVO.java
 * @Description : 작업배정 조회 SearchVO.
 * @author Yin Xueyuan
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class WorkAssignSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2661304304645489049L;

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
     * 수리코드 그룹
     */
    private String sRpipGrpCd;

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

    /**
     * 예정시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocStartDt; //-- khskhs wa작업배정 타임라인 때문에

    /**
     * 예정완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocEndDt; //-- khskhs wa작업배정 타임라인 때문에

    /**
     * 소조번호
     */
    private String sWkgrpNo;

    /**
     * Bay번호
     */
    private String sBayNo;

    /**
     * 배정 완료 상태코드
     */
    private String sAllcConfStatCd;

    /**
     * 진도 완료 상태코드
     */
    private String sWrkConfStatCd;

    /**
     * 품질검사 완료 상태코드
     */
    private String sQtTestConfStatCd;

    /**
     * 작업배분 취소 대상건
     */
    private String sCancelChkYn;

    /**
     * 작업진도상태
     */
    private String sWrkStopYn;



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

    /**
     * @return the sWkgrpNo
     */
    public String getsWkgrpNo() {
        return sWkgrpNo;
    }

    /**
     * @param sWkgrpNo the sWkgrpNo to set
     */
    public void setsWkgrpNo(String sWkgrpNo) {
        this.sWkgrpNo = sWkgrpNo;
    }

    /**
     * @return the sBayNo
     */
    public String getsBayNo() {
        return sBayNo;
    }

    /**
     * @param sBayNo the sBayNo to set
     */
    public void setsBayNo(String sBayNo) {
        this.sBayNo = sBayNo;
    }

    /**
     * @param allocStartDt the allocStartDt to set
     */
    public void setAllocStartDt(Date allocStartDt) {
        this.allocStartDt = allocStartDt;
    }

    /**
     * @return the allocStartDt
     */
    public Date getAllocStartDt() {
        return allocStartDt;
    }

    /**
     * @param allocEndDt the allocEndDt to set
     */
    public void setAllocEndDt(Date allocEndDt) {
        this.allocEndDt = allocEndDt;
    }

    /**
     * @return the allocEndDt
     */
    public Date getAllocEndDt() {
        return allocEndDt;
    }

    public String getsCancelChkYn() {
        return sCancelChkYn;
    }

    public void setsCancelChkYn(String sCancelChkYn) {
        this.sCancelChkYn = sCancelChkYn;
    }

    public String getsRpipGrpCd() {
        return sRpipGrpCd;
    }

    public void setsRpipGrpCd(String sRpipGrpCd) {
        this.sRpipGrpCd = sRpipGrpCd;
    }


    public String getsAllcConfStatCd() {
        return sAllcConfStatCd;
    }

    public void setsAllcConfStatCd(String sAllcConfStatCd) {
        this.sAllcConfStatCd = sAllcConfStatCd;
    }

    public String getsWrkConfStatCd() {
        return sWrkConfStatCd;
    }

    public void setsWrkConfStatCd(String sWrkConfStatCd) {
        this.sWrkConfStatCd = sWrkConfStatCd;
    }

    /**
     * @return the sQtTestConfStatCd
     */
    public String getsQtTestConfStatCd() {
        return sQtTestConfStatCd;
    }

    /**
     * @param sQtTestConfStatCd the sQtTestConfStatCd to set
     */
    public void setsQtTestConfStatCd(String sQtTestConfStatCd) {
        this.sQtTestConfStatCd = sQtTestConfStatCd;
    }

    /**
     * @return the sWrkStopYn
     */
    public String getsWrkStopYn() {
        return sWrkStopYn;
    }

    /**
     * @param sWrkStopYn the sWrkStopYn to set
     */
    public void setsWrkStopYn(String sWrkStopYn) {
        this.sWrkStopYn = sWrkStopYn;
    }
}
