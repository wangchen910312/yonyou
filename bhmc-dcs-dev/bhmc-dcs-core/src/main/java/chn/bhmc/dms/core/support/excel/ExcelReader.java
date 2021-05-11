package chn.bhmc.dms.core.support.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;

/**
 * 엑셀파일 정보를 ExcelDataBinder를 구현한 객체목록으로 구성한다.
 *
 * @author 한강석
 *
 * @param <T>
 */
public class ExcelReader<T extends ExcelDataBinder> {

    private static final Logger log = LoggerFactory
            .getLogger(ExcelReader.class);

    private DefaultExcelDataBindContext context = new DefaultExcelDataBindContext();

    MessageSource messageSource;
    Class<T> clazz;

    /**
     * 제목열을 스킵하기 위한 값을 설정한다.
     */
    int skipRows = -1;

    Workbook wb = null;
    Sheet sheet = null;
    int totalRows = 0;      //총목록수
    int readRows = 0;       //총읽은 목록수
    List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();



    public ExcelDataBindContext getContext() {
        return context;
    }

    public List<ExcelUploadError> getErrors(){
        return this.errors;
    }

    public void setMessageSource(MessageSource messageSource){
        this.messageSource = messageSource;
    }

    /**
     * 총 목록수를 반환한다.
     * @return
     */
    public int getTotalRows(){
        if(this.skipRows >= 0){
            return this.totalRows - (skipRows + 1);
        }else{
            return this.totalRows;
        }
    }

    /**
     * 현재 읽어들인 목록수를 반환한다.
     * @return
     */
    public int getReadRows(){
        return this.readRows;
    }

    public ExcelReader(Class<T> clazz) {
        this.clazz = clazz;
    }

    public ExcelReader(Class<T> clazz, InputStream inp, int sheetNumber)
            throws IOException, InvalidFormatException {
        this.clazz = clazz;
        new WorkbookFactory();
        try{
            wb = WorkbookFactory.create(inp);
            sheet = wb.getSheetAt(sheetNumber);
            totalRows = sheet.getPhysicalNumberOfRows();

        }catch(Exception e){
        }finally{
            try{
                inp.close();
                log.debug("InputStream Closed");
            }catch(Exception  e){}
        }

        log.debug("NumberOfSheets : " + wb.getNumberOfSheets());
        log.debug("SheetName : " + sheet.getSheetName());
        log.debug("NumberOfRows : " + sheet.getPhysicalNumberOfRows());
    }

    public ExcelReader(Class<T> clazz, File excelFile, int sheetNumber)
            throws InvalidFormatException, IOException {
        this(clazz, new FileInputStream(excelFile), sheetNumber);
    }

    public ExcelReader(Class<T> clazz, String excelFilePath, int sheetNumber) throws InvalidFormatException, IOException {
        this(clazz, new File(excelFilePath), sheetNumber);
    }

    /**
     *
     * @param rows
     */
    public void setSkipRows(int rows){
        this.skipRows = rows;
    }

    public T createInstance() throws IllegalAccessException,
            InstantiationException {
        return clazz.newInstance();
    }

    public List<T> readExcelData() throws IllegalAccessException, InstantiationException, ExcelDataBindingException {
        return readExcelData(null);
    }

    public List<T> readExcelData(ExcelUploadStatus status) throws IllegalAccessException, InstantiationException, ExcelDataBindingException {

        //데이터 추출 시작
        if(status != null){
            status.setStep(ExcelUploadStatus.DATA_EXTRACT); //상태코드 변경 - 데이터 추출 시작
            status.setTotalRowsCount(this.getTotalRows());  //총 목록수 설정
        }

        List<T> list = new ArrayList<T>();
        Integer nRow = 0;
        Integer nCol = 0;

        log.debug("Read Start");

        for (Row row : sheet) {

            nRow = row.getRowNum();
            this.readRows = nRow;

            //현재진행중인 열의 번호를 설정한다.
            if(status != null){
                status.setCurrentRowNum(this.getReadRows());
            }

            log.debug("RowNum : " + nRow);

            //제목줄을 포함하는 경우 skip
            if(nRow <= skipRows){
                continue;
            }

            T obj = createInstance();
            obj.setMessageSource(messageSource);
            Object value = null;


                for (Cell cell : row) {

                    nCol = cell.getColumnIndex();

                    log.debug("nCol : " + nCol);

                    try{
                        switch (cell.getCellType()) {
                            case Cell.CELL_TYPE_STRING:
                                value = cell.getStringCellValue();
                                break;

                            case Cell.CELL_TYPE_NUMERIC:
                                if (DateUtil.isCellDateFormatted(cell)) value = cell.getDateCellValue();
                                else value = cell.getNumericCellValue();
                                break;

                            case Cell.CELL_TYPE_BOOLEAN:
                                value = cell.getBooleanCellValue();
                                break;

                            case Cell.CELL_TYPE_FORMULA:
                                /* 계산식의 경우 계산식을 리턴 */
                                //obj.bind(nCol, cell.getCellFormula());
                                value = cell.getStringCellValue();
                                break;

                            default:
                                value = "";
                        }

                        obj.bind(nRow, nCol, value);

                        log.debug("value : " + value);

                    }catch(ExcelDataBindingException e){
                        obj.getErrors().add(new ExcelUploadError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage()));
//                      throw e;
                    }catch(Exception e){
                        obj.getErrors().add(new ExcelUploadError(nRow+1, nCol, value+"", e.getMessage()));
//                      ExcelDataBindingException bindingException = new ExcelDataBindingException(e.getMessage(), e);
//                      bindingException.setRowNo(nRow+1);
//                      bindingException.setColNo(nCol);
//                      bindingException.setFieldValue(value+"");
//
//                      throw bindingException;

                    }

                }

                context.setRow(nRow);

                List<ExcelUploadError> validationErrors = obj.validate(context);
                if(validationErrors != null && validationErrors.size() > 0){
                    obj.getErrors().addAll(validationErrors);
                }

                obj.setErrorCount(obj.getErrors().size());
                list.add(obj);



        }

        log.debug("엑셀데이터 추출 목록수 : " + list.size());

        //데이터 추출 완료
        if(status != null){
            status.setStep(ExcelUploadStatus.DATA_EXTRACT_COMPLATED);   //상태코드 변경 - 데이터 추출 완료
        }

        return list;

    }
}
