package chn.bhmc.dms.crm.slm.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
import chn.bhmc.dms.crm.cmm.vo.CallInfoVO;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeadInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"         , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="leadNo"        , mesgKey="global.lbl.leadNo")
    ,@ValidField(field="custNo"        , mesgKey="global.lbl.custNo")
    ,@ValidField(field="opptNo"        , mesgKey="global.lbl.opptNo")
    ,@ValidField(field="hpNo"          , mesgKey="global.lbl.hpNo")
    ,@ValidField(field="telNo"         , mesgKey="global.lbl.telNo")
    ,@ValidField(field="leadSrcCd"     , mesgKey="global.lbl.leadSrcCd")
    ,@ValidField(field="bhmcYn"        , mesgKey="global.lbl.bhmcYn")
    ,@ValidField(field="bhmcLeadNo"    , mesgKey="global.lbl.bhmcLeadNo")
    ,@ValidField(field="respDeptCd"    , mesgKey="global.lbl.respDeptCd")
    ,@ValidField(field="prsnId"        , mesgKey="global.lbl.prsnId")
    ,@ValidField(field="statCd"        , mesgKey="global.lbl.statCd")
    ,@ValidField(field="ddlnDt"        , mesgKey="global.lbl.ddlnDt")
    ,@ValidField(field="opptChgDt"     , mesgKey="global.lbl.opptChgDt")
    ,@ValidField(field="expcSaleDt"    , mesgKey="global.lbl.expcSaleDt")
    ,@ValidField(field="succPrbCd"     , mesgKey="global.lbl.succPrbCd")
    ,@ValidField(field="bhmcReceiveDt" , mesgKey="global.lbl.bhmcReceiveDt")
    ,@ValidField(field="bhmcSendDt"    , mesgKey="global.lbl.bhmcSendDt")
    ,@ValidField(field="remark"        , mesgKey="global.lbl.remark")
    ,@ValidField(field="regUsrId"      , mesgKey="global.lbl.regUsrId")
    ,@ValidField(field="regDt"         , mesgKey="global.lbl.regDt")
    ,@ValidField(field="updtUsrId"     , mesgKey="global.lbl.updtUsrId")
    ,@ValidField(field="updtDt"        , mesgKey="global.lbl.updtDt")
   })

public class LeadInfoSaveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2093954171945620741L;

    BaseSaveVO<CarLineInfoVO> carLineInfoVO = new BaseSaveVO<CarLineInfoVO>();


    public CallInfoVO callInfoVO;

    public LeadInfoVO leadInfoVO;

    //public CarLineInfoVO carLineInfoVO;

    /**
     * @return the callInfoVO
     */
    public CallInfoVO getCallInfoVO() {
        return callInfoVO;
    }

    /**
     * @param callInfoVO the callInfoVO to set
     */
    public void setCallInfoVO(CallInfoVO callInfoVO) {
        this.callInfoVO = callInfoVO;
    }

    /**
     * @return the leadInfoVO
     */
    public LeadInfoVO getLeadInfoVO() {
        return leadInfoVO;
    }

    /**
     * @param leadInfoVO the leadInfoVO to set
     */
    public void setLeadInfoVO(LeadInfoVO leadInfoVO) {
        this.leadInfoVO = leadInfoVO;
    }

    /**
     * @return the carLineInfoVO
     */
    public BaseSaveVO<CarLineInfoVO> getCarLineInfoVO() {
        return carLineInfoVO;
    }

    /**
     * @param carLineInfoVO the carLineInfoVO to set
     */
    public void setCarLineInfoVO(BaseSaveVO<CarLineInfoVO> carLineInfoVO) {
        this.carLineInfoVO = carLineInfoVO;
    }


}
