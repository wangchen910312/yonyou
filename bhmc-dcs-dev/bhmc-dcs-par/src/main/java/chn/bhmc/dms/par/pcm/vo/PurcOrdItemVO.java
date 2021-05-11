package chn.bhmc.dms.par.pcm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdItemVO.java
 * @Description : PurcOrdItemVO.class
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
    ,@ValidField(field="purcOrdLineNo", mesgKey="par.lbl.purcOrdLineNo")
    ,@ValidField(field="purcItemStatCd", mesgKey="par.lbl.purcItemStatCd")
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
public class PurcOrdItemVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6071720494896446459L;

        /**
         * 딜러코드
         **/
        @NotEmpty
        private String dlrCd;

        /**
         * 딜러명
         **/
        private String dlrNm;

        /**
         * 구매오더정보
         **/
        private String purcOrdNo;

        /**
         * 구매오더라인번호
         **/
        private String purcOrdLineNo;

        /**
         * 모비스송장번호
         **/
        private String mobisInvcNo;

        /**
         * 모비스송장라인번호
         **/
        private String mobisInvcLineNo;

        /**
         * Boxing번호
         **/
        private String boxNo;

        /**
         * 구매품목상태코드
         **/
        private String purcItemStatCd;

        /**
         * 구매품목유형
         **/
        private String purcItemTp;

        /**
         * 구매오더유형
         **/
        private String purcOrdTp;

        /**
         * 삭제여부
         **/
        private String delYn;

        /**
         * 입고완료여부
         **/
        private String grEndYn;

        /**
         * 품목코드
         **/
        private String itemCd;

        /**
         * 품목명
         **/
        private String itemNm;

        /**
         * 거래처코드
         **/
        private String bpCd;

        /**
         * 거래처명
         **/
        private String bpNm;

        /**
         * 공급업체유형
         **/
        private String spyrCd;

        /**
         * 구매수량
         **/
        private Double purcQty;

        /**
         * 반품수량
         **/
        private Double returnQty;

        /**
         * 예약수량
         **/
        private Double resvQty;

        /**
         * 구매요청수량
         **/
        private Double purcReqQty;

        /**
         * 구매단위코드
         **/
        private String purcUnitCd;

        /**
         * 가격유형
         **/
        private String prcTp;

        /**
         * 구매단가
         **/
        private Double purcPrc;

        /**
         * 원구매단가
         **/
        private Double orgPurcPrc;

        /**
         * 구매금액
         **/
        private Double purcAmt;

        /**
         * 구매단가(세금제외)
         **/
        private Double taxDdctPrc;

        /**
         * 구매금액(세금제외)
         **/
        private Double taxDdctAmt;

        /**
         * 구매요청일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date purcReqDt;

        /**
         * 전송일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date sendDt;


        /**
         * 오더일자
         **/
        private String purcRegDt;

        /**
         * 오더품목등록일시
         **/
        private String purcRegDttmStr;

        /**
         * 오더품목전송일시
         **/
        private String purcSendDttmStr;


        /**
         * 발송일자
         **/
        private String invcDt;

        /**
         * 도착예정일자
         **/
        private String arrvDt;

        /**
         * 구매반품일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date purcReturnDt;

        /**
         * 전송일자 ( B/O 전송일자와 동일 20170707 )
         **/
        private String confirmDt;

        /**
         * 입고창고코드
         **/
        private String grStrgeCd;

        /**
         * 입고수량
         **/
        private Double grQty;


        /**
         * 구매요청번호
         **/
        private String purcReqNo;

        /**
         * 구매요청번호리스트
         **/
        private List<String> purcReqNoList;

        /**
         * 구매요청라인번호
         **/
        private String purcReqLineNo;

        /**
         * 구매요청라인번호리스트(여기선.구매요청번호 별 구매요청 수량으로 사용됨)
         **/
        private List<Double> purcReqQtyList;

        /**
         * 구매오더라인구분자
         **/
        private String purcOrdLineDetlNo;

        /**
         * BMP오더번호
         **/
        private String bmpOrdNo;

        /**
         * BMP 가격
         **/
        private String bmpPurcPrc;

        /**
         * PDC코드
         **/
        private String dlDistCd;

        /**
         * 구매요청자 ID
         **/
        private String purcReqRegUsrId;

        /**
         * 구매요청자명
         **/
        private String purcReqRegUsrNm;

        /**
         * 구매등록자명
         **/
        private String regUsrNm;

        /**
         * BMP확인수량
         **/
        private Double bmpChkQty;

        /**
         * 취소수량
         **/
        private Double cancQty;

        /**
         * 운송유형
         **/
        private String trsfTp;

        /**
         * 운송자
         **/
        private String trsfUsrId;

        /**
         * 비고
         **/
        private String remark;

        /**
         * 엑셀업로드 구매수량
         **/
        private String purcExcelQty;

        /**
         * 구매리드타임
         **/
        private int purcLeadHm;

        /**
         * B/O수량
         **/
        private Double boQty;

        /**
         * B/O 총 건수
         **/
        private Double boTotalCnt;

        /**
         * B/O 총 수량
         **/
        private Double boTotalQty;

        /**
         * B/O 총 bmp단가
         **/
        private Double boTotalPrc;

        /**
         * 최소포장수량
         **/
        private Double minPackQty = 0.0;

        /**
         * 최소구매수량
         **/
        private Double minPurcQty = 0.0;

        /**
         * 가용재고
         **/
        private Double avlbStockQty;

        /**
         * 예약수량
         **/
        private Double resvStockQty;

        /**
         * 보류수량
         **/
        private Double clamStockQty;

        /**
         * 차입수량
         **/
        private Double borrowQty;

        /**
         * 대여수량
         **/
        private Double rentQty;

        /**
         * 재고수량
         **/
        private Double stockQty;

        /**
         * BMP오더라인번호
         **/
        private String bmpOrdLineNo;

        /**
         * 오더라인상세번호(구분자)
         **/
        private String bmpOrdLineDetlNo;

        /**
         * 회사구분코드
         **/
        private String cmpDstinCd;

        /**
         * 구매진행코드
         **/
        private String purcPgssCd;

        /**
         * 구매부품번호
         **/
        private String purcParNo;

        /**
         * 확정부품번호
         **/
        private String confirmParNo;

        /**
         * 확정부품명
         **/
        private String confirmParNm;

        /**
         * 확정수량
         **/
        private int confirmQty;

        /**
         * 진행수량
         **/
        private int pgssQty;

        /**
         * 선적수량
         **/
        private int shipQty;

        /**
         * 취소요청수량
         **/
        private int cancReqQty;

        /**
         * 편수코드
         **/
        private String editCd;

        /**
         * 확정구분코드
         **/
        private String confirmDstinCd;

        /**
         * 구매요청단가
         **/
        private Double purcReqPrc;

        /**
         * 세금액
         **/
        private Double taxAmt;

        /**
         * B/O 일자
         **/
        private String giExpcDt;

        /**
         * 부품특성코드
         **/
        private String parSpecCd;

        /**
         * SUC코드
         **/
        private String sucCd;

        /**
         * 생성일자
         **/
        private String creDt;

        /**
         * 생성시간
         **/
        private String creHm;

        /**
         * ALLOCATION QUANTITY
         **/
        private int odrAlcQt;

        /**
         * ON_PICK QUANTITY
         **/
        private int odrOpicQt;

        /**
         * ON_PACK QUANTITY
         **/
        private int odrOpacQt;

        /**
         * PACKED QUANTITY
         **/
        private int odrPakdQt;

        /**
         * INVOICED QUANTITY
         **/
        private int odrInvQt;

        /**
         * CURRENT 수량
         **/
        private Double calcConfirmQty;

        /**
         * CURRENT 금액
         **/
        private Double calcPurcAmt;

        /**
         * CURRENT 세전 금액
         **/
        private Double calcTaxDdctAmt;

        /**
         * 구매신청건수
         **/
        private int bmpChkCnt;

        /**
         * 구매신청 금액
         **/
        private Double bmpChkAmt;

        /**
         * 구매확인건수
         **/
        private int calcConfirmCnt;

        /**
         * 구매확인 금액
         **/
        private Double calcConfirmAmt;

        /**
         * 할당건수
         **/
        private int odrAlcCnt;

        /**
         * 할당 수량
         **/
        private Double odrAlcQty;

        /**
         * 할당 금액
         **/
        private Double odrAlcAmt;

        /**
         * BO건수
         **/
        private int boCnt;

        /**
         * BO 금액
         **/
        private Double boAmt;

        /**
         * 피킹건수
         **/
        private int odrOpicCnt;

        /**
         * 피킹 수량
         **/
        private Double odrOpicQty;

        /**
         * 피킹 금액
         **/
        private Double odrOpicAmt;

        /**
         * 패킹중건수
         **/
        private int odrOpacCnt;

        /**
         * 패킹중 수량
         **/
        private Double odrOpacQty;

        /**
         * 패킹중 금액
         **/
        private Double odrOpacAmt;

        /**
         * 패킹건수
         **/
        private int odrPakdCnt;

        /**
         * 패킹 수량
         **/
        private Double odrPakdQty;

        /**
         * 패킹 금액
         **/
        private Double odrPakdAmt;

        /**
         * 송장건수
         **/
        private int odrInvCnt;

        /**
         * 송장 수량
         **/
        private Double odrInvQty;

        /**
         * 송장 금액
         **/
        private Double odrInvAmt;

        /**
         * 딜러확인 BO건수
         **/
        private int odrDlrBoCnt;

        /**
         * 딜러확인 BO 수량
         **/
        private Double odrDlrBoQty;

        /**
         * 딜러확인 BO 금액
         **/
        private Double odrDlrBoAmt;
        
        private String appealStat;
        private String questionNo;   //待货升级申诉编号
        private String replyLevel;   //处理环节
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date expectArrivalDt; //预计到仓库时间
        private String replyStatus;//回复状态
        private String appealRegUsrNm;//申诉提交人 
        private String appealRegUsrId;//申诉提交人 
        private String overTimeFlg;//预计到达仓库时间超时
        private String bmpCd;//供应伤在bmp对应的编码
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date dealDt; //处理时间
        private String dealDtStr; //处理时间串
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private String appealRegDtStr;//申诉时间 
        private String replyContent;//回复内容
        private String appealContent;//申诉内容
        private String expectArrivalDtStr;
        private String smDealDtStr;//库存管理科最新处理的时间
        private String pcDealDtStr;//采购科最新处理的时间
        private String smUsrNm;
        private String pcUsrNm;
        /**
         * @return the dlrCd
         */
        public String getDlrCd() {
            return dlrCd;
        }

        /**
         * @param dlrCd the dlrCd to set
         */
        public void setDlrCd(String dlrCd) {
            this.dlrCd = dlrCd;
        }

        /**
         * @return the dlrNm
         */
        public String getDlrNm() {
            return dlrNm;
        }

        /**
         * @param dlrNm the dlrNm to set
         */
        public void setDlrNm(String dlrNm) {
            this.dlrNm = dlrNm;
        }

        /**
         * @return the purcOrdNo
         */
        public String getPurcOrdNo() {
            return purcOrdNo;
        }

        /**
         * @param purcOrdNo the purcOrdNo to set
         */
        public void setPurcOrdNo(String purcOrdNo) {
            this.purcOrdNo = purcOrdNo;
        }

        /**
         * @return the purcOrdLineNo
         */
        public String getPurcOrdLineNo() {
            return purcOrdLineNo;
        }

        /**
         * @param purcOrdLineNo the purcOrdLineNo to set
         */
        public void setPurcOrdLineNo(String purcOrdLineNo) {
            this.purcOrdLineNo = purcOrdLineNo;
        }

        /**
         * @return the mobisInvcNo
         */
        public String getMobisInvcNo() {
            return mobisInvcNo;
        }

        /**
         * @param mobisInvcNo the mobisInvcNo to set
         */
        public void setMobisInvcNo(String mobisInvcNo) {
            this.mobisInvcNo = mobisInvcNo;
        }

        /**
         * @return the mobisInvcLineNo
         */
        public String getMobisInvcLineNo() {
            return mobisInvcLineNo;
        }

        /**
         * @param mobisInvcLineNo the mobisInvcLineNo to set
         */
        public void setMobisInvcLineNo(String mobisInvcLineNo) {
            this.mobisInvcLineNo = mobisInvcLineNo;
        }

        /**
         * @return the boxNo
         */
        public String getBoxNo() {
            return boxNo;
        }

        /**
         * @param boxNo the boxNo to set
         */
        public void setBoxNo(String boxNo) {
            this.boxNo = boxNo;
        }

        /**
         * @return the purcItemStatCd
         */
        public String getPurcItemStatCd() {
            return purcItemStatCd;
        }

        /**
         * @param purcItemStatCd the purcItemStatCd to set
         */
        public void setPurcItemStatCd(String purcItemStatCd) {
            this.purcItemStatCd = purcItemStatCd;
        }

        /**
         * @return the purcItemTp
         */
        public String getPurcItemTp() {
            return purcItemTp;
        }

        /**
         * @param purcItemTp the purcItemTp to set
         */
        public void setPurcItemTp(String purcItemTp) {
            this.purcItemTp = purcItemTp;
        }

        /**
         * @return the purcOrdTp
         */
        public String getPurcOrdTp() {
            return purcOrdTp;
        }

        /**
         * @param purcOrdTp the purcOrdTp to set
         */
        public void setPurcOrdTp(String purcOrdTp) {
            this.purcOrdTp = purcOrdTp;
        }

        /**
         * @return the delYn
         */
        public String getDelYn() {
            return delYn;
        }

        /**
         * @param delYn the delYn to set
         */
        public void setDelYn(String delYn) {
            this.delYn = delYn;
        }

        /**
         * @return the grEndYn
         */
        public String getGrEndYn() {
            return grEndYn;
        }

        /**
         * @param grEndYn the grEndYn to set
         */
        public void setGrEndYn(String grEndYn) {
            this.grEndYn = grEndYn;
        }

        /**
         * @return the itemCd
         */
        public String getItemCd() {
            return itemCd;
        }

        /**
         * @param itemCd the itemCd to set
         */
        public void setItemCd(String itemCd) {
            this.itemCd = itemCd;
        }

        /**
         * @return the itemNm
         */
        public String getItemNm() {
            return itemNm;
        }

        /**
         * @param itemNm the itemNm to set
         */
        public void setItemNm(String itemNm) {
            this.itemNm = itemNm;
        }

        /**
         * @return the bpCd
         */
        public String getBpCd() {
            return bpCd;
        }

        /**
         * @param bpCd the bpCd to set
         */
        public void setBpCd(String bpCd) {
            this.bpCd = bpCd;
        }

        /**
         * @return the bpNm
         */
        public String getBpNm() {
            return bpNm;
        }

        /**
         * @param bpNm the bpNm to set
         */
        public void setBpNm(String bpNm) {
            this.bpNm = bpNm;
        }

        /**
         * @return the purcQty
         */
        public Double getPurcQty() {
            return purcQty;
        }

        /**
         * @param purcQty the purcQty to set
         */
        public void setPurcQty(Double purcQty) {
            this.purcQty = purcQty;
        }

        /**
         * @return the returnQty
         */
        public Double getReturnQty() {
            return returnQty;
        }

        /**
         * @param returnQty the returnQty to set
         */
        public void setReturnQty(Double returnQty) {
            this.returnQty = returnQty;
        }

        /**
         * @return the resvQty
         */
        public Double getResvQty() {
            return resvQty;
        }

        /**
         * @param resvQty the resvQty to set
         */
        public void setResvQty(Double resvQty) {
            this.resvQty = resvQty;
        }

        /**
         * @return the purcReqQty
         */
        public Double getPurcReqQty() {
            return purcReqQty;
        }

        /**
         * @param purcReqQty the purcReqQty to set
         */
        public void setPurcReqQty(Double purcReqQty) {
            this.purcReqQty = purcReqQty;
        }

        /**
         * @return the purcUnitCd
         */
        public String getPurcUnitCd() {
            return purcUnitCd;
        }

        /**
         * @param purcUnitCd the purcUnitCd to set
         */
        public void setPurcUnitCd(String purcUnitCd) {
            this.purcUnitCd = purcUnitCd;
        }

        /**
         * @return the prcTp
         */
        public String getPrcTp() {
            return prcTp;
        }

        /**
         * @param prcTp the prcTp to set
         */
        public void setPrcTp(String prcTp) {
            this.prcTp = prcTp;
        }

        /**
         * @return the purcPrc
         */
        public Double getPurcPrc() {
            return purcPrc;
        }

        /**
         * @param purcPrc the purcPrc to set
         */
        public void setPurcPrc(Double purcPrc) {
            this.purcPrc = purcPrc;
        }

        /**
         * @return the orgPurcPrc
         */
        public Double getOrgPurcPrc() {
            return orgPurcPrc;
        }

        /**
         * @param orgPurcPrc the orgPurcPrc to set
         */
        public void setOrgPurcPrc(Double orgPurcPrc) {
            this.orgPurcPrc = orgPurcPrc;
        }

        /**
         * @return the purcAmt
         */
        public Double getPurcAmt() {
            return purcAmt;
        }

        /**
         * @param purcAmt the purcAmt to set
         */
        public void setPurcAmt(Double purcAmt) {
            this.purcAmt = purcAmt;
        }

        /**
         * @return the taxDdctPrc
         */
        public Double getTaxDdctPrc() {
            return taxDdctPrc;
        }

        /**
         * @param taxDdctPrc the taxDdctPrc to set
         */
        public void setTaxDdctPrc(Double taxDdctPrc) {
            this.taxDdctPrc = taxDdctPrc;
        }

        /**
         * @return the taxDdctAmt
         */
        public Double getTaxDdctAmt() {
            return taxDdctAmt;
        }

        /**
         * @param taxDdctAmt the taxDdctAmt to set
         */
        public void setTaxDdctAmt(Double taxDdctAmt) {
            this.taxDdctAmt = taxDdctAmt;
        }

        /**
         * @return the purcReqDt
         */
        public Date getPurcReqDt() {
            return purcReqDt;
        }

        /**
         * @param purcReqDt the purcReqDt to set
         */
        public void setPurcReqDt(Date purcReqDt) {
            this.purcReqDt = purcReqDt;
        }

        /**
         * @return the sendDt
         */
        public Date getSendDt() {
            return sendDt;
        }

        /**
         * @param sendDt the sendDt to set
         */
        public void setSendDt(Date sendDt) {
            this.sendDt = sendDt;
        }

        /**
         * @return the purcRegDt
         */
        public String getPurcRegDt() {
            return purcRegDt;
        }

        /**
         * @param purcRegDt the purcRegDt to set
         */
        public void setPurcRegDt(String purcRegDt) {
            this.purcRegDt = purcRegDt;
        }

        /**
         * @return the purcRegDttmStr
         */
        public String getPurcRegDttmStr() {
            return purcRegDttmStr;
        }

        /**
         * @param purcRegDttmStr the purcRegDttmStr to set
         */
        public void setPurcRegDttmStr(String purcRegDttmStr) {
            this.purcRegDttmStr = purcRegDttmStr;
        }

        /**
         * @return the purcSendDttmStr
         */
        public String getPurcSendDttmStr() {
            return purcSendDttmStr;
        }

        /**
         * @param purcSendDttmStr the purcSendDttmStr to set
         */
        public void setPurcSendDttmStr(String purcSendDttmStr) {
            this.purcSendDttmStr = purcSendDttmStr;
        }

        /**
         * @return the invcDt
         */
        public String getInvcDt() {
            return invcDt;
        }

        /**
         * @param invcDt the invcDt to set
         */
        public void setInvcDt(String invcDt) {
            this.invcDt = invcDt;
        }

        /**
         * @return the arrvDt
         */
        public String getArrvDt() {
            return arrvDt;
        }

        /**
         * @param arrvDt the arrvDt to set
         */
        public void setArrvDt(String arrvDt) {
            this.arrvDt = arrvDt;
        }

        /**
         * @return the purcReturnDt
         */
        public Date getPurcReturnDt() {
            return purcReturnDt;
        }

        /**
         * @param purcReturnDt the purcReturnDt to set
         */
        public void setPurcReturnDt(Date purcReturnDt) {
            this.purcReturnDt = purcReturnDt;
        }

        /**
         * @return the confirmDt
         */
        public String getConfirmDt() {
            return confirmDt;
        }

        /**
         * @param confirmDt the confirmDt to set
         */
        public void setConfirmDt(String confirmDt) {
            this.confirmDt = confirmDt;
        }

        /**
         * @return the grStrgeCd
         */
        public String getGrStrgeCd() {
            return grStrgeCd;
        }

        /**
         * @param grStrgeCd the grStrgeCd to set
         */
        public void setGrStrgeCd(String grStrgeCd) {
            this.grStrgeCd = grStrgeCd;
        }

        /**
         * @return the grQty
         */
        public Double getGrQty() {
            return grQty;
        }

        /**
         * @param grQty the grQty to set
         */
        public void setGrQty(Double grQty) {
            this.grQty = grQty;
        }

        /**
         * @return the purcReqNo
         */
        public String getPurcReqNo() {
            return purcReqNo;
        }

        /**
         * @param purcReqNo the purcReqNo to set
         */
        public void setPurcReqNo(String purcReqNo) {
            this.purcReqNo = purcReqNo;
        }

        /**
         * @return the purcReqLineNo
         */
        public String getPurcReqLineNo() {
            return purcReqLineNo;
        }

        /**
         * @param purcReqLineNo the purcReqLineNo to set
         */
        public void setPurcReqLineNo(String purcReqLineNo) {
            this.purcReqLineNo = purcReqLineNo;
        }

        /**
         * @return the purcOrdLineDetlNo
         */
        public String getPurcOrdLineDetlNo() {
            return purcOrdLineDetlNo;
        }

        /**
         * @param purcOrdLineDetlNo the purcOrdLineDetlNo to set
         */
        public void setPurcOrdLineDetlNo(String purcOrdLineDetlNo) {
            this.purcOrdLineDetlNo = purcOrdLineDetlNo;
        }

        /**
         * @return the bmpOrdNo
         */
        public String getBmpOrdNo() {
            return bmpOrdNo;
        }

        /**
         * @param bmpOrdNo the bmpOrdNo to set
         */
        public void setBmpOrdNo(String bmpOrdNo) {
            this.bmpOrdNo = bmpOrdNo;
        }

        /**
         * @return the bmpPurcPrc
         */
        public String getBmpPurcPrc() {
            return bmpPurcPrc;
        }

        /**
         * @param bmpPurcPrc the bmpPurcPrc to set
         */
        public void setBmpPurcPrc(String bmpPurcPrc) {
            this.bmpPurcPrc = bmpPurcPrc;
        }

        /**
         * @return the dlDistCd
         */
        public String getDlDistCd() {
            return dlDistCd;
        }

        /**
         * @param dlDistCd the dlDistCd to set
         */
        public void setDlDistCd(String dlDistCd) {
            this.dlDistCd = dlDistCd;
        }

        /**
         * @return the purcReqRegUsrId
         */
        public String getPurcReqRegUsrId() {
            return purcReqRegUsrId;
        }

        /**
         * @param purcReqRegUsrId the purcReqRegUsrId to set
         */
        public void setPurcReqRegUsrId(String purcReqRegUsrId) {
            this.purcReqRegUsrId = purcReqRegUsrId;
        }

        /**
         * @return the bmpChkQty
         */
        public Double getBmpChkQty() {
            return bmpChkQty;
        }

        /**
         * @param bmpChkQty the bmpChkQty to set
         */
        public void setBmpChkQty(Double bmpChkQty) {
            this.bmpChkQty = bmpChkQty;
        }

        /**
         * @return the cancQty
         */
        public Double getCancQty() {
            return cancQty;
        }

        /**
         * @param cancQty the cancQty to set
         */
        public void setCancQty(Double cancQty) {
            this.cancQty = cancQty;
        }

        /**
         * @return the trsfTp
         */
        public String getTrsfTp() {
            return trsfTp;
        }

        /**
         * @param trsfTp the trsfTp to set
         */
        public void setTrsfTp(String trsfTp) {
            this.trsfTp = trsfTp;
        }

        /**
         * @return the trsfUsrId
         */
        public String getTrsfUsrId() {
            return trsfUsrId;
        }

        /**
         * @param trsfUsrId the trsfUsrId to set
         */
        public void setTrsfUsrId(String trsfUsrId) {
            this.trsfUsrId = trsfUsrId;
        }

        /**
         * @return the remark
         */
        public String getRemark() {
            return remark;
        }

        /**
         * @param remark the remark to set
         */
        public void setRemark(String remark) {
            this.remark = remark;
        }

        /**
         * @return the purcExcelQty
         */
        public String getPurcExcelQty() {
            return purcExcelQty;
        }

        /**
         * @param purcExcelQty the purcExcelQty to set
         */
        public void setPurcExcelQty(String purcExcelQty) {
            this.purcExcelQty = purcExcelQty;
        }

        /**
         * @return the purcLeadHm
         */
        public int getPurcLeadHm() {
            return purcLeadHm;
        }

        /**
         * @param purcLeadHm the purcLeadHm to set
         */
        public void setPurcLeadHm(int purcLeadHm) {
            this.purcLeadHm = purcLeadHm;
        }

        /**
         * @return the boQty
         */
        public Double getBoQty() {
            return boQty;
        }

        /**
         * @param boQty the boQty to set
         */
        public void setBoQty(Double boQty) {
            this.boQty = boQty;
        }

        /**
         * @return the boTotalCnt
         */
        public Double getBoTotalCnt() {
            return boTotalCnt;
        }

        /**
         * @param boTotalCnt the boTotalCnt to set
         */
        public void setBoTotalCnt(Double boTotalCnt) {
            this.boTotalCnt = boTotalCnt;
        }

        /**
         * @return the boTotalQty
         */
        public Double getBoTotalQty() {
            return boTotalQty;
        }

        /**
         * @param boTotalQty the boTotalQty to set
         */
        public void setBoTotalQty(Double boTotalQty) {
            this.boTotalQty = boTotalQty;
        }

        /**
         * @return the boTotalPrc
         */
        public Double getBoTotalPrc() {
            return boTotalPrc;
        }

        /**
         * @param boTotalPrc the boTotalPrc to set
         */
        public void setBoTotalPrc(Double boTotalPrc) {
            this.boTotalPrc = boTotalPrc;
        }

        /**
         * @return the minPackQty
         */
        public Double getMinPackQty() {
            return minPackQty;
        }

        /**
         * @param minPackQty the minPackQty to set
         */
        public void setMinPackQty(Double minPackQty) {
            this.minPackQty = minPackQty;
        }

        /**
         * @return the minPurcQty
         */
        public Double getMinPurcQty() {
            return minPurcQty;
        }

        /**
         * @param minPurcQty the minPurcQty to set
         */
        public void setMinPurcQty(Double minPurcQty) {
            this.minPurcQty = minPurcQty;
        }

        /**
         * @return the avlbStockQty
         */
        public Double getAvlbStockQty() {
            return avlbStockQty;
        }

        /**
         * @param avlbStockQty the avlbStockQty to set
         */
        public void setAvlbStockQty(Double avlbStockQty) {
            this.avlbStockQty = avlbStockQty;
        }

        /**
         * @return the resvStockQty
         */
        public Double getResvStockQty() {
            return resvStockQty;
        }

        /**
         * @param resvStockQty the resvStockQty to set
         */
        public void setResvStockQty(Double resvStockQty) {
            this.resvStockQty = resvStockQty;
        }

        /**
         * @return the clamStockQty
         */
        public Double getClamStockQty() {
            return clamStockQty;
        }

        /**
         * @param clamStockQty the clamStockQty to set
         */
        public void setClamStockQty(Double clamStockQty) {
            this.clamStockQty = clamStockQty;
        }

        /**
         * @return the borrowQty
         */
        public Double getBorrowQty() {
            return borrowQty;
        }

        /**
         * @param borrowQty the borrowQty to set
         */
        public void setBorrowQty(Double borrowQty) {
            this.borrowQty = borrowQty;
        }

        /**
         * @return the rentQty
         */
        public Double getRentQty() {
            return rentQty;
        }

        /**
         * @param rentQty the rentQty to set
         */
        public void setRentQty(Double rentQty) {
            this.rentQty = rentQty;
        }

        /**
         * @return the stockQty
         */
        public Double getStockQty() {
            return stockQty;
        }

        /**
         * @param stockQty the stockQty to set
         */
        public void setStockQty(Double stockQty) {
            this.stockQty = stockQty;
        }

        /**
         * @return the bmpOrdLineNo
         */
        public String getBmpOrdLineNo() {
            return bmpOrdLineNo;
        }

        /**
         * @param bmpOrdLineNo the bmpOrdLineNo to set
         */
        public void setBmpOrdLineNo(String bmpOrdLineNo) {
            this.bmpOrdLineNo = bmpOrdLineNo;
        }

        /**
         * @return the bmpOrdLineDetlNo
         */
        public String getBmpOrdLineDetlNo() {
            return bmpOrdLineDetlNo;
        }

        /**
         * @param bmpOrdLineDetlNo the bmpOrdLineDetlNo to set
         */
        public void setBmpOrdLineDetlNo(String bmpOrdLineDetlNo) {
            this.bmpOrdLineDetlNo = bmpOrdLineDetlNo;
        }

        /**
         * @return the cmpDstinCd
         */
        public String getCmpDstinCd() {
            return cmpDstinCd;
        }

        /**
         * @param cmpDstinCd the cmpDstinCd to set
         */
        public void setCmpDstinCd(String cmpDstinCd) {
            this.cmpDstinCd = cmpDstinCd;
        }

        /**
         * @return the purcPgssCd
         */
        public String getPurcPgssCd() {
            return purcPgssCd;
        }

        /**
         * @param purcPgssCd the purcPgssCd to set
         */
        public void setPurcPgssCd(String purcPgssCd) {
            this.purcPgssCd = purcPgssCd;
        }

        /**
         * @return the purcParNo
         */
        public String getPurcParNo() {
            return purcParNo;
        }

        /**
         * @param purcParNo the purcParNo to set
         */
        public void setPurcParNo(String purcParNo) {
            this.purcParNo = purcParNo;
        }

        /**
         * @return the confirmParNo
         */
        public String getConfirmParNo() {
            return confirmParNo;
        }

        /**
         * @param confirmParNo the confirmParNo to set
         */
        public void setConfirmParNo(String confirmParNo) {
            this.confirmParNo = confirmParNo;
        }

        /**
         * @return the confirmParNm
         */
        public String getConfirmParNm() {
            return confirmParNm;
        }

        /**
         * @param confirmParNm the confirmParNm to set
         */
        public void setConfirmParNm(String confirmParNm) {
            this.confirmParNm = confirmParNm;
        }

        /**
         * @return the confirmQty
         */
        public int getConfirmQty() {
            return confirmQty;
        }

        /**
         * @param confirmQty the confirmQty to set
         */
        public void setConfirmQty(int confirmQty) {
            this.confirmQty = confirmQty;
        }

        /**
         * @return the pgssQty
         */
        public int getPgssQty() {
            return pgssQty;
        }

        /**
         * @param pgssQty the pgssQty to set
         */
        public void setPgssQty(int pgssQty) {
            this.pgssQty = pgssQty;
        }

        /**
         * @return the shipQty
         */
        public int getShipQty() {
            return shipQty;
        }

        /**
         * @param shipQty the shipQty to set
         */
        public void setShipQty(int shipQty) {
            this.shipQty = shipQty;
        }

        /**
         * @return the cancReqQty
         */
        public int getCancReqQty() {
            return cancReqQty;
        }

        /**
         * @param cancReqQty the cancReqQty to set
         */
        public void setCancReqQty(int cancReqQty) {
            this.cancReqQty = cancReqQty;
        }

        /**
         * @return the editCd
         */
        public String getEditCd() {
            return editCd;
        }

        /**
         * @param editCd the editCd to set
         */
        public void setEditCd(String editCd) {
            this.editCd = editCd;
        }

        /**
         * @return the confirmDstinCd
         */
        public String getConfirmDstinCd() {
            return confirmDstinCd;
        }

        /**
         * @param confirmDstinCd the confirmDstinCd to set
         */
        public void setConfirmDstinCd(String confirmDstinCd) {
            this.confirmDstinCd = confirmDstinCd;
        }

        /**
         * @return the purcReqPrc
         */
        public Double getPurcReqPrc() {
            return purcReqPrc;
        }

        /**
         * @param purcReqPrc the purcReqPrc to set
         */
        public void setPurcReqPrc(Double purcReqPrc) {
            this.purcReqPrc = purcReqPrc;
        }

        /**
         * @return the taxAmt
         */
        public Double getTaxAmt() {
            return taxAmt;
        }

        /**
         * @param taxAmt the taxAmt to set
         */
        public void setTaxAmt(Double taxAmt) {
            this.taxAmt = taxAmt;
        }

        /**
         * @return the giExpcDt
         */
        public String getGiExpcDt() {
            return giExpcDt;
        }

        /**
         * @param giExpcDt the giExpcDt to set
         */
        public void setGiExpcDt(String giExpcDt) {
            this.giExpcDt = giExpcDt;
        }

        /**
         * @return the parSpecCd
         */
        public String getParSpecCd() {
            return parSpecCd;
        }

        /**
         * @param parSpecCd the parSpecCd to set
         */
        public void setParSpecCd(String parSpecCd) {
            this.parSpecCd = parSpecCd;
        }


        /**
         * @return the sucCd
         */
        public String getSucCd() {
            return sucCd;
        }

        /**
         * @param sucCd the sucCd to set
         */
        public void setSucCd(String sucCd) {
            this.sucCd = sucCd;
        }

        /**
         * @return the creDt
         */
        public String getCreDt() {
            return creDt;
        }

        /**
         * @param creDt the creDt to set
         */
        public void setCreDt(String creDt) {
            this.creDt = creDt;
        }

        /**
         * @return the creHm
         */
        public String getCreHm() {
            return creHm;
        }

        /**
         * @param creHm the creHm to set
         */
        public void setCreHm(String creHm) {
            this.creHm = creHm;
        }

        /**
         * @return the odrAlcQt
         */
        public int getOdrAlcQt() {
            return odrAlcQt;
        }

        /**
         * @param odrAlcQt the odrAlcQt to set
         */
        public void setOdrAlcQt(int odrAlcQt) {
            this.odrAlcQt = odrAlcQt;
        }

        /**
         * @return the odrOpicQt
         */
        public int getOdrOpicQt() {
            return odrOpicQt;
        }

        /**
         * @param odrOpicQt the odrOpicQt to set
         */
        public void setOdrOpicQt(int odrOpicQt) {
            this.odrOpicQt = odrOpicQt;
        }

        /**
         * @return the odrOpacQt
         */
        public int getOdrOpacQt() {
            return odrOpacQt;
        }

        /**
         * @param odrOpacQt the odrOpacQt to set
         */
        public void setOdrOpacQt(int odrOpacQt) {
            this.odrOpacQt = odrOpacQt;
        }

        /**
         * @return the odrPakdQt
         */
        public int getOdrPakdQt() {
            return odrPakdQt;
        }

        /**
         * @param odrPakdQt the odrPakdQt to set
         */
        public void setOdrPakdQt(int odrPakdQt) {
            this.odrPakdQt = odrPakdQt;
        }

        /**
         * @return the odrInvQt
         */
        public int getOdrInvQt() {
            return odrInvQt;
        }

        /**
         * @param odrInvQt the odrInvQt to set
         */
        public void setOdrInvQt(int odrInvQt) {
            this.odrInvQt = odrInvQt;
        }

        /**
         * @return the purcReqRegUsrNm
         */
        public String getPurcReqRegUsrNm() {
            return purcReqRegUsrNm;
        }

        /**
         * @param purcReqRegUsrNm the purcReqRegUsrNm to set
         */
        public void setPurcReqRegUsrNm(String purcReqRegUsrNm) {
            this.purcReqRegUsrNm = purcReqRegUsrNm;
        }

        /**
         * @return the regUsrNm
         */
        public String getRegUsrNm() {
            return regUsrNm;
        }

        /**
         * @param regUsrNm the regUsrNm to set
         */
        public void setRegUsrNm(String regUsrNm) {
            this.regUsrNm = regUsrNm;
        }

        /**
         * @return the spyrCd
         */
        public String getSpyrCd() {
            return spyrCd;
        }

        /**
         * @param spyrCd the spyrCd to set
         */
        public void setSpyrCd(String spyrCd) {
            this.spyrCd = spyrCd;
        }

        /**
         * @return the purcReqNoList
         */
        public List<String> getPurcReqNoList() {
            return purcReqNoList;
        }

        /**
         * @param purcReqNoList the purcReqNoList to set
         */
        public void setPurcReqNoList(List<String> purcReqNoList) {
            this.purcReqNoList = purcReqNoList;
        }

        /**
         * @return the purcReqQtyList
         */
        public List<Double> getPurcReqQtyList() {
            return purcReqQtyList;
        }

        /**
         * @param purcReqQtyList the purcReqQtyList to set
         */
        public void setPurcReqQtyList(List<Double> purcReqQtyList) {
            this.purcReqQtyList = purcReqQtyList;
        }

        /**
         * @return the calcConfirmQty
         */
        public Double getCalcConfirmQty() {
            return calcConfirmQty;
        }

        /**
         * @param calcConfirmQty the calcConfirmQty to set
         */
        public void setCalcConfirmQty(Double calcConfirmQty) {
            this.calcConfirmQty = calcConfirmQty;
        }

        /**
         * @return the calcPurcAmt
         */
        public Double getCalcPurcAmt() {
            return calcPurcAmt;
        }

        /**
         * @param calcPurcAmt the calcPurcAmt to set
         */
        public void setCalcPurcAmt(Double calcPurcAmt) {
            this.calcPurcAmt = calcPurcAmt;
        }

        /**
         * @return the calcTaxDdctAmt
         */
        public Double getCalcTaxDdctAmt() {
            return calcTaxDdctAmt;
        }

        /**
         * @param calcTaxDdctAmt the calcTaxDdctAmt to set
         */
        public void setCalcTaxDdctAmt(Double calcTaxDdctAmt) {
            this.calcTaxDdctAmt = calcTaxDdctAmt;
        }

        /**
         * @return the bmpChkCnt
         */
        public int getBmpChkCnt() {
            return bmpChkCnt;
        }

        /**
         * @param bmpChkCnt the bmpChkCnt to set
         */
        public void setBmpChkCnt(int bmpChkCnt) {
            this.bmpChkCnt = bmpChkCnt;
        }

        /**
         * @return the bmpChkAmt
         */
        public Double getBmpChkAmt() {
            return bmpChkAmt;
        }

        /**
         * @param bmpChkAmt the bmpChkAmt to set
         */
        public void setBmpChkAmt(Double bmpChkAmt) {
            this.bmpChkAmt = bmpChkAmt;
        }

        /**
         * @return the calcConfirmCnt
         */
        public int getCalcConfirmCnt() {
            return calcConfirmCnt;
        }

        /**
         * @param calcConfirmCnt the calcConfirmCnt to set
         */
        public void setCalcConfirmCnt(int calcConfirmCnt) {
            this.calcConfirmCnt = calcConfirmCnt;
        }

        /**
         * @return the calcConfirmAmt
         */
        public Double getCalcConfirmAmt() {
            return calcConfirmAmt;
        }

        /**
         * @param calcConfirmAmt the calcConfirmAmt to set
         */
        public void setCalcConfirmAmt(Double calcConfirmAmt) {
            this.calcConfirmAmt = calcConfirmAmt;
        }

        /**
         * @return the odrAlcCnt
         */
        public int getOdrAlcCnt() {
            return odrAlcCnt;
        }

        /**
         * @param odrAlcCnt the odrAlcCnt to set
         */
        public void setOdrAlcCnt(int odrAlcCnt) {
            this.odrAlcCnt = odrAlcCnt;
        }

        /**
         * @return the odrAlcQty
         */
        public Double getOdrAlcQty() {
            return odrAlcQty;
        }

        /**
         * @param odrAlcQty the odrAlcQty to set
         */
        public void setOdrAlcQty(Double odrAlcQty) {
            this.odrAlcQty = odrAlcQty;
        }

        /**
         * @return the odrAlcAmt
         */
        public Double getOdrAlcAmt() {
            return odrAlcAmt;
        }

        /**
         * @param odrAlcAmt the odrAlcAmt to set
         */
        public void setOdrAlcAmt(Double odrAlcAmt) {
            this.odrAlcAmt = odrAlcAmt;
        }

        /**
         * @return the boCnt
         */
        public int getBoCnt() {
            return boCnt;
        }

        /**
         * @param boCnt the boCnt to set
         */
        public void setBoCnt(int boCnt) {
            this.boCnt = boCnt;
        }

        /**
         * @return the boAmt
         */
        public Double getBoAmt() {
            return boAmt;
        }

        /**
         * @param boAmt the boAmt to set
         */
        public void setBoAmt(Double boAmt) {
            this.boAmt = boAmt;
        }

        /**
         * @return the odrOpicCnt
         */
        public int getOdrOpicCnt() {
            return odrOpicCnt;
        }

        /**
         * @param odrOpicCnt the odrOpicCnt to set
         */
        public void setOdrOpicCnt(int odrOpicCnt) {
            this.odrOpicCnt = odrOpicCnt;
        }

        /**
         * @return the odrOpicQty
         */
        public Double getOdrOpicQty() {
            return odrOpicQty;
        }

        /**
         * @param odrOpicQty the odrOpicQty to set
         */
        public void setOdrOpicQty(Double odrOpicQty) {
            this.odrOpicQty = odrOpicQty;
        }

        /**
         * @return the odrOpicAmt
         */
        public Double getOdrOpicAmt() {
            return odrOpicAmt;
        }

        /**
         * @param odrOpicAmt the odrOpicAmt to set
         */
        public void setOdrOpicAmt(Double odrOpicAmt) {
            this.odrOpicAmt = odrOpicAmt;
        }

        /**
         * @return the odrOpacCnt
         */
        public int getOdrOpacCnt() {
            return odrOpacCnt;
        }

        /**
         * @param odrOpacCnt the odrOpacCnt to set
         */
        public void setOdrOpacCnt(int odrOpacCnt) {
            this.odrOpacCnt = odrOpacCnt;
        }

        /**
         * @return the odrOpacQty
         */
        public Double getOdrOpacQty() {
            return odrOpacQty;
        }

        /**
         * @param odrOpacQty the odrOpacQty to set
         */
        public void setOdrOpacQty(Double odrOpacQty) {
            this.odrOpacQty = odrOpacQty;
        }

        /**
         * @return the odrOpacAmt
         */
        public Double getOdrOpacAmt() {
            return odrOpacAmt;
        }

        /**
         * @param odrOpacAmt the odrOpacAmt to set
         */
        public void setOdrOpacAmt(Double odrOpacAmt) {
            this.odrOpacAmt = odrOpacAmt;
        }

        /**
         * @return the odrPakdCnt
         */
        public int getOdrPakdCnt() {
            return odrPakdCnt;
        }

        /**
         * @param odrPakdCnt the odrPakdCnt to set
         */
        public void setOdrPakdCnt(int odrPakdCnt) {
            this.odrPakdCnt = odrPakdCnt;
        }

        /**
         * @return the odrPakdQty
         */
        public Double getOdrPakdQty() {
            return odrPakdQty;
        }

        /**
         * @param odrPakdQty the odrPakdQty to set
         */
        public void setOdrPakdQty(Double odrPakdQty) {
            this.odrPakdQty = odrPakdQty;
        }

        /**
         * @return the odrPakdAmt
         */
        public Double getOdrPakdAmt() {
            return odrPakdAmt;
        }

        /**
         * @param odrPakdAmt the odrPakdAmt to set
         */
        public void setOdrPakdAmt(Double odrPakdAmt) {
            this.odrPakdAmt = odrPakdAmt;
        }

        /**
         * @return the odrInvCnt
         */
        public int getOdrInvCnt() {
            return odrInvCnt;
        }

        /**
         * @param odrInvCnt the odrInvCnt to set
         */
        public void setOdrInvCnt(int odrInvCnt) {
            this.odrInvCnt = odrInvCnt;
        }

        /**
         * @return the odrInvQty
         */
        public Double getOdrInvQty() {
            return odrInvQty;
        }

        /**
         * @param odrInvQty the odrInvQty to set
         */
        public void setOdrInvQty(Double odrInvQty) {
            this.odrInvQty = odrInvQty;
        }

        /**
         * @return the odrInvAmt
         */
        public Double getOdrInvAmt() {
            return odrInvAmt;
        }

        /**
         * @param odrInvAmt the odrInvAmt to set
         */
        public void setOdrInvAmt(Double odrInvAmt) {
            this.odrInvAmt = odrInvAmt;
        }



        /**
         * @return the odrDlrBoCnt
         */
        public int getOdrDlrBoCnt() {
            return odrDlrBoCnt;
        }

        /**
         * @param odrDlrBoCnt the odrDlrBoCnt to set
         */
        public void setOdrDlrBoCnt(int odrDlrBoCnt) {
            this.odrDlrBoCnt = odrDlrBoCnt;
        }

        /**
         * @return the odrDlrBoQty
         */
        public Double getOdrDlrBoQty() {
            return odrDlrBoQty;
        }

        /**
         * @param odrDlrBoQty the odrDlrBoQty to set
         */
        public void setOdrDlrBoQty(Double odrDlrBoQty) {
            this.odrDlrBoQty = odrDlrBoQty;
        }

        /**
         * @return the odrDlrBoAmt
         */
        public Double getOdrDlrBoAmt() {
            return odrDlrBoAmt;
        }

        /**
         * @param odrDlrBoAmt the odrDlrBoAmt to set
         */
        public void setOdrDlrBoAmt(Double odrDlrBoAmt) {
            this.odrDlrBoAmt = odrDlrBoAmt;
        }

        /**
         * {@inheritDoc}
         */
        public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
            try{
                switch(cellNo){
                    case 0:this.setItemCd(ExcelDataBinderUtil.toString(value).trim()); break;   //부품번호
                    case 1:this.setPurcExcelQty(ExcelDataBinderUtil.toString(value).trim()); break;     //구매수량
                }
            }catch(Exception e){

                ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
                bindingException.setRowNo(rowNo);
                bindingException.setColNo(cellNo);
                bindingException.setFieldValue(value.toString());

                throw bindingException;
            }
        }

        /**
         * {@inheritDoc}
         */
        public List<ExcelUploadError> validate(ExcelDataBindContext context) {

            List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

            if(!(StringUtils.isBlank(this.getItemCd()) && StringUtils.isBlank(this.getPurcExcelQty()))){
                //부품번호
                if(StringUtils.isBlank(this.getItemCd())){

                    String msg = messageSource.getMessage(
                        "global.info.required.field"
                        , new String[]{
                                messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale())
                        }
                        , LocaleContextHolder.getLocale()
                    );

                    errors.add(new ExcelUploadError(context.getRow(), 0, this.getItemCd(), msg));
                }


                if(StringUtils.isBlank(this.getPurcExcelQty())){
                    String msg = messageSource.getMessage(
                            "global.info.emptyParamInfo"
                            , new String[]{
                                    messageSource.getMessage("par.lbl.purcQty", null, LocaleContextHolder.getLocale())
                            }
                            , LocaleContextHolder.getLocale()
                        );

                        errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getPurcQty()), msg));
                }else{

                    //구매수량
                    if(NumberUtils.isNumber(this.getPurcExcelQty())){
                        if(NumberUtils.toDouble(this.getPurcExcelQty()) <= 0){
                            String msg = messageSource.getMessage(
                                "par.info.itemReqZeroCntMsg"
                                , new String[]{
                                        messageSource.getMessage("par.lbl.purcQty", null, LocaleContextHolder.getLocale())
                                       ,"0"
                                }
                                , LocaleContextHolder.getLocale()
                            );

                            errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getPurcExcelQty()), msg));
                        }
                    }else{
                        String msg = messageSource.getMessage(
                                "global.err.checkQtyParam"
                                , new String[]{
                                        messageSource.getMessage("par.lbl.purcQty", null, LocaleContextHolder.getLocale())
                                }
                                , LocaleContextHolder.getLocale()
                            );

                            errors.add(new ExcelUploadError(context.getRow(), 1, String.valueOf(this.getPurcExcelQty()), msg));
                    }
                }
            }

            return errors;

        }

		public String getAppealStat() {
			return appealStat;
		}

		public void setAppealStat(String appealStat) {
			this.appealStat = appealStat;
		}

		public String getQuestionNo() {
			return questionNo;
		}

		public void setQuestionNo(String questionNo) {
			this.questionNo = questionNo;
		}

		public String getReplyLevel() {
			return replyLevel;
		}

		public void setReplyLevel(String replyLevel) {
			this.replyLevel = replyLevel;
		}

		public Date getExpectArrivalDt() {
			return expectArrivalDt;
		}

		public void setExpectArrivalDt(Date expectArrivalDt) {
			this.expectArrivalDt = expectArrivalDt;
		}

		public String getReplyStatus() {
			return replyStatus;
		}

		public void setReplyStatus(String replyStatus) {
			this.replyStatus = replyStatus;
		}


		public String getAppealRegUsrNm() {
			return appealRegUsrNm;
		}

		public void setAppealRegUsrNm(String appealRegUsrNm) {
			this.appealRegUsrNm = appealRegUsrNm;
		}

		public String getOverTimeFlg() {
			return overTimeFlg;
		}

		public void setOverTimeFlg(String overTimeFlg) {
			this.overTimeFlg = overTimeFlg;
		}

		public String getBmpCd() {
			return bmpCd;
		}

		public void setBmpCd(String bmpCd) {
			this.bmpCd = bmpCd;
		}

		public Date getDealDt() {
			return dealDt;
		}

		public void setDealDt(Date dealDt) {
			this.dealDt = dealDt;
		}


		public String getReplyContent() {
			return replyContent;
		}

		public void setReplyContent(String replyContent) {
			this.replyContent = replyContent;
		}

		public String getAppealContent() {
			return appealContent;
		}

		public void setAppealContent(String appealContent) {
			this.appealContent = appealContent;
		}

		public String getDealDtStr() {
			return dealDtStr;
		}

		public void setDealDtStr(String dealDtStr) {
			this.dealDtStr = dealDtStr;
		}



		public String getAppealRegDtStr() {
			return appealRegDtStr;
		}

		public void setAppealRegDtStr(String appealRegDtStr) {
			this.appealRegDtStr = appealRegDtStr;
		}

		public String getExpectArrivalDtStr() {
			return expectArrivalDtStr;
		}

		public void setExpectArrivalDtStr(String expectArrivalDtStr) {
			this.expectArrivalDtStr = expectArrivalDtStr;
		}

		public String getSmDealDtStr() {
			return smDealDtStr;
		}

		public void setSmDealDtStr(String smDealDtStr) {
			this.smDealDtStr = smDealDtStr;
		}

		public String getPcDealDtStr() {
			return pcDealDtStr;
		}

		public void setPcDealDtStr(String pcDealDtStr) {
			this.pcDealDtStr = pcDealDtStr;
		}

		public String getSmUsrNm() {
			return smUsrNm;
		}

		public void setSmUsrNm(String smUsrNm) {
			this.smUsrNm = smUsrNm;
		}

		public String getPcUsrNm() {
			return pcUsrNm;
		}

		public void setPcUsrNm(String pcUsrNm) {
			this.pcUsrNm = pcUsrNm;
		}

		public String getAppealRegUsrId() {
			return appealRegUsrId;
		}

		public void setAppealRegUsrId(String appealRegUsrId) {
			this.appealRegUsrId = appealRegUsrId;
		}
		

}

