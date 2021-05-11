package chn.bhmc.dms.security.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LoginError.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 7. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 12.     Kang Seok Han     최초 생성
 * </pre>
 */

public class LoginError implements Serializable {
    /**
     * 등록되지 않은 아이디 에러
     */
    public static final int ERROR_INVALID_USER_ID = 1;

    /**
     * 올바르지 않은 비밀번호 에러
     */
    public static final int ERROR_INVALID_PASSWORD = 2;

    /**
     * 아이디 비활성화 에러
     */
    public static final int ERROR_DISABLED_USER = 3;

    /**
     * 알려지지 않은 에러
     */
    public static final int ERROR_UNDIFINED = 4;

    /**
     *
     */
    private static final long serialVersionUID = -9091519828732883107L;

    private int errorCode = 0;
    private String errorMessage = null;

    public LoginError(int errorCode, String errorMessage) {
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
