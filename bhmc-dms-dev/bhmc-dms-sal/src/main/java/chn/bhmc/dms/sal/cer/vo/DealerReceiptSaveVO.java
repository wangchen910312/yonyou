package chn.bhmc.dms.sal.cer.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


public class DealerReceiptSaveVO extends BaseSaveVO<DealerReceiptVO> {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2864274377715677856L;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ddlnDt;          // 마감일자

    /**
     * @return the ddlnDt
     */
    public Date getDdlnDt() {
        return ddlnDt;
    }

    /**
     * @param ddlnDt the ddlnDt to set
     */
    public void setDdlnDt(Date ddlnDt) {
        this.ddlnDt = ddlnDt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }


}
