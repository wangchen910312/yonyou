package chn.bhmc.dms.sal.ass.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AssignSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 3. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 3.      Kim yewon              최초 생성
 * </pre>
 */

public class AssignSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String sDlrCd;                               // 딜러코드
    private String sContractNo;                          // 계약번호
    private String sContractCustNo;                      // 고객번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sContractStartDt;                     // 계약일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sContractEndDt;                       // 계약일 - 종료일
    private String sAssignYn;                            // 배정여부
    private String sContractTp;                          // 판매유형
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlReqStartDt;                        // 인도요청일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlReqEndDt;                          // 인도요청일 - 종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sDlReqDt;                             // 인도요청일
    private String sCarlineCd;                           // 차종코드
    private String sModelCd;                             // 모델코드
    private String sOcnCd;                               // OCN코드
    private String sExtColorCd;                          // 외장색코드
    private String sIntColorCd;                          // 내장색코드
    private String sVinNo;                               // 차대번호
    private String sVinNo1;                              // VIN NO1
    private String sVinNo2;                              // VIN NO2
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sAllocStartDt;                        // 배정일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sAllocEndDt;                          // 배정일 - 종료일
    private String sTabId;                               // TAB ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCancelStartDt;                       // 취소일 - 시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCancelEndDt;                         // 취소일 - 종료일

    //月结工具车辆对比2019/05/28 qian  start
    private String statCd;                              // statCd

    public String getStatCd() {
		return statCd;
	}
	public void setStatCd(String statCd) {
		this.statCd = statCd;
	}
	//月结工具车辆对比2019/05/28 qian  end
	
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
     * @return the sContractStartDt
     */
    public Date getsContractStartDt() {
        return sContractStartDt;
    }
    /**
     * @param sContractStartDt the sContractStartDt to set
     */
    public void setsContractStartDt(Date sContractStartDt) {
        this.sContractStartDt = sContractStartDt;
    }
    /**
     * @return the sContractEndDt
     */
    public Date getsContractEndDt() {
        return sContractEndDt;
    }
    /**
     * @param sContractEndDt the sContractEndDt to set
     */
    public void setsContractEndDt(Date sContractEndDt) {
        this.sContractEndDt = sContractEndDt;
    }
    /**
     * @return the sAssignYn
     */
    public String getsAssignYn() {
        return sAssignYn;
    }
    /**
     * @param sAssignYn the sAssignYn to set
     */
    public void setsAssignYn(String sAssignYn) {
        this.sAssignYn = sAssignYn;
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
     * @return the sDlReqStartDt
     */
    public Date getsDlReqStartDt() {
        return sDlReqStartDt;
    }
    /**
     * @param sDlReqStartDt the sDlReqStartDt to set
     */
    public void setsDlReqStartDt(Date sDlReqStartDt) {
        this.sDlReqStartDt = sDlReqStartDt;
    }
    /**
     * @return the sDlReqEndDt
     */
    public Date getsDlReqEndDt() {
        return sDlReqEndDt;
    }
    /**
     * @param sDlReqEndDt the sDlReqEndDt to set
     */
    public void setsDlReqEndDt(Date sDlReqEndDt) {
        this.sDlReqEndDt = sDlReqEndDt;
    }
    /**
     * @return the sDlReqDt
     */
    public Date getsDlReqDt() {
        return sDlReqDt;
    }
    /**
     * @param sDlReqDt the sDlReqDt to set
     */
    public void setsDlReqDt(Date sDlReqDt) {
        this.sDlReqDt = sDlReqDt;
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
     * @return the sExtColorCd
     */
    public String getsExtColorCd() {
        return sExtColorCd;
    }
    /**
     * @param sExtColorCd the sExtColorCd to set
     */
    public void setsExtColorCd(String sExtColorCd) {
        this.sExtColorCd = sExtColorCd;
    }
    /**
     * @return the sIntColorCd
     */
    public String getsIntColorCd() {
        return sIntColorCd;
    }
    /**
     * @param sIntColorCd the sIntColorCd to set
     */
    public void setsIntColorCd(String sIntColorCd) {
        this.sIntColorCd = sIntColorCd;
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
     * @return the sAllocStartDt
     */
    public Date getsAllocStartDt() {
        return sAllocStartDt;
    }
    /**
     * @param sAllocStartDt the sAllocStartDt to set
     */
    public void setsAllocStartDt(Date sAllocStartDt) {
        this.sAllocStartDt = sAllocStartDt;
    }
    /**
     * @return the sAllocEndDt
     */
    public Date getsAllocEndDt() {
        return sAllocEndDt;
    }
    /**
     * @param sAllocEndDt the sAllocEndDt to set
     */
    public void setsAllocEndDt(Date sAllocEndDt) {
        this.sAllocEndDt = sAllocEndDt;
    }
    /**
     * @return the sTabId
     */
    public String getsTabId() {
        return sTabId;
    }
    /**
     * @param sTabId the sTabId to set
     */
    public void setsTabId(String sTabId) {
        this.sTabId = sTabId;
    }
    /**
     * @return the sCancelStartDt
     */
    public Date getsCancelStartDt() {
        return sCancelStartDt;
    }
    /**
     * @param sCancelStartDt the sCancelStartDt to set
     */
    public void setsCancelStartDt(Date sCancelStartDt) {
        this.sCancelStartDt = sCancelStartDt;
    }
    /**
     * @return the sCancelEndDt
     */
    public Date getsCancelEndDt() {
        return sCancelEndDt;
    }
    /**
     * @param sCancelEndDt the sCancelEndDt to set
     */
    public void setsCancelEndDt(Date sCancelEndDt) {
        this.sCancelEndDt = sCancelEndDt;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
