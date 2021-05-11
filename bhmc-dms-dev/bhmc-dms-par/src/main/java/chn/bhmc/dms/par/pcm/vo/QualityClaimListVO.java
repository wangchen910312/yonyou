package chn.bhmc.dms.par.pcm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : QualityClaimListVO.java
 * @Description : QualityClaimListVO.class
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


public class QualityClaimListVO extends BaseVO implements Serializable{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2791818344189396054L;


    private  List<QualityClaimVO>    qualityClaimList;


    /**
     * @return the qualityClaimList
     */
    public List<QualityClaimVO> getQualityClaimList() {
        return qualityClaimList;
    }


    /**
     * @param qualityClaimList the qualityClaimList to set
     */
    public void setQualityClaimList(List<QualityClaimVO> qualityClaimList) {
        this.qualityClaimList = qualityClaimList;
    }

}
