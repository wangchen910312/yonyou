package chn.bhmc.dms.sal.ond.vo;

import chn.bhmc.dms.core.datatype.BaseSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GradeSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Choi Kyung Yong
 * @since 2017. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 7.     Choi Kyung Yong     최초 생성
 * </pre>
 */

public class GradeSearchVO extends BaseSearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 930254041685854666L;

    private String modelCd;
    private String ocnCd;
    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }
    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
    }
    /**
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
}
