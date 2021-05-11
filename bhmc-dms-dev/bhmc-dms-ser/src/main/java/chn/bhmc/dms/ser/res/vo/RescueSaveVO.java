package chn.bhmc.dms.ser.res.vo;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RescueSaveVO.java
 * @Description : 구원서비스 마스터 VO
 * @author YIN XUEYUAN
 * @since 2016. 6. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 19.    YIN XUEYUAN     최초 생성
 * </pre>
 */

@ValidDescriptor({

})
public class RescueSaveVO extends TabInfoSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2203335642180747165L;

    RescueVO rescueVO;

    public RescueVO getRescueVO() {
        return rescueVO;
    }

    public void setRescueVO(RescueVO rescueVO) {
        this.rescueVO = rescueVO;
    }

}