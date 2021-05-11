package chn.bhmc.dms.dply.spec.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3169896687164800888L;

    private SpecBasicVO specBasicVO;

    private SpecSqlVO SpecSqlVO;

    private SpecPrtyVO specPrtyVO;

    /**
     * @param specBasicVO the specBasicVO to set
     */
    public void setSpecBasicVO(SpecBasicVO specBasicVO) {
        this.specBasicVO = specBasicVO;
    }

    /**
     * @return the specBasicVO
     */
    public SpecBasicVO getSpecBasicVO() {
        return specBasicVO;
    }

    /**
     * @param specSqlVO the specSqlVO to set
     */
    public void setSpecSqlVO(SpecSqlVO specSqlVO) {
        SpecSqlVO = specSqlVO;
    }

    /**
     * @return the specSqlVO
     */
    public SpecSqlVO getSpecSqlVO() {
        return SpecSqlVO;
    }

    /**
     * @param specPrtyVO the specPrtyVO to set
     */
    public void setSpecPrtyVO(SpecPrtyVO specPrtyVO) {
        this.specPrtyVO = specPrtyVO;
    }

    /**
     * @return the specPrtyVO
     */
    public SpecPrtyVO getSpecPrtyVO() {
        return specPrtyVO;
    }



}
