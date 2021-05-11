/**
 * 데이터를 엑셀데이터로 변환하여 다운로드 하기위하여 구현할 인터페이스
 */
package chn.bhmc.dms.core.support.excel;

import java.io.IOException;
import java.util.Map;

import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import chn.bhmc.dms.core.support.excel.ExcelWriter.SpreadsheetWriter;

public interface ExcelDataCreater {

	/**
	 * 기본적으로 정의된  셀스타일 외에 추가적으로 사용할 셀스타일을 생성하여 styles에 저장한다.
	 * @param wb
	 * @param styles
	 */
	public void createStyle(XSSFWorkbook wb, Map<String, XSSFCellStyle> styles);

	/**
	 * 제목열을 생성한다.
	 * @param sw
	 * @param styles
	 * @throws IOException
	 *
	 * int styleIndex = styles.get("header").getIndex();
     * sw.createCell(0, "번호", styleIndex);
     * sw.createCell(1, "이름", styleIndex);
     * sw.createCell(2, "나이", styleIndex);
     *
	 */
	public void createHeader(SpreadsheetWriter sw, Map<String, XSSFCellStyle> styles) throws IOException;

	/**
	 * Row 를 생성한다.
	 * @param sw
	 * @param styles
	 * @param rowNum n번째 열을 구성할 목록 번호
	 * @throws IOException
	 *
	 *
	 * sw.createCell(0, 1);
     * sw.createCell(1, "홍길동");
     * sw.createCell(2, 20, styles.get("age").getIndex());
	 *
	 */
	public void createRow(SpreadsheetWriter sw, Map<String, XSSFCellStyle> styles, int rowNum) throws IOException;

	/**
	 * 엑셀로 저장할 목록의 수를 반환한다.
	 * @return
	 */
	public int getRowsCount();

	/**
	 * 엑셀 저장명을 반환한다.
	 * @return
	 */
	public String getSaveName();

	/**
	 * 임시저장 템플릿 파일명을 반환한다.
	 * @return
	 */
	public String getTemplateName();
}
