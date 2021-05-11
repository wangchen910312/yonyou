package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ReceiveEtcSaveVO.java
 * @Description : ReceiveEtcSaveVO.class
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
     @ValidField(field="dlrCd"            , mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="etcGrDocNo"       , mesgKey="par.lbl.etcGrDocNo")
    ,@ValidField(field="etcGrDocLineNo"   , mesgKey="par.lbl.etcGrDocLineNo")
    ,@ValidField(field="cancYn"           , mesgKey="par.lbl.cancYn")
    ,@ValidField(field="itemCd"           , mesgKey="par.lbl.itemCd")
    ,@ValidField(field="qty"              , mesgKey="par.lbl.qty")
    ,@ValidField(field="unitCd"           , mesgKey="par.lbl.unitCd")
    ,@ValidField(field="strgeCd"          , mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="locCd"            , mesgKey="par.lbl.locCd")
    ,@ValidField(field="prc"              , mesgKey="par.lbl.prc")
    ,@ValidField(field="amt"              , mesgKey="par.lbl.amt")
    ,@ValidField(field="grReasonCd"       , mesgKey="par.lbl.grReasonCd")
    ,@ValidField(field="mvtDocYyMm"       , mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo"         , mesgKey="par.lbl.mvtDocNo")
    ,@ValidField(field="mvtDocLineNo"     , mesgKey="par.lbl.mvtDocLineNo")
  })
public class ReceiveEtcSaveVO extends BaseSaveVO<ReceiveEtcItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;


    private  ReceiveEtcVO          receiveEtcVO;

    /**
     * @return the receiveEtcVO
     */
    public ReceiveEtcVO getReceiveEtcVO() {
        return receiveEtcVO;
    }

    /**
     * @param receiveEtcVO the receiveEtcVO to set
     */
    public void setReceiveEtcVO(ReceiveEtcVO receiveEtcVO) {
        this.receiveEtcVO = receiveEtcVO;
    }


}
