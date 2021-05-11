package chn.bhmc.dms.bat.par.pcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatInvcSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     In Bo Shim     최초 생성
 * </pre>
 */

public class BatInvcSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5688489457211305827L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 송장문서번호
     **/

    private String sInvcDocNo;

    /**
     * 송장유형
     **/

    private String sInvcTp;

    /**
     * 송장구분코드
     **/

    private String sInvcDstinCd;

    /**
     * 구매오더유형코드
     **/

    private String sPurcOrdTp;

    /**
    * 구매오더번호
    **/

    private String sPurcOrdNo;

    /**
     * 송장상태코드
     **/

    private String sInvcStatCd;

    /**
     * 송장일자
     **/
    private String sInvcDt;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcDtFr;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcDtTo;

    /**
     * 입고시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcGrDtFr;

    /**
     * 입고종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sInvcGrDtTo;

    /**
     * 도착일자
     **/
    private String sArrvDt;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sArrvDtFr;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sArrvDtTo;

    /**
     * 확정일자
     **/
    private String sConfirmDt;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sConfirmDtFr;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sConfirmDtTo;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 모비스송장번호
     **/
    private String sMobisInvcNo;

    /**
     * 통화코드
     **/
    private String sCurrCd;

    /**
     * 송장총금액
     **/
    private Double sInvcTotAmt;

    /**
     * 부가세코드
     **/
    private String sVatCd;

    /**
     * 부가세금액
     **/
    private Double sVatAmt;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 취소여부
     **/
    private String sCancYn;

    /**
     * 배송PDC코드
     **/
    private String sDlPdcCd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /**
     * 창고코드
     */
    private String sStrgeCd;

    /**
     * 입고창고코드
     */
    private String sGrStrgeCd;

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
     * @return the sInvcDocNo
     */
    public String getsInvcDocNo() {
        return sInvcDocNo;
    }

    /**
     * @param sInvcDocNo the sInvcDocNo to set
     */
    public void setsInvcDocNo(String sInvcDocNo) {
        this.sInvcDocNo = sInvcDocNo;
    }

    /**
     * @return the sInvcTp
     */
    public String getsInvcTp() {
        return sInvcTp;
    }

    /**
     * @param sInvcTp the sInvcTp to set
     */
    public void setsInvcTp(String sInvcTp) {
        this.sInvcTp = sInvcTp;
    }

    /**
     * @return the sInvcDstinCd
     */
    public String getsInvcDstinCd() {
        return sInvcDstinCd;
    }

    /**
     * @param sInvcDstinCd the sInvcDstinCd to set
     */
    public void setsInvcDstinCd(String sInvcDstinCd) {
        this.sInvcDstinCd = sInvcDstinCd;
    }

    /**
     * @return the sPurcOrdTp
     */
    public String getsPurcOrdTp() {
        return sPurcOrdTp;
    }

    /**
     * @param sPurcOrdTp the sPurcOrdTp to set
     */
    public void setsPurcOrdTp(String sPurcOrdTp) {
        this.sPurcOrdTp = sPurcOrdTp;
    }

    /**
     * @return the sPurcOrdNo
     */
    public String getsPurcOrdNo() {
        return sPurcOrdNo;
    }

    /**
     * @param sPurcOrdNo the sPurcOrdNo to set
     */
    public void setsPurcOrdNo(String sPurcOrdNo) {
        this.sPurcOrdNo = sPurcOrdNo;
    }

    /**
     * @return the sInvcStatCd
     */
    public String getsInvcStatCd() {
        return sInvcStatCd;
    }

    /**
     * @param sInvcStatCd the sInvcStatCd to set
     */
    public void setsInvcStatCd(String sInvcStatCd) {
        this.sInvcStatCd = sInvcStatCd;
    }

    /**
     * @return the sInvcDt
     */
    public String getsInvcDt() {
        return sInvcDt;
    }

    /**
     * @param sInvcDt the sInvcDt to set
     */
    public void setsInvcDt(String sInvcDt) {
        this.sInvcDt = sInvcDt;
    }

    /**
     * @return the sInvcDtFr
     */
    public Date getsInvcDtFr() {
        return sInvcDtFr;
    }

    /**
     * @param sInvcDtFr the sInvcDtFr to set
     */
    public void setsInvcDtFr(Date sInvcDtFr) {
        this.sInvcDtFr = sInvcDtFr;
    }

    /**
     * @return the sInvcDtTo
     */
    public Date getsInvcDtTo() {
        return sInvcDtTo;
    }

    /**
     * @param sInvcDtTo the sInvcDtTo to set
     */
    public void setsInvcDtTo(Date sInvcDtTo) {
        this.sInvcDtTo = sInvcDtTo;
    }

    /**
     * @return the sInvcGrDtFr
     */
    public Date getsInvcGrDtFr() {
        return sInvcGrDtFr;
    }

    /**
     * @param sInvcGrDtFr the sInvcGrDtFr to set
     */
    public void setsInvcGrDtFr(Date sInvcGrDtFr) {
        this.sInvcGrDtFr = sInvcGrDtFr;
    }

    /**
     * @return the sInvcGrDtTo
     */
    public Date getsInvcGrDtTo() {
        return sInvcGrDtTo;
    }

    /**
     * @param sInvcGrDtTo the sInvcGrDtTo to set
     */
    public void setsInvcGrDtTo(Date sInvcGrDtTo) {
        this.sInvcGrDtTo = sInvcGrDtTo;
    }

    /**
     * @return the sArrvDt
     */
    public String getsArrvDt() {
        return sArrvDt;
    }

    /**
     * @param sArrvDt the sArrvDt to set
     */
    public void setsArrvDt(String sArrvDt) {
        this.sArrvDt = sArrvDt;
    }

    /**
     * @return the sArrvDtFr
     */
    public Date getsArrvDtFr() {
        return sArrvDtFr;
    }

    /**
     * @param sArrvDtFr the sArrvDtFr to set
     */
    public void setsArrvDtFr(Date sArrvDtFr) {
        this.sArrvDtFr = sArrvDtFr;
    }

    /**
     * @return the sArrvDtTo
     */
    public Date getsArrvDtTo() {
        return sArrvDtTo;
    }

    /**
     * @param sArrvDtTo the sArrvDtTo to set
     */
    public void setsArrvDtTo(Date sArrvDtTo) {
        this.sArrvDtTo = sArrvDtTo;
    }

    /**
     * @return the sConfirmDt
     */
    public String getsConfirmDt() {
        return sConfirmDt;
    }

    /**
     * @param sConfirmDt the sConfirmDt to set
     */
    public void setsConfirmDt(String sConfirmDt) {
        this.sConfirmDt = sConfirmDt;
    }

    /**
     * @return the sConfirmDtFr
     */
    public Date getsConfirmDtFr() {
        return sConfirmDtFr;
    }

    /**
     * @param sConfirmDtFr the sConfirmDtFr to set
     */
    public void setsConfirmDtFr(Date sConfirmDtFr) {
        this.sConfirmDtFr = sConfirmDtFr;
    }

    /**
     * @return the sConfirmDtTo
     */
    public Date getsConfirmDtTo() {
        return sConfirmDtTo;
    }

    /**
     * @param sConfirmDtTo the sConfirmDtTo to set
     */
    public void setsConfirmDtTo(Date sConfirmDtTo) {
        this.sConfirmDtTo = sConfirmDtTo;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sMobisInvcNo
     */
    public String getsMobisInvcNo() {
        return sMobisInvcNo;
    }

    /**
     * @param sMobisInvcNo the sMobisInvcNo to set
     */
    public void setsMobisInvcNo(String sMobisInvcNo) {
        this.sMobisInvcNo = sMobisInvcNo;
    }

    /**
     * @return the sCurrCd
     */
    public String getsCurrCd() {
        return sCurrCd;
    }

    /**
     * @param sCurrCd the sCurrCd to set
     */
    public void setsCurrCd(String sCurrCd) {
        this.sCurrCd = sCurrCd;
    }

    /**
     * @return the sInvcTotAmt
     */
    public Double getsInvcTotAmt() {
        return sInvcTotAmt;
    }

    /**
     * @param sInvcTotAmt the sInvcTotAmt to set
     */
    public void setsInvcTotAmt(Double sInvcTotAmt) {
        this.sInvcTotAmt = sInvcTotAmt;
    }

    /**
     * @return the sVatCd
     */
    public String getsVatCd() {
        return sVatCd;
    }

    /**
     * @param sVatCd the sVatCd to set
     */
    public void setsVatCd(String sVatCd) {
        this.sVatCd = sVatCd;
    }

    /**
     * @return the sVatAmt
     */
    public Double getsVatAmt() {
        return sVatAmt;
    }

    /**
     * @param sVatAmt the sVatAmt to set
     */
    public void setsVatAmt(Double sVatAmt) {
        this.sVatAmt = sVatAmt;
    }

    /**
     * @return the sRemark
     */
    public String getsRemark() {
        return sRemark;
    }

    /**
     * @param sRemark the sRemark to set
     */
    public void setsRemark(String sRemark) {
        this.sRemark = sRemark;
    }

    /**
     * @return the sCancYn
     */
    public String getsCancYn() {
        return sCancYn;
    }

    /**
     * @param sCancYn the sCancYn to set
     */
    public void setsCancYn(String sCancYn) {
        this.sCancYn = sCancYn;
    }

    /**
     * @return the sDlPdcCd
     */
    public String getsDlPdcCd() {
        return sDlPdcCd;
    }

    /**
     * @param sDlPdcCd the sDlPdcCd to set
     */
    public void setsDlPdcCd(String sDlPdcCd) {
        this.sDlPdcCd = sDlPdcCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
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
     * @return the sRegDtFr
     */
    public Date getsRegDtFr() {
        return sRegDtFr;
    }

    /**
     * @param sRegDtFr the sRegDtFr to set
     */
    public void setsRegDtFr(Date sRegDtFr) {
        this.sRegDtFr = sRegDtFr;
    }

    /**
     * @return the sRegDtTo
     */
    public Date getsRegDtTo() {
        return sRegDtTo;
    }

    /**
     * @param sRegDtTo the sRegDtTo to set
     */
    public void setsRegDtTo(Date sRegDtTo) {
        this.sRegDtTo = sRegDtTo;
    }

    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sGrStrgeCd
     */
    public String getsGrStrgeCd() {
        return sGrStrgeCd;
    }

    /**
     * @param sGrStrgeCd the sGrStrgeCd to set
     */
    public void setsGrStrgeCd(String sGrStrgeCd) {
        this.sGrStrgeCd = sGrStrgeCd;
    }

}
