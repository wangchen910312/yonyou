package chn.bhmc.dms.sal.fas.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Jin Suk Kim
 * @since 2016. 3. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 22.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class CoercionApprovalSearchVO extends SearchVO{

    private static final long serialVersionUID = 2783621072617184220L;

    private String sReqStatCd;                  // 승인/불승인 상태 여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  sRegStartDt;                  // 신청일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date  sRegEndDt;                    // 신청일자
    private String sDlrCd;                      // 딜러코드
    private String sFceSaleReqReasonCd;         // 예외사유
    private String sVinNo1;                      // vin
    private String sVinNo2;
    private String sVinNo;                       // vin
    //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start
    private String sReceipYn;
    //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end
   
	@JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRealDlStartDt;                 //발차일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRealDlEndDt;
    private String sCarlineCd;                  // 차종
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveStratDt;                // 승인일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveEndDt;

    private int sSeq;

    private String sDiviCd;
    private String sOffCd;
    private String sModelCd;
    private String sContractNo;
    private String sSaleEmpNo;
    private String sOrdTp;

    
    //20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 start
    public String getsReceipYn() {
		return sReceipYn;
	}
	public void setsReceipYn(String sReceipYn) {
		this.sReceipYn = sReceipYn;
	}
	//20201224 Q20122300005 增加筛选条件“是否有发票” update by sunzq3 end
    /**
     * @return the sReqStatCd
     */
    public String getsReqStatCd() {
        return sReqStatCd;
    }
    /**
     * @param sReqStatCd the sReqStatCd to set
     */
    public void setsReqStatCd(String sReqStatCd) {
        this.sReqStatCd = sReqStatCd;
    }
    /**
     * @return the sRegStartDt
     */
    public Date getsRegStartDt() {
        return sRegStartDt;
    }
    /**
     * @param sRegStartDt the sRegStartDt to set
     */
    public void setsRegStartDt(Date sRegStartDt) {
        this.sRegStartDt = sRegStartDt;
    }
    /**
     * @return the sRegEndDt
     */
    public Date getsRegEndDt() {
        return sRegEndDt;
    }
    /**
     * @param sRegEndDt the sRegEndDt to set
     */
    public void setsRegEndDt(Date sRegEndDt) {
        this.sRegEndDt = sRegEndDt;
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
     * @return the sFceSaleReqReasonCd
     */
    public String getsFceSaleReqReasonCd() {
        return sFceSaleReqReasonCd;
    }
    /**
     * @param sFceSaleReqReasonCd the sFceSaleReqReasonCd to set
     */
    public void setsFceSaleReqReasonCd(String sFceSaleReqReasonCd) {
        this.sFceSaleReqReasonCd = sFceSaleReqReasonCd;
    }
    /**
     * @return the sVinNo1
     */
    public String getsVinNo1() {
        return sVinNo1;
    }
    /**
     * @param sVinNo1 the sVinNo1 to set
     */
    public void setsVinNo1(String sVinNo1) {
        this.sVinNo1 = sVinNo1;
    }
    /**
     * @return the sVinNo2
     */
    public String getsVinNo2() {
        return sVinNo2;
    }
    /**
     * @param sVinNo2 the sVinNo2 to set
     */
    public void setsVinNo2(String sVinNo2) {
        this.sVinNo2 = sVinNo2;
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
     * @return the sRealDlStartDt
     */
    public Date getsRealDlStartDt() {
        return sRealDlStartDt;
    }
    /**
     * @param sRealDlStartDt the sRealDlStartDt to set
     */
    public void setsRealDlStartDt(Date sRealDlStartDt) {
        this.sRealDlStartDt = sRealDlStartDt;
    }
    /**
     * @return the sRealDlEndDt
     */
    public Date getsRealDlEndDt() {
        return sRealDlEndDt;
    }
    /**
     * @param sRealDlEndDt the sRealDlEndDt to set
     */
    public void setsRealDlEndDt(Date sRealDlEndDt) {
        this.sRealDlEndDt = sRealDlEndDt;
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
     * @return the sApproveStratDt
     */
    public Date getsApproveStratDt() {
        return sApproveStratDt;
    }
    /**
     * @param sApproveStratDt the sApproveStratDt to set
     */
    public void setsApproveStratDt(Date sApproveStratDt) {
        this.sApproveStratDt = sApproveStratDt;
    }
    /**
     * @return the sApproveEndDt
     */
    public Date getsApproveEndDt() {
        return sApproveEndDt;
    }
    /**
     * @param sApproveEndDt the sApproveEndDt to set
     */
    public void setsApproveEndDt(Date sApproveEndDt) {
        this.sApproveEndDt = sApproveEndDt;
    }
    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }
    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
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
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
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
     * @return the sSaleEmpNo
     */
    public String getsSaleEmpNo() {
        return sSaleEmpNo;
    }
    /**
     * @return the sOrdTp
     */
    public String getsOrdTp() {
        return sOrdTp;
    }
    /**
     * @param sSaleEmpNo the sSaleEmpNo to set
     */
    public void setsSaleEmpNo(String sSaleEmpNo) {
        this.sSaleEmpNo = sSaleEmpNo;
    }
    /**
     * @param sOrdTp the sOrdTp to set
     */
    public void setsOrdTp(String sOrdTp) {
        this.sOrdTp = sOrdTp;
    }
}
