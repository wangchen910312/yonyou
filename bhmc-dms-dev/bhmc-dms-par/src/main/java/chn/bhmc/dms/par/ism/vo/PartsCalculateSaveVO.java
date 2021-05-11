package chn.bhmc.dms.par.ism.vo;

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
    ,@ValidField(field="parSaleOrdNo", mesgKey="par.lbl.parSaleOrdNo")
    ,@ValidField(field="parSaleOrdLineNo", mesgKey="par.lbl.parSaleOrdLineNo")
    ,@ValidField(field="itemStatCd", mesgKey="par.lbl.itemStatCd")
    ,@ValidField(field="calcTpCd", mesgKey="par.lbl.calcTpCd")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="eqipExpcDt", mesgKey="par.lbl.eqipExpcDt")
    ,@ValidField(field="dcRate", mesgKey="par.lbl.dcRate")
    ,@ValidField(field="prc", mesgKey="par.lbl.prc")
    ,@ValidField(field="amt", mesgKey="par.lbl.amt")
    ,@ValidField(field="unitCd", mesgKey="par.lbl.unitCd")
    ,@ValidField(field="ordQty", mesgKey="par.lbl.ordQty")
    ,@ValidField(field="endQty", mesgKey="par.lbl.endQty")
})
public class PartsCalculateSaveVO extends BaseSaveVO<PartCalculateVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;

    /**
     * 부품판매오더VO
     */
    private PartsSaleOrdVO  partsSaleOrdVO;

    /**
     * @return the partsSaleOrdVO
     */
    public PartsSaleOrdVO getPartsSaleOrdVO() {
        return partsSaleOrdVO;
    }

    /**
     * @param partsSaleOrdVO the partsSaleOrdVO to set
     */
    public void setPartsSaleOrdVO(PartsSaleOrdVO partsSaleOrdVO) {
        this.partsSaleOrdVO = partsSaleOrdVO;
    }
}
