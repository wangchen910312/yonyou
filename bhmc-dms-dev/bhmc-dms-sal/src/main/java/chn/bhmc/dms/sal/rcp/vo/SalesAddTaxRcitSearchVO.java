package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 영수증관리 > 부가세영수증관리
 * </pre>
 *
 * @ClassName   : SalesAddTaxRcitSearchVO.java
 * @Description : 영수증관리 > 부가세영수증관리
 * @author chibeom.song
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.   chibeom.song     최초 생성
 * </pre>
 */

public class SalesAddTaxRcitSearchVO extends SearchVO {

    private static final long serialVersionUID = 2924692645434750515L;

 // 검색조건
    private String sReceiptId;
    private String sDlrCd;
    private String sCarId;
    private int sSeq;
    private String sVinNo;
    private String sReceiptNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReceiptStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReceiptEdDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadEdDt;
    private String sPurchaseCom;
    // TangWei 2021/04/15 增加是否显示的状态字段
    private String showYn;


    public String getsReceiptId() {
		return sReceiptId;
	}
	public void setsReceiptId(String sReceiptId) {
		this.sReceiptId = sReceiptId;
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
     * @return the sCarId
     */
    public String getsCarId() {
        return sCarId;
    }
    /**
     * @param sCarId the sCarId to set
     */
    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
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
     * @return the sReceiptNo
     */
    public String getsReceiptNo() {
        return sReceiptNo;
    }
    /**
     * @param sReceiptNo the sReceiptNo to set
     */
    public void setsReceiptNo(String sReceiptNo) {
        this.sReceiptNo = sReceiptNo;
    }
    /**
     * @return the sReceiptStDt
     */
    public Date getsReceiptStDt() {
        return sReceiptStDt;
    }
    /**
     * @param sReceiptStDt the sReceiptStDt to set
     */
    public void setsReceiptStDt(Date sReceiptStDt) {
        this.sReceiptStDt = sReceiptStDt;
    }
    /**
     * @return the sReceiptEdDt
     */
    public Date getsReceiptEdDt() {
        return sReceiptEdDt;
    }
    /**
     * @param sReceiptEdDt the sReceiptEdDt to set
     */
    public void setsReceiptEdDt(Date sReceiptEdDt) {
        this.sReceiptEdDt = sReceiptEdDt;
    }
    /**
     * @return the sUploadStDt
     */
    public Date getsUploadStDt() {
        return sUploadStDt;
    }
    /**
     * @param sUploadStDt the sUploadStDt to set
     */
    public void setsUploadStDt(Date sUploadStDt) {
        this.sUploadStDt = sUploadStDt;
    }
    /**
     * @return the sUploadEdDt
     */
    public Date getsUploadEdDt() {
        return sUploadEdDt;
    }
    /**
     * @param sUploadEdDt the sUploadEdDt to set
     */
    public void setsUploadEdDt(Date sUploadEdDt) {
        this.sUploadEdDt = sUploadEdDt;
    }
    /**
     * @return the sPurchaseCom
     */
    public String getsPurchaseCom() {
        return sPurchaseCom;
    }
    /**
     * @param sPurchaseCom the sPurchaseCom to set
     */
    public void setsPurchaseCom(String sPurchaseCom) {
        this.sPurchaseCom = sPurchaseCom;
    }
    public String getShowYn() {
        return showYn;
    }
    public void setShowYn(String showYn) {
        this.showYn = showYn;
    }
    
    

}
