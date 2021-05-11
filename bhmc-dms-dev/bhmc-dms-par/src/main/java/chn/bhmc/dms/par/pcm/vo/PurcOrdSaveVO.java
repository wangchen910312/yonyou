package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdSaveVO.java
 * @Description : PurcOrdSaveVO.class
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
    ,@ValidField(field="purcOrdNo", mesgKey="par.lbl.purcOrdNo")
    ,@ValidField(field="purcOrdTp", mesgKey="par.lbl.purcOrdTp")
    ,@ValidField(field="trsfTp", mesgKey="par.lbl.trsfTp")
    ,@ValidField(field="purcOrdStatCd", mesgKey="par.lbl.purcOrdStatCd")
    ,@ValidField(field="purcItemStatCd", mesgKey="par.lbl.purcItemStatCd")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="bpNm", mesgKey="par.lbl.bpNm")
    ,@ValidField(field="purcRegDt", mesgKey="par.lbl.purcRegDt")
    ,@ValidField(field="totPurcAmt", mesgKey="par.lbl.totPurcAmt")
    ,@ValidField(field="sendDt", mesgKey="par.lbl.sendDt")
    ,@ValidField(field="confirmDt", mesgKey="par.lbl.confirmDt")
    ,@ValidField(field="endDt", mesgKey="par.lbl.endDt")
    ,@ValidField(field="cancDt", mesgKey="par.lbl.cancDt")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="purcItemTp", mesgKey="par.lbl.purcItemTp")
    ,@ValidField(field="delYn", mesgKey="par.lbl.delYn")
    ,@ValidField(field="grEndYn", mesgKey="par.lbl.grEndYn")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="purcQty", mesgKey="par.lbl.purcQty")
    ,@ValidField(field="purcUnitCd", mesgKey="par.lbl.purcUnitCd")
    ,@ValidField(field="prcTp", mesgKey="par.lbl.prcTp")
    ,@ValidField(field="purcPrc", mesgKey="par.lbl.purcPrc")
    ,@ValidField(field="purcAmt", mesgKey="par.lbl.purcAmt")
    ,@ValidField(field="purcReqDt", mesgKey="par.lbl.periodDeliveryReqDt")
    ,@ValidField(field="grStrgeCd", mesgKey="par.lbl.grStrgeCd")
    ,@ValidField(field="grQty", mesgKey="par.lbl.grQty")
    ,@ValidField(field="purcReqNo", mesgKey="par.lbl.purcReqNo")
    ,@ValidField(field="purcReqLineNo", mesgKey="par.lbl.purcReqLineNo")
    ,@ValidField(field="bmpOrdNo", mesgKey="par.lbl.bmpOrdNo")
    ,@ValidField(field="bmpChkQty", mesgKey="par.lbl.bmpChkQty")
    ,@ValidField(field="cancQty", mesgKey="par.lbl.cancQty")
})
public class PurcOrdSaveVO extends BaseSaveVO<PurcOrdItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;

    /**
     * 구매오더VO
     */
    private PurcOrdVO purcOrdVO;

    /**
     * @return the purcOrdVO
     */
    public PurcOrdVO getPurcOrdVO() {
        return purcOrdVO;
    }

    /**
     * @param purcOrdVO the purcOrdVO to set
     */
    public void setPurcOrdVO(PurcOrdVO purcOrdVO) {
        this.purcOrdVO = purcOrdVO;
    }
}
