package chn.bhmc.dms.core.support.excel;

public class ExcelDataBindingException extends Exception {

	/**
	 *
	 */
	private static final long serialVersionUID = 7494491864509998556L;

	private int rowNo = 0;
	private int colNo = 0;
	private String fieldValue = null;


	public int getRowNo() {
		return rowNo;
	}

	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}

	public int getColNo() {
		return colNo;
	}

	public void setColNo(int colNo) {
		this.colNo = colNo;
	}

	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public ExcelDataBindingException(String msg){
		super(msg);
	}

	public ExcelDataBindingException(int rowNo, int colNo, String fieldValue, String message){
		super(message);
		this.rowNo = rowNo;
		this.colNo = colNo;
		this.fieldValue = fieldValue;
	}

	public ExcelDataBindingException(String message, Throwable cause) {
        super(message, cause);
    }

	public ExcelDataBindingException(int rowNo, int colNo, String fieldValue, String message, Throwable cause){
		super(message, cause);
		this.rowNo = rowNo;
		this.colNo = colNo;
		this.fieldValue = fieldValue;
	}

}
