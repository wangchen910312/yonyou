package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OversAndShortsClaimSaveVO.java
 * @Description : OversAndShortsClaimSaveVO.class
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */


public class OversAndShortsClaimSaveVO extends BaseSaveVO<OversAndShortsClaimItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;

    /**
     * 과부족클레임VO
     */
    private OversAndShortsClaimVO oversAndShortsClaimVO;

    /**
     * @return the oversAndShortsClaimVO
     */
    public OversAndShortsClaimVO getOversAndShortsClaimVO() {
        return oversAndShortsClaimVO;
    }

    /**
     * @param oversAndShortsClaimVO the oversAndShortsClaimVO to set
     */
    public void setOversAndShortsClaimVO(OversAndShortsClaimVO oversAndShortsClaimVO) {
        this.oversAndShortsClaimVO = oversAndShortsClaimVO;
    }
}
