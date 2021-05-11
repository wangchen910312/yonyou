package chn.bhmc.dms.core.web.bind.annotation;

import java.nio.file.AccessDeniedException;

import able.com.exception.BizException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.transaction.TransactionException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import chn.bhmc.dms.core.exception.Error;
import chn.bhmc.dms.core.exception.Errors;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExceptionHandlerAdvice.java
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

@EnableWebMvc
@ControllerAdvice
public class ExceptionHandlerAdvice {

    @Autowired
    MessageSource messageSource;

    @ExceptionHandler(BizException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Errors bizError(BizException ex, WebRequest request) {

        Errors errors = new Errors();
        errors.add(new Error(ex.getMessage(), ex.getClass().getSimpleName()));

        return errors;
    }

    @ExceptionHandler(DataAccessException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Errors dataAccessError(DataAccessException ex, WebRequest request) {

        Errors errors = new Errors();
        errors.add(new Error(ex.getMessage(), ex.getClass().getSimpleName()));

        return errors;
    }

    @ExceptionHandler(TransactionException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Errors transactionError(TransactionException ex, WebRequest request) {

        Errors errors = new Errors();
        errors.add(new Error(ex.getMessage(), ex.getClass().getSimpleName()));

        return errors;
    }

    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public Errors accessDeniedError(AccessDeniedException ex, WebRequest request) {

        Errors errors = new Errors();
        errors.add(new Error(ex.getMessage(), ex.getClass().getSimpleName()));

        return errors;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public Errors validationError(MethodArgumentNotValidException ex, WebRequest request) {

        Errors errors = new Errors();
        String exceptionClass = ex.getClass().getSimpleName();

        BindingResult bindingResult = ex.getBindingResult();

        ValidField[] validFields = resolveFieldNames(bindingResult.getTarget().getClass());

        for(FieldError error : bindingResult.getFieldErrors()){
            errors.add(new Error(resolveMessage(error, validFields), exceptionClass));
        }

        return errors;
    }

    private String resolveMessage(FieldError error, ValidField[] validFields){

        if(validFields == null){
            return error.getDefaultMessage();
        }

        for(ValidField validField : validFields){
            if(error.getField().endsWith(validField.field())){
                return String.format("%s %s %s", messageSource.getMessage(validField.mesgKey(), null, error.getField(), LocaleContextHolder.getLocale()), ":", error.getDefaultMessage());
            }
        }

        return error.getDefaultMessage();

    }

    private ValidField[] resolveFieldNames(Class<?> clazz){

        ValidField[] validFields = null;

        if(clazz.isAnnotationPresent(ValidDescriptor.class)){
            ValidDescriptor validDescriptor = clazz.getAnnotation(ValidDescriptor.class);
            validFields = validDescriptor.value();
        }

        return validFields;
    }

}
