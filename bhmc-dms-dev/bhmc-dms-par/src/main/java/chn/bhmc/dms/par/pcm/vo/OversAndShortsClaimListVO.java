package chn.bhmc.dms.par.pcm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OversAndShortsClaimListVO.java
 * @Description : OversAndShortsClaimListVO.java
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
public class OversAndShortsClaimListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6540217638370198311L;

    /**
     * 과부족클레임VO
     */
    private OversAndShortsClaimVO oversAndShortsClaimVO;

    /**
     * 과부족클레임품목리스트VO
     */
    private List<OversAndShortsClaimItemVO> oversAndShortsClaimItemList;

    /**
     * @return the OversAndShortsClaimVO
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

    /**
     * @return the purcOrdItemList
     */
    public List<OversAndShortsClaimItemVO> getOversAndShortsClaimItemList() {
        return oversAndShortsClaimItemList;
    }

    /**
     * @param oversAndShortsClaimItemList the oversAndShortsClaimItemList to set
     */
    public void setOversAndShortsClaimItemList(List<OversAndShortsClaimItemVO> oversAndShortsClaimItemList) {
        this.oversAndShortsClaimItemList = oversAndShortsClaimItemList;
    }
}
