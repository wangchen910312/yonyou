package chn.bhmc.dms.bat.sal.rcp.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <p>Title: 车辆主信息</p>
 * @author Gongrs 2021年4月15日 下午7:00:20
 */
public class BatchVehicleMasterVO extends BaseVO {

    private static final long serialVersionUID = 1949258238699913552L;
    
    private String carId;
    
    // 变更类型
    private String temp4;
    
    // 保修开始日期
    private Date grteStartDt;
    
    // 绑定发票标识(01.未绑定、02.机动车发票、03.增值税发票)
    private String bindingReceiptFlag;

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getTemp4() {
        return temp4;
    }

    public void setTemp4(String temp4) {
        this.temp4 = temp4;
    }

    public Date getGrteStartDt() {
        return grteStartDt;
    }

    public void setGrteStartDt(Date grteStartDt) {
        this.grteStartDt = grteStartDt;
    }

    public String getBindingReceiptFlag() {
        return bindingReceiptFlag;
    }

    public void setBindingReceiptFlag(String bindingReceiptFlag) {
        this.bindingReceiptFlag = bindingReceiptFlag;
    }
}
