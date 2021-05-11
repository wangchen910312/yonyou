/* ====================================================================
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
==================================================================== */

package chn.bhmc.dms.core.support.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Demonstrates a workaround you can use to generate large workbooks and avoid OutOfMemory exception.
 *
 * The trick is as follows:
 * 1. create a template workbook, create sheets and global objects such as cell styles, number formats, etc.
 * 2. create an application that streams data in a text file
 * 3. Substitute the sheet in the template with the generated data
 *
 * <p>
 *      Since 3.8-beta3 POI provides a low-memory footprint SXSSF API which implementing the "BigGridDemo" strategy.
 *      XSSF is an API-compatible streaming extension of XSSF to be used when
 *      very large spreadsheets have to be produced, and heap space is limited.
 *      SXSSF achieves its low memory footprint by limiting access to the rows that
 *      are within a sliding window, while XSSF gives access to all rows in the
 *      document. Older rows that are no longer in the window become inaccessible,
 *      as they are written to the disk.
 * </p>
 * See <a "http://poi.apache.org/spreadsheet/how-to.html#sxssf">
 *     http://poi.apache.org/spreadsheet/how-to.html#sxssf</a>.

 *
 * @author Yegor Kozlov
 */
public class ExcelWriter {

    private static final String XML_ENCODING = "UTF-8";
    private static final Logger log = LoggerFactory
	.getLogger(ExcelWriter.class);

    public static void write(ExcelDataCreater creater, OutputStream out) throws Exception {

        FileOutputStream fos = null;
        Writer fw = null;

    	try{
	        XSSFWorkbook wb = new XSSFWorkbook();
	        XSSFSheet sheet = wb.createSheet("Sheet1");

	        Map<String, XSSFCellStyle> styles = createStyles(wb);
	        //name of the zip entry holding sheet data, e.g. /xl/worksheets/sheet1.xml
	        String sheetRef = sheet.getPackagePart().getPartName().getName();

	        //스타일 생성 호출
	        creater.createStyle(wb, styles);

            fos = new FileOutputStream(creater.getTemplateName() + ".xlsx");
        	wb.write(fos);

	        //Step 2. Generate XML file.
	        File tmp = File.createTempFile(creater.getTemplateName(), ".xml");

            fw = new OutputStreamWriter(new FileOutputStream(tmp), XML_ENCODING);
        	generate(fw, styles, creater);

	        substitute(new File(creater.getTemplateName() + ".xlsx"), tmp, sheetRef.substring(1), out);

    	}catch(Exception e){
    		log.error(e.getMessage(), e);
        	throw e;
    	}finally{
    	    if(fos != null){
                try{
                    fos.close();
                }catch(IOException e){}
            }

    	    if(fw != null){
                try{
                    fw.close();
                }catch(IOException e){}
            }
    	}
    }

