package chn.bhmc.dms.sal.rcp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 영수증관리 > 기동차통일영수증관리
 * </pre>
 *
 * @ClassName   : SalesVhclCbinRcitSearchVO.java
 * @Description : 영수증관리 > 기동차통일영수증관리
 * @author chibeom.song
 * @since 2017. 2. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 20.   chibeom.song     최초 생성
 * </pre>
 */

public class SalesVhclCbinRcitSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

 // 검색조건
    private String sDlrCds;
    private String sVinNo;
    private String sReceiptNo;
    private String sVinType;
    private String sUploadStat;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sCustSaleEdDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMachineStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMachineEdDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReceiptStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sReceiptEdDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadStDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sUploadEdDt;

    private String sCarId;

    private String sDlrCarTp;
    private String sTaxBeforeChk;
    private String sArea;
    private String sProvince;
    private String sSearchGubun;
    private String sTaxPayerId;

    private String sSdptCd;
    private String sDistOfficeCd;
    private String sSungCd;
    // 宫荣枢 2021-04-22 新增加筛选条件“发票状态”
    private String sReceiptStatus;
    // 宫荣枢 2021-04-30 新增语言
    private String sLangCd;

    private String sDlrCd;
    private String sDlrNm;
    /**
     * R19080700284 统一发票管理功能  贾明 2019-8-8 增加 初审、次月复核、 出库店代码 查询条件
     */
    private String sCertfst; //初审
    private String sCertnd; //次月复核
    private String sOrdDlrCd;//出库店代码
    private String sAppliRecode;//申请记录



    /**
     * @return the sSungCd
     */
    public String getsSungCd() {
        return sSungCd;
    }
    /**
     * @param sSungCd the sSungCd to set
     */
    public void setsSungCd(String sSungCd) {
        this.sSungCd = sSungCd;
    }
    /**
     * @return the sSdptCd
     */
    public String getsSdptCd() {
        return sSdptCd;
    }
    /**
     * @param sSdptCd the sSdptCd to set
     */
    public void setsSdptCd(String sSdptCd) {
        this.sSdptCd = sSdptCd;
    }
    /**
     * @return the sDistOfficeCd
     */
    public String getsDistOfficeCd() {
        return sDistOfficeCd;
    }
    /**
     * @param sDistOfficeCd the sDistOfficeCd to set
     */
    public void setsDistOfficeCd(String sDistOfficeCd) {
        this.sDistOfficeCd = sDistOfficeCd;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    public String getsDlrCd() {
        return sDlrCd;
    }
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }
    public String getsDlrNm() {
        return sDlrNm;
    }
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
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
     * @return the sVinType
     */
    public String getsVinType() {
        return sVinType;
    }
    /**
     * @param sVinType the sVinType to set
     */
    public void setsVinType(String sVinType) {
        this.sVinType = sVinType;
    }
    /**
     * @return the sUploadStat
     */
    public String getsUploadStat() {
        return sUploadStat;
    }
    /**
     * @param sUploadStat the sUploadStat to set
     */
    public void setsUploadStat(String sUploadStat) {
        this.sUploadStat = sUploadStat;
    }
    /**
     * @return the sCustSaleStDt
     */
    public Date getsCustSaleStDt() {
        return sCustSaleStDt;
    }
    /**
     * @param sCustSaleStDt the sCustSaleStDt to set
     */
    public void setsCustSaleStDt(Date sCustSaleStDt) {
        this.sCustSaleStDt = sCustSaleStDt;
    }
    /**
     * @return the sMachineStDt
     */
    public Date getsMachineStDt() {
        return sMachineStDt;
    }
    /**
     * @param sMachineStDt the sMachineStDt to set
     */
    public void setsMachineStDt(Date sMachineStDt) {
        this.sMachineStDt = sMachineStDt;
    }
    /**
     * @return the sMachineEdDt
     */
    public Date getsMachineEdDt() {
        return sMachineEdDt;
    }
    /**
     * @param sMachineEdDt the sMachineEdDt to set
     */
    public void setsMachineEdDt(Date sMachineEdDt) {
        this.sMachineEdDt = sMachineEdDt;
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
     * @return the sCustSaleEdDt
     */
    public Date getsCustSaleEdDt() {
        return sCustSaleEdDt;
    }
    /**
     * @param sCustSaleEdDt the sCustSaleEdDt to set
     */
    public void setsCustSaleEdDt(Date sCustSaleEdDt) {
        this.sCustSaleEdDt = sCustSaleEdDt;
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
     * @return the sDlrCarTp
     */
    public String getsDlrCarTp() {
        return sDlrCarTp;
    }
    /**
     * @param sDlrCarTp the sDlrCarTp to set
     */
    public void setsDlrCarTp(String sDlrCarTp) {
        this.sDlrCarTp = sDlrCarTp;
    }
    /**
     * @return the sTaxBeforeChk
     */
    public String getsTaxBeforeChk() {
        return sTaxBeforeChk;
    }
    /**
     * @param sTaxBeforeChk the sTaxBeforeChk to set
     */
    public void setsTaxBeforeChk(String sTaxBeforeChk) {
        this.sTaxBeforeChk = sTaxBeforeChk;
    }
    /**
     * @return the sArea
     */
    public String getsArea() {
        return sArea;
    }
    /**
     * @param sArea the sArea to set
     */
    public void setsArea(String sArea) {
        this.sArea = sArea;
    }
    /**
     * @return the sProvince
     */
    public String getsProvince() {
        return sProvince;
    }
    /**
     * @param sProvince the sProvince to set
     */
    public void setsProvince(String sProvince) {
        this.sProvince = sProvince;
    }
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
     * @return the sTaxPayerId
     */
    public String getsTaxPayerId() {
        return sTaxPayerId;
    }
    /**
     * @param sTaxPayerId the sTaxPayerId to set
     */
    public void setsTaxPayerId(String sTaxPayerId) {
        this.sTaxPayerId = sTaxPayerId;
    }
    public String getsReceiptStatus() {
        return sReceiptStatus;
    }
    public void setsReceiptStatus(String sReceiptStatus) {
        this.sReceiptStatus = sReceiptStatus;
    }
    public String getsLangCd() {
        return sLangCd;
    }
    public void setsLangCd(String sLangCd) {
        this.sLangCd = sLangCd;
    }
    public String getsDlrCds() {
        return sDlrCds;
    }
    public void setsDlrCds(String sDlrCds) {
        this.sDlrCds = sDlrCds;
    }
    /**
     * @return the sCertfst
     */
	public String getsCertfst() {
		return sCertfst;
	}
	/**
     * @param sCertfst the sCertfst to set
     */
	public void setsCertfst(String sCertfst) {
		this.sCertfst = sCertfst;
	}
	 /**
     * @return the sCertnd
     */
	public String getsCertnd() {
		return sCertnd;
	}
	/**
     * @param sCertnd the sCertnd to set
     */
	public void setsCertnd(String sCertnd) {
		this.sCertnd = sCertnd;
	}
	 /**
     * @return the sOrdDlrCd
     */
	public String getsOrdDlrCd() {
		return sOrdDlrCd;
	}
	/**
     * @param sOrdDlrCd the sOrdDlrCd to set
     */
	public void setsOrdDlrCd(String sOrdDlrCd) {
		this.sOrdDlrCd = sOrdDlrCd;
	}
	
	public String getsAppliRecode() {
		return sAppliRecode;
	}
	public void setsAppliRecode(String sAppliRecode) {
		this.sAppliRecode = sAppliRecode;
	}



}
