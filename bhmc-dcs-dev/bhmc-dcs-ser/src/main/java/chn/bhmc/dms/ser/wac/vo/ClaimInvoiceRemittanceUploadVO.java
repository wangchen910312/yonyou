package chn.bhmc.dms.ser.wac.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * 导入索赔发票汇款信息VO
 * </pre>
 *
 * @ClassName   : ClaimInvoiceRemittanceUploadVO.java
 * @Description : 导入索赔发票汇款信息VO
 * @author chen shengan
 * @since 2021. 4. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 09.     chen shengan        导入索赔发票汇款信息VO
 * </pre>
 */
public class ClaimInvoiceRemittanceUploadVO extends AbstractExcelDataBinder {
	
	/**
	 * 是否错误
	 */
	private String errorYn;
	
	/**
	 * 错误信息
	 */
	private String errorMessage;
	
	/**
	 * 上传时间
	 */
	private Date uploadDt;
	
	/**
	 * 经销商代码
	 */
	private String dlrCd;
	
	/**
	 * 结算单编号
	 */
	private String invcNo;
	
	/**
	 * 序号
	 */
	private int rnum;

	public String getErrorYn() {
		return errorYn;
	}

	public void setErrorYn(String errorYn) {
		this.errorYn = errorYn;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Date getUploadDt() {
		return uploadDt;
	}

	public void setUploadDt(Date uploadDt) {
		this.uploadDt = uploadDt;
	}

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getInvcNo() {
		return invcNo;
	}

	public void setInvcNo(String invcNo) {
		this.invcNo = invcNo;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public ClaimInvoiceRemittanceUploadVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public ClaimInvoiceRemittanceUploadVO(String errorYn, String errorMessage, Date uploadDt, String dlrCd,
			String invcNo, int rnum) {
		super();
		this.errorYn = errorYn;
		this.errorMessage = errorMessage;
		this.uploadDt = uploadDt;
		this.dlrCd = dlrCd;
		this.invcNo = invcNo;
		this.rnum = rnum;
	}

	@Override
	public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
		try{
            switch(cellNo){
                case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim());            break;          
                case 1:this.setInvcNo(ExcelDataBinderUtil.toString(value).trim());       break;          
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
		
	}

	@Override
	public List<ExcelUploadError> validate(ExcelDataBindContext context) {
		List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
		return errors;
	}

}
