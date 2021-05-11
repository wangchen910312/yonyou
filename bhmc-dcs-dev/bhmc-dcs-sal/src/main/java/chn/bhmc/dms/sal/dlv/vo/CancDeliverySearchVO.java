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

public class CancDeliverySearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1L;



    /**
     * Statements
     * (long)serialVersionUID
     */

    private String sDlrCd;                      //딜러코드
    private String sCarlineCd;                  //차종
    private String sCancReasonCd;               //취소사유
    private String sApproveYn;                  //승인상태
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqStartDt;                   //신청일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReqEndDt;                     //신청일자 - 종료일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveStartDt;               //승인일자 - 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sApproveEndDt;                 //승인일자 - 종료일자
    private String sSearchGubun;                //화면구분 - 승인화면
    private String sVinNo;                      //Vin number
  //Q21012900003 出库取消审批列表显示有无发票、发票核验结果。查询条件增加有无发票  JiaMing 2021-2-5 start
    private String sReceipYn;                      //Vin number
  //Q21012900003 出库取消审批列表显示有无发票、发票核验结果。查询条件增加有无发票 JiaMing 2021-2-5 end




    /**
     * @return the sSearchGubun
     */
    public String getsSearchGubun() {
        return sSearchGubun;
    }
    /**
     * @param sSearchGubun the sSearchGubun to set
     */
    public void setsSearchGubun(String sSearchGubun) {
        this.sSearchGubun = sSearchGubun;
    }
    /**
     * @return the sApproveYn
     */
    public String getsApproveYn() {
        return sApproveYn;
    }
    /**
     * @param sApproveYn the sApproveYn to set
     */
    public void setsApproveYn(String sApproveYn) {
        this.sApproveYn = sApproveYn;
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
     * @return the sCancReasonCd
     */
    public String getsCancReasonCd() {
        return sCancReasonCd;
    }
    /**
     * @param sCancReasonCd the sCancReasonCd to set
     */
    public void setsCancReasonCd(String sCancReasonCd) {
        this.sCancReasonCd = sCancReasonCd;
    }
    /**
     * @return the sReqStartDt
     */
    public Date getsReqStartDt() {
        return sReqStartDt;
    }
    /**
     * @param sReqStartDt the sReqStartDt to set
     */
    public void setsReqStartDt(Date sReqStartDt) {
        this.sReqStartDt = sReqStartDt;
    }
    /**
     * @return the sReqEndDt
     */
    public Date getsReqEndDt() {
        return sReqEndDt;
    }
    /**
     * @param sReqEndDt the sReqEndDt to set
     */
    public void setsReqEndDt(Date sReqEndDt) {
        this.sReqEndDt = sReqEndDt;
    }
    /**
     * @return the sApproveStartDt
     */
    public Date getsApproveStartDt() {
        return sApproveStartDt;
    }
    /**
     * @param sApproveStartDt the sApproveStartDt to set
     */
    public void setsApproveStartDt(Date sApproveStartDt) {
        this.sApproveStartDt = sApproveStartDt;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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
    
	public String getsReceipYn() {
		return sReceipYn;
	}
	public void setsReceipYn(String sReceipYn) {
		this.sReceipYn = sReceipYn;
	}


}
