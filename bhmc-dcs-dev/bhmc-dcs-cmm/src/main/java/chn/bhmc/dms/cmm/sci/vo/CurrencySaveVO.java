package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CurrencySaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="currencyCd", mesgKey="global.lbl.currencyCd")
    ,@ValidField(field="currencySym", mesgKey="global.lbl.currencySym")
    ,@ValidField(field="symbolPosTp", mesgKey="global.lbl.symbolPosTp")
    ,@ValidField(field="exrUnitAmt", mesgKey="global.lbl.exrUnitAmt")
    ,@ValidField(field="currencyNm", mesgKey="global.lbl.currencyNm")
    ,@ValidField(field="fractionCnt", mesgKey="global.lbl.fractionCnt")
    ,@ValidField(field="numberSym", mesgKey="global.lbl.numberSym")
    ,@ValidField(field="decimalSym", mesgKey="global.lbl.decimalSym")
    ,@ValidField(field="exrTargYn", mesgKey="global.lbl.exrTargYn")
})
public class CurrencySaveVO extends BaseSaveVO<CurrencyVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4205714377797792606L;

}
