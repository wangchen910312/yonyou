package chn.bhmc.dms.par.stm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
/**
 * 재고실사 VO
 *
 * @ClassName   : InvestigationVO.java
 * @Description : InvestigationVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class InvestigationItemVO extends AbstractExcelDataBinder{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 218491767419593775L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 재고실사문서번호
     **/
    private String stockDdDocNo;

    /**
     * 재고실사문서라인번호
     **/
    private int stockDdDocLineNo;

    /**
     * 참조문서번호
     **/
    private String refDocNo;

    /**
     * 참조문서라인번호
     **/
    private int refDocLineNo;

    /**
    *
    * 공급처유형
    **/
    private String bpTp;

    /**
     * 품목상태코드
     **/
    private String itemStatCd;

    /**
     * 창고
     **/
    private String strgeCd;

    /**
     * 위치코드
     **/
    private String locCd;

    /**
     * 위치코드
     **/
    private String locCdMig;

    /**
     * 품목코드
     **/
    @NotEmpty
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 품목구분
     **/
    private String itemDstinCd;

    /**
     * 차종
     **/
    private String carlineCd;

    /**
     * 모델
     **/
    private String carlineCd2;

    /**
     * ABC CLASS
     **/
    private String abcInd;

    /***
     * LAST_GR_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGrDt;

    /***
     * LAST_GI_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lastGiDt;

    /***
     * STOCK_IVST_PLAN_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date stockIvstPlanDt;

    /**
     * 장부수량
     **/
    private Double bookQty = 0.0;

    /**
     * 실사수량
     **/
    private Double ddQty = 0.0;

    /**
     * 차이수량
     **/
    private double diffQty = 0.0;

    /**
     * 차이수량
     **/
    private double qty = 0.0;

    /**
     * 단가
     **/
    private double prc = 0.0;

    /**
     * 금액
     **/
    private double amt = 0.0;

    /**
     * 단가
     **/
    private double movingAvgPrc = 0.0;

    /**
     * 재고
     */
    private double stockQty = 0.0;

    /**
     * 유보수량
     */
    private double resvQty = 0.0;

    /**
     * 차출수량
     */
    private double rentQty = 0.0;

    /**
     * 차입수량
     */
    private double borrowQty = 0.0;

    /**
     * 가용수량
     */
    private double avlbStockQty = 0.0;

    /**
     * 예류수량
     */
    private double resvStockQty = 0.0;

    /**
     * 단위코드
     **/
    private String unitCd;

    /**
     * 사유코드
     **/
    private String reasonCont;

    /**
     * 재고조정수불문서년월
     **/
    private String stockAdjMvtDocYyMm;

    /**
     * 재고조정수불문서년월
     **/
    private String stockAdjMvtDocNo;

    /**
     * 재고조정수불문서년월
     **/
    private int stockAdjMvtDocLineNo;

    /**
     * 재고실사손익수량
     **/
    private double stockItemPlusQty = 0;

    /**
     * 재고실사손익금액
     **/
    private double stockItemPlusPrc = 0.0;

    /**
     * 재고실사손실수량
     **/
    private double stockItemMinusQty = 0;

    /**
     * 재고실사손실금액
     **/
    private double stockItemMinusPrc = 0.0;

    /**
     * 문서상태
     **/
    private String docStatCd;
    private String excelStrgeNm;
    private String excelLocCd;
    private String excelLocCdMig;
    private String excelDdQty;
    private String excelItemCd;
    private String strgeNm;//仓库名称
    
    /***
     * STOCK_IVST_PLAN_DT
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date approveReqDt;

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
     * @return the stockDdDocNo
     */
    public String getStockDdDocNo() {
        return stockDdDocNo;
    }

    /**
     * @param stockDdDocNo the stockDdDocNo to set
     */
    public void setStockDdDocNo(String stockDdDocNo) {
        this.stockDdDocNo = stockDdDocNo;
    }

    /**
     * @return the stockDdDocLineNo
     */
    public int getStockDdDocLineNo() {
        return stockDdDocLineNo;
    }

    /**
     * @param stockDdDocLineNo the stockDdDocLineNo to set
     */
    public void setStockDdDocLineNo(int stockDdDocLineNo) {
        this.stockDdDocLineNo = stockDdDocLineNo;
    }

    /**
     * @return the refDocNo
     */
    public String getRefDocNo() {
        return refDocNo;
    }

    /**
     * @param refDocNo the refDocNo to set
     */
    public void setRefDocNo(String refDocNo) {
        this.refDocNo = refDocNo;
    }

    /**
     * @return the refDocLineNo
     */
    public int getRefDocLineNo() {
        return refDocLineNo;
    }

    /**
     * @param refDocLineNo the refDocLineNo to set
     */
    public void setRefDocLineNo(int refDocLineNo) {
        this.refDocLineNo = refDocLineNo;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the itemStatCd
     */
    public String getItemStatCd() {
        return itemStatCd;
    }

    /**
     * @param itemStatCd the itemStatCd to set
     */
    public void setItemStatCd(String itemStatCd) {
        this.itemStatCd = itemStatCd;
    }

    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }

    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }

    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }

    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
    }

    /**
     * @return the locCdMig
     */
    public String getLocCdMig() {
        return locCdMig;
    }

    /**
     * @param locCdMig the locCdMig to set
     */
    public void setLocCdMig(String locCdMig) {
        this.locCdMig = locCdMig;
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
     * @return the itemDstinCd
     */
    public String getItemDstinCd() {
        return itemDstinCd;
    }

    /**
     * @param itemDstinCd the itemDstinCd to set
     */
    public void setItemDstinCd(String itemDstinCd) {
        this.itemDstinCd = itemDstinCd;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the carlineCd2
     */
    public String getCarlineCd2() {
        return carlineCd2;
    }

    /**
     * @param carlineCd2 the carlineCd2 to set
     */
    public void setCarlineCd2(String carlineCd2) {
        this.carlineCd2 = carlineCd2;
    }

    /**
     * @return the abcInd
     */
    public String getAbcInd() {
        return abcInd;
    }

    /**
     * @param abcInd the abcInd to set
     */
    public void setAbcInd(String abcInd) {
        this.abcInd = abcInd;
    }

    /**
     * @return the lastGrDt
     */
    public Date getLastGrDt() {
        return lastGrDt;
    }

    /**
     * @param lastGrDt the lastGrDt to set
     */
    public void setLastGrDt(Date lastGrDt) {
        this.lastGrDt = lastGrDt;
    }

    /**
     * @return the lastGiDt
     */
    public Date getLastGiDt() {
        return lastGiDt;
    }

    /**
     * @param lastGiDt the lastGiDt to set
     */
    public void setLastGiDt(Date lastGiDt) {
        this.lastGiDt = lastGiDt;
    }

    /**
     * @return the stockIvstPlanDt
     */
    public Date getStockIvstPlanDt() {
        return stockIvstPlanDt;
    }

    /**
     * @param stockIvstPlanDt the stockIvstPlanDt to set
     */
    public void setStockIvstPlanDt(Date stockIvstPlanDt) {
        this.stockIvstPlanDt = stockIvstPlanDt;
    }

    /**
     * @return the bookQty
     */
    public Double getBookQty() {
        return bookQty;
    }

    /**
     * @param bookQty the bookQty to set
     */
    public void setBookQty(Double bookQty) {
        this.bookQty = bookQty;
    }

    /**
     * @return the ddQty
     */
    public Double getDdQty() {
        return ddQty;
    }

    /**
     * @param ddQty the ddQty to set
     */
    public void setDdQty(Double ddQty) {
        this.ddQty = ddQty;
    }

    /**
     * @return the diffQty
     */
    public double getDiffQty() {
        return diffQty;
    }

    /**
     * @param diffQty the diffQty to set
     */
    public void setDiffQty(double diffQty) {
        this.diffQty = diffQty;
    }

    /**
     * @return the qty
     */
    public double getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(double qty) {
        this.qty = qty;
    }

    /**
     * @return the prc
     */
    public double getPrc() {
        return prc;
    }

    /**
     * @param prc the prc to set
     */
    public void setPrc(double prc) {
        this.prc = prc;
    }

    /**
     * @return the amt
     */
    public double getAmt() {
        return amt;
    }

    /**
     * @param amt the amt to set
     */
    public void setAmt(double amt) {
        this.amt = amt;
    }

    /**
     * @return the movingAvgPrc
     */
    public double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the stockQty
     */
    public double getStockQty() {
        return stockQty;
    }

    /**
     * @param stockQty the stockQty to set
     */
    public void setStockQty(double stockQty) {
        this.stockQty = stockQty;
    }

    /**
     * @return the resvQty
     */
    public double getResvQty() {
        return resvQty;
    }

    /**
     * @param resvQty the resvQty to set
     */
    public void setResvQty(double resvQty) {
        this.resvQty = resvQty;
    }

    /**
     * @return the rentQty
     */
    public double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the borrowQty
     */
    public double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the avlbStockQty
     */
    public double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(double resvStockQty) {
        this.resvStockQty = resvStockQty;
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
     * @return the reasonCont
     */
    public String getReasonCont() {
        return reasonCont;
    }

    /**
     * @param reasonCont the reasonCont to set
     */
    public void setReasonCont(String reasonCont) {
        this.reasonCont = reasonCont;
    }

    /**
     * @return the stockAdjMvtDocYyMm
     */
    public String getStockAdjMvtDocYyMm() {
        return stockAdjMvtDocYyMm;
    }

    /**
     * @param stockAdjMvtDocYyMm the stockAdjMvtDocYyMm to set
     */
    public void setStockAdjMvtDocYyMm(String stockAdjMvtDocYyMm) {
        this.stockAdjMvtDocYyMm = stockAdjMvtDocYyMm;
    }

    /**
     * @return the stockAdjMvtDocNo
     */
    public String getStockAdjMvtDocNo() {
        return stockAdjMvtDocNo;
    }

    /**
     * @param stockAdjMvtDocNo the stockAdjMvtDocNo to set
     */
    public void setStockAdjMvtDocNo(String stockAdjMvtDocNo) {
        this.stockAdjMvtDocNo = stockAdjMvtDocNo;
    }

    /**
     * @return the stockAdjMvtDocLineNo
     */
    public int getStockAdjMvtDocLineNo() {
        return stockAdjMvtDocLineNo;
    }

    /**
     * @param stockAdjMvtDocLineNo the stockAdjMvtDocLineNo to set
     */
    public void setStockAdjMvtDocLineNo(int stockAdjMvtDocLineNo) {
        this.stockAdjMvtDocLineNo = stockAdjMvtDocLineNo;
    }

    /**
     * @return the stockItemPlusQty
     */
    public double getStockItemPlusQty() {
        return stockItemPlusQty;
    }

    /**
     * @param stockItemPlusQty the stockItemPlusQty to set
     */
    public void setStockItemPlusQty(double stockItemPlusQty) {
        this.stockItemPlusQty = stockItemPlusQty;
    }

    /**
     * @return the stockItemPlusPrc
     */
    public double getStockItemPlusPrc() {
        return stockItemPlusPrc;
    }

    /**
     * @param stockItemPlusPrc the stockItemPlusPrc to set
     */
    public void setStockItemPlusPrc(double stockItemPlusPrc) {
        this.stockItemPlusPrc = stockItemPlusPrc;
    }

    /**
     * @return the stockItemMinusQty
     */
    public double getStockItemMinusQty() {
        return stockItemMinusQty;
    }

    /**
     * @param stockItemMinusQty the stockItemMinusQty to set
     */
    public void setStockItemMinusQty(double stockItemMinusQty) {
        this.stockItemMinusQty = stockItemMinusQty;
    }

    /**
     * @return the stockItemMinusPrc
     */
    public double getStockItemMinusPrc() {
        return stockItemMinusPrc;
    }

    /**
     * @param stockItemMinusPrc the stockItemMinusPrc to set
     */
    public void setStockItemMinusPrc(double stockItemMinusPrc) {
        this.stockItemMinusPrc = stockItemMinusPrc;
    }

    /**
     * @return the docStatCd
     */
    public String getDocStatCd() {
        return docStatCd;
    }

    /**
     * @param docStatCd the docStatCd to set
     */
    public void setDocStatCd(String docStatCd) {
        this.docStatCd = docStatCd;
    }

    /**
     * @return the approveReqDt
     */
    public Date getApproveReqDt() {
        return approveReqDt;
    }

    /**
     * @param approveReqDt the approveReqDt to set
     */
    public void setApproveReqDt(Date approveReqDt) {
        this.approveReqDt = approveReqDt;
    }

    private int rnum;

    /**
     * 등록자 아이디
     */
    private String regUsrId;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정자 아이디
     */
    private String updtUsrId;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRegUsrId() {
		return regUsrId;
	}

	public void setRegUsrId(String regUsrId) {
		this.regUsrId = regUsrId;
	}

	public Date getRegDt() {
		return regDt;
	}

	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}

	public String getUpdtUsrId() {
		return updtUsrId;
	}

	public void setUpdtUsrId(String updtUsrId) {
		this.updtUsrId = updtUsrId;
	}
	public String getExcelStrgeNm() {
		return excelStrgeNm;
	}

	public void setExcelStrgeNm(String excelStrgeNm) {
		this.excelStrgeNm = excelStrgeNm;
	}

	public String getExcelLocCd() {
		return excelLocCd;
	}

	public void setExcelLocCd(String excelLocCd) {
		this.excelLocCd = excelLocCd;
	}

	public String getExcelLocCdMig() {
		return excelLocCdMig;
	}

	public void setExcelLocCdMig(String excelLocCdMig) {
		this.excelLocCdMig = excelLocCdMig;
	}

	public void setExcelItemCd(String excelItemCd) {
		this.excelItemCd = excelItemCd;
	}

	public String getExcelDdQty() {
		return excelDdQty;
	}

	public void setExcelDdQty(String excelDdQty) {
		this.excelDdQty = excelDdQty;
	}

	public String getExcelItemCd() {
		return excelItemCd;
	}

	public String getStrgeNm() {
		return strgeNm;
	}

	public void setStrgeNm(String strgeNm) {
		this.strgeNm = strgeNm;
	}

	@Override
	public void bind(int rowNo, int cellNo, Object value)
			throws ExcelDataBindingException {
		 try{
	            switch(cellNo){
	                case 0:this.setExcelItemCd(ExcelDataBinderUtil.toString(value).trim()); break;   //부품번호
	                case 1:this.setExcelStrgeNm(ExcelDataBinderUtil.toString(value).trim()); break;     //입고창고
	                case 2:this.setExcelLocCd(ExcelDataBinderUtil.toString(value).trim()); break;     //입고수량
	                case 3:this.setExcelLocCdMig(ExcelDataBinderUtil.toString(value).trim()); break;     //입고단가
	                case 4:this.setExcelDdQty(ExcelDataBinderUtil.toString(value).trim()); break;     //입고세전단가
	            }
	        }catch(Exception e){
	            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
	            bindingException.setRowNo(rowNo);
	            bindingException.setColNo(cellNo);
	            bindingException.setFieldValue(value.toString());
	            throw bindingException;
	        }
	}

	@Override
	public List<ExcelUploadError> validate(ExcelDataBindContext context) {
		List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();
        if(StringUtils.isBlank(this.getExcelItemCd())){
            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
        }
        if(StringUtils.isBlank(this.getExcelStrgeNm())){
            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.strgeCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
        }
        if(StringUtils.isBlank(this.getExcelDdQty())){
            String msg = messageSource.getMessage(
                    "global.info.emptyParamInfo"
                    , new String[]{
                            messageSource.getMessage("par.lbl.ddQty", null, LocaleContextHolder.getLocale())
                    }
                    , LocaleContextHolder.getLocale()
                );

                errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelDdQty()), msg));
        }else{
        	 if(NumberUtils.isNumber(this.getExcelDdQty())){
                 if(NumberUtils.toDouble(this.getExcelDdQty()) <= 0){
                     String msg = messageSource.getMessage(
                         "par.info.itemReqZeroCntMsg"
                         , new String[]{
                                 messageSource.getMessage("par.lbl.ddQty", null, LocaleContextHolder.getLocale())
                                ,"0"
                         }
                         , LocaleContextHolder.getLocale()
                     );
                     errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelDdQty()), msg));
                 }
             }else{
                 String msg = messageSource.getMessage(
                         "global.err.checkQtyParam"
                         , new String[]{
                                 messageSource.getMessage("par.lbl.ddQty", null, LocaleContextHolder.getLocale())
                         }
                         , LocaleContextHolder.getLocale()
                     );
                     errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getExcelDdQty()), msg));
             }
        }
		return null;
	}

}
