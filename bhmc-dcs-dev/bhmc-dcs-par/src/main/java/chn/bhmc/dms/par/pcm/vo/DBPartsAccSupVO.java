package chn.bhmc.dms.par.pcm.vo;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.context.i18n.LocaleContextHolder;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * @ClassName   : DBPartsAccSupVO.java
 * @Description : 导入配件对应供应商信息.
 * @author jiaMing
 * @since 2020. 11. 18.
 * @version 1.0
 * @see
 * @Modification Information
 */
public class DBPartsAccSupVO extends AbstractExcelDataBinder {


	/**
	 * 
	 */
	private static final long serialVersionUID = -6536215226796292285L;



	

	/**
     *메세지일련번호 销售序列号
     */
    private int mesgSeq;

    /**
     * 配件编号
     */
    @NotBlank
    private String itemCd;
    
    /**
     * 供应商名称
     */
    @NotBlank
    private String bpNm;
 
    private  String bmpCd;//bmp编码
    private  String bpCd;//供应商编码
    
    /**
     * 사용여부 是否使用
     */
    private String useYn = "Y";

    /**
     * @return the mesgSeq
     */
    public int getMesgSeq() {
        return mesgSeq;
    }

    /**
     * @param mesgSeq the mesgSeq to set
     */
    public void setMesgSeq(int mesgSeq) {
        this.mesgSeq = mesgSeq;
    }

    public String getItemCd() {
		return itemCd;
	}

	public void setItemCd(String itemCd) {
		this.itemCd = itemCd;
	}
	
	

	public String getBpNm() {
		return bpNm;
	}

	public void setBpNm(String bpNm) {
		this.bpNm = bpNm;
	}

	/**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;    
                case 1:this.setBpNm(ExcelDataBinderUtil.toString(value).trim()); break;     
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

    /**
     * {@inheritDoc}
     */
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        
        if(StringUtils.isBlank(this.getBpNm())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("global.lbl.bpNm", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getBpNm(), msg));
        }

        
        if(StringUtils.isBlank(this.getItemCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                        messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                }
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getItemCd(), msg));
        }

       

       

        return errors;
    }

	public String getBmpCd() {
		return bmpCd;
	}

	public void setBmpCd(String bmpCd) {
		this.bmpCd = bmpCd;
	}

	public String getBpCd() {
		return bpCd;
	}

	public void setBpCd(String bpCd) {
		this.bpCd = bpCd;
	}
    
    
}
