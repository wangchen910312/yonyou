package chn.bhmc.dms.core.support.excel;

import org.jxls.common.CellData;
import org.jxls.common.CellRef;
import org.jxls.common.RowData;
import org.jxls.transform.jexcel.JexcelRowData;

import jxl.Cell;
import jxl.CellView;
import jxl.Sheet;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExtJexcelRowData.java
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

public class ExtJexcelRowData extends JexcelRowData {
    Cell[] cells;

    public static RowData createRowData(Sheet sheet, int rowNum, ExtJexcelTransformer transformer){
        return createRowData(sheet.getName(), sheet.getRow(rowNum), sheet.getRowView(rowNum), transformer);
    }

    public static RowData createRowData(String sheetName, Cell[] cells, CellView rowCellView, ExtJexcelTransformer transformer){
        if( cells == null ) return null;
        ExtJexcelRowData rowData = new ExtJexcelRowData();
        rowData.setTransformer( transformer );
        rowData.cells = cells;
        rowData.height = rowCellView.getSize();
        int numberOfCells = cells.length;
        for(int cellIndex = 0; cellIndex < numberOfCells; cellIndex++){
            Cell cell = cells[cellIndex];
            if(cell != null ){
                CellData cellData = ExtJexcelCellData.createCellData(new CellRef(sheetName, cell.getRow(), cellIndex), cell);
                cellData.setTransformer(transformer);
                rowData.addCellData(cellData);
            }else{
                rowData.addCellData(null);
            }
        }
        return rowData;
    }

    public Cell[] getRow() {
        return cells;
    }
}
