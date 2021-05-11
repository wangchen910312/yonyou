package chn.bhmc.dms.par.cpm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 기술자문 검색 VO
 *
 * @ClassName   : SkillAndQnaSearchVO.java
 * @Description : SkillAndQnaSearchVO Class
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */
public class SkillAndQnaSaveVO {

    /**
     * 기술자문헤더 저장 VO
     **/
    private SkillAndQnaHeaderVO skillAndQnaHeaderVO;

    /**
     * 기술자문상세 리스트 저장 VO
     **/
    private BaseSaveVO<SkillAndQnaDetailVO> skillAndQnaDetailVO;

    /**
     * 기술자문전송구분
     **/
    private String skillAndQnaSendYn = "N";

    /**
     * @return the skillAndQnaHeaderVO
     */
    public SkillAndQnaHeaderVO getSkillAndQnaHeaderVO() {
        return skillAndQnaHeaderVO;
    }

    /**
     * @param skillAndQnaHeaderVO the skillAndQnaHeaderVO to set
     */
    public void setSkillAndQnaHeaderVO(SkillAndQnaHeaderVO skillAndQnaHeaderVO) {
        this.skillAndQnaHeaderVO = skillAndQnaHeaderVO;
    }

    /**
     * @return the skillAndQnaDetailVO
     */
    public BaseSaveVO<SkillAndQnaDetailVO> getSkillAndQnaDetailVO() {
        return skillAndQnaDetailVO;
    }

    /**
     * @param skillAndQnaDetailVO the skillAndQnaDetailVO to set
     */
    public void setSkillAndQnaDetailVO(BaseSaveVO<SkillAndQnaDetailVO> skillAndQnaDetailVO) {
        this.skillAndQnaDetailVO = skillAndQnaDetailVO;
    }

    /**
     * @return the skillAndQnaSendYn
     */
    public String getSkillAndQnaSendYn() {
        return skillAndQnaSendYn;
    }

    /**
     * @param skillAndQnaSendYn the skillAndQnaSendYn to set
     */
    public void setSkillAndQnaSendYn(String skillAndQnaSendYn) {
        this.skillAndQnaSendYn = skillAndQnaSendYn;
    }
}
