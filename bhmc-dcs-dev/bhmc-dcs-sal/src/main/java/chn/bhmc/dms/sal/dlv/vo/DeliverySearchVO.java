package chn.bhmc.dms.sal.dlv.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeliverySearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 3. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.    Kim yewon              최초 생성
 * </pre>
 */

public class DeliverySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;
    private String sDlrCd;                  // 딜러코드
    private String sContractNo;             //계약번호
    private String sContractCustNo;         //고객
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                  //검색기간 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                    //검색기간 - 종료일
    private String sCarlineCd;              //차종
    private String sModelCd;                //모델
    private String sOcnCd;                  //OCN
    private String sVinNo;                  //VIN NO
    private String sRfidNo;                 //RFID
    private String tSearchDt;               //일자검색 조건
    private String sContractStatCd;         //계약상태

    private String sFscCd;
    //집단판매 검색조건
    private String sGrpContractNo;          //그룹계약번호
    private String sCustNo;                 //고객번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String sContractStartDt;        //계약일자 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String sContractEndDt;          //계약일자 - 종료일
    private String sGrpContractStatCd;      //집단판매 계약상태
    private String sContractTp;             //계약유형(판매유형)

    private String sReqStatCd;              //승인상태
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveStratDt;         //심사일자-시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveEndDt;           //심사일자-종료일
    private String sDiviCd;                 //사업부
    private String sOffCd;                  //판사처
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrAskStratDt;         //심사일자-시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStrAskDtEndDt;           //심사일자-종료일


    /**
     * @return the sFscCd
     */
    public String getsFscCd() {
        return sFscCd;
    }
    /**
     * @param sFscCd the sFscCd to set
     */
    public void setsFscCd(String sFscCd) {
        this.sFscCd = sFscCd;
    }
    /**
     * @return the sGrpContractStatCd
     */
    public String getsGrpContractStatCd() {
        return sGrpContractStatCd;
    }
    /**
     * @param sGrpContractStatCd the sGrpContractStatCd to set
     */
    public void setsGrpContractStatCd(String sGrpContractStatCd) {
        this.sGrpContractStatCd = sGrpContractStatCd;
    }
    /**
     * @return the sContractTp
     */
    public String getsContractTp() {
        return sContractTp;
    }
    /**
     * @param sContractTp the sContractTp to set
     */
    public void setsContractTp(String sContractTp) {
        this.sContractTp = sContractTp;
    }
    /**
     * @return the sContractStartDt
     */
    public String getsContractStartDt() {
        return sContractStartDt;
    }
    /**
     * @param sContractStartDt the sContractStartDt to set
     */
    public void setsContractStartDt(String sContractStartDt) {
        this.sContractStartDt = sContractStartDt;
    }
    /**
     * @return the sContractEndDt
     */
    public String getsContractEndDt() {
        return sContractEndDt;
    }
    /**
     * @param sContractEndDt the sContractEndDt to set
     */
    public void setsContractEndDt(String sContractEndDt) {
        this.sContractEndDt = sContractEndDt;
    }
    /**
     * @return the sGrpContractNo
     */
    public String getsGrpContractNo() {
        return sGrpContractNo;
    }
    /**
     * @param sGrpContractNo the sGrpContractNo to set
     */
    public void setsGrpContractNo(String sGrpContractNo) {
        this.sGrpContractNo = sGrpContractNo;
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
     * @return the sContractStatCd
     */
    public String getsContractStatCd() {
        return sContractStatCd;
    }
    /**
     * @param sContractStatCd the sContractStatCd to set
     */
    public void setsContractStatCd(String sContractStatCd) {
        this.sContractStatCd = sContractStatCd;
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
     * @return the sContractNo
     */
    public String getsContractNo() {
        return sContractNo;
    }
    /**
     * @param sContractNo the sContractNo to set
     */
    public void setsContractNo(String sContractNo) {
        this.sContractNo = sContractNo;
    }
    /**
     * @return the sContractCustNo
     */
    public String getsContractCustNo() {
        return sContractCustNo;
    }
    /**
     * @param sContractCustNo the sContractCustNo to set
     */
    public void setsContractCustNo(String sContractCustNo) {
        this.sContractCustNo = sContractCustNo;
    }
    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }
    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
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
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }
    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }
    /**
     * @return the sOcnCd
     */
    public String getsOcnCd() {
        return sOcnCd;
    }
    /**
     * @param sOcnCd the sOcnCd to set
     */
    public void setsOcnCd(String sOcnCd) {
        this.sOcnCd = sOcnCd;
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
     * @return the sRfidNo
     */
    public String getsRfidNo() {
        return sRfidNo;
    }
    /**
     * @param sRfidNo the sRfidNo to set
     */
    public void setsRfidNo(String sRfidNo) {
        this.sRfidNo = sRfidNo;
    }
    /**
     * @return the tSearchDt
     */
    public String gettSearchDt() {
        return tSearchDt;
    }
    /**
     * @param tSearchDt the tSearchDt to set
     */
    public void settSearchDt(String tSearchDt) {
        this.tSearchDt = tSearchDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the sReqStatCd
     */
    public String getsReqStatCd() {
        return sReqStatCd;
    }
    /**
     * @return the sDiviCd
     */
    public String getsDiviCd() {
        return sDiviCd;
    }
    /**
     * @return the sOffCd
     */
    public String getsOffCd() {
        return sOffCd;
    }
    /**
     * @param sReqStatCd the sReqStatCd to set
     */
    public void setsReqStatCd(String sReqStatCd) {
        this.sReqStatCd = sReqStatCd;
    }
    /**
     * @param sDiviCd the sDiviCd to set
     */
    public void setsDiviCd(String sDiviCd) {
        this.sDiviCd = sDiviCd;
    }
    /**
     * @param sOffCd the sOffCd to set
     */
    public void setsOffCd(String sOffCd) {
        this.sOffCd = sOffCd;
    }
    /**
     * @return the sApproveStratDt
     */
    public Date getsApproveStratDt() {
        return sApproveStratDt;
    }
    /**
     * @return the sApproveEndDt
     */
    public Date getsApproveEndDt() {
        return sApproveEndDt;
    }
    /**
     * @param sApproveStratDt the sApproveStratDt to set
     */
    public void setsApproveStratDt(Date sApproveStratDt) {
        this.sApproveStratDt = sApproveStratDt;
    }
    /**
     * @param sApproveEndDt the sApproveEndDt to set
     */
    public void setsApproveEndDt(Date sApproveEndDt) {
        this.sApproveEndDt = sApproveEndDt;
    }
    /**
     * @return the sStrAskStratDt
     */
    public Date getsStrAskStratDt() {
        return sStrAskStratDt;
    }
    /**
     * @return the sStrAskDtEndDt
     */
    public Date getsStrAskDtEndDt() {
        return sStrAskDtEndDt;
    }
    /**
     * @param sStrAskStratDt the sStrAskStratDt to set
     */
    public void setsStrAskStratDt(Date sStrAskStratDt) {
        this.sStrAskStratDt = sStrAskStratDt;
    }
    /**
     * @param sStrAskDtEndDt the sStrAskDtEndDt to set
     */
    public void setsStrAskDtEndDt(Date sStrAskDtEndDt) {
        this.sStrAskDtEndDt = sStrAskDtEndDt;
    }

}
