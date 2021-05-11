package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class PwaSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6376275072294608329L;

    /**
     * 조회 시작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFromDt;

    /**
     * 조회 종료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sToDt;

    /**
     * 차대번호
     */
    private String sVinNo;

    /**
     * PWA 상태
     */
    private String sPwaStatCd;

    /**
     * PWA 딜러코드
     */
    private String sDlrCd;

    /**
     * PWA DOC NO
     */

    private String sPwaDocNo;

    /**
     * LTS MODEL CODE
     */
    private String sLtsModelCd;

    /**
     * 사업부
     */
    private String sDivision;

    /**
     * 요청여부
     */
    private String sRqsYn;

    /**
     * RO DOC NO
     */
    private String sRoDocNo;

    /**
     * 선택한 Tab ID
     */
    private String sSelectTabId;

    /**
     * 조회조건 VIN 길이
     */
    private int sVinLength;

    private String sPreFixId;

    private String sDocNo;
    
    /**
     * PWA申请 csr 62 需求延保索赔申请类型的PWA申请单 贾明 2020-3-26
     * pwaRequiNo : 关联申请单号
     * calcDocNo   服务结算单号
     */
    private String sPwaRequiNo;
    private String sCalcDocNo;


    public String getsPreFixId() {
        return sPreFixId;
    }

    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
    }

    /**
     * @return the sPwaDocNo
     */
    public String getsPwaDocNo() {
        return sPwaDocNo;
    }

    /**
     * @param sPwaDocNo the sPwaDocNo to set
     */
    public void setsPwaDocNo(String sPwaDocNo) {
        this.sPwaDocNo = sPwaDocNo;
    }

    /**
     * @return the sFromDt
     */
    public Date getsFromDt() {
        return sFromDt;
    }

    /**
     * @param sFromDt the sFromDt to set
     */
    public void setsFromDt(Date sFromDt) {
        this.sFromDt = sFromDt;
    }

    /**
     * @return the sToDt
     */
    public Date getsToDt() {
        return sToDt;
    }

    /**
     * @param sToDt the sToDt to set
     */
    public void setsToDt(Date sToDt) {
        this.sToDt = sToDt;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sPwaStatCd
     */
    public String getsPwaStatCd() {
        return sPwaStatCd;
    }

    /**
     * @param sPwaStatCd the sPwaStatCd to set
     */
    public void setsPwaStatCd(String sPwaStatCd) {
        this.sPwaStatCd = sPwaStatCd;
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
     * @return the sDivision
     */
    public String getsDivision() {
        return sDivision;
    }

    /**
     * @param sDivision the sDivision to set
     */
    public void setsDivision(String sDivision) {
        this.sDivision = sDivision;
    }

    /**
     * @return the sRqsYn
     */
    public String getsRqsYn() {
        return sRqsYn;
    }

    /**
     * @param sRqsYn the sRqsYn to set
     */
    public void setsRqsYn(String sRqsYn) {
        this.sRqsYn = sRqsYn;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sSelectTabId
     */
    public String getsSelectTabId() {
        return sSelectTabId;
    }

    /**
     * @param sSelectTabId the sSelectTabId to set
     */
    public void setsSelectTabId(String sSelectTabId) {
        this.sSelectTabId = sSelectTabId;
    }

    /**
     * @return the sVinLength
     */
    public int getsVinLength() {
        return sVinLength;
    }

    /**
     * @param sVinLength the sVinLength to set
     */
    public void setsVinLength(int sVinLength) {
        this.sVinLength = sVinLength;
    }

    /**
     * @param sDocNo the sDocNo to set
     */
    public void setsDocNo(String sDocNo) {
        this.sDocNo = sDocNo;
    }

    /**
     * @return the sDocNo
     */
    public String getsDocNo() {
        return sDocNo;
    }

	public String getsPwaRequiNo() {
		return sPwaRequiNo;
	}

	public void setsPwaRequiNo(String sPwaRequiNo) {
		this.sPwaRequiNo = sPwaRequiNo;
	}

	public String getsCalcDocNo() {
		return sCalcDocNo;
	}

	public void setsCalcDocNo(String sCalcDocNo) {
		this.sCalcDocNo = sCalcDocNo;
	}



}
