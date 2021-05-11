package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustPublishInfoSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

public class CustPublishInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7797463191232255819L;

    /**
    * 딜러코드
    **/

    private String sDlrCd;

    /**
    * 발행번호
    **/

    private String sPubliNo;

    /**
    * 발행유형 고객 또는 차
    **/

    private String sPubliCd;

    /**
    * 쿠폰시퀀스
    **/

    private int sCupnSeq;

    /**
    * 패키지일련번호
    **/

    private int sPkgSeq;

    /**
    * 고객번호
    **/

    private String sCustNo;

    /**
    * 고객명
    **/

    private String sCustNm;

    /**
    * VIN
    **/

    private String sVinNo;

    /**
    * 쿠폰유효시작일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCupnFromDt;

    /**
    * 쿠폰유효종료일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCupnToDt;

    /**
    * 유효일수
    **/

    private int sCupnValidPrid;

    /**
    * 발행일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPubliDt;

    /**
    * 발행자
    **/

    private String sPubliUsrId;

    /**
    * 사용유무
    **/

    private String sUseYn;

    /**
    * 등록자ID
    **/

    private String sRegUsrId;

    /**
    * 등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 할인사용구분 (CRM052)
     **/
    private String sDcUseTp;

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
     * @return the sPubliNo
     */
    public String getsPubliNo() {
        return sPubliNo;
    }

    /**
     * @param sPubliNo the sPubliNo to set
     */
    public void setsPubliNo(String sPubliNo) {
        this.sPubliNo = sPubliNo;
    }

    /**
     * @return the sPubliCd
     */
    public String getsPubliCd() {
        return sPubliCd;
    }

    /**
     * @param sPubliCd the sPubliCd to set
     */
    public void setsPubliCd(String sPubliCd) {
        this.sPubliCd = sPubliCd;
    }

    /**
     * @return the sCupnSeq
     */
    public int getsCupnSeq() {
        return sCupnSeq;
    }

    /**
     * @param sCupnSeq the sCupnSeq to set
     */
    public void setsCupnSeq(int sCupnSeq) {
        this.sCupnSeq = sCupnSeq;
    }

    /**
     * @return the sPkgSeq
     */
    public int getsPkgSeq() {
        return sPkgSeq;
    }

    /**
     * @param sPkgSeq the sPkgSeq to set
     */
    public void setsPkgSeq(int sPkgSeq) {
        this.sPkgSeq = sPkgSeq;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
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
     * @return the sCupnFromDt
     */
    public Date getsCupnFromDt() {
        return sCupnFromDt;
    }

    /**
     * @param sCupnFromDt the sCupnFromDt to set
     */
    public void setsCupnFromDt(Date sCupnFromDt) {
        this.sCupnFromDt = sCupnFromDt;
    }

    /**
     * @return the sCupnToDt
     */
    public Date getsCupnToDt() {
        return sCupnToDt;
    }

    /**
     * @param sCupnToDt the sCupnToDt to set
     */
    public void setsCupnToDt(Date sCupnToDt) {
        this.sCupnToDt = sCupnToDt;
    }

    /**
     * @return the sCupnValidPrid
     */
    public int getsCupnValidPrid() {
        return sCupnValidPrid;
    }

    /**
     * @param sCupnValidPrid the sCupnValidPrid to set
     */
    public void setsCupnValidPrid(int sCupnValidPrid) {
        this.sCupnValidPrid = sCupnValidPrid;
    }

    /**
     * @return the sPubliDt
     */
    public Date getsPubliDt() {
        return sPubliDt;
    }

    /**
     * @param sPubliDt the sPubliDt to set
     */
    public void setsPubliDt(Date sPubliDt) {
        this.sPubliDt = sPubliDt;
    }

    /**
     * @return the sPubliUsrId
     */
    public String getsPubliUsrId() {
        return sPubliUsrId;
    }

    /**
     * @param sPubliUsrId the sPubliUsrId to set
     */
    public void setsPubliUsrId(String sPubliUsrId) {
        this.sPubliUsrId = sPubliUsrId;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sDcUseTp
     */
    public String getsDcUseTp() {
        return sDcUseTp;
    }

    /**
     * @param sDcUseTp the sDcUseTp to set
     */
    public void setsDcUseTp(String sDcUseTp) {
        this.sDcUseTp = sDcUseTp;
    }

}
