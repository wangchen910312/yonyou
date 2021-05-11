package chn.bhmc.dms.core.support.excel;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ExcelUploadStatus implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -8094465136094552649L;

	/**
	 * 파일 업로드
	 */
	public static int FILE_UPLOAD = 1;

	/**
	 * 파일 업로드 완료
	 */
	public static int FILE_UPLOAD_COMPLETED = 2;

	/**
	 * 데이터 추출
	 */
	public static int DATA_EXTRACT = 3;

	/**
	 * 데이터 추출 완료
	 */
	public static int DATA_EXTRACT_COMPLATED = 4;

	/**
	 * 처리 완료
	 */
	public static int COMPLETED = 5;


	private int step = 0;
	private int totalRowsCount = 0;
	private int currentRowNum = 0;
	private List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

	public void init(){
		this.totalRowsCount = 0;
		this.currentRowNum = 0;
	}

	/**
	 * 처리단계를 설정한다.
	 * @param type
	 */
	public void setStep(int step){
		this.step = step;
	}

	/**
	 * 처리단계를 반환한다.
	 * @return
	 */
	public int getStep(){
		return this.step;
	}

	/**
	 * 전체 열의수를 설정한다.
	 */
	public void setTotalRowsCount(int totalRowsCount){
		this.totalRowsCount = totalRowsCount;
	}
	/**
	 * 전체 열의수를 반환한다.
	 */
	public int getTotalRowsCount(){
		return this.totalRowsCount;
	}
	/**
	 * 현재 처리된 열의 번호를 설정한다.
	 */
	public void setCurrentRowNum(int currentRowNum){
		this.currentRowNum = currentRowNum;
	}
	/**
	 * 현재 처리된 열의 번호를 반환한다.
	 */
	public int getCurrentRowNum(){
		if(this.currentRowNum >= this.totalRowsCount){
			return this.totalRowsCount;
		}
		return this.currentRowNum;
	}
	/**
	 * 업로드 진행율(%)을 반환한다.
	 */
	public int getProgressRate(){
		if(totalRowsCount <= 0){
			return 0;
		}

		if(this.currentRowNum >= this.totalRowsCount){
			return 100;
		}else{
			return (int)(((double)this.currentRowNum/this.totalRowsCount)*100);
		}

	}
	/**
	 * 에러를 등록한다.
	 * @param rowNum 에러 발생 열의 번호
	 * @param colNum 에러발생 컬럼의 번호
	 * @param fieldValue 에러발생한 컬럼의 값
	 * @param message 에러메세지
	 */
	public void addError(int rowNum, int colNum, String fieldValue, String message){
		errors.add(new ExcelUploadError(rowNum, colNum, fieldValue, message));
	}
	/**
	 * 에러를 등록한다.
	 * @param message 에러메세지
	 */
	public void addError(String message){
		errors.add(new ExcelUploadError(message));
	}

	public void addError(List<ExcelUploadError> errors){
		this.errors.addAll(errors);
	}

	/**
	 * 에러목록을 반환한다.
	 * @return
	 */
	public List<ExcelUploadError> getErrors(){
		return this.errors;
	}
	/**
	 * 에러가 있는지 여부를 반환한다.
	 * @return 에러가 있다면 true 그렇지 않다면 false를 반환한다.
	 */
	public boolean hasErrors(){
		return !this.errors.isEmpty();
	}
	/**
	 * 에러갯수를 반환한다.
	 * @return
	 */
	public int getErrorsCount(){
		return this.errors.size();
	}
}
