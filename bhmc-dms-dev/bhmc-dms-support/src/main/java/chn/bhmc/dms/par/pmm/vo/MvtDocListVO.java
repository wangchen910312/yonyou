package chn.bhmc.dms.par.pmm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MvtDocListVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 2. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 29.     Ju Won Lee     최초 생성
 * </pre>
 */

public class MvtDocListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7182710908109382421L;

    /**
     * 수불문서VO
     */
    private MvtDocVO mvtDocVO;

    /**
     * 수불아이템VO
     */
    private List<MvtDocItemVO> mvtDocItemVO;

    /**
     * @return the mvtDocVO
     */
    public MvtDocVO getMvtDocVO() {
        return mvtDocVO;
    }

    /**
     * @param mvtDocVO the mvtDocVO to set
     */
    public void setMvtDocVO(MvtDocVO mvtDocVO) {
        this.mvtDocVO = mvtDocVO;
    }

    /**
     * @return the mvtDocItemVO
     */
    public List<MvtDocItemVO> getMvtDocItemVO() {
        return mvtDocItemVO;
    }

    /**
     * @param mvtDocItemVO the mvtDocItemVO to set
     */
    public void setMvtDocItemVO(List<MvtDocItemVO> mvtDocItemVO) {
        this.mvtDocItemVO = mvtDocItemVO;
    }
}
