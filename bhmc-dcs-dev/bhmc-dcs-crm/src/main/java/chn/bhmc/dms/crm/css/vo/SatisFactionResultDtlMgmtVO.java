package chn.bhmc.dms.crm.css.vo;

import java.util.Date;
import java.util.List;

import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionResultDtlMgmtVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class SatisFactionResultDtlMgmtVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8637529097761342220L;

       private List<?> columnList = null;

       private long total = 0;
       private List<?> data = null;

       /**
        * 일련번호
        **/
       private  String     seq;

       /**
        * 상위 일련번호
        **/
       private  String     upperSeq;



       /**
        * 헤더내용
        **/
       //HEADER_CONT

       private  String     headerCont;

       /**
        * 값
        **/
       //VAL

       private  String     val;

       /**
        * 등록자ID
        **/
       private  String     regUsrId;

       /**
        * 등록일자
        **/
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date       regDt;

       /**
        * 수정자ID
        **/
       //UPDT_USR_ID

       private  String     updtUsrId;

       /**
        * 수정일자
        **/
       //UPDT_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date       updtDt;

       /**
        * 딜러코드
        **/
       //DLR_CD

       private  String     dlrCd;


       /**
        * Excel Temp Read를 위한 col1~col30
        */
       private String col0;
       private String col1;
       private String col2;
       private String col3;
       private String col4;
       private String col5;
       private String col6;
       private String col7;
       private String col8;
       private String col9;
       private String col10;
       private String col11;
       private String col12;
       private String col13;
       private String col14;
       private String col15;
       private String col16;
       private String col17;
       private String col18;
       private String col19;
       private String col20;
       private String col21;
       private String col22;
       private String col23;
       private String col24;
       private String col25;
       private String col26;
       private String col27;
       private String col28;
       private String col29;
       private String col30;
       private String col31;
       private String col32;
       private String col33;
       private String col34;
       private String col35;
       private String col36;
       private String col37;
       private String col38;
       private String col39;
       private String col40;
       private String col41;
       private String col42;
       private String col43;
       private String col44;
       private String col45;
       private String col46;
       private String col47;
       private String col48;
       private String col49;
       private String col50;
       /**
        * Excel Temp Read를 위한 col1~col30
        */


    /**
     * @return the seq
     */
    public String getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(String seq) {
        this.seq = seq;
    }

    /**
     * @return the headerCont
     */
    public String getHeaderCont() {
        return headerCont;
    }

    /**
     * @param headerCont the headerCont to set
     */
    public void setHeaderCont(String headerCont) {
        this.headerCont = headerCont;
    }

    /**
     * @return the val
     */
    public String getVal() {
        return val;
    }

    /**
     * @param val the val to set
     */
    public void setVal(String val) {
        this.val = val;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the columnList
     */
    public List<?> getColumnList() {
        return columnList;
    }

    /**
     * @param columnList the columnList to set
     */
    public void setColumnList(List<?> columnList) {
        this.columnList = columnList;
    }

    /**
     * @return the total
     */
    public long getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(long total) {
        this.total = total;
    }

    /**
     * @return the data
     */
    public List<?> getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(List<?> data) {
        this.data = data;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setCol0(ExcelDataBinderUtil.toString(value).trim());
                case 1:this.setCol1(ExcelDataBinderUtil.toString(value).trim());
                case 2:this.setCol2(ExcelDataBinderUtil.toString(value).trim());
                case 3:this.setCol3(ExcelDataBinderUtil.toString(value).trim());
                case 4:this.setCol4(ExcelDataBinderUtil.toString(value).trim());
                case 5:this.setCol5(ExcelDataBinderUtil.toString(value).trim());
                case 6:this.setCol6(ExcelDataBinderUtil.toString(value).trim());
                case 7:this.setCol7(ExcelDataBinderUtil.toString(value).trim());
                case 8:this.setCol8(ExcelDataBinderUtil.toString(value).trim());
                case 9:this.setCol9(ExcelDataBinderUtil.toString(value).trim());
                case 10:this.setCol10(ExcelDataBinderUtil.toString(value).trim());
                case 11:this.setCol11(ExcelDataBinderUtil.toString(value).trim());
                case 12:this.setCol12(ExcelDataBinderUtil.toString(value).trim());
                case 13:this.setCol13(ExcelDataBinderUtil.toString(value).trim());
                case 14:this.setCol14(ExcelDataBinderUtil.toString(value).trim());
                case 15:this.setCol15(ExcelDataBinderUtil.toString(value).trim());
                case 16:this.setCol16(ExcelDataBinderUtil.toString(value).trim());
                case 17:this.setCol17(ExcelDataBinderUtil.toString(value).trim());
                case 18:this.setCol18(ExcelDataBinderUtil.toString(value).trim());
                case 19:this.setCol19(ExcelDataBinderUtil.toString(value).trim());
                case 20:this.setCol20(ExcelDataBinderUtil.toString(value).trim());
                case 21:this.setCol21(ExcelDataBinderUtil.toString(value).trim());
                case 22:this.setCol22(ExcelDataBinderUtil.toString(value).trim());
                case 23:this.setCol23(ExcelDataBinderUtil.toString(value).trim());
                case 24:this.setCol24(ExcelDataBinderUtil.toString(value).trim());
                case 25:this.setCol25(ExcelDataBinderUtil.toString(value).trim());
                case 26:this.setCol26(ExcelDataBinderUtil.toString(value).trim());
                case 27:this.setCol27(ExcelDataBinderUtil.toString(value).trim());
                case 28:this.setCol28(ExcelDataBinderUtil.toString(value).trim());
                case 29:this.setCol29(ExcelDataBinderUtil.toString(value).trim());
                case 30:this.setCol30(ExcelDataBinderUtil.toString(value).trim());
                case 31:this.setCol31(ExcelDataBinderUtil.toString(value).trim());
                case 32:this.setCol32(ExcelDataBinderUtil.toString(value).trim());
                case 33:this.setCol33(ExcelDataBinderUtil.toString(value).trim());
                case 34:this.setCol34(ExcelDataBinderUtil.toString(value).trim());
                case 35:this.setCol35(ExcelDataBinderUtil.toString(value).trim());
                case 36:this.setCol36(ExcelDataBinderUtil.toString(value).trim());
                case 37:this.setCol37(ExcelDataBinderUtil.toString(value).trim());
                case 38:this.setCol38(ExcelDataBinderUtil.toString(value).trim());
                case 39:this.setCol39(ExcelDataBinderUtil.toString(value).trim());
                case 40:this.setCol40(ExcelDataBinderUtil.toString(value).trim());
                case 41:this.setCol41(ExcelDataBinderUtil.toString(value).trim());
                case 42:this.setCol42(ExcelDataBinderUtil.toString(value).trim());
                case 43:this.setCol43(ExcelDataBinderUtil.toString(value).trim());
                case 44:this.setCol44(ExcelDataBinderUtil.toString(value).trim());
                case 45:this.setCol45(ExcelDataBinderUtil.toString(value).trim());
                case 46:this.setCol46(ExcelDataBinderUtil.toString(value).trim());
                case 47:this.setCol47(ExcelDataBinderUtil.toString(value).trim());
                case 48:this.setCol48(ExcelDataBinderUtil.toString(value).trim());
                case 49:this.setCol49(ExcelDataBinderUtil.toString(value).trim());
                case 50:this.setCol50(ExcelDataBinderUtil.toString(value).trim());

                default :
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }

    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        // TODO Auto-generated method stub
        return null;
    }

    /**
     * @return the col1
     */
    public String getCol1() {
        return col1;
    }

    /**
     * @param col1 the col1 to set
     */
    public void setCol1(String col1) {
        this.col1 = col1;
    }

    /**
     * @return the col2
     */
    public String getCol2() {
        return col2;
    }

    /**
     * @param col2 the col2 to set
     */
    public void setCol2(String col2) {
        this.col2 = col2;
    }

    /**
     * @return the col3
     */
    public String getCol3() {
        return col3;
    }

    /**
     * @param col3 the col3 to set
     */
    public void setCol3(String col3) {
        this.col3 = col3;
    }

    /**
     * @return the col4
     */
    public String getCol4() {
        return col4;
    }

    /**
     * @param col4 the col4 to set
     */
    public void setCol4(String col4) {
        this.col4 = col4;
    }

    /**
     * @return the col5
     */
    public String getCol5() {
        return col5;
    }

    /**
     * @param col5 the col5 to set
     */
    public void setCol5(String col5) {
        this.col5 = col5;
    }

    /**
     * @return the col6
     */
    public String getCol6() {
        return col6;
    }

    /**
     * @param col6 the col6 to set
     */
    public void setCol6(String col6) {
        this.col6 = col6;
    }

    /**
     * @return the col7
     */
    public String getCol7() {
        return col7;
    }

    /**
     * @param col7 the col7 to set
     */
    public void setCol7(String col7) {
        this.col7 = col7;
    }

    /**
     * @return the col8
     */
    public String getCol8() {
        return col8;
    }

    /**
     * @param col8 the col8 to set
     */
    public void setCol8(String col8) {
        this.col8 = col8;
    }

    /**
     * @return the col9
     */
    public String getCol9() {
        return col9;
    }

    /**
     * @param col9 the col9 to set
     */
    public void setCol9(String col9) {
        this.col9 = col9;
    }

    /**
     * @return the col10
     */
    public String getCol10() {
        return col10;
    }

    /**
     * @param col10 the col10 to set
     */
    public void setCol10(String col10) {
        this.col10 = col10;
    }

    /**
     * @return the col11
     */
    public String getCol11() {
        return col11;
    }

    /**
     * @param col11 the col11 to set
     */
    public void setCol11(String col11) {
        this.col11 = col11;
    }

    /**
     * @return the col12
     */
    public String getCol12() {
        return col12;
    }

    /**
     * @param col12 the col12 to set
     */
    public void setCol12(String col12) {
        this.col12 = col12;
    }

    /**
     * @return the col13
     */
    public String getCol13() {
        return col13;
    }

    /**
     * @param col13 the col13 to set
     */
    public void setCol13(String col13) {
        this.col13 = col13;
    }

    /**
     * @return the col14
     */
    public String getCol14() {
        return col14;
    }

    /**
     * @param col14 the col14 to set
     */
    public void setCol14(String col14) {
        this.col14 = col14;
    }

    /**
     * @return the col15
     */
    public String getCol15() {
        return col15;
    }

    /**
     * @param col15 the col15 to set
     */
    public void setCol15(String col15) {
        this.col15 = col15;
    }

    /**
     * @return the col16
     */
    public String getCol16() {
        return col16;
    }

    /**
     * @param col16 the col16 to set
     */
    public void setCol16(String col16) {
        this.col16 = col16;
    }

    /**
     * @return the col17
     */
    public String getCol17() {
        return col17;
    }

    /**
     * @param col17 the col17 to set
     */
    public void setCol17(String col17) {
        this.col17 = col17;
    }

    /**
     * @return the col18
     */
    public String getCol18() {
        return col18;
    }

    /**
     * @param col18 the col18 to set
     */
    public void setCol18(String col18) {
        this.col18 = col18;
    }

    /**
     * @return the col19
     */
    public String getCol19() {
        return col19;
    }

    /**
     * @param col19 the col19 to set
     */
    public void setCol19(String col19) {
        this.col19 = col19;
    }

    /**
     * @return the col20
     */
    public String getCol20() {
        return col20;
    }

    /**
     * @param col20 the col20 to set
     */
    public void setCol20(String col20) {
        this.col20 = col20;
    }

    /**
     * @return the col21
     */
    public String getCol21() {
        return col21;
    }

    /**
     * @param col21 the col21 to set
     */
    public void setCol21(String col21) {
        this.col21 = col21;
    }

    /**
     * @return the col22
     */
    public String getCol22() {
        return col22;
    }

    /**
     * @param col22 the col22 to set
     */
    public void setCol22(String col22) {
        this.col22 = col22;
    }

    /**
     * @return the col23
     */
    public String getCol23() {
        return col23;
    }

    /**
     * @param col23 the col23 to set
     */
    public void setCol23(String col23) {
        this.col23 = col23;
    }

    /**
     * @return the col24
     */
    public String getCol24() {
        return col24;
    }

    /**
     * @param col24 the col24 to set
     */
    public void setCol24(String col24) {
        this.col24 = col24;
    }

    /**
     * @return the col25
     */
    public String getCol25() {
        return col25;
    }

    /**
     * @param col25 the col25 to set
     */
    public void setCol25(String col25) {
        this.col25 = col25;
    }

    /**
     * @return the col26
     */
    public String getCol26() {
        return col26;
    }

    /**
     * @param col26 the col26 to set
     */
    public void setCol26(String col26) {
        this.col26 = col26;
    }

    /**
     * @return the col27
     */
    public String getCol27() {
        return col27;
    }

    /**
     * @param col27 the col27 to set
     */
    public void setCol27(String col27) {
        this.col27 = col27;
    }

    /**
     * @return the col28
     */
    public String getCol28() {
        return col28;
    }

    /**
     * @param col28 the col28 to set
     */
    public void setCol28(String col28) {
        this.col28 = col28;
    }

    /**
     * @return the col29
     */
    public String getCol29() {
        return col29;
    }

    /**
     * @param col29 the col29 to set
     */
    public void setCol29(String col29) {
        this.col29 = col29;
    }

    /**
     * @return the col30
     */
    public String getCol30() {
        return col30;
    }

    /**
     * @param col30 the col30 to set
     */
    public void setCol30(String col30) {
        this.col30 = col30;
    }

    /**
     * @return the col31
     */
    public String getCol31() {
        return col31;
    }

    /**
     * @param col31 the col31 to set
     */
    public void setCol31(String col31) {
        this.col31 = col31;
    }

    /**
     * @return the col32
     */
    public String getCol32() {
        return col32;
    }

    /**
     * @param col32 the col32 to set
     */
    public void setCol32(String col32) {
        this.col32 = col32;
    }

    /**
     * @return the col33
     */
    public String getCol33() {
        return col33;
    }

    /**
     * @param col33 the col33 to set
     */
    public void setCol33(String col33) {
        this.col33 = col33;
    }

    /**
     * @return the col34
     */
    public String getCol34() {
        return col34;
    }

    /**
     * @param col34 the col34 to set
     */
    public void setCol34(String col34) {
        this.col34 = col34;
    }

    /**
     * @return the col35
     */
    public String getCol35() {
        return col35;
    }

    /**
     * @param col35 the col35 to set
     */
    public void setCol35(String col35) {
        this.col35 = col35;
    }

    /**
     * @return the col36
     */
    public String getCol36() {
        return col36;
    }

    /**
     * @param col36 the col36 to set
     */
    public void setCol36(String col36) {
        this.col36 = col36;
    }

    /**
     * @return the col37
     */
    public String getCol37() {
        return col37;
    }

    /**
     * @param col37 the col37 to set
     */
    public void setCol37(String col37) {
        this.col37 = col37;
    }

    /**
     * @return the col38
     */
    public String getCol38() {
        return col38;
    }

    /**
     * @param col38 the col38 to set
     */
    public void setCol38(String col38) {
        this.col38 = col38;
    }

    /**
     * @return the col39
     */
    public String getCol39() {
        return col39;
    }

    /**
     * @param col39 the col39 to set
     */
    public void setCol39(String col39) {
        this.col39 = col39;
    }

    /**
     * @return the col40
     */
    public String getCol40() {
        return col40;
    }

    /**
     * @param col40 the col40 to set
     */
    public void setCol40(String col40) {
        this.col40 = col40;
    }

    /**
     * @return the col41
     */
    public String getCol41() {
        return col41;
    }

    /**
     * @param col41 the col41 to set
     */
    public void setCol41(String col41) {
        this.col41 = col41;
    }

    /**
     * @return the col42
     */
    public String getCol42() {
        return col42;
    }

    /**
     * @param col42 the col42 to set
     */
    public void setCol42(String col42) {
        this.col42 = col42;
    }

    /**
     * @return the col43
     */
    public String getCol43() {
        return col43;
    }

    /**
     * @param col43 the col43 to set
     */
    public void setCol43(String col43) {
        this.col43 = col43;
    }

    /**
     * @return the col44
     */
    public String getCol44() {
        return col44;
    }

    /**
     * @param col44 the col44 to set
     */
    public void setCol44(String col44) {
        this.col44 = col44;
    }

    /**
     * @return the col45
     */
    public String getCol45() {
        return col45;
    }

    /**
     * @param col45 the col45 to set
     */
    public void setCol45(String col45) {
        this.col45 = col45;
    }

    /**
     * @return the col46
     */
    public String getCol46() {
        return col46;
    }

    /**
     * @param col46 the col46 to set
     */
    public void setCol46(String col46) {
        this.col46 = col46;
    }

    /**
     * @return the col47
     */
    public String getCol47() {
        return col47;
    }

    /**
     * @param col47 the col47 to set
     */
    public void setCol47(String col47) {
        this.col47 = col47;
    }

    /**
     * @return the col48
     */
    public String getCol48() {
        return col48;
    }

    /**
     * @param col48 the col48 to set
     */
    public void setCol48(String col48) {
        this.col48 = col48;
    }

    /**
     * @return the col49
     */
    public String getCol49() {
        return col49;
    }

    /**
     * @param col49 the col49 to set
     */
    public void setCol49(String col49) {
        this.col49 = col49;
    }

    /**
     * @return the col50
     */
    public String getCol50() {
        return col50;
    }

    /**
     * @param col50 the col50 to set
     */
    public void setCol50(String col50) {
        this.col50 = col50;
    }

    /**
     * @return the col0
     */
    public String getCol0() {
        return col0;
    }

    /**
     * @param col0 the col0 to set
     */
    public void setCol0(String col0) {
        this.col0 = col0;
    }

    /**
     * @return the upperSeq
     */
    public String getUpperSeq() {
        return upperSeq;
    }

    /**
     * @param upperSeq the upperSeq to set
     */
    public void setUpperSeq(String upperSeq) {
        this.upperSeq = upperSeq;
    }



}
