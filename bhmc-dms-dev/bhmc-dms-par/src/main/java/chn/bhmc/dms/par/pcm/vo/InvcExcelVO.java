package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="invcDocNo", mesgKey="par.lbl.invcDocNo")
    ,@ValidField(field="invcTp", mesgKey="par.lbl.invcTp")
    ,@ValidField(field="invcDstinCd", mesgKey="par.lbl.invcDstinCd")
    ,@ValidField(field="invcStatCd", mesgKey="par.lbl.invcStatCd")
    ,@ValidField(field="invcDt", mesgKey="par.lbl.invcDt")
    ,@ValidField(field="arrvDt", mesgKey="par.lbl.arrvDt")
    ,@ValidField(field="confirmDt", mesgKey="par.lbl.confirmDt")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="mobisInvcNo", mesgKey="par.lbl.mobisInvcNo")
    ,@ValidField(field="currCd", mesgKey="par.lbl.currency")
    ,@ValidField(field="invcTotAmt", mesgKey="par.lbl.invcTotAmt")
    ,@ValidField(field="vatCd", mesgKey="par.lbl.vatCd")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
})
public class InvcExcelVO extends BaseVO{
	
	 /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    private String invcDocNo;

    /**
     * 입고문서번호
     **/
    private String grDocNo;

    /**
     * 입고문서 업무구분
     */
    private String grDocTp;

    /**
     * 송장유형
     **/
    private String invcTp;

    /**
     * 송장구분코드
     **/
    private String invcDstinCd;

    /**
     * 송장상태코드
     * 装箱单状态编码
     **/
    private String invcStatCd;
    
    /**
     * 装箱单状态名称
     **/
    private String invcStatCdNm;

    /**
     * 운송유형
     **/
    private String trsfTp;

    /**
     * 공급처유형
     **/
    private String bpTp;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 도착일자CHAR
     **/
    private String arrvDtChar;

    /**
     * 도착일자 시간CHAR
     **/
    private String arrvTmChar;

    /**
     * 등록일자CHAR
     **/
    private String regDtChar;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcGrDt;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 통화코드
     **/
    private String currCd;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 전송금액
     **/
    private Double trsfAmt;

    /**
     * 보험비
     **/
    private Double incAmt;

    /**
     * 부가세코드
     **/
    private String vatCd;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 인터페이스여부
     **/
    private String ifYn;

    /**
     * 부품건수
     **/
    private Double itemCnt;

    /**
     * 세금포함 구매금액
     **/
    private Double purcIncTaxAmt;

    /**
     * 구매금액
     **/
    private Double purcAmt;

    /**
     * 부품수량
     **/
    private Double itemQty;

    /**
     * out box count
     **/
    private Double invcCseCnt;

    /**
     * out box CBM
     **/
    private Double invcCbm;

    /**
     * total line no
     **/
    private Double invcTotalLine;

    /**
     * transporter code(물류회사)
     **/
    private String invcTspCode;

    /**
     * TR NO
     **/
    private String invcGcnBlNo;

    /**
     * truck no
     **/
    private String invcTnCnNo;


    /**
     * Invoice Quantity
     **/
    private Double invcSumQt;

    /**
     * 송장 부가세 제외 금액
     **/
    private Double invcAmtCur;

    /**
     * 입고수량
     **/
    private Double grTotQty;

    /**
     * 클레임수량
     **/
    private Double claimTotQty;

    /**
     * 입고금액
     **/
    private Double grIncTaxAmt;

    /**
     * 입고금액(부가세 제외)
     **/
    private Double grAmt;

    /**
     * 입고총금액
     **/
    private Double grTotIncTaxAmt;

    /**
     * 입고총금액(부가세 제외)
     **/
    private Double grTotAmt;

    /**
     * 할인율
     **/
    private Double dcRate;


    /**
     * 구매신청자
     **/
    private String regUsrId;

    /**
     * 구매신청자명
     **/
    private String regUsrNm;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;
    
    
    
    //子表信息
    
    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sdlrCd;

    /**
     * 송장문서번호
     **/
    @NotEmpty
    private String sinvcDocNo;

    /**
     * 송장문서라인번호
     **/
    @NotEmpty
    private int sinvcDocLineNo;

    /**
     * 모비스송장번호
     **/
    private String smobisInvcNo;

    /**
     * 모비스송장라인번호
     **/
    private int smobisInvcLineNo;

    /**
     * 구매오더유형
     **/
    private String spurcOrdTp;

