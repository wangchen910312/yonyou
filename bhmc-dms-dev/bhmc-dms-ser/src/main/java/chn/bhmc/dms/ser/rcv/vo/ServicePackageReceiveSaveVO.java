package chn.bhmc.dms.ser.rcv.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author KyungMok Kim
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     KyungMok Kim     최초 생성
 * </pre>
 */

@ValidDescriptor({

})

public class ServicePackageReceiveSaveVO extends BaseSaveVO<Object>{



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1573999958207207581L;

    private ServiceReceiveDetailVO serviceReceiveDetailVO;

    private List<ServicePackageReceiveVO> servicePackageReceiveSaveVO;

    /**
     * @return the serviceReceiveDetailVO
     */
    public ServiceReceiveDetailVO getServiceReceiveDetailVO() {
        return serviceReceiveDetailVO;
    }

    /**
     * @param serviceReceiveDetailVO the serviceReceiveDetailVO to set
     */
    public void setServiceReceiveDetailVO(ServiceReceiveDetailVO serviceReceiveDetailVO) {
        this.serviceReceiveDetailVO = serviceReceiveDetailVO;
    }

    /**
     * @return the servicePackageReceiveSaveVO
     */
    public List<ServicePackageReceiveVO> getServicePackageReceiveSaveVO() {
        return servicePackageReceiveSaveVO;
    }

    /**
     * @param servicePackageReceiveSaveVO the servicePackageReceiveSaveVO to set
     */
    public void setServicePackageReceiveSaveVO(List<ServicePackageReceiveVO> servicePackageReceiveSaveVO) {
        this.servicePackageReceiveSaveVO = servicePackageReceiveSaveVO;
    }

}
