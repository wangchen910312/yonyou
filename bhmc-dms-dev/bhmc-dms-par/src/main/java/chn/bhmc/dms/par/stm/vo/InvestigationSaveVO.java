package chn.bhmc.dms.par.stm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
/**
 * 재고실사 VO
 *
 * @ClassName   : InvestigationSaveVO.java
 * @Description : InvestigationSaveVO Class
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

@ValidDescriptor({
    @ValidField(field="dlrCd"                 , mesgKey="par.lbl.dlrCd")
   ,@ValidField(field="stockDdDocNo"          , mesgKey="par.lbl.stockDdDocNo")
   ,@ValidField(field="docStatCd"             , mesgKey="par.lbl.docStatCd")
   ,@ValidField(field="pltCd"                 , mesgKey="par.lbl.pltCd")
   ,@ValidField(field="strgeCd"               , mesgKey="par.lbl.strgeCd")
   ,@ValidField(field="stockIvstPlanDt"       , mesgKey="par.lbl.stockIvstPlanDt")
   ,@ValidField(field="prsnId"                , mesgKey="par.lbl.prsNm")
   ,@ValidField(field="stockLockYn"           , mesgKey="par.lbl.stockLockYn")
   ,@ValidField(field="stockAdjMvtDocYy"      , mesgKey="par.lbl.stockAdjMvtDocYy")
   ,@ValidField(field="stockAdjMvtDocNo"      , mesgKey="par.lbl.stockAdjMvtDocNo")
   ,@ValidField(field="approveReqDt"          , mesgKey="par.lbl.approveReqDt")
   ,@ValidField(field="endDt"                 , mesgKey="par.lbl.endDt")
   ,@ValidField(field="cancDt"                , mesgKey="par.lbl.cancDt")
   ,@ValidField(field="signOpnCont"           , mesgKey="par.lbl.signOpnCont")
   })

public class InvestigationSaveVO extends BaseSaveVO<InvestigationItemVO>{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 218491767419593775L;

    private InvestigationVO investigationVO;

    private  List<InvestigationItemVO> investigationItemList;

    BaseSaveVO<InvestigationItemVO> investigationList;

    /**
     * @return the investigationVO
     */
    public InvestigationVO getInvestigationVO() {
        return investigationVO;
    }

    /**
     * @param investigationVO the investigationVO to set
     */
    public void setInvestigationVO(InvestigationVO investigationVO) {
        this.investigationVO = investigationVO;
    }

    /**
     * @return the investigationItemList
     */
    public List<InvestigationItemVO> getInvestigationItemList() {
        return investigationItemList;
    }

    /**
     * @param investigationItemList the investigationItemList to set
     */
    public void setInvestigationItemList(List<InvestigationItemVO> investigationItemList) {
        this.investigationItemList = investigationItemList;
    }

    /**
     * @return the investigationList
     */
    public BaseSaveVO<InvestigationItemVO> getInvestigationList() {
        return investigationList;
    }

    /**
     * @param investigationList the investigationList to set
     */
    public void setInvestigationList(BaseSaveVO<InvestigationItemVO> investigationList) {
        this.investigationList = investigationList;
    }

}
