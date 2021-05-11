package chn.bhmc.dms.ser.ro.vo;

import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

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

public class CarCheckSaveVO extends TabInfoSaveVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1573999951037207581L;

    private CarCheckVO carCheckVO;

    private List<CarCheckDetailVO> carCheckDetailVO;

    /**
     * @return the carCheckVO
     */
    public CarCheckVO getCarCheckVO() {
        return carCheckVO;
    }

    /**
     * @param carCheckVO the carCheckVO to set
     */
    public void setCarCheckVO(CarCheckVO carCheckVO) {
        this.carCheckVO = carCheckVO;
    }

    /**
     * @return the carCheckDetailVO
     */
    public List<CarCheckDetailVO> getCarCheckDetailVO() {
        return carCheckDetailVO;
    }

    /**
     * @param carCheckDetailVO the carCheckDetailVO to set
     */
    public void setCarCheckDetailVO(List<CarCheckDetailVO> carCheckDetailVO) {
        this.carCheckDetailVO = carCheckDetailVO;
    }

}
