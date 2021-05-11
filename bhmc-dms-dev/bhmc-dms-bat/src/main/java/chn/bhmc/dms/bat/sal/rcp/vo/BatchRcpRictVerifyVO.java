package chn.bhmc.dms.bat.sal.rcp.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <p>Title: 发票上传信息</p>
 * @author Gongrs 2021年3月31日 下午2:37:03
 */
public class BatchRcpRictVerifyVO extends BaseVO {

    private static final long serialVersionUID = 1949258238699913551L;
    
    private String appReceiptId;
    
    private String receiptNo;
    
    private String receiptCd;
    
    private Date receiptIssDt;
    
    private String sumAmt;
    
    private Date scanDt;
    
    private String certFst;
    
    private String receiptResource;
    
    private String receiptInResource;
    
    private String receiptStatus;

    public String getAppReceiptId() {
        return appReceiptId;
    }

    public void setAppReceiptId(String appReceiptId) {
        this.appReceiptId = appReceiptId;
    }

    public String getReceiptNo() {
        return receiptNo;
    }
    
    public void setReceiptNo(String receiptNo) {
        this.receiptNo = receiptNo;
    }
    
    public String getReceiptCd() {
        return receiptCd;
    }
    
    public void setReceiptCd(String receiptCd) {
        this.receiptCd = receiptCd;
    }

    public Date getReceiptIssDt() {
        return receiptIssDt;
    }

    public void setReceiptIssDt(Date receiptIssDt) {
        this.receiptIssDt = receiptIssDt;
    }

    public String getSumAmt() {
        return sumAmt;
    }

    public void setSumAmt(String sumAmt) {
        this.sumAmt = sumAmt;
    }

    public Date getScanDt() {
        return scanDt;
    }

    public void setScanDt(Date scanDt) {
        this.scanDt = scanDt;
    }

    public String getCertFst() {
        return certFst;
    }

    public void setCertFst(String certFst) {
        this.certFst = certFst;
    }

    public String getReceiptResource() {
        return receiptResource;
    }

    public void setReceiptResource(String receiptResource) {
        this.receiptResource = receiptResource;
    }

    public String getReceiptInResource() {
        return receiptInResource;
    }

    public void setReceiptInResource(String receiptInResource) {
        this.receiptInResource = receiptInResource;
    }

    public String getReceiptStatus() {
        return receiptStatus;
    }

    public void setReceiptStatus(String receiptStatus) {
        this.receiptStatus = receiptStatus;
    }
}
