package chn.bhmc.dms.par.stm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * StockMovStorageDetail VO
 *
 * @ClassName   : StockMovStorageDetailVO.java
 * @Description : StockMovStorageDetailVO Class
 * @author In Bo Shim
 * @since 2016. 5. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 10.     In Bo Shim     최초 생성
 * </pre>
 */
public class StockMovStorageDetailVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 695052228261472404L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 기타출고문서번호
     **/
    private String etcGiDocNo;

    /**
     * 기타출고문서라인번호
     **/
    private int etcGiDocLineNo;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 단위코드
     **/
    private String unitCd;

    /**
     * 로케이션재고수량
     **/
    private Double strgeStockQty;

    /**
     * 이동수량
     **/
    private Double strgeMoveStockQty;

    /**
     * 엑셀수량
     **/
    private String excelQty;

    /**
     * 출고장면재고수량
     **/
    private Double grStockQty = 0.0;

    /**
     * 출고가용수량
     **/
    private Double grAvlbStockQty = 0.0;

    /**
     * 출고예류수량
     **/
    private Double grResvStockQty = 0.0;

    /**
     * 출고차입수량
     **/
    private Double grBorrowQty = 0.0;

    /**
     * 출고차출수량
     **/
    private Double grRentQty = 0.0;

    /**
     * 입고장면재고수량
     **/
    private Double giStockQty = 0.0;

    /**
     * 입고가용수량
     **/
    private Double giAvlbStockQty = 0.0;

    /**
     * 입고예류수량
     **/
    private Double giResvStockQty = 0.0;

    /**
     * 입고차입수량
     **/
    private Double giBorrowQty = 0.0;

    /**
     * 입고차출수량
     **/
    private Double giRentQty = 0.0;

    /**
     * 차입수량
     **/
    private Double borrowQty = 0.0;

    /**
     * 차출수량
     **/
    private Double rentQty = 0.0;

    /**
     * 이동단가
     **/
    private Double movingAvgPrc = 0.0;

    /**
     * 이동금액
     **/
    private Double movingAvgAmt = 0.0;

    /**
     * 출고창고코드
     **/
    private String giStrgeCd;

    /**
     * 출고위치코드
     **/
    private String giLocCd;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 입고위치코드
     **/
    private String grLocCd;

    /**
     * 출고창고코드
     **/
    private String giStrgeNm;

    /**
     * 출고위치코드
     **/
    private String giLocNm;

    /**
     * 입고창고코드
     **/
    private String grStrgeNm;

    /**
     * 입고위치코드
     **/
    private String grLocNm;

    /**
     * 입고사유코드
     **/
    private String grReasonCd;

    /**
     * 출고상태
     **/
    private String giStatCd;

    /**
     * 수불문서년월
     **/
    private String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    private String mvtDocNo = "";

    /**
     * 수불문서라인번호
     **/
    private int mvtDocLineNo;

    /**
     * 출고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;

    /**
     * 출고일자 문자열
     **/
    private String giDtString;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;

    /**
     * 입고일자 문자열
     **/
    private String grDtString;



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
     * @return the etcGiDocNo
     */
    public String getEtcGiDocNo() {
        return etcGiDocNo;
    }

    /**
     * @param etcGiDocNo the etcGiDocNo to set
     */
    public void setEtcGiDocNo(String etcGiDocNo) {
        this.etcGiDocNo = etcGiDocNo;
    }

    /**
     * @return the etcGiDocLineNo
     */
    public int getEtcGiDocLineNo() {
        return etcGiDocLineNo;
    }

    /**
     * @param etcGiDocLineNo the etcGiDocLineNo to set
     */
    public void setEtcGiDocLineNo(int etcGiDocLineNo) {
        this.etcGiDocLineNo = etcGiDocLineNo;
    }

    /**
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the itemNm
     */
    public String getItemNm() {
        return itemNm;
    }

    /**
     * @param itemNm the itemNm to set
     */
    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    /**
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the strgeStockQty
     */
    public Double getStrgeStockQty() {
        return strgeStockQty;
    }

    /**
     * @param strgeStockQty the strgeStockQty to set
     */
    public void setStrgeStockQty(Double strgeStockQty) {
        this.strgeStockQty = strgeStockQty;
    }

    /**
     * @return the strgeMoveStockQty
     */
    public Double getStrgeMoveStockQty() {
        return strgeMoveStockQty;
    }

    /**
     * @param strgeMoveStockQty the strgeMoveStockQty to set
     */
    public void setStrgeMoveStockQty(Double strgeMoveStockQty) {
        this.strgeMoveStockQty = strgeMoveStockQty;
    }

    /**
     * @return the excelQty
     */
    public String getExcelQty() {
        return excelQty;
    }

    /**
     * @param excelQty the excelQty to set
     */
    public void setExcelQty(String excelQty) {
        this.excelQty = excelQty;
    }

    /**
     * @return the grStockQty
     */
    public Double getGrStockQty() {
        return grStockQty;
    }

    /**
     * @param grStockQty the grStockQty to set
     */
    public void setGrStockQty(Double grStockQty) {
        this.grStockQty = grStockQty;
    }

    /**
     * @return the grAvlbStockQty
     */
    public Double getGrAvlbStockQty() {
        return grAvlbStockQty;
    }

    /**
     * @param grAvlbStockQty the grAvlbStockQty to set
     */
    public void setGrAvlbStockQty(Double grAvlbStockQty) {
        this.grAvlbStockQty = grAvlbStockQty;
    }

    /**
     * @return the grResvStockQty
     */
    public Double getGrResvStockQty() {
        return grResvStockQty;
    }

    /**
     * @param grResvStockQty the grResvStockQty to set
     */
    public void setGrResvStockQty(Double grResvStockQty) {
        this.grResvStockQty = grResvStockQty;
    }

    /**
     * @return the grBorrowQty
     */
    public Double getGrBorrowQty() {
        return grBorrowQty;
    }

    /**
     * @param grBorrowQty the grBorrowQty to set
     */
    public void setGrBorrowQty(Double grBorrowQty) {
        this.grBorrowQty = grBorrowQty;
    }

    /**
     * @return the grRentQty
     */
    public Double getGrRentQty() {
        return grRentQty;
    }

    /**
     * @param grRentQty the grRentQty to set
     */
    public void setGrRentQty(Double grRentQty) {
        this.grRentQty = grRentQty;
    }

    /**
     * @return the giStockQty
     */
    public Double getGiStockQty() {
        return giStockQty;
    }

    /**
     * @param giStockQty the giStockQty to set
     */
    public void setGiStockQty(Double giStockQty) {
        this.giStockQty = giStockQty;
    }

    /**
     * @return the giAvlbStockQty
     */
    public Double getGiAvlbStockQty() {
        return giAvlbStockQty;
    }

    /**
     * @param giAvlbStockQty the giAvlbStockQty to set
     */
    public void setGiAvlbStockQty(Double giAvlbStockQty) {
        this.giAvlbStockQty = giAvlbStockQty;
    }

    /**
     * @return the giResvStockQty
     */
    public Double getGiResvStockQty() {
        return giResvStockQty;
    }

    /**
     * @param giResvStockQty the giResvStockQty to set
     */
    public void setGiResvStockQty(Double giResvStockQty) {
        this.giResvStockQty = giResvStockQty;
    }

    /**
     * @return the giBorrowQty
     */
    public Double getGiBorrowQty() {
        return giBorrowQty;
    }

    /**
     * @param giBorrowQty the giBorrowQty to set
     */
    public void setGiBorrowQty(Double giBorrowQty) {
        this.giBorrowQty = giBorrowQty;
    }

    /**
     * @return the giRentQty
     */
    public Double getGiRentQty() {
        return giRentQty;
    }

    /**
     * @param giRentQty the giRentQty to set
     */
    public void setGiRentQty(Double giRentQty) {
        this.giRentQty = giRentQty;
    }

    /**
     * @return the borrowQty
     */
    public Double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(Double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the rentQty
     */
    public Double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(Double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the movingAvgPrc
     */
    public Double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(Double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the movingAvgAmt
     */
    public Double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(Double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the grStrgeCd
     */
    public String getGrStrgeCd() {
        return grStrgeCd;
    }

    /**
     * @param grStrgeCd the grStrgeCd to set
     */
    public void setGrStrgeCd(String grStrgeCd) {
        this.grStrgeCd = grStrgeCd;
    }

    /**
     * @return the grLocCd
     */
    public String getGrLocCd() {
        return grLocCd;
    }

    /**
     * @param grLocCd the grLocCd to set
     */
    public void setGrLocCd(String grLocCd) {
        this.grLocCd = grLocCd;
    }

    /**
     * @return the giStrgeNm
     */
    public String getGiStrgeNm() {
        return giStrgeNm;
    }

    /**
     * @param giStrgeNm the giStrgeNm to set
     */
    public void setGiStrgeNm(String giStrgeNm) {
        this.giStrgeNm = giStrgeNm;
    }

    /**
     * @return the giLocNm
     */
    public String getGiLocNm() {
        return giLocNm;
    }

    /**
     * @param giLocNm the giLocNm to set
     */
    public void setGiLocNm(String giLocNm) {
        this.giLocNm = giLocNm;
    }

    /**
     * @return the grStrgeNm
     */
    public String getGrStrgeNm() {
        return grStrgeNm;
    }

    /**
     * @param grStrgeNm the grStrgeNm to set
     */
    public void setGrStrgeNm(String grStrgeNm) {
        this.grStrgeNm = grStrgeNm;
    }

    /**
     * @return the grLocNm
     */
    public String getGrLocNm() {
        return grLocNm;
    }

    /**
     * @param grLocNm the grLocNm to set
     */
    public void setGrLocNm(String grLocNm) {
        this.grLocNm = grLocNm;
    }

    /**
     * @return the grReasonCd
     */
    public String getGrReasonCd() {
        return grReasonCd;
    }

    /**
     * @param grReasonCd the grReasonCd to set
     */
    public void setGrReasonCd(String grReasonCd) {
        this.grReasonCd = grReasonCd;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the giDtString
     */
    public String getGiDtString() {
        return giDtString;
    }

    /**
     * @param giDtString the giDtString to set
     */
    public void setGiDtString(String giDtString) {
        this.giDtString = giDtString;
    }

    /**
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }

    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
    }

    /**
     * @return the grDtString
     */
    public String getGrDtString() {
        return grDtString;
    }

    /**
     * @param grDtString the grDtString to set
     */
    public void setGrDtString(String grDtString) {
        this.grDtString = grDtString;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;       //부품번호
                case 1:this.setGiStrgeNm(ExcelDataBinderUtil.toString(value).trim()); break;    //원창고
                //case 2:this.setGiLocCd(ExcelDataBinderUtil.toString(value).trim()); break;      //원로케이션
                case 2:this.setGrStrgeNm(ExcelDataBinderUtil.toString(value).trim()); break;    //이동창고
                //case 4:this.setGrLocCd(ExcelDataBinderUtil.toString(value).trim()); break;      //이동로케이션
                case 3:this.setExcelQty(ExcelDataBinderUtil.toString(value).trim()); break;     //재고이동수량
                case 4:this.setGrReasonCd(ExcelDataBinderUtil.toString(value).trim()); break;   //재고이동사유
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        if(!(StringUtils.isBlank(this.getItemCd()) && StringUtils.isBlank(this.getExcelQty())&& StringUtils.isBlank(this.getGiStrgeCd())
              && StringUtils.isBlank(this.getGrStrgeCd())&& StringUtils.isBlank(this.getGrReasonCd()))){
            //부품번호
            if(StringUtils.isBlank(this.getItemCd())){

                String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
            }


            if(StringUtils.isBlank(this.getExcelQty())){
                String msg = messageSource.getMessage(
                        "global.info.emptyParamInfo"
                        , new String[]{
                                messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
            }else{

                if(NumberUtils.isNumber(this.getExcelQty())){
                    if(NumberUtils.toDouble(this.getExcelQty()) <= 0){
                        String msg = messageSource.getMessage(
                            "par.info.itemReqZeroCntMsg"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                                   ,"0"
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                    }
                }else{
                    String msg = messageSource.getMessage(
                            "global.err.checkQtyParam"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.strgeMoveStockQty", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelQty()), msg));
                }
            }
            //원창고
            if(StringUtils.isBlank(this.getGiStrgeNm())){

                String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("par.lbl.giStrgeCd", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 0, this.getGiStrgeNm(), msg));
            }

            //이동창고
            if(StringUtils.isBlank(this.getGrStrgeNm())){

                String msg = messageSource.getMessage(
                        "global.info.required.field"
                        , new String[]{
                                messageSource.getMessage("par.lbl.grStrgeCd", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 0, this.getGrStrgeNm(), msg));
            }

        }

        return errors;


    }

}
