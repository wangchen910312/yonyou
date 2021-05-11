package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimSearchVO.java
 * @Description : ClaimSearchVO.java
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

public class ClaimSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3005006893013229481L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 클레임문서번호
     **/
    private String sClaimDocNo;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 클레임상태코드
     **/
    private String sClaimStatCd;

    /**
     * 클레임대상코드
     **/
    private String sClaimTargCd;

    /**
     * 배송거래처코드
     **/
    private String sDlBpCd;

    /**
     * 요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqDt;

    /**
     * 승인일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 판정결과내용
     **/
    private String sJudgRsltCont;

    /**
     * 결재의견내용
     **/
    private String sSignOpnCont;

    /**
     * 삭제여부
     **/
    private String sDelYn;

    /**
     * 클레임유형
     **/
    private String sClaimTp;

    /**
     * 처리유형
     **/
    private String sProcTp;

    /**
     * 품목번호
     **/
    private String sItemCd;

    /**
     * 품목명
     **/
    private String sItemNm;

    /**
     * 클레임수량
     **/
    private Double sClaimQty;

    /**
     * 클레임단위코드
     **/
    private String sClaimUnitCd;

    /**
     * 단가
     **/
    private Double sPrc;

    /**
     * 금액
     **/
    private Double sAmt;

    /**
     * 송장문서번호
     **/
    private String sInvcDocNo;

    /**
     * 송장문서라인번호
     **/
    private int sInvcDocLineNo;

    /**
     * 모비스송장번호
     **/
    private String sMobisInvcNo;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * ABC CLASS
     **/
    private String sAbcInd;

    /**
     * 문서파일번호
     **/
    private String sDocFileNo;

    /**
     * 요청내용
     **/
    private String sReqCont;

    /**
     * 수불문서년월일자
     **/
    private String sMvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String sMvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int sMvrDocLineNo;

    /**
     * 구매오더번호
     **/

     private String sPurcOrdNo;

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
     * @return the sClaimDocNo
     */
    public String getsClaimDocNo() {
        return sClaimDocNo;
    }

    /**
     * @param sClaimDocNo the sClaimDocNo to set
     */
    public void setsClaimDocNo(String sClaimDocNo) {
        this.sClaimDocNo = sClaimDocNo;
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
     * @return the sClaimStatCd
     */
    public String getsClaimStatCd() {
        return sClaimStatCd;
    }

    /**
     * @param sClaimStatCd the sClaimStatCd to set
     */
    public void setsClaimStatCd(String sClaimStatCd) {
        this.sClaimStatCd = sClaimStatCd;
    }

    /**
     * @return the sClaimTargCd
     */
    public String getsClaimTargCd() {
        return sClaimTargCd;
    }

    /**
     * @param sClaimTargCd the sClaimTargCd to set
     */
    public void setsClaimTargCd(String sClaimTargCd) {
        this.sClaimTargCd = sClaimTargCd;
    }

    /**
     * @return the sDlBpCd
     */
    public String getsDlBpCd() {
        return sDlBpCd;
    }

    /**
     * @param sDlBpCd the sDlBpCd to set
     */
    public void setsDlBpCd(String sDlBpCd) {
        this.sDlBpCd = sDlBpCd;
    }

    /**
     * @return the sReqDt
     */
    public Date getsReqDt() {
        return sReqDt;
    }

    /**
     * @param sReqDt the sReqDt to set
     */
    public void setsReqDt(Date sReqDt) {
        this.sReqDt = sReqDt;
    }

    /**
     * @return the sApproveDt
     */
    public Date getsApproveDt() {
        return sApproveDt;
    }

    /**
     * @param sApproveDt the sApproveDt to set
     */
    public void setsApproveDt(Date sApproveDt) {
        this.sApproveDt = sApproveDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
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
     * @return the sJudgRsltCont
     */
    public String getsJudgRsltCont() {
        return sJudgRsltCont;
    }

    /**
     * @param sJudgRsltCont the sJudgRsltCont to set
     */
    public void setsJudgRsltCont(String sJudgRsltCont) {
        this.sJudgRsltCont = sJudgRsltCont;
    }

    /**
     * @return the sSignOpnCont
     */
    public String getsSignOpnCont() {
        return sSignOpnCont;
    }

    /**
     * @param sSignOpnCont the sSignOpnCont to set
     */
    public void setsSignOpnCont(String sSignOpnCont) {
        this.sSignOpnCont = sSignOpnCont;
    }

    /**
     * @return the sDelYn
     */
    public String getsDelYn() {
        return sDelYn;
    }

    /**
     * @param sDelYn the sDelYn to set
     */
    public void setsDelYn(String sDelYn) {
        this.sDelYn = sDelYn;
    }

    /**
     * @return the sClaimTp
     */
    public String getsClaimTp() {
        return sClaimTp;
    }

    /**
     * @param sClaimTp the sClaimTp to set
     */
    public void setsClaimTp(String sClaimTp) {
        this.sClaimTp = sClaimTp;
    }

    /**
     * @return the sProcTp
     */
    public String getsProcTp() {
        return sProcTp;
    }

    /**
     * @param sProcTp the sProcTp to set
     */
    public void setsProcTp(String sProcTp) {
        this.sProcTp = sProcTp;
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
     * @return the sClaimQty
     */
    public Double getsClaimQty() {
        return sClaimQty;
    }

    /**
     * @param sClaimQty the sClaimQty to set
     */
    public void setsClaimQty(Double sClaimQty) {
        this.sClaimQty = sClaimQty;
    }

    /**
     * @return the sClaimUnitCd
     */
    public String getsClaimUnitCd() {
        return sClaimUnitCd;
    }

    /**
     * @param sClaimUnitCd the sClaimUnitCd to set
     */
    public void setsClaimUnitCd(String sClaimUnitCd) {
        this.sClaimUnitCd = sClaimUnitCd;
    }

    /**
     * @return the sPrc
     */
    public Double getsPrc() {
        return sPrc;
    }

    /**
     * @param sPrc the sPrc to set
     */
    public void setsPrc(Double sPrc) {
        this.sPrc = sPrc;
    }

    /**
     * @return the sAmt
     */
    public Double getsAmt() {
        return sAmt;
    }

    /**
     * @param sAmt the sAmt to set
     */
    public void setsAmt(Double sAmt) {
        this.sAmt = sAmt;
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
     * @return the sInvcDocLineNo
     */
    public int getsInvcDocLineNo() {
        return sInvcDocLineNo;
    }

    /**
     * @param sInvcDocLineNo the sInvcDocLineNo to set
     */
    public void setsInvcDocLineNo(int sInvcDocLineNo) {
        this.sInvcDocLineNo = sInvcDocLineNo;
    }

    /**
     * @return the sDocFileNo
     */
    public String getsDocFileNo() {
        return sDocFileNo;
    }

    /**
     * @param sDocFileNo the sDocFileNo to set
     */
    public void setsDocFileNo(String sDocFileNo) {
        this.sDocFileNo = sDocFileNo;
    }

    /**
     * @return the sReqCont
     */
    public String getsReqCont() {
        return sReqCont;
    }

    /**
     * @param sReqCont the sReqCont to set
     */
    public void setsReqCont(String sReqCont) {
        this.sReqCont = sReqCont;
    }

    /**
     * @return the sMvtDocYyMm
     */
    public String getsMvtDocYyMm() {
        return sMvtDocYyMm;
    }

    /**
     * @param sMvtDocYyMm the sMvtDocYyMm to set
     */
    public void setsMvtDocYyMm(String sMvtDocYyMm) {
        this.sMvtDocYyMm = sMvtDocYyMm;
    }

    /**
     * @return the sMvtDocNo
     */
    public String getsMvtDocNo() {
        return sMvtDocNo;
    }

    /**
     * @param sMvtDocNo the sMvtDocNo to set
     */
    public void setsMvtDocNo(String sMvtDocNo) {
        this.sMvtDocNo = sMvtDocNo;
    }

    /**
     * @return the sMvrDocLineNo
     */
    public int getsMvrDocLineNo() {
        return sMvrDocLineNo;
    }

    /**
     * @param sMvrDocLineNo the sMvrDocLineNo to set
     */
    public void setsMvrDocLineNo(int sMvrDocLineNo) {
        this.sMvrDocLineNo = sMvrDocLineNo;
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
}
