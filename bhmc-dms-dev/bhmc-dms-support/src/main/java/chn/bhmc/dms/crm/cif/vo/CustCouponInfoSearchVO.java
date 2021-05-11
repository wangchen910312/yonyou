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
 * @ClassName   : CustomerInfoSearchVO.java
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

public class CustCouponInfoSearchVO extends SearchVO {




    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5067671085892711468L;

    /**
    * 딜러코드
    **/

    private  String         sDlrCd;

    /**
    * 쿠폰시퀀스
    **/

    private  int            sCupnSeq;

    /**
    * 쿠폰명
    **/

    private  String         sCupnNm;

    /**
    * 할인방식
    **/

    private  String         sDcCd;

    /**
    * 할인사용구분
    **/

    private  String         sDcUseTp;

    /**
    * 사용여부
    **/

    private  String         sUseYn;

    /**
    * 유효시작일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sCupnFromDt;

    /**
    * 유효종료일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date           sCupnToDt;

    /**
    * 기본유효일자
    **/

    private  int            sCupnValidPrid;

    /**
    * 공임할일율
    **/

    private  Double         sLbrDcRate;

    /**
    * 공임할인금액
    **/

    private  Double         sLbrDcAmt;

    /**
    * 부품할인율
    **/

    private  Double         sParDcRate;

    /**
    * 부품할인금액
    **/

    private  Double         sParDcAmt;

    /**
    * 총액할인율
    **/

    private  Double         sTotDcRate;

    /**
    * 총액할인금액
    **/

    private  Double         sTotDcAmt;

    /**
    * 용폼코드
    **/

    private  String         sItemCd;

    private  String         sGoodsCnt;

    private  String         sRegUsrId;
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
     * @return the sCupnNm
     */
    public String getsCupnNm() {
        return sCupnNm;
    }

    /**
     * @param sCupnNm the sCupnNm to set
     */
    public void setsCupnNm(String sCupnNm) {
        this.sCupnNm = sCupnNm;
    }

    /**
     * @return the sDcCd
     */
    public String getsDcCd() {
        return sDcCd;
    }

    /**
     * @param sDcCd the sDcCd to set
     */
    public void setsDcCd(String sDcCd) {
        this.sDcCd = sDcCd;
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
     * @return the sLbrDcRate
     */
    public Double getsLbrDcRate() {
        return sLbrDcRate;
    }

    /**
     * @param sLbrDcRate the sLbrDcRate to set
     */
    public void setsLbrDcRate(Double sLbrDcRate) {
        this.sLbrDcRate = sLbrDcRate;
    }

    /**
     * @return the sLbrDcAmt
     */
    public Double getsLbrDcAmt() {
        return sLbrDcAmt;
    }

    /**
     * @param sLbrDcAmt the sLbrDcAmt to set
     */
    public void setsLbrDcAmt(Double sLbrDcAmt) {
        this.sLbrDcAmt = sLbrDcAmt;
    }

    /**
     * @return the sParDcRate
     */
    public Double getsParDcRate() {
        return sParDcRate;
    }

    /**
     * @param sParDcRate the sParDcRate to set
     */
    public void setsParDcRate(Double sParDcRate) {
        this.sParDcRate = sParDcRate;
    }

    /**
     * @return the sParDcAmt
     */
    public Double getsParDcAmt() {
        return sParDcAmt;
    }

    /**
     * @param sParDcAmt the sParDcAmt to set
     */
    public void setsParDcAmt(Double sParDcAmt) {
        this.sParDcAmt = sParDcAmt;
    }

    /**
     * @return the sTotDcRate
     */
    public Double getsTotDcRate() {
        return sTotDcRate;
    }

    /**
     * @param sTotDcRate the sTotDcRate to set
     */
    public void setsTotDcRate(Double sTotDcRate) {
        this.sTotDcRate = sTotDcRate;
    }

    /**
     * @return the sTotDcAmt
     */
    public Double getsTotDcAmt() {
        return sTotDcAmt;
    }

    /**
     * @param sTotDcAmt the sTotDcAmt to set
     */
    public void setsTotDcAmt(Double sTotDcAmt) {
        this.sTotDcAmt = sTotDcAmt;
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
     * @return the sGoodsCnt
     */
    public String getsGoodsCnt() {
        return sGoodsCnt;
    }

    /**
     * @param sGoodsCnt the sGoodsCnt to set
     */
    public void setsGoodsCnt(String sGoodsCnt) {
        this.sGoodsCnt = sGoodsCnt;
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
    * 수량
    **/



}