    /**
     * 구매오더번호
     **/
    private String spurcOrdNo;

    /**
     * 구매오더라인번호
     **/
    private String spurcOrdLineNo;

    /**
     * I/F 구매오더번호
     **/
    private String sinvcIfOrdNo;

    /**
     * I/F 구매오더라인번호
     **/
    private String sinvcIfOrdLn;

    /**
     * 구매오더라인구분자
     **/
    private String spurcOrdLineDetlNo;

    /**
     * 품목코드
     **/
    private String sitemCd;

    /**
     * 품목명
     **/
    private String sitemNm;

    /**
     * 가격유형
     **/
    private String sprcTp;

    /**
     * 송장대상수량
     **/
    private Double sinvcTargetQty;

    /**
     * 송장수량
     **/
    private Double sinvcQty;

    /**
     * 구매수량
     **/
    private Double spurcQty;

    /**
     * 엑셀업로드수량
     **/
    private String sexcelQty;

    /**
     * 엑셀업로드단가
     **/
    private String sexcelPrc;

    /**
     * 엑셀업로드세전단가
     **/
    private String sexcelTaxDdctPrc;

    /**
     * 엑셀창고코드
     **/
    private String sexcelStrgeCd;

    /**
     * 엑셀창고이름
     **/
    private String sexcelStrgeNm;

    /**
     * 송장원본수량(구매수량)
     **/
    private Double sinvcQtyOrg;

    /**
     * 송장단위코드
     **/
    private String sinvcUnitCd;

    /**
     * 공급상
     **/
    private String sspyrCd;

    /**
     * 송장단가
     **/
    private Double sinvcPrc;

    /**
     * 세금공제단가
     **/
    private Double staxDdctPrc;

    /**
     * 할인율
     **/
    private Double sdcRate;

    /**
     * 송장단가(세액포함)
     **/
    private Double sinvcIncTaxPrc;

    /**
     * 송장금액
     **/
    private Double sinvcAmt;

    /**
     * 부가세금액
     **/
    private Double svatAmt;

    /**
     * 송장총금액
     **/
    private Double sinvcTotAmt;

    /**
     * 입고총금액
     **/
    private Double sgrTotAmt;

    /**
     * 입고총금액(세금제외)
     **/
    private Double sgrTaxDdctAmt;

    /**
     * 세금
     **/
    private Double staxAmt;

    /**
     * 차변대변구분코드
     **/
    private String sdebitCreditDstinCd;

    /**
     * 참조송장문서번호
     **/
    private String srefInvcDocNo;

    /**
     * 참조송장문서라인번호
     **/
    private int srefInvcDocLineNo;

    /**
     * 도착예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sarrvDt;

    /**
     * 송장입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sinvcGrDt;

    /**
     * INVOICE일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sinvcDt;

    /**
     * 구매신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date spurcRegDt;

    /**
     * 배송PDC코드
     **/
    private String sdlPdcCd;

    /**
     * 입고창고코드
     **/
    private String sgrStrgeCd;

    /**
     * 입고창고명
     **/
    private String sgrStrgeNm;

    /**
     * 입고Location
     **/
    private String sgrLocCd;

    /**
     * 입고Location명
     **/
    private String sgrLocNm;

    /**
     * 입고수량
     **/
    private Double sgrQty;

    /**
     * 거래처코드
     **/
    private String sbpCd;

    /**
     * 거래처명
     **/
    private String sbpNm;

    /**
     * 구매신청자
     **/
    private String sordRegUsrId;

    /**
     * 구매신청자명
     **/
    private String sordRegUsrNm;

    /**
     * 결품신청자
     **/
    private String sreqUsrId;

    /**
     * 결품신청자명
     **/
    private String sreqUsrNm;

    /**
     * 클레임대상코드
     **/
    private String sclaimTargCd;

    /**
     * 배송거래처코드
     **/
    private String sdlBpCd;

    /**
     * 배송거래처명
     **/
    private String sdlBpNm;

    /**
     * 클레임유형
     **/
    private String sclaimTp;

    /**
     * 송장유형
     **/
    private String sinvcTp;

    /**
     * 송장상태
     **/
    private String sinvcStatCd;

    /**
     * 기 클레임수량
     **/
    private Double sprevClaimQty;

    /**
     * 클레임수량
     **/
    private Double sclaimQty;

    /**
     * 차이수량
     **/
    private Double scompareQty;

    /**
     * 요청내용
     **/
    private String sreqCont;

