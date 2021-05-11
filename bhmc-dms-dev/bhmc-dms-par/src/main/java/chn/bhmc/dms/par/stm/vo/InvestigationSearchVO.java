package chn.bhmc.dms.par.stm.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 수불유형 검색 VO
 *
 * @ClassName   : InvestigationSearchVO.java
 * @Description : InvestigationSearchVO.Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class InvestigationSearchVO extends SearchVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5601616528377964049L;
    
    /**
     * 配件号
     */
    private String sItemCd;
    
    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 재고실사문서번호
     **/
    private String sStockDdDocNo;

    /**
     * 문서상태코드
     **/
    private String sDocStatCd;

    /**
     * 문서상태코드리스트
     **/
    private List<String> sDocStatCdLst;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 실사입출고 유형
     **/
    private String sDdGr;

    /**
     * 실사입출고 유형
     **/

    private String sDdGi;

    /**
     * 재고조사계획일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStockIvstPlanDt;

    /**
     * 담당자ID
     **/
    private String sPrsnId;

    /**
     * 담당자명
     **/
    private String sPrsnNm;

    /**
     * 실사승인자ID
     **/
    private String sApprovePrsnId;

    /**
     * 실사승인자명
     **/
    private String sApprovePrsnNm;

    /**
     * 실사승인자ID
     **/
    private String sRegUsrId;

    /**
     * 실사승인자명
     **/
    private String sRegUsrNm;

    /**
     * 재고통제여부
     **/
    private String sStockLockYn;

    /**
     * 반려여부
     **/
    private String sRejectYn;

    /**
     * 재고조정수물문서년월
     **/
    private String sStockAdjMvtDocYy;

    /**
     * 재고조정수불문서번호
     **/
    private String sStockAdjMvtDocNo;

    /**
     * 승인요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveReqDt;

    /**
     * 승인요청일자 From
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveReqDtFr;

    /**
     * 승인요청일자 To
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveReqDtTo;

    /**
     * 실사확인일자 From
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegCfDtFr;

    /**
     * 실사확인일자 To
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegCfDtTo;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDt;

    /**
     * 등록일자 From
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtFr;

    /**
     * 등록일자 To
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegDtTo;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndFrDt;

    /**
     * 완료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndToDt;

    /**
     * 반려일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCancDt;

    /**
     * 결재의견내용
     **/
    private String sSignOpnCont;

    /**
     * 비고
     **/
    private String sRemark;

    /**
     * 손익손실구분자
     **/
    private String sAddDiffYn;

    private String sStrgeNm;
    private String sLocCd;
    private String sLocCdMig;
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
     * @return the sStockDdDocNo
     */
    public String getsStockDdDocNo() {
        return sStockDdDocNo;
    }

    /**
     * @param sStockDdDocNo the sStockDdDocNo to set
     */
    public void setsStockDdDocNo(String sStockDdDocNo) {
        this.sStockDdDocNo = sStockDdDocNo;
    }

    /**
     * @return the sDocStatCd
     */
    public String getsDocStatCd() {
        return sDocStatCd;
    }

    /**
     * @param sDocStatCd the sDocStatCd to set
     */
    public void setsDocStatCd(String sDocStatCd) {
        this.sDocStatCd = sDocStatCd;
    }

    /**
     * @return the sDocStatCdLst
     */
    public List<String> getsDocStatCdLst() {
        return sDocStatCdLst;
    }

    /**
     * @param sDocStatCdLst the sDocStatCdLst to set
     */
    public void setsDocStatCdLst(List<String> sDocStatCdLst) {
        this.sDocStatCdLst = sDocStatCdLst;
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
     * @return the sDdGr
     */
    public String getsDdGr() {
        return sDdGr;
    }

    /**
     * @param sDdGr the sDdGr to set
     */
    public void setsDdGr(String sDdGr) {
        this.sDdGr = sDdGr;
    }

    /**
     * @return the sDdGi
     */
    public String getsDdGi() {
        return sDdGi;
    }

    /**
     * @param sDdGi the sDdGi to set
     */
    public void setsDdGi(String sDdGi) {
        this.sDdGi = sDdGi;
    }

    /**
     * @return the sStockIvstPlanDt
     */
    public Date getsStockIvstPlanDt() {
        return sStockIvstPlanDt;
    }

    /**
     * @param sStockIvstPlanDt the sStockIvstPlanDt to set
     */
    public void setsStockIvstPlanDt(Date sStockIvstPlanDt) {
        this.sStockIvstPlanDt = sStockIvstPlanDt;
    }

    /**
     * @return the sPrsnId
     */
    public String getsPrsnId() {
        return sPrsnId;
    }

    /**
     * @param sPrsnId the sPrsnId to set
     */
    public void setsPrsnId(String sPrsnId) {
        this.sPrsnId = sPrsnId;
    }

    /**
     * @return the sStockLockYn
     */
    public String getsStockLockYn() {
        return sStockLockYn;
    }

    /**
     * @param sStockLockYn the sStockLockYn to set
     */
    public void setsStockLockYn(String sStockLockYn) {
        this.sStockLockYn = sStockLockYn;
    }

    /**
     * @return the sRejectYn
     */
    public String getsRejectYn() {
        return sRejectYn;
    }

    /**
     * @param sRejectYn the sRejectYn to set
     */
    public void setsRejectYn(String sRejectYn) {
        this.sRejectYn = sRejectYn;
    }

    /**
     * @return the sStockAdjMvtDocYy
     */
    public String getsStockAdjMvtDocYy() {
        return sStockAdjMvtDocYy;
    }

    /**
     * @param sStockAdjMvtDocYy the sStockAdjMvtDocYy to set
     */
    public void setsStockAdjMvtDocYy(String sStockAdjMvtDocYy) {
        this.sStockAdjMvtDocYy = sStockAdjMvtDocYy;
    }

    /**
     * @return the sStockAdjMvtDocNo
     */
    public String getsStockAdjMvtDocNo() {
        return sStockAdjMvtDocNo;
    }

    /**
     * @param sStockAdjMvtDocNo the sStockAdjMvtDocNo to set
     */
    public void setsStockAdjMvtDocNo(String sStockAdjMvtDocNo) {
        this.sStockAdjMvtDocNo = sStockAdjMvtDocNo;
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
     * @return the sApproveReqDt
     */
    public Date getsApproveReqDt() {
        return sApproveReqDt;
    }

    /**
     * @param sApproveReqDt the sApproveReqDt to set
     */
    public void setsApproveReqDt(Date sApproveReqDt) {
        this.sApproveReqDt = sApproveReqDt;
    }

    /**
     * @return the sApproveReqDtFr
     */
    public Date getsApproveReqDtFr() {
        return sApproveReqDtFr;
    }

    /**
     * @param sApproveReqDtFr the sApproveReqDtFr to set
     */
    public void setsApproveReqDtFr(Date sApproveReqDtFr) {
        this.sApproveReqDtFr = sApproveReqDtFr;
    }

    /**
     * @return the sApproveReqDtTo
     */
    public Date getsApproveReqDtTo() {
        return sApproveReqDtTo;
    }

    /**
     * @param sApproveReqDtTo the sApproveReqDtTo to set
     */
    public void setsApproveReqDtTo(Date sApproveReqDtTo) {
        this.sApproveReqDtTo = sApproveReqDtTo;
    }

    /**
     * @return the sRegCfDtFr
     */
    public Date getsRegCfDtFr() {
        return sRegCfDtFr;
    }

    /**
     * @param sRegCfDtFr the sRegCfDtFr to set
     */
    public void setsRegCfDtFr(Date sRegCfDtFr) {
        this.sRegCfDtFr = sRegCfDtFr;
    }

    /**
     * @return the sRegCfDtTo
     */
    public Date getsRegCfDtTo() {
        return sRegCfDtTo;
    }

    /**
     * @param sRegCfDtTo the sRegCfDtTo to set
     */
    public void setsRegCfDtTo(Date sRegCfDtTo) {
        this.sRegCfDtTo = sRegCfDtTo;
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
     * @return the sEndFrDt
     */
    public Date getsEndFrDt() {
        return sEndFrDt;
    }

    /**
     * @param sEndFrDt the sEndFrDt to set
     */
    public void setsEndFrDt(Date sEndFrDt) {
        this.sEndFrDt = sEndFrDt;
    }

    /**
     * @return the sEndToDt
     */
    public Date getsEndToDt() {
        return sEndToDt;
    }

    /**
     * @param sEndToDt the sEndToDt to set
     */
    public void setsEndToDt(Date sEndToDt) {
        this.sEndToDt = sEndToDt;
    }

    /**
     * @return the sCancDt
     */
    public Date getsCancDt() {
        return sCancDt;
    }

    /**
     * @param sCancDt the sCancDt to set
     */
    public void setsCancDt(Date sCancDt) {
        this.sCancDt = sCancDt;
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
     * @return the sAddDiffYn
     */
    public String getsAddDiffYn() {
        return sAddDiffYn;
    }

    /**
     * @param sAddDiffYn the sAddDiffYn to set
     */
    public void setsAddDiffYn(String sAddDiffYn) {
        this.sAddDiffYn = sAddDiffYn;
    }

    /**
     * @return the sPrsnNm
     */
    public String getsPrsnNm() {
        return sPrsnNm;
    }

    /**
     * @param sPrsnNm the sPrsnNm to set
     */
    public void setsPrsnNm(String sPrsnNm) {
        this.sPrsnNm = sPrsnNm;
    }

    /**
     * @return the sApprovePrsnId
     */
    public String getsApprovePrsnId() {
        return sApprovePrsnId;
    }

    /**
     * @param sApprovePrsnId the sApprovePrsnId to set
     */
    public void setsApprovePrsnId(String sApprovePrsnId) {
        this.sApprovePrsnId = sApprovePrsnId;
    }

    /**
     * @return the sApprovePrsnNm
     */
    public String getsApprovePrsnNm() {
        return sApprovePrsnNm;
    }

    /**
     * @param sApprovePrsnNm the sApprovePrsnNm to set
     */
    public void setsApprovePrsnNm(String sApprovePrsnNm) {
        this.sApprovePrsnNm = sApprovePrsnNm;
    }

    /**
     * @return the sRegUsrNm
     */
    public String getsRegUsrNm() {
        return sRegUsrNm;
    }

    /**
     * @param sRegUsrNm the sRegUsrNm to set
     */
    public void setsRegUsrNm(String sRegUsrNm) {
        this.sRegUsrNm = sRegUsrNm;
    }

	public String getsItemCd() {
		return sItemCd;
	}

	public void setsItemCd(String sItemCd) {
		this.sItemCd = sItemCd;
	}

	public String getsStrgeNm() {
		return sStrgeNm;
	}
	

	public void setsStrgeNm(String sStrgeNm) {
		this.sStrgeNm = sStrgeNm;
	}

	public String getsLocCd() {
		return sLocCd;
	}

	public void setsLocCd(String sLocCd) {
		this.sLocCd = sLocCd;
	}

	public String getsLocCdMig() {
		return sLocCdMig;
	}

	public void setsLocCdMig(String sLocCdMig) {
		this.sLocCdMig = sLocCdMig;
	}
    
}
