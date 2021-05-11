package chn.bhmc.dms.core.support.idgen;

import egovframework.rte.fdl.idgnr.EgovIdGnrStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SimpleIdGnrStrategyImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 16.     Kang Seok Han     최초 생성
 * </pre>
 */

public abstract class AbstractIdGnrStrategyImpl implements EgovIdGnrStrategy {

    private static final int DEFAULT_CIPERS = 5;

    // 정책으로 입력된 prefix
    private String prefix;

    // 자리수로 디폴트는 5자리
    private int cipers = DEFAULT_CIPERS;

    // 채울 charater로 기본은 '0'
    private char fillChar = '0';

    /**
     * 생성자.
     */
    public AbstractIdGnrStrategyImpl() {
        super();
    }

    /**
     * 생성자.
     *
     * @param prefix prefix
     * @param cipers cipers
     * @param fillChar fillChar
     */
    public AbstractIdGnrStrategyImpl(String prefix, int cipers, char fillChar) {
        super();
        this.prefix = prefix;
        this.cipers = cipers;
        this.fillChar = fillChar;
    }


    /**
     * 생성된 String 타입의 ID를 입력받아서 정책으로 입력된 PREFIX에 기본 채울
     * 문자를 지정 길이만큼 넣어서 아이디 생성.
     *
     * @param originalId original id to be converted
     * @return assembled id
     */
    public String makeId(String originalId) {
        return buildPrefix(prefix) + fillString(originalId, fillChar, cipers);
    }

    public abstract String buildPrefix(String prefix);

    /**
     * 정책정보.
     *
     * @param cipers cipers
     */
    public void setCipers(int cipers) {
        this.cipers = cipers;
    }

    /**
     * Prefix.
     *
     * @param prefix prefix
     */
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    /**
     * properties.
     *
     * @param fillChar fillChar
     */
    public void setFillChar(char fillChar) {
        this.fillChar = fillChar;
    }

    /**
     * 대상 길이만큼 디폴트 Char로 채우기.
     */
    public static String fillString(String originalStr, char ch, int cipers) {
        int originalStrLength = originalStr.length();

        if (cipers < originalStrLength) {
            return null;
        }

        int difference = cipers - originalStrLength;

        StringBuffer strBuf = new StringBuffer();
        for (int i = 0; i < difference; i++) {
            strBuf.append(ch);
        }

        strBuf.append(originalStr);

        return strBuf.toString();
    }

}