    /**
     * 문서파일번호
     **/
    private String sdocFileNo;

    /**
     * 입고완료여부
     */
    private String sgrEndYn;

    /**
     * BOX번호
     */
    private String sboxNo;

    /**
     * BMP구매번호
     */
    private String sbmpOrdNo;

    /**
     * BMP구매라인번호
     */
    private String sbmpOrdLineNo;

    /**
     * 구매단가
     **/
    private Double spurcPrc;

    /**
     * 구매금액
     **/
    private Double spurcAmt;

    /**
     * 실구매요청수량
     **/
    private Double spurcReqQty;

    /**
     * 가용재고
     **/
    private Double savlbStockQty;

    /**
     * 예약수량
     **/
    private Double sresvStockQty;

    /**
     * 재고수량
     **/
    private Double sstockQty;

    /**
     * 차입수량
     **/
    private Double sborrowQty;

    /**
     * 대여수량
     **/
    private Double srentQty;

    /**
     * 수불문서년월
     **/
    private String smvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String smvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int smvtDocLineNo;
    
    
    
    
    
    
    
    
    
    
    

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
     * @return the invcDocNo
     */
    public String getInvcDocNo() {
        return invcDocNo;
    }

    /**
     * @param invcDocNo the invcDocNo to set
     */
    public void setInvcDocNo(String invcDocNo) {
        this.invcDocNo = invcDocNo;
    }

    /**
     * @return the invcTp
     */
    public String getInvcTp() {
        return invcTp;
    }

    /**
     * @param invcTp the invcTp to set
     */
    public void setInvcTp(String invcTp) {
        this.invcTp = invcTp;
    }

    /**
     * @return the invcDstinCd
     */
    public String getInvcDstinCd() {
        return invcDstinCd;
    }

    /**
     * @param invcDstinCd the invcDstinCd to set
     */
    public void setInvcDstinCd(String invcDstinCd) {
        this.invcDstinCd = invcDstinCd;
    }

    /**
     * @return the invcStatCd
     */
    public String getInvcStatCd() {
        return invcStatCd;
    }

    /**
     * @param invcStatCd the invcStatCd to set
     */
    public void setInvcStatCd(String invcStatCd) {
        this.invcStatCd = invcStatCd;
    }

    /**
     * @return the invcDt
     */
    public Date getInvcDt() {
        return invcDt;
    }

