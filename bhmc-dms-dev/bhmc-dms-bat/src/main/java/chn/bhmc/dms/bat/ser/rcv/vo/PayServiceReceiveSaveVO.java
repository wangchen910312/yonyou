package chn.bhmc.dms.bat.ser.rcv.vo;


import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

@ValidDescriptor({

})
public class PayServiceReceiveSaveVO {

    PayServiceReceiveDetailVO serviceReceiveDetailVO;


    /**
     * @return the serviceReceiveDetailVO
     */
    public PayServiceReceiveDetailVO getServiceReceiveDetailVO() {
        return serviceReceiveDetailVO;
    }

    /**
     * @param serviceReceiveDetailVO the serviceReceiveDetailVO to set
     */
    public void setServiceReceiveDetailVO(PayServiceReceiveDetailVO serviceReceiveDetailVO) {
        this.serviceReceiveDetailVO = serviceReceiveDetailVO;
    }


}