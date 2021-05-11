package chn.bhmc.dms.core.support.excel;

import java.io.Serializable;

public class ExcelUploadError implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -6578883941022665587L;

	/**
	 * 에러가 발생한 열의 번호
	 */
	private int row = 0;
	/**
	 * 에러가 발생한 필드(컬럼)의 번호
	 */
	private int col = 0;
	/**
	 * 에러발생한 필드(컬럼)의 값
	 */
	private String fieldValue = null;
	/**
	 * 에러메세지
	 */
	private String errorMessage = null;

	public ExcelUploadError(String errorMessage){
		this.errorMessage = errorMessage;
	}

	public ExcelUploadError(int rowNum, int colNum, String fieldValue, String errorMessage){
		this.row = rowNum;
		this.col = colNum;
		this.fieldValue = fieldValue;
		this.errorMessage = errorMessage;
	}

	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

}
