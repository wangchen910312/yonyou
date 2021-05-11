package chn.bhmc.dms.core.support.tree;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : KendoTreeSpriteCssClassBuilder.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 11. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface KendoTreeSpriteCssClassBuilder<T> {
    public String build(boolean isRoot, boolean isLeaf, T model);
}
