package chn.bhmc.dms.ser.wac.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FreeServicePartRequestSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 19.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class FreeServicePartSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2643212396822015071L;

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
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 면비부품문서번호
     **/
    private String sFreeItemDocNo;

    /**
     * 차대번호
     **/
    @NotEmpty
    private String sVinNo;

    /**
     * 면비부품상태
     **/
    private String sFreeItemStatCd;

    /**
     * 부품유형
     **/
    private String sItemTp;

    /**
     * 부품번호
     **/
    private String sItemCd;

    /**
     * 부품명
     **/
    private String sItemNm;

    /**
     * 면비부품승인번호
     **/
    private String sFreeItemApproveNo;

    /**
     * LTS MODEL CD
     **/
    private String sLtsModelCd;

    private String sPreFixId;



    /**
     * @return the sPreFixId
     */
    public String getsPreFixId() {
        return sPreFixId;
    }

    /**
     * @param sPreFixId the sPreFixId to set
     */
    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
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
     * @return the sFreeItemDocNo
     */
    public String getsFreeItemDocNo() {
        return sFreeItemDocNo;
    }

    /**
     * @param sFreeItemDocNo the sFreeItemDocNo to set
     */
    public void setsFreeItemDocNo(String sFreeItemDocNo) {
        this.sFreeItemDocNo = sFreeItemDocNo;
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
     * @return the sFreeItemStatCd
     */
    public String getsFreeItemStatCd() {
        return sFreeItemStatCd;
    }

    /**
     * @param sFreeItemStatCd the sFreeItemStatCd to set
     */
    public void setsFreeItemStatCd(String sFreeItemStatCd) {
        this.sFreeItemStatCd = sFreeItemStatCd;
    }

    /**
     * @return the sItemTp
     */
    public String getsItemTp() {
        return sItemTp;
    }

    /**
     * @param sItemTp the sItemTp to set
     */
    public void setsItemTp(String sItemTp) {
        this.sItemTp = sItemTp;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    /**
     * @return the sFreeItemApproveNo
     */
    public String getsFreeItemApproveNo() {
        return sFreeItemApproveNo;
    }

    /**
     * @param sFreeItemApproveNo the sFreeItemApproveNo to set
     */
    public void setsFreeItemApproveNo(String sFreeItemApproveNo) {
        this.sFreeItemApproveNo = sFreeItemApproveNo;
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




}