    /**
     * Create a library of cell styles.
     */
    private static Map<String, XSSFCellStyle> createStyles(XSSFWorkbook wb){
        Map<String, XSSFCellStyle> styles = new HashMap<String, XSSFCellStyle>();
        XSSFDataFormat fmt = wb.createDataFormat();

        //헤더
        XSSFCellStyle headerStyle = wb.createCellStyle();
        XSSFFont headerFont = wb.createFont();
        headerFont.setBold(true);
        headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        headerStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
        headerStyle.setFont(headerFont);
        setBorderStyle(headerStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("header", headerStyle);

        XSSFCellStyle defaultStyle = wb.createCellStyle();
        defaultStyle.setAlignment(CellStyle.ALIGN_LEFT);
        setBorderStyle(defaultStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("default", defaultStyle);

        //퍼센트
        XSSFCellStyle percentStyle = wb.createCellStyle();
        percentStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        percentStyle.setDataFormat(fmt.getFormat("0.0%"));
        setBorderStyle(percentStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("percent", percentStyle);

        //US달러
        XSSFCellStyle usdStyle = wb.createCellStyle();
        usdStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        usdStyle.setDataFormat(fmt.getFormat("$#,##0.00"));
        setBorderStyle(usdStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("usd", usdStyle);


        //날짜
        XSSFCellStyle dateStyle = wb.createCellStyle();
        dateStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        dateStyle.setDataFormat(fmt.getFormat("yyyy-MM-dd"));
        setBorderStyle(dateStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("date", dateStyle);


        //금액
        XSSFCellStyle amountStyle = wb.createCellStyle();
        amountStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        amountStyle.setDataFormat(fmt.getFormat("#,##0.000000"));
        setBorderStyle(amountStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("amount", amountStyle);

        //수량
        XSSFCellStyle qtyStyle = wb.createCellStyle();
        qtyStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        qtyStyle.setDataFormat(fmt.getFormat("#,##0.000000"));
        setBorderStyle(qtyStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("qty", qtyStyle);

        //단가
        XSSFCellStyle priceStyle = wb.createCellStyle();
        priceStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        priceStyle.setDataFormat(fmt.getFormat("#,##0.000000"));
        setBorderStyle(priceStyle, BorderStyle.THIN, IndexedColors.BLACK.getIndex());
        styles.put("price", priceStyle);

        return styles;
    }

    private static void generate(Writer out, Map<String, XSSFCellStyle> styles, ExcelDataCreater creater) throws IOException {

        SpreadsheetWriter sw = new SpreadsheetWriter(out);
        sw.beginSheet();

        //insert header row
        sw.insertRow(0);

        creater.createHeader(sw, styles);

        sw.endRow();

        //write data rows
        for (int rownum = 1, rows = creater.getRowsCount(); rownum <= rows; rownum++) {
            sw.insertRow(rownum);

            creater.createRow(sw, styles, rownum - 1);

            sw.endRow();
        }
        sw.endSheet();
    }

    /**
     *
     * @param zipfile the template file
     * @param tmpfile the XML file with the sheet data
     * @param entry the name of the sheet entry to substitute, e.g. xl/worksheets/sheet1.xml
     * @param out the stream to write the result to
     */
	private static void substitute(File zipfile, File tmpfile, String entry, OutputStream out) throws IOException {
        ZipFile zip = null;
        ZipOutputStream zos = null;

        try{
            zip = new ZipFile(zipfile);
            zos = new ZipOutputStream(out);

            @SuppressWarnings("unchecked")
            Enumeration<ZipEntry> en = (Enumeration<ZipEntry>) zip.entries();
            while (en.hasMoreElements()) {
                ZipEntry ze = en.nextElement();
                if(!ze.getName().equals(entry)){
                    zos.putNextEntry(new ZipEntry(ze.getName()));
                    InputStream is = null;
                    try{
                        is = zip.getInputStream(ze);
                        copyStream(is, zos);
                    }catch(IOException e){
                        throw e;
                    }finally{
                        if(is != null){
                            try{
                                is.close();
                            }catch(IOException ex){}
                        }
                    }
                }
            }

            zos.putNextEntry(new ZipEntry(entry));
            InputStream is = null;
            try{
                is = new FileInputStream(tmpfile);
                copyStream(is, zos);
            }catch(IOException e){
                throw e;
            }finally{
                if(is != null){
                    try{
                        is.close();
                    }catch(IOException ex){}
                }
            }

        }catch(IOException e){
            throw e;
        }finally{
            if(zos != null){
                try{
                    zos.close();
                }catch(IOException ex){}
            }
            if(zip != null){
                try{
                    zip.close();
                }catch(IOException ex){}
            }
        }
    }

    private static void copyStream(InputStream in, OutputStream out) throws IOException {
        byte[] chunk = new byte[1024];
        int count;
        while ((count = in.read(chunk)) >=0 ) {
          out.write(chunk,0,count);
        }
    }

    private static void setBorderStyle(XSSFCellStyle style, BorderStyle borderStyle, short borderColor){
    	style.setBorderTop(borderStyle);
    	style.setTopBorderColor(borderColor);
    	style.setBorderRight(borderStyle);
    	style.setRightBorderColor(borderColor);
    	style.setBorderBottom(borderStyle);
    	style.setBottomBorderColor(borderColor);
    	style.setBorderLeft(borderStyle);
    	style.setLeftBorderColor(borderColor);
    }

    /**
     * Writes spreadsheet data in a Writer.
     * (YK: in future it may evolve in a full-featured API for streaming data in Excel)
     */
    public static class SpreadsheetWriter {
        private final Writer _out;
        private int _rownum;

        public SpreadsheetWriter(Writer out){
            _out = out;
        }

        public void beginSheet() throws IOException {
            _out.write("<?xml version=\"1.0\" encoding=\""+XML_ENCODING+"\"?>" +
                    "<worksheet xmlns=\"http://schemas.openxmlformats.org/spreadsheetml/2006/main\">" );
            _out.write("<sheetData>\n");
        }

        public void endSheet() throws IOException {
            _out.write("</sheetData>");
            _out.write("</worksheet>");
        }

        /**
         * Insert a new row
         *
         * @param rownum 0-based row number
         */
        public void insertRow(int rownum) throws IOException {
            _out.write("<row r=\""+(rownum+1)+"\">\n");
            this._rownum = rownum;
        }

        /**
         * Insert row end marker
         */
        public void endRow() throws IOException {
            _out.write("</row>\n");
        }

        public void createCell(int columnIndex, String value, int styleIndex) throws IOException {

        	value = StringUtils.defaultString(value, "");

            String ref = new CellReference(_rownum, columnIndex).formatAsString();
            _out.write("<c r=\""+ref+"\" t=\"inlineStr\"");
            if(styleIndex != -1) _out.write(" s=\""+styleIndex+"\"");
            _out.write(">");
            _out.write("<is><t><![CDATA["+value+"]]></t></is>");
            _out.write("</c>");
        }

        public void createCell(int columnIndex, String value) throws IOException {
            createCell(columnIndex, value, -1);
        }

        public void createCell(int columnIndex, double value, int styleIndex) throws IOException {
            String ref = new CellReference(_rownum, columnIndex).formatAsString();
            _out.write("<c r=\""+ref+"\" t=\"n\"");
            if(styleIndex != -1) _out.write(" s=\""+styleIndex+"\"");
            _out.write(">");
            _out.write("<v>"+value+"</v>");
            _out.write("</c>");
        }

        public void createCell(int columnIndex, double value) throws IOException {
            createCell(columnIndex, value, -1);
        }

        public void createCell(int columnIndex, Calendar value, int styleIndex) throws IOException {
            createCell(columnIndex, DateUtil.getExcelDate(value, false), styleIndex);
        }
    }
}
