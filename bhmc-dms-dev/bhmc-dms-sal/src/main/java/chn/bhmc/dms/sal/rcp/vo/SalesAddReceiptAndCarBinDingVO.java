package chn.bhmc.dms.sal.rcp.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

public class SalesAddReceiptAndCarBinDingVO extends BaseVO{
    
    private static final long serialVersionUID = 8835548827065572989L;
    
    private String receiptId;
    
    private String receiptNo;
    
    private String receiptCd;
    
    private String carId;
    
    private String vinNo;

    public String getReceiptId() {
        return receiptId;
    }

    public void setReceiptId(String receiptId) {
        this.receiptId = receiptId;
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

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    
}
