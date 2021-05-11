package chn.bhmc.dms.core.support.idgen;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TableNameStrategy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface TableNameStrategy {
    public String makeTableName(String originalTableName);
}
