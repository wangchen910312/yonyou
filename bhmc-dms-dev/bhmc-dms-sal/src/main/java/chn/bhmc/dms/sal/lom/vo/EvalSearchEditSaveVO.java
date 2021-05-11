package chn.bhmc.dms.sal.lom.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.sal.sti.vo.ConfirmWearingVehiclePopupVO;

@ValidDescriptor({
  //  @ValidField(field="calcAtcDstinCd", mesgKey="정산구분")

})
public class EvalSearchEditSaveVO extends BaseSaveVO<EvalInfoVO> {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2864274377715677856L;

    private String vinNo;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrEvalDt;

    private String dlrCd;

    private ConfirmWearingVehiclePopupVO popupVO;

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the dlrEvalDt
     */
    public Date getDlrEvalDt() {
        return dlrEvalDt;
    }

    /**
     * @param dlrEvalDt the dlrEvalDt to set
     */
    public void setDlrEvalDt(Date dlrEvalDt) {
        this.dlrEvalDt = dlrEvalDt;
    }

    /**
     * @return the popupVO
     */
    public ConfirmWearingVehiclePopupVO getPopupVO() {
        return popupVO;
    }

    /**
     * @param popupVO the popupVO to set
     */
    public void setPopupVO(ConfirmWearingVehiclePopupVO popupVO) {
        this.popupVO = popupVO;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
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



}