    /**
     * @param invcDt the invcDt to set
     */
    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
    }

    /**
     * @return the arrvDt
     */
    public Date getArrvDt() {
        return arrvDt;
    }

    /**
     * @param arrvDt the arrvDt to set
     */
    public void setArrvDt(Date arrvDt) {
        this.arrvDt = arrvDt;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
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
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
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
     * @return the currCd
     */
    public String getCurrCd() {
        return currCd;
    }

    /**
     * @param currCd the currCd to set
     */
    public void setCurrCd(String currCd) {
        this.currCd = currCd;
    }

    /**
     * @return the invcTotAmt
     */
    public Double getInvcTotAmt() {
        return invcTotAmt;
    }

    /**
     * @param invcTotAmt the invcTotAmt to set
     */
    public void setInvcTotAmt(Double invcTotAmt) {
        this.invcTotAmt = invcTotAmt;
    }

    /**
     * @return the vatCd
     */
    public String getVatCd() {
        return vatCd;
    }

    /**
     * @param vatCd the vatCd to set
     */
    public void setVatCd(String vatCd) {
        this.vatCd = vatCd;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
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
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
    }

    /**
     * @param ifYn the ifYn to set
     */
    public void setIfYn(String ifYn) {
        this.ifYn = ifYn;
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
     * @return the itemCnt
     */
    public Double getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(Double itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the ifYn
     */
    public String getIfYn() {
        return ifYn;
    }

    /**
     * @return the purcIncTaxAmt
     */
    public Double getPurcIncTaxAmt() {
        return purcIncTaxAmt;
    }

    /**
     * @param purcIncTaxAmt the purcIncTaxAmt to set
     */
    public void setPurcIncTaxAmt(Double purcIncTaxAmt) {
        this.purcIncTaxAmt = purcIncTaxAmt;
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
     * @return the invcCseCnt
     */
    public Double getInvcCseCnt() {
        return invcCseCnt;
    }

    /**
     * @param invcCseCnt the invcCseCnt to set
     */
    public void setInvcCseCnt(Double invcCseCnt) {
        this.invcCseCnt = invcCseCnt;
    }

    /**
     * @return the invcCbm
     */
    public Double getInvcCbm() {
        return invcCbm;
    }

    /**
     * @param invcCbm the invcCbm to set
     */
    public void setInvcCbm(Double invcCbm) {
        this.invcCbm = invcCbm;
    }

    /**
     * @return the invcTotalLine
     */
    public Double getInvcTotalLine() {
        return invcTotalLine;
    }

    /**
     * @param invcTotalLine the invcTotalLine to set
     */
    public void setInvcTotalLine(Double invcTotalLine) {
        this.invcTotalLine = invcTotalLine;
    }

    /**
     * @return the invcTspCode
     */
    public String getInvcTspCode() {
        return invcTspCode;
    }

    /**
     * @param invcTspCode the invcTspCode to set
     */
    public void setInvcTspCode(String invcTspCode) {
        this.invcTspCode = invcTspCode;
    }

    /**
     * @return the invcGcnBlNo
     */
    public String getInvcGcnBlNo() {
        return invcGcnBlNo;
    }

    /**
     * @param invcGcnBlNo the invcGcnBlNo to set
     */
    public void setInvcGcnBlNo(String invcGcnBlNo) {
        this.invcGcnBlNo = invcGcnBlNo;
    }

    /**
     * @return the invcTnCnNo
     */
    public String getInvcTnCnNo() {
        return invcTnCnNo;
    }

    /**
     * @param invcTnCnNo the invcTnCnNo to set
     */
    public void setInvcTnCnNo(String invcTnCnNo) {
        this.invcTnCnNo = invcTnCnNo;
    }

    /**
     * @return the invcSumQt
     */
    public Double getInvcSumQt() {
        return invcSumQt;
    }

    /**
     * @param invcSumQt the invcSumQt to set
     */
    public void setInvcSumQt(Double invcSumQt) {
        this.invcSumQt = invcSumQt;
    }

    /**
     * @return the invcAmtCur
     */
    public Double getInvcAmtCur() {
        return invcAmtCur;
    }

    /**
     * @param invcAmtCur the invcAmtCur to set
     */
    public void setInvcAmtCur(Double invcAmtCur) {
        this.invcAmtCur = invcAmtCur;
    }

    /**
     * @return the invcGrDt
     */
    public Date getInvcGrDt() {
        return invcGrDt;
    }

    /**
     * @param invcGrDt the invcGrDt to set
     */
    public void setInvcGrDt(Date invcGrDt) {
        this.invcGrDt = invcGrDt;
    }

    /**
     * @return the grTotIncTaxAmt
     */
    public Double getGrTotIncTaxAmt() {
        return grTotIncTaxAmt;
    }

    /**
     * @param grTotIncTaxAmt the grTotIncTaxAmt to set
     */
    public void setGrTotIncTaxAmt(Double grTotIncTaxAmt) {
        this.grTotIncTaxAmt = grTotIncTaxAmt;
    }

    /**
     * @return the grTotAmt
     */
    public Double getGrTotAmt() {
        return grTotAmt;
    }

    /**
     * @param grTotAmt the grTotAmt to set
     */
    public void setGrTotAmt(Double grTotAmt) {
        this.grTotAmt = grTotAmt;
    }

    /**
     * @return the grIncTaxAmt
     */
    public Double getGrIncTaxAmt() {
        return grIncTaxAmt;
    }

    /**
     * @param grIncTaxAmt the grIncTaxAmt to set
     */
    public void setGrIncTaxAmt(Double grIncTaxAmt) {
        this.grIncTaxAmt = grIncTaxAmt;
    }

    /**
     * @return the grAmt
     */
    public Double getGrAmt() {
        return grAmt;
    }

    /**
     * @param grAmt the grAmt to set
     */
    public void setGrAmt(Double grAmt) {
        this.grAmt = grAmt;
    }

    /**
     * @return the arrvDtChar
     */
    public String getArrvDtChar() {
        return arrvDtChar;
    }

    /**
     * @param arrvDtChar the arrvDtChar to set
     */
    public void setArrvDtChar(String arrvDtChar) {
        this.arrvDtChar = arrvDtChar;
    }

    /**
     * @return the arrvTmChar
     */
    public String getArrvTmChar() {
        return arrvTmChar;
    }

    /**
     * @param arrvTmChar the arrvTmChar to set
     */
    public void setArrvTmChar(String arrvTmChar) {
        this.arrvTmChar = arrvTmChar;
    }

    /**
     * @return the regDtChar
     */
    public String getRegDtChar() {
        return regDtChar;
    }

    /**
     * @param regDtChar the regDtChar to set
     */
    public void setRegDtChar(String regDtChar) {
        this.regDtChar = regDtChar;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the grDocNo
     */
    public String getGrDocNo() {
        return grDocNo;
    }

    /**
     * @param grDocNo the grDocNo to set
     */
    public void setGrDocNo(String grDocNo) {
        this.grDocNo = grDocNo;
    }


    /**
     * @return the grDocTp
     */
    public String getGrDocTp() {
        return grDocTp;
    }

    /**
     * @param grDocTp the grDocTp to set
     */
    public void setGrDocTp(String grDocTp) {
        this.grDocTp = grDocTp;
    }

    /**
     * @return the grTotQty
     */
    public Double getGrTotQty() {
        return grTotQty;
    }

    /**
     * @param grTotQty the grTotQty to set
     */
    public void setGrTotQty(Double grTotQty) {
        this.grTotQty = grTotQty;
    }

    /**
     * @return the claimTotQty
     */
    public Double getClaimTotQty() {
        return claimTotQty;
    }

    /**
     * @param claimTotQty the claimTotQty to set
     */
    public void setClaimTotQty(Double claimTotQty) {
        this.claimTotQty = claimTotQty;
    }

    /**
     * @return the trsfAmt
     */
    public Double getTrsfAmt() {
        return trsfAmt;
    }

    /**
     * @param trsfAmt the trsfAmt to set
     */
    public void setTrsfAmt(Double trsfAmt) {
        this.trsfAmt = trsfAmt;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
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
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }
  //子表的get/set方法

	public String getSdlrCd() {
		return sdlrCd;
	}

	public void setSdlrCd(String sdlrCd) {
		this.sdlrCd = sdlrCd;
	}

	public String getSinvcDocNo() {
		return sinvcDocNo;
	}

	public void setSinvcDocNo(String sinvcDocNo) {
		this.sinvcDocNo = sinvcDocNo;
	}

	public int getSinvcDocLineNo() {
		return sinvcDocLineNo;
	}

	public void setSinvcDocLineNo(int sinvcDocLineNo) {
		this.sinvcDocLineNo = sinvcDocLineNo;
	}

	public String getSmobisInvcNo() {
		return smobisInvcNo;
	}

	public void setSmobisInvcNo(String smobisInvcNo) {
		this.smobisInvcNo = smobisInvcNo;
	}

	public int getSmobisInvcLineNo() {
		return smobisInvcLineNo;
	}

	public void setSmobisInvcLineNo(int smobisInvcLineNo) {
		this.smobisInvcLineNo = smobisInvcLineNo;
	}

	public String getSpurcOrdTp() {
		return spurcOrdTp;
	}

	public void setSpurcOrdTp(String spurcOrdTp) {
		this.spurcOrdTp = spurcOrdTp;
	}

	public String getSpurcOrdNo() {
		return spurcOrdNo;
	}

	public void setSpurcOrdNo(String spurcOrdNo) {
		this.spurcOrdNo = spurcOrdNo;
	}

	public String getSpurcOrdLineNo() {
		return spurcOrdLineNo;
	}

	public void setSpurcOrdLineNo(String spurcOrdLineNo) {
		this.spurcOrdLineNo = spurcOrdLineNo;
	}

	public String getSinvcIfOrdNo() {
		return sinvcIfOrdNo;
	}

	public void setSinvcIfOrdNo(String sinvcIfOrdNo) {
		this.sinvcIfOrdNo = sinvcIfOrdNo;
	}

	public String getSinvcIfOrdLn() {
		return sinvcIfOrdLn;
	}

	public void setSinvcIfOrdLn(String sinvcIfOrdLn) {
		this.sinvcIfOrdLn = sinvcIfOrdLn;
	}

	public String getSpurcOrdLineDetlNo() {
		return spurcOrdLineDetlNo;
	}

	public void setSpurcOrdLineDetlNo(String spurcOrdLineDetlNo) {
		this.spurcOrdLineDetlNo = spurcOrdLineDetlNo;
	}

	public String getSitemCd() {
		return sitemCd;
	}

	public void setSitemCd(String sitemCd) {
		this.sitemCd = sitemCd;
	}

	public String getSitemNm() {
		return sitemNm;
	}

	public void setSitemNm(String sitemNm) {
		this.sitemNm = sitemNm;
	}

	public String getSprcTp() {
		return sprcTp;
	}

	public void setSprcTp(String sprcTp) {
		this.sprcTp = sprcTp;
	}

	public Double getSinvcTargetQty() {
		return sinvcTargetQty;
	}

	public void setSinvcTargetQty(Double sinvcTargetQty) {
		this.sinvcTargetQty = sinvcTargetQty;
	}

	public Double getSinvcQty() {
		return sinvcQty;
	}

	public void setSinvcQty(Double sinvcQty) {
		this.sinvcQty = sinvcQty;
	}

	public Double getSpurcQty() {
		return spurcQty;
	}

	public void setSpurcQty(Double spurcQty) {
		this.spurcQty = spurcQty;
	}

	public String getSexcelQty() {
		return sexcelQty;
	}

	public void setSexcelQty(String sexcelQty) {
		this.sexcelQty = sexcelQty;
	}

	public String getSexcelPrc() {
		return sexcelPrc;
	}

	public void setSexcelPrc(String sexcelPrc) {
		this.sexcelPrc = sexcelPrc;
	}

	public String getSexcelTaxDdctPrc() {
		return sexcelTaxDdctPrc;
	}

	public void setSexcelTaxDdctPrc(String sexcelTaxDdctPrc) {
		this.sexcelTaxDdctPrc = sexcelTaxDdctPrc;
	}

	public String getSexcelStrgeCd() {
		return sexcelStrgeCd;
	}

	public void setSexcelStrgeCd(String sexcelStrgeCd) {
		this.sexcelStrgeCd = sexcelStrgeCd;
	}

	public String getSexcelStrgeNm() {
		return sexcelStrgeNm;
	}

	public void setSexcelStrgeNm(String sexcelStrgeNm) {
		this.sexcelStrgeNm = sexcelStrgeNm;
	}

	public Double getSinvcQtyOrg() {
		return sinvcQtyOrg;
	}

	public void setSinvcQtyOrg(Double sinvcQtyOrg) {
		this.sinvcQtyOrg = sinvcQtyOrg;
	}

	public String getSinvcUnitCd() {
		return sinvcUnitCd;
	}

	public void setSinvcUnitCd(String sinvcUnitCd) {
		this.sinvcUnitCd = sinvcUnitCd;
	}

	public String getSspyrCd() {
		return sspyrCd;
	}

	public void setSspyrCd(String sspyrCd) {
		this.sspyrCd = sspyrCd;
	}

	public Double getSinvcPrc() {
		return sinvcPrc;
	}

	public void setSinvcPrc(Double sinvcPrc) {
		this.sinvcPrc = sinvcPrc;
	}

	public Double getStaxDdctPrc() {
		return staxDdctPrc;
	}

	public void setStaxDdctPrc(Double staxDdctPrc) {
		this.staxDdctPrc = staxDdctPrc;
	}

	public Double getSdcRate() {
		return sdcRate;
	}

	public void setSdcRate(Double sdcRate) {
		this.sdcRate = sdcRate;
	}

	public Double getSinvcIncTaxPrc() {
		return sinvcIncTaxPrc;
	}

	public void setSinvcIncTaxPrc(Double sinvcIncTaxPrc) {
		this.sinvcIncTaxPrc = sinvcIncTaxPrc;
	}

	public Double getSinvcAmt() {
		return sinvcAmt;
	}

	public void setSinvcAmt(Double sinvcAmt) {
		this.sinvcAmt = sinvcAmt;
	}

	public Double getSvatAmt() {
		return svatAmt;
	}

	public void setSvatAmt(Double svatAmt) {
		this.svatAmt = svatAmt;
	}

	public Double getSinvcTotAmt() {
		return sinvcTotAmt;
	}

	public void setSinvcTotAmt(Double sinvcTotAmt) {
		this.sinvcTotAmt = sinvcTotAmt;
	}

	public Double getSgrTotAmt() {
		return sgrTotAmt;
	}

	public void setSgrTotAmt(Double sgrTotAmt) {
		this.sgrTotAmt = sgrTotAmt;
	}

	public Double getSgrTaxDdctAmt() {
		return sgrTaxDdctAmt;
	}

	public void setSgrTaxDdctAmt(Double sgrTaxDdctAmt) {
		this.sgrTaxDdctAmt = sgrTaxDdctAmt;
	}

	public Double getStaxAmt() {
		return staxAmt;
	}

	public void setStaxAmt(Double staxAmt) {
		this.staxAmt = staxAmt;
	}

	public String getSdebitCreditDstinCd() {
		return sdebitCreditDstinCd;
	}

	public void setSdebitCreditDstinCd(String sdebitCreditDstinCd) {
		this.sdebitCreditDstinCd = sdebitCreditDstinCd;
	}

	public String getSrefInvcDocNo() {
		return srefInvcDocNo;
	}

	public void setSrefInvcDocNo(String srefInvcDocNo) {
		this.srefInvcDocNo = srefInvcDocNo;
	}

	public int getSrefInvcDocLineNo() {
		return srefInvcDocLineNo;
	}

	public void setSrefInvcDocLineNo(int srefInvcDocLineNo) {
		this.srefInvcDocLineNo = srefInvcDocLineNo;
	}

	public Date getSarrvDt() {
		return sarrvDt;
	}

	public void setSarrvDt(Date sarrvDt) {
		this.sarrvDt = sarrvDt;
	}

	public Date getSinvcGrDt() {
		return sinvcGrDt;
	}

	public void setSinvcGrDt(Date sinvcGrDt) {
		this.sinvcGrDt = sinvcGrDt;
	}

	public Date getSinvcDt() {
		return sinvcDt;
	}

	public void setSinvcDt(Date sinvcDt) {
		this.sinvcDt = sinvcDt;
	}

	public Date getSpurcRegDt() {
		return spurcRegDt;
	}

	public void setSpurcRegDt(Date spurcRegDt) {
		this.spurcRegDt = spurcRegDt;
	}

	public String getSdlPdcCd() {
		return sdlPdcCd;
	}

	public void setSdlPdcCd(String sdlPdcCd) {
		this.sdlPdcCd = sdlPdcCd;
	}

	public String getSgrStrgeCd() {
		return sgrStrgeCd;
	}

	public void setSgrStrgeCd(String sgrStrgeCd) {
		this.sgrStrgeCd = sgrStrgeCd;
	}

	public String getSgrStrgeNm() {
		return sgrStrgeNm;
	}

	public void setSgrStrgeNm(String sgrStrgeNm) {
		this.sgrStrgeNm = sgrStrgeNm;
	}

	public String getSgrLocCd() {
		return sgrLocCd;
	}

	public void setSgrLocCd(String sgrLocCd) {
		this.sgrLocCd = sgrLocCd;
	}

	public String getSgrLocNm() {
		return sgrLocNm;
	}

	public void setSgrLocNm(String sgrLocNm) {
		this.sgrLocNm = sgrLocNm;
	}

	public Double getSgrQty() {
		return sgrQty;
	}

	public void setSgrQty(Double sgrQty) {
		this.sgrQty = sgrQty;
	}

	public String getSbpCd() {
		return sbpCd;
	}

	public void setSbpCd(String sbpCd) {
		this.sbpCd = sbpCd;
	}

	public String getSbpNm() {
		return sbpNm;
	}

	public void setSbpNm(String sbpNm) {
		this.sbpNm = sbpNm;
	}

	public String getSordRegUsrId() {
		return sordRegUsrId;
	}

	public void setSordRegUsrId(String sordRegUsrId) {
		this.sordRegUsrId = sordRegUsrId;
	}

	public String getSordRegUsrNm() {
		return sordRegUsrNm;
	}

	public void setSordRegUsrNm(String sordRegUsrNm) {
		this.sordRegUsrNm = sordRegUsrNm;
	}

	public String getSreqUsrId() {
		return sreqUsrId;
	}

	public void setSreqUsrId(String sreqUsrId) {
		this.sreqUsrId = sreqUsrId;
	}

	public String getSreqUsrNm() {
		return sreqUsrNm;
	}

	public void setSreqUsrNm(String sreqUsrNm) {
		this.sreqUsrNm = sreqUsrNm;
	}

	public String getSclaimTargCd() {
		return sclaimTargCd;
	}

	public void setSclaimTargCd(String sclaimTargCd) {
		this.sclaimTargCd = sclaimTargCd;
	}

	public String getSdlBpCd() {
		return sdlBpCd;
	}

	public void setSdlBpCd(String sdlBpCd) {
		this.sdlBpCd = sdlBpCd;
	}

	public String getSdlBpNm() {
		return sdlBpNm;
	}

	public void setSdlBpNm(String sdlBpNm) {
		this.sdlBpNm = sdlBpNm;
	}

	public String getSclaimTp() {
		return sclaimTp;
	}

	public void setSclaimTp(String sclaimTp) {
		this.sclaimTp = sclaimTp;
	}

	public String getSinvcTp() {
		return sinvcTp;
	}

	public void setSinvcTp(String sinvcTp) {
		this.sinvcTp = sinvcTp;
	}

	public String getSinvcStatCd() {
		return sinvcStatCd;
	}

	public void setSinvcStatCd(String sinvcStatCd) {
		this.sinvcStatCd = sinvcStatCd;
	}

	public Double getSprevClaimQty() {
		return sprevClaimQty;
	}

	public void setSprevClaimQty(Double sprevClaimQty) {
		this.sprevClaimQty = sprevClaimQty;
	}

	public Double getSclaimQty() {
		return sclaimQty;
	}

	public void setSclaimQty(Double sclaimQty) {
		this.sclaimQty = sclaimQty;
	}

	public Double getScompareQty() {
		return scompareQty;
	}

	public void setScompareQty(Double scompareQty) {
		this.scompareQty = scompareQty;
	}

	public String getSreqCont() {
		return sreqCont;
	}

	public void setSreqCont(String sreqCont) {
		this.sreqCont = sreqCont;
	}

	public String getSdocFileNo() {
		return sdocFileNo;
	}

	public void setSdocFileNo(String sdocFileNo) {
		this.sdocFileNo = sdocFileNo;
	}

	public String getSgrEndYn() {
		return sgrEndYn;
	}

	public void setSgrEndYn(String sgrEndYn) {
		this.sgrEndYn = sgrEndYn;
	}

	public String getSboxNo() {
		return sboxNo;
	}

	public void setSboxNo(String sboxNo) {
		this.sboxNo = sboxNo;
	}

	public String getSbmpOrdNo() {
		return sbmpOrdNo;
	}

	public void setSbmpOrdNo(String sbmpOrdNo) {
		this.sbmpOrdNo = sbmpOrdNo;
	}

	public String getSbmpOrdLineNo() {
		return sbmpOrdLineNo;
	}

	public void setSbmpOrdLineNo(String sbmpOrdLineNo) {
		this.sbmpOrdLineNo = sbmpOrdLineNo;
	}

	public Double getSpurcPrc() {
		return spurcPrc;
	}

	public void setSpurcPrc(Double spurcPrc) {
		this.spurcPrc = spurcPrc;
	}

	public Double getSpurcAmt() {
		return spurcAmt;
	}

	public void setSpurcAmt(Double spurcAmt) {
		this.spurcAmt = spurcAmt;
	}

	public Double getSpurcReqQty() {
		return spurcReqQty;
	}

	public void setSpurcReqQty(Double spurcReqQty) {
		this.spurcReqQty = spurcReqQty;
	}

	public Double getSavlbStockQty() {
		return savlbStockQty;
	}

	public void setSavlbStockQty(Double savlbStockQty) {
		this.savlbStockQty = savlbStockQty;
	}

	public Double getSresvStockQty() {
		return sresvStockQty;
	}

	public void setSresvStockQty(Double sresvStockQty) {
		this.sresvStockQty = sresvStockQty;
	}

	public Double getSstockQty() {
		return sstockQty;
	}

	public void setSstockQty(Double sstockQty) {
		this.sstockQty = sstockQty;
	}

	public Double getSborrowQty() {
		return sborrowQty;
	}

	public void setSborrowQty(Double sborrowQty) {
		this.sborrowQty = sborrowQty;
	}

	public Double getSrentQty() {
		return srentQty;
	}

	public void setSrentQty(Double srentQty) {
		this.srentQty = srentQty;
	}

	public String getSmvtDocYyMm() {
		return smvtDocYyMm;
	}

	public void setSmvtDocYyMm(String smvtDocYyMm) {
		this.smvtDocYyMm = smvtDocYyMm;
	}

	public String getSmvtDocNo() {
		return smvtDocNo;
	}

	public void setSmvtDocNo(String smvtDocNo) {
		this.smvtDocNo = smvtDocNo;
	}

	public int getSmvtDocLineNo() {
		return smvtDocLineNo;
	}

	public void setSmvtDocLineNo(int smvtDocLineNo) {
		this.smvtDocLineNo = smvtDocLineNo;
	}

	public String getInvcStatCdNm() {
		return invcStatCdNm;
	}

	public void setInvcStatCdNm(String invcStatCdNm) {
		this.invcStatCdNm = invcStatCdNm;
	}
    
    
    
    
    
    
    
    
    
}
