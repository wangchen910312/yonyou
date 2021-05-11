package chn.bhmc.dms.crm.cso.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * 영업 스케쥴  VO
 *
 * @ClassName   : SalesOpptMgmtSaveVO.java
 * @Description : SalesOpptMgmtSaveVO.Class
 * @author in moon lee
 * @since 2016.03.07.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.07     in moon lee     최초 생성
 * </pre>
 */

/*
 * Draft : 신규등록, 수정
 * Modify : 판매기회 상세 정보 변경
 */
@ValidDescriptor({
     @ValidField(field="dlrCd"           , mesgKey="global.lbl.dlrCd")              // 딜러코드
    ,@ValidField(field="saleOpptNo"     , mesgKey="global.lbl.saleOpptSeq")        // 판매기회번호
    ,@ValidField(field="custNo"          , mesgKey="global.lbl.custNo")             // 고객번호
    ,@ValidField(field="saleOpptStepCd"  , mesgKey="global.lbl.saleOpptStepCd")     // 판매기회단계
    ,@ValidField(field="scId"            , mesgKey="crm.lbl.scId")                  // 담당SC
    ,@ValidField(field="expcSaleDt"      , mesgKey="global.lbl.expcSaleDt")         // 예상판매일자
    ,@ValidField(field="succPrbCd"       , mesgKey="global.lbl.succPrbCd")          // 성공확률
    ,@ValidField(field="saleOpptSrcCd"   , mesgKey="global.lbl.saleOpptSrcCd")      // 판매기회출처
    ,@ValidField(field="hpNo"            , mesgKey="global.lbl.hpNo")               // 휴대전화

    ,@ValidField(field="trsfStatCd"      , mesgKey="global.lbl.trsfStatCd")         // 전출상태
    ,@ValidField(field="carlineCd"       , mesgKey="global.lbl.intrCarLine")        // 관심차종
    ,@ValidField(field="modelCd"         , mesgKey="global.lbl.intrModel")          // 관심모델
    ,@ValidField(field="regUsrId"        , mesgKey="global.lbl.regUsrId")           // 등록자
    ,@ValidField(field="regDt"           , mesgKey="global.lbl.regDt")              // 등록일
    ,@ValidField(field="updtUsrId"       , mesgKey="global.lbl.updtUsrId")          // 수정자
    ,@ValidField(field="updtDt"          , mesgKey="global.lbl.updtDt")             // 수정일


    ,@ValidField(field="extColorCd"      , mesgKey="crm.lbl.extColorCd")             // 외장색
    ,@ValidField(field="intColorCd"      , mesgKey="crm.lbl.intColorCd")             // 내장색

    ,@ValidField(field="remark"          , mesgKey="crm.lbl.saleRemark")             // 판매기회 개술
    ,@ValidField(field="srcInfoCont"     , mesgKey="global.lbl.srcInfoCont")
    ,@ValidField(field="fuPrid"          , mesgKey="global.lbl.fuPrid")
    ,@ValidField(field="failReasonCd"    , mesgKey="global.lbl.failReasonCd")
    ,@ValidField(field="respDeptCd"      , mesgKey="global.lbl.respDeptCd")
    ,@ValidField(field="failCont"        , mesgKey="global.lbl.failCont")
    ,@ValidField(field="evalReasonCd"    , mesgKey="global.lbl.evalReasonCd")
    ,@ValidField(field="evalCont"        , mesgKey="global.lbl.evalCont")
    ,@ValidField(field="bhmcYn"          , mesgKey="global.lbl.bhmcYn")
    ,@ValidField(field="refTableNm"      , mesgKey="global.lbl.refTableNm")


})

public class SalesOpptMgmtSaveVO extends BaseSaveVO<CarLineInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 475538653576954578L;


    @Valid
    public SalesOpptMgmtVO salesOpptMgmtVO;

    /**
     * @return the salesOpptMgmtVO
     */
    public SalesOpptMgmtVO getSalesOpptMgmtVO() {
        return salesOpptMgmtVO;
    }

    /**
     * @param salesOpptMgmtVO the salesOpptMgmtVO to set
     */
    public void setSalesOpptMgmtVO(SalesOpptMgmtVO salesOpptMgmtVO) {
        this.salesOpptMgmtVO = salesOpptMgmtVO;
    }


}