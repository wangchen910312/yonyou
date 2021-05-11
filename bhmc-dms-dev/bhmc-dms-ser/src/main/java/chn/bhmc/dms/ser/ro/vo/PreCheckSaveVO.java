package chn.bhmc.dms.ser.ro.vo;

import java.util.List;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.ser.cmm.vo.TabInfoSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PreCheckSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

@ValidDescriptor({

})

public class PreCheckSaveVO extends TabInfoSaveVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1573999902037207581L;

    private PreCheckVO preCheckVO;

    private List<PreCheckDetailVO> preCheckDetailVO;

    /**
     * @return the preCheckVO
     */
    public PreCheckVO getPreCheckVO() {
        return preCheckVO;
    }

    /**
     * @param preCheckVO the preCheckVO to set
     */
    public void setPreCheckVO(PreCheckVO preCheckVO) {
        this.preCheckVO = preCheckVO;
    }


    /**
     * @return the preCheckDetailVO
     */
    public List<PreCheckDetailVO> getPreCheckDetailVO() {
        return preCheckDetailVO;
    }

    /**
     * @param preCheckDetailVO the preCheckDetailVO to set
     */
    public void setPreCheckDetailVO(List<PreCheckDetailVO> preCheckDetailVO) {
        this.preCheckDetailVO = preCheckDetailVO;
    }

}
