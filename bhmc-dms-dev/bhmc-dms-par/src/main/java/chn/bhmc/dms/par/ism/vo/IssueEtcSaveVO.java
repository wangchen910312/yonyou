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
    ,@ValidField(field="etcGiDocNo", mesgKey="par.lbl.etcGiDocNo")
    ,@ValidField(field="etcGiDocLineNo", mesgKey="par.lbl.etcGiDocLineNo")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
    ,@ValidField(field="itemCd", mesgKey="par.lbl.itemCd")
    ,@ValidField(field="qty", mesgKey="par.lbl.qty")
    ,@ValidField(field="unitCd", mesgKey="par.lbl.unitCd")
    ,@ValidField(field="strgeCd", mesgKey="par.lbl.strgeCd")
    ,@ValidField(field="locCd", mesgKey="par.lbl.locCd")
    ,@ValidField(field="prc", mesgKey="par.lbl.prc")
    ,@ValidField(field="amt", mesgKey="par.lbl.amt")
    ,@ValidField(field="giReasonCd", mesgKey="par.lbl.giReasonCd")
    ,@ValidField(field="mvtDocYyMm", mesgKey="par.lbl.mvtDocYyMm")
    ,@ValidField(field="mvtDocNo" , mesgKey="par.lbl.mvtDocNo")
    ,@ValidField(field="mvtDocLineNo", mesgKey="par.lbl.mvtDocLineNo")
})
public class IssueEtcSaveVO extends BaseSaveVO<IssueEtcItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3344984203543611647L;

    /**
     * 기타출고VO
     */
    private IssueEtcVO issueEtcVO;

    /**
     * @return the issueEtcVO
     */
    public IssueEtcVO getIssueEtcVO() {
        return issueEtcVO;
    }

    /**
     * @param issueEtcVO the issueEtcVO to set
     */
    public void setIssueEtcVO(IssueEtcVO issueEtcVO) {
        this.issueEtcVO = issueEtcVO;
    }
}
