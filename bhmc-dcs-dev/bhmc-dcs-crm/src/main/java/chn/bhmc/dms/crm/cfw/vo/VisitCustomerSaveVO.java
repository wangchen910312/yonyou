package chn.bhmc.dms.crm.cfw.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;

/**
 * 내방 예약  VO
 *
 * @ClassName   : VisitCustomerVO.java
 * @Description : VisitCustomerVO Class
 * @author in moon lee
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     in moon lee     최초 생성
 * </pre>
 */
/*
 *
 * Draft : 내방 예약 ( 팝업 )
 * Modify : 내방관리
 *
 */
@ValidDescriptor({

     @ValidField(field="dlrCd"            , mesgKey="global.lbl.dlrCd")         // 딜러코드
    ,@ValidField(field="pltCd"            , mesgKey="global.lbl.pltCd")         // 센터코드
    ,@ValidField(field="vsitNo"           , mesgKey="global.lbl.visitSeq")      // 내방번호
    ,@ValidField(field="callNo"           , mesgKey="global.lbl.callNo")        // -
    ,@ValidField(field="leadNo"           , mesgKey="global.lbl.leadNo")        // 리드번호
    ,@ValidField(field="saleOpptNo"       , mesgKey="global.lbl.saleOpptSeq")   // 판매기회번호
    ,@ValidField(field="scId"             , mesgKey="sal.lbl.salesAdvisor")     // 판매고문
    ,@ValidField(field="custNo"           , mesgKey="global.lbl.custNo")        // 고객번호
    ,@ValidField(field="custNm"           , mesgKey="global.lbl.custNm")        // 고객번호
    ,@ValidField(field="hpNo"             , mesgKey="global.lbl.hpNo")          // 휴대전화
    ,@ValidField(field="resvDt"           , mesgKey="global.lbl.resvDt")        // 예약일
    ,@ValidField(field="csltTmCd"         , mesgKey="global.lbl.csltTmCd")      // 상담시간
    ,@ValidField(field="vsitDt"           , mesgKey="global.lbl.vsitDt")        // 방문시간
    ,@ValidField(field="vsitEndDt"        , mesgKey="global.lbl.visitEndDt")    // 내방종료일
    ,@ValidField(field="vsitSrcCd"        , mesgKey="global.lbl.visitPathCd")   // 내방출처
    ,@ValidField(field="vsitSrcDetlCont"  , mesgKey="global.lbl.vsitSrcDetlCd") // 내방출처상세
    ,@ValidField(field="vsitGoalCd"       , mesgKey="global.lbl.visitPpsCd")    // 내방목적
    ,@ValidField(field="compareBrandCd"   , mesgKey="global.lbl.compareBrandCd")// 비교 타사 브랜드
    ,@ValidField(field="compareModelCd"   , mesgKey="global.lbl.compareModelCd")// 비교 타사 모델
    ,@ValidField(field="purcPridCd"       , mesgKey="global.lbl.purcPridCd")    // 구매시기
    ,@ValidField(field="remark"           , mesgKey="global.lbl.remark")        // 비고
    ,@ValidField(field="withPrsnCnt"      , mesgKey="global.lbl.withPrsCnt")    // 동행자수
    ,@ValidField(field="vsitStatCd"       , mesgKey="global.lbl.visitStatCd")   // 내방상태
    ,@ValidField(field="docId"            , mesgKey="global.lbl.docId")         // -
    ,@ValidField(field="resvVinNo1"       , mesgKey="global.lbl.resvVinNo1")    // -
    ,@ValidField(field="resvVinNo2"       , mesgKey="global.lbl.resvVinNo2")    // -
    ,@ValidField(field="regUsrId"         , mesgKey="global.lbl.regUsrId")      // 등록자
    ,@ValidField(field="regDt"            , mesgKey="global.lbl.regDt")         // 등록일
    ,@ValidField(field="updtUsrId"        , mesgKey="global.lbl.updtUsrId")     // 수정자
    ,@ValidField(field="updtDt"           , mesgKey="global.lbl.updtDt")        // 수정일

})

public class VisitCustomerSaveVO extends BaseSaveVO<CarLineInfoVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1882625883233739027L;



    @Valid
    public VisitCustomerVO visitCustomerVO;



    /**
     * @return the visitCustomerVO
     */
    public VisitCustomerVO getVisitCustomerVO() {
        return visitCustomerVO;
    }



    /**
     * @param visitCustomerVO the visitCustomerVO to set
     */
    public void setVisitCustomerVO(VisitCustomerVO visitCustomerVO) {
        this.visitCustomerVO = visitCustomerVO;
    }



    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "VisitCustomerSaveVO [visitCustomerVO=" + visitCustomerVO + "]";
    }





}