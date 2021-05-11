package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvcSaveVO.java
 * @Description : InvcSaveVO.java
 * @author Ju Won Lee
 * @since 2016. 2. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 3.     Ju Won Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="invcDocNo", mesgKey="par.lbl.invcDocNo")
    ,@ValidField(field="invcTp", mesgKey="par.lbl.invcTp")
    ,@ValidField(field="invcDstinCd", mesgKey="par.lbl.invcDstinCd")
    ,@ValidField(field="invcStatCd", mesgKey="par.lbl.invcStatCd")
    ,@ValidField(field="invcDt", mesgKey="par.lbl.invcDt")
    ,@ValidField(field="arrvDt", mesgKey="par.lbl.arrvDt")
    ,@ValidField(field="confirmDt", mesgKey="par.lbl.confirmDt")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="bpNm", mesgKey="par.lbl.bpNm")
    ,@ValidField(field="mobisInvcNo", mesgKey="par.lbl.mobisInvcNo")
    ,@ValidField(field="currCd", mesgKey="par.lbl.currency")
    ,@ValidField(field="invcTotAmt", mesgKey="par.lbl.invcTotAmt")
    ,@ValidField(field="vatCd", mesgKey="par.lbl.vatCd")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
    ,@ValidField(field="invcDocLineNo", mesgKey="par.lbl.invcDocLineNo")
    ,@ValidField(field="mobisInvcLineNo", mesgKey="par.lbl.mobisInvcLineNo")
    ,@ValidField(field="purcOrdNo", mesgKey="par.lbl.purcOrdNo")
    ,@ValidField(field="purcOrdLineNo", mesgKey="par.lbl.purcOrdLineNo")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="invcQty", mesgKey="par.lbl.invcQty")
    ,@ValidField(field="invcUnitCd", mesgKey="par.lbl.invcUnitCd")
    ,@ValidField(field="invcPrc", mesgKey="par.lbl.invcPrc")
    ,@ValidField(field="invcAmt", mesgKey="par.lbl.invcAmt")
    ,@ValidField(field="debitCreditDstinCd", mesgKey="par.lbl.debitCreditDstinCd")
    ,@ValidField(field="refInvcDocNo", mesgKey="par.lbl.refInvcDocNo")
    ,@ValidField(field="refInvcDocLineNo", mesgKey="par.lbl.refInvcDocLineNo")
    ,@ValidField(field="invcGrDt", mesgKey="par.lbl.invcGrDt")
    ,@ValidField(field="dlPdcCd", mesgKey="par.lbl.dlPdcCd")
})
public class InvcSaveVO extends BaseSaveVO<InvcItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5605566758030104663L;

    /**
     * 송장VO
     */
    private InvcVO invcVO;

    /**
     * @return the invcVO
     */
    public InvcVO getInvcVO() {
        return invcVO;
    }

    /**
     * @param invcVO the invcVO to set
     */
    public void setInvcVO(InvcVO invcVO) {
        this.invcVO = invcVO;
    }
}
