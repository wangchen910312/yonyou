package chn.bhmc.dms.core.exception;

import java.util.ArrayList;
import java.util.List;

import able.com.exception.BizException;

import org.springframework.validation.FieldError;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ValidationException.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ValidationException extends BizException {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9075511430932587894L;

    private List<FieldError> errors = new ArrayList<FieldError>();

    public ValidationException(){
        super();
    }

    public ValidationException(List<FieldError> errors){
        this.errors = errors;
    }

    public List<FieldError> getErrors() {
        return errors;
    }

    public void setErrors(List<FieldError> errors) {
        this.errors = errors;
    }
}
