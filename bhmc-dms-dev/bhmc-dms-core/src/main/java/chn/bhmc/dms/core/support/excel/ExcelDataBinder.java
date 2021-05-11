package chn.bhmc.dms.core.support.excel;

import java.util.List;

import org.springframework.context.MessageSource;

/**
 * 엑셀 데이터를 오브젝트에 매핑하기 위한 인터페이스
 * @author Kang Seok Han
 * @see ExcelReader
 */
public interface ExcelDataBinder {
	void setMessageSource(MessageSource messageSource);
	void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException;
	List<ExcelUploadError> validate(ExcelDataBindContext context);
	void setErrors(List<ExcelUploadError> errors);
	List<ExcelUploadError> getErrors();
	void setErrorCount(int errorCount);
	int getErrorCount();

}
