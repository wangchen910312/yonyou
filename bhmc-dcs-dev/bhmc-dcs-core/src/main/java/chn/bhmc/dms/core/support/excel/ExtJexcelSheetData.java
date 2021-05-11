package chn.bhmc.dms.core.support.excel;

import org.jxls.transform.jexcel.JexcelSheetData;

import jxl.Range;
import jxl.Sheet;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExtJexcelSheetData.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 16.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ExtJexcelSheetData extends JexcelSheetData {
    Sheet sheet;
    Range[] mergedCells;

    public static JexcelSheetData createSheetData(Sheet sheet, ExtJexcelTransformer transformer){
        ExtJexcelSheetData sheetData = new ExtJexcelSheetData();
        sheetData.setTransformer(transformer);
        sheetData.sheet = sheet;
        sheetData.sheetName = sheet.getName();
        sheetData.columnWidth = new int[256];
        for(int i = 0; i < 256; i++){
            sheetData.columnWidth[i] = sheet.getColumnView(i).getSize();
        }
        int numberOfRows = sheet.getRows();
        for(int i = 0; i < numberOfRows; i++){
            sheetData.rowDataList.add(ExtJexcelRowData.createRowData(sheet, i, transformer));
        }
        sheetData.mergedCells = sheet.getMergedCells();
        return sheetData;
    }

    public Sheet getSheet() {
        return sheet;
    }

    public Range[] getMergedCells(){
        return mergedCells;
    }
}
