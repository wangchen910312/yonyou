package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 구매요청 상세 VO
 *
 * @ClassName   : IsuueReqDetailVO.java
 * @Description : IsuueReqDetailVO Class
 * @author In Bo Shim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     In Bo Shim     최초 생성
 * </pre>
 */
public class IssueReqDetailVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8766890819849032638L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 센터코드
     **/
    @NotEmpty
    private String pltCd = "";

    /**
     * 부품요청문서번호
     **/
    @NotEmpty
    private String parReqDocNo = "";

    /**
     * 부품요청문서라인번호
     **/
    private int parReqDocLineNo = 0;

    /**
     * 부품요청문서재고체크라인번호
     **/
    private int parReqDocStockLineNo = 0;

    /**
     * 부품요청상태코드
     **/
    @NotEmpty
    private String parReqStatCd = "";

    /**
     * 부품요청상태변경 구분자
     **/
    private String parReqStatCdYn = "N";

    /**
     * 준비상태코드
     **/
    @NotEmpty
    private String readyStatCd = "";

    /**
     * 구매요청문서번호
     **/
    private String purcReqNo = "";

    /**
     * 구매요청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcReqDt;

    /**
     * 취소여부
     **/
    @NotEmpty
    private String cancYn;

    /**
     * 부품출고유형
     **/
    @NotEmpty
    private String parGiTp = "";

    /**
     * RO일련번호
     **/
    @NotEmpty
    private String roDocNo = "";

    /**
     * RO유형
     **/
    @NotEmpty
    private String roTp = "";

    /**
     * RO상태
     **/
    @NotEmpty
    private String roStatCd = "";

    /**
     * RO라인번호
     **/
    private int roLineNo = 0;

    /**
     * 예약문서번호
     **/
    @NotEmpty
    private String resvDocNo = "";

    /**
     * 예약문서라인번호
     **/
    private int resvDocLineNo = 0;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd = "";

    /**
     * 출고창고코드
     **/
    private String giStrgeCd = "";

    /**
     * 로케이션코드
     **/
    private String giLocCd = "";

    /**
     * DB저장품목코드
     **/
    private String dbItemCd = "";

    /**
     * 패키지문서번호
     **/
    private int pkgDocNo;

    /**
     * 패키지코드
     **/
    private String pkgItemCd = "";

    /**
     * 할인율
     **/
    private double pkgDetlDcRate = 0.0;

    /**
     * 할인금액
     **/
    private double pkgDetlDcAmt = 0.0;

    /**
     * 할인총금액
     **/
    private double pkgDetlDcTotAmt = 0.0;

    /**
     * 부품코드
     **/
    private String itemCd = "";

    /**
     * 부품명
     **/
    private String itemNm = "";

    /**
     * 부품품종
     **/
    private int itemGrpCnt;

    /**
     * 브랜드
     **/
    private String brandCd = "";

    /**
     * 공용품목코드
     **/
    private String comItemCd = "";

    /**
     * 공용품목명
     **/
    private String comItemNm = "";

    /**
     * 공용품목단가
     **/
    private double comItemPrc = 0.0;

    /**
     * 요청수량
     **/
    private double reqQty = 0.0;

    /**
     * 단위코드
     **/
    private String unitCd = "EA";

    /**
     * 계산완료수량
     **/
    private double calEndQty = 0.0;

    /**
     * 완료수량
     **/
    private double endQty = 0.0;

    /**
     * 요청창고코드
     **/
    private String reqStrgeCd = "";

    /**
     * 총재고량
     **/
    private double totStockQty = 0.0;

    /**
     * 가용재고량
     **/
    private double avlbStockQty = 0.0;

    /**
     * 예약재고량
     **/
    private double resvStockQty = 0.0;

    /**
     * 보유재고량
     **/
    private double clamStockQty = 0.0;

    /**
     * 입고예정수량
     **/
    private double grScheQty = 0.0;

    /**
     * 출고예정수량
     **/
    private double giScheQty = 0.0;

    /**
     * 차출재고수량
     **/
    private double rentQty = 0.0;

    /**
     * 차입재고수량
     **/
    private double borrowStockQty = 0.0;

    /**
     * 구매요청수량
     **/
    private double resvQty = 0.0;

    /**
     * 출고문서번호
     **/
    private String giDocNo = "";

    /**
     * 출고문서유형
     **/
    private String giDocTp = "";

    /**
     * 고객코드
     **/
    private String custCd = "";

    /**
     * 고객명
     **/
    private String custNm = "";

    /**
     * 서비스담당자ID
     **/
    private String serPrsnId = "";

    /**
     * 차량번호
     **/
    private String carNo = "";

    /**
     * 차대번호
     **/
    private String vinNo = "";

    /**
     * 차종
     **/
    private String carlineCd = "";

    /**
     * 차종명
     **/
    private String carlineNm = "";

    /**
     * DB 저장여부
     **/
    private String dbYn;

    /**
     * 출고문서상태코드
     **/
    private String giDocStatCd = "";

    /**
     * 출고상태코드
     **/
    private String giStatCd = "";

    /**
     * 수령인ID
     **/
    private String receiveId = "";

    /**
     * 수령인명칭
     **/
    private String receiveNm = "";

    /**
     * 출고일자
     **/
    private Date giDt;

    /**
     * 수령일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveDt;

    /**
     * 수령일자(String)
     */
    private String receiveDtString;

    /**
     * 수령시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date receiveTime;

    /**
     * 수령시간(String)
     */
    private String receiveTimeString;

    /**
     * 반환수량
     **/
    private double returnPartsQty = 0.0;

    /**
     * 반품인ID
     **/
    private String returnId = "";

    /**
     * 반품인명칭
     **/
    private String returnNm = "";

    /**
     * 반품일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date returnDt;

    /**
     * 취소인ID
     **/
    private String cancId;

    /**
     * 취소일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cancDt;

    /**
     * 부품단가
     **/
    private double itemPrc = 0.0;

    /**
     * 부품단가세금액
     **/
    private double taxPrc = 0.0;

    /**
     * 부품금액
     **/
    private double itemAmt = 0.0;

    /**
     * 세금공제금액
     **/
    private double taxDdctAmt = 0.0;

    /**
     * 세금액
     **/
    private double taxAmt = 0.0;

    /**
     * 판매금액(보증가세금포함)
     **/
    private double salePrcAmt = 0.0;

    /**
     * BMP구매금액
     **/
    private double bmpPurcPrc = 0.0;

    /**
     * 판매금액(보증가원가)
     **/
    private double taxDdctGrtePrc = 0.0;

    /**
     * 출고원인명
     **/
    private String giCauNm = "";

    /**
     * 기타출고유형
     **/
    private String etcGiTp = "";

    /**
     * 이동평균단가
     **/
    private double movingAvgPrc = 0.0;

    /**
     * 이동평균금액
     **/
    private double movingAvgAmt = 0.0;

    /**
     * 이동평균단가(세금제외)
     **/
    private double movingAvgTaxDdctPrc = 0.0;

    /**
     * 이동평균금액(세금제외)
     **/
    private double movingAvgTaxDdctAmt = 0.0;

    /**
     * 부품예류번호
     **/
    private String readyDocNo = "";

    /**
     * 부품예류비고
     **/
    private String readyRemark = "";

    /**
     * 부품예류자아이디
     **/
    private String readyUsrId = "";

    /**
     * 부품예류자명
     **/
    private String readyUsrNm = "";

    /**
     * 부품예류시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date readyRegDt;

    /**
     * 부품예류시간문자열
     **/
    private String readyRegDtString;

    /**
     * 부품예류마감일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date readyRegEndDt;

    /**
     * 부품예류취소비고
     **/
    private String readyCancRemark = "";

    /**
     * 부품예류취소자아이디
     **/
    private String readyCancUsrId = "";

    /**
     * 부품예류취소자명
     **/
    private String readyCancUsrNm = "";

    /**
     * 부품예류취소시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date readyCancRegDt;

    /**
     * 부품예류취소시간문자열
     **/
    private String readyCancRegDtString;

    /**
     * 등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;

    /**
     * 수정일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;

    /**
     * 예약처리자
     **/
    private String resvUsrId = "";

    /**
     * 예약처리자명
     **/
    private String resvUsrNm = "";

    /**
     * 부품예약처리자
     **/
    private String partsResvUsrId = "";

    /**
     * 부품예약처리자명
     **/
    private String partsResvUsrNm = "";

    /**
     * 차용문서번호
     **/
    private String borrowDocNo = "";

    /**
     * 차용문서번호유무
     **/
    private String borrowDocNoUseYn = "N";

    /**
     * 차용라인번호
     **/
    private int borrowLineNo = 0;
    /**
     * 차용유형
     **/
    private String borrowTp = "";
    /**
     * 차용상태코드
     **/
    private String borrowStatCd = "01";

    /**
     * 차용상태변경코드
     **/
    private String borrowUpdateStatCd = "";

    /**
     * 차용수량
     **/
    private double borrowQty = 0;

    /**
     * 차용자ID
     **/
    private String borrowUsrId = "";

    /**
     * 차용자명
     **/
    private String borrowUsrNm = "";

    /**
     * 차용자부서코드
     **/
    private String borrowDeptCd = "";

    /**
     * 차용자부서명
     **/
    private String borrowDeptNm = "";

    /**
     * 차용등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date borrowRegDt;

    /**
     * 기타예류문서번호
     **/
    private String etcRvDocNo = "";

    /**
     * 기타예류라인번호
     **/
    private int etcRvLineNo = 0;

    /**
     * 기타예류상태코드
     **/
    private String etcRvStatCd = "01";

    /**
     * 기타예류수량
     **/
    private double etcRvQty = 0;

    /**
     * 기타예류자ID
     **/
    private String etcRvPrsnId = "";

    /**
     * 기타예류등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date etcRvRegDt;

    /**
     * 수불문서년월일자
     **/
    @NotEmpty
    private  String mvtDocYyMm = "";

    /**
     * 수불문서번호
     **/
    @NotEmpty
    private  String mvtDocNo = "";

    /**
     * 수불문서라인번호
     **/
    private  int mvtDocLineNo = 0;

    /**
     * 비고
     **/
    private String remark = "";

    /**
     * 부품단가-정비
     **/
    private double itemSalePrc = 0.0;

    /**
     * 부품금액-정비
     **/
    private double itemSaleAmt = 0.0;

    /**
     * 할인율-정비
     **/
    private double dcRate = 0.0;

    /**
     * 할인금액-정비
     **/
    private double dcAmt = 0.0;

    /**
     * 부품예정대-정비
     **/
    private double itemTotAmt;

    /**
     * 등록자명
     **/
    private String regUsrNm;

    /**
     * 조작자명
     **/
    private String updtUsrNm;

    /**
     * 등록부서코드
     **/
    private String deptCd;

    /**
     * 등록부서명
     **/
    private String deptNm;

    /**
     * 지불자코드
     **/
    private String paymCd;

    /**
     * 결제자유형
     **/
    private String paymTp;

    /**
     * 결제자명
     **/
    private String paymUsrNm;

    /**
     * 소매가격
     */
    private double retlPrc = 0.0;

    /**
     * 도매가격
     */
    private double whslPrc = 0.0;

    /**
     * 보험가격
     */
    private double incPrc = 0.0;

    /**
     * 보증가격
     */
    private double grtePrc = 0.0;

    /**
     * 부품가격유형
     **/
    private String partsPrcTp = "01";

    /**
     * 정비위탁자
     **/
    private String roRegUsrNm;

    /**
     * 부품마크업
     **/
    private double markUp = 0.0;

    /**
     * 세율
     **/
    private double taxRate = 0;
    
    private Date calcDt;
    
//    /**
//     * 结算时间
//     */
//     private String calcDtFormat;
//    
//     
//     /**
//      * @return the calcDtFormat
//      */
//    public String getCalcDtFormat() {
//		return calcDtFormat;
//	}
//
//	public void setCalcDtFormat(String calcDtFormat) {
//		this.calcDtFormat = calcDtFormat;
//	}

    
    public Date getCalcDt() {
		return calcDt;
	}

	public void setCalcDt(Date calcDt) {
		this.calcDt = calcDt;
	}

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
     * @return the parReqDocNo
     */
    public String getParReqDocNo() {
        return parReqDocNo;
    }

    /**
     * @param parReqDocNo the parReqDocNo to set
     */
    public void setParReqDocNo(String parReqDocNo) {
        this.parReqDocNo = parReqDocNo;
    }

    /**
     * @return the parReqDocLineNo
     */
    public int getParReqDocLineNo() {
        return parReqDocLineNo;
    }

    /**
     * @param parReqDocLineNo the parReqDocLineNo to set
     */
    public void setParReqDocLineNo(int parReqDocLineNo) {
        this.parReqDocLineNo = parReqDocLineNo;
    }

    /**
     * @return the parReqDocStockLineNo
     */
    public int getParReqDocStockLineNo() {
        return parReqDocStockLineNo;
    }

    /**
     * @param parReqDocStockLineNo the parReqDocStockLineNo to set
     */
    public void setParReqDocStockLineNo(int parReqDocStockLineNo) {
        this.parReqDocStockLineNo = parReqDocStockLineNo;
    }

    /**
     * @return the parReqStatCd
     */
    public String getParReqStatCd() {
        return parReqStatCd;
    }

    /**
     * @param parReqStatCd the parReqStatCd to set
     */
    public void setParReqStatCd(String parReqStatCd) {
        this.parReqStatCd = parReqStatCd;
    }

    /**
     * @return the parReqStatCdYn
     */
    public String getParReqStatCdYn() {
        return parReqStatCdYn;
    }

    /**
     * @param parReqStatCdYn the parReqStatCdYn to set
     */
    public void setParReqStatCdYn(String parReqStatCdYn) {
        this.parReqStatCdYn = parReqStatCdYn;
    }

    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }

    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
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
     * @return the parGiTp
     */
    public String getParGiTp() {
        return parGiTp;
    }

    /**
     * @param parGiTp the parGiTp to set
     */
    public void setParGiTp(String parGiTp) {
        this.parGiTp = parGiTp;
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }

    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    /**
     * @return the roStatCd
     */
    public String getRoStatCd() {
        return roStatCd;
    }

    /**
     * @param roStatCd the roStatCd to set
     */
    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }

    /**
     * @return the roLineNo
     */
    public int getRoLineNo() {
        return roLineNo;
    }

    /**
     * @param roLineNo the roLineNo to set
     */
    public void setRoLineNo(int roLineNo) {
        this.roLineNo = roLineNo;
    }

    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }

    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    /**
     * @return the resvDocLineNo
     */
    public int getResvDocLineNo() {
        return resvDocLineNo;
    }

    /**
     * @param resvDocLineNo the resvDocLineNo to set
     */
    public void setResvDocLineNo(int resvDocLineNo) {
        this.resvDocLineNo = resvDocLineNo;
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
     * @return the giStrgeCd
     */
    public String getGiStrgeCd() {
        return giStrgeCd;
    }

    /**
     * @param giStrgeCd the giStrgeCd to set
     */
    public void setGiStrgeCd(String giStrgeCd) {
        this.giStrgeCd = giStrgeCd;
    }

    /**
     * @return the giLocCd
     */
    public String getGiLocCd() {
        return giLocCd;
    }

    /**
     * @param giLocCd the giLocCd to set
     */
    public void setGiLocCd(String giLocCd) {
        this.giLocCd = giLocCd;
    }

    /**
     * @return the dbItemCd
     */
    public String getDbItemCd() {
        return dbItemCd;
    }

    /**
     * @param dbItemCd the dbItemCd to set
     */
    public void setDbItemCd(String dbItemCd) {
        this.dbItemCd = dbItemCd;
    }

    /**
     * @return the pkgDocNo
     */
    public int getPkgDocNo() {
        return pkgDocNo;
    }

    /**
     * @param pkgDocNo the pkgDocNo to set
     */
    public void setPkgDocNo(int pkgDocNo) {
        this.pkgDocNo = pkgDocNo;
    }

    /**
     * @return the pkgItemCd
     */
    public String getPkgItemCd() {
        return pkgItemCd;
    }

    /**
     * @param pkgItemCd the pkgItemCd to set
     */
    public void setPkgItemCd(String pkgItemCd) {
        this.pkgItemCd = pkgItemCd;
    }

    /**
     * @return the pkgDetlDcRate
     */
    public double getPkgDetlDcRate() {
        return pkgDetlDcRate;
    }

    /**
     * @param pkgDetlDcRate the pkgDetlDcRate to set
     */
    public void setPkgDetlDcRate(double pkgDetlDcRate) {
        this.pkgDetlDcRate = pkgDetlDcRate;
    }

    /**
     * @return the pkgDetlDcAmt
     */
    public double getPkgDetlDcAmt() {
        return pkgDetlDcAmt;
    }

    /**
     * @param pkgDetlDcAmt the pkgDetlDcAmt to set
     */
    public void setPkgDetlDcAmt(double pkgDetlDcAmt) {
        this.pkgDetlDcAmt = pkgDetlDcAmt;
    }

    /**
     * @return the pkgDetlDcTotAmt
     */
    public double getPkgDetlDcTotAmt() {
        return pkgDetlDcTotAmt;
    }

    /**
     * @param pkgDetlDcTotAmt the pkgDetlDcTotAmt to set
     */
    public void setPkgDetlDcTotAmt(double pkgDetlDcTotAmt) {
        this.pkgDetlDcTotAmt = pkgDetlDcTotAmt;
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
     * @return the itemGrpCnt
     */
    public int getItemGrpCnt() {
        return itemGrpCnt;
    }

    /**
     * @param itemGrpCnt the itemGrpCnt to set
     */
    public void setItemGrpCnt(int itemGrpCnt) {
        this.itemGrpCnt = itemGrpCnt;
    }

    /**
     * @return the brandCd
     */
    public String getBrandCd() {
        return brandCd;
    }

    /**
     * @param brandCd the brandCd to set
     */
    public void setBrandCd(String brandCd) {
        this.brandCd = brandCd;
    }

    /**
     * @return the comItemCd
     */
    public String getComItemCd() {
        return comItemCd;
    }

    /**
     * @param comItemCd the comItemCd to set
     */
    public void setComItemCd(String comItemCd) {
        this.comItemCd = comItemCd;
    }

    /**
     * @return the comItemNm
     */
    public String getComItemNm() {
        return comItemNm;
    }

    /**
     * @param comItemNm the comItemNm to set
     */
    public void setComItemNm(String comItemNm) {
        this.comItemNm = comItemNm;
    }

    /**
     * @return the comItemPrc
     */
    public double getComItemPrc() {
        return comItemPrc;
    }

    /**
     * @param comItemPrc the comItemPrc to set
     */
    public void setComItemPrc(double comItemPrc) {
        this.comItemPrc = comItemPrc;
    }

    /**
     * @return the reqQty
     */
    public double getReqQty() {
        return reqQty;
    }

    /**
     * @param reqQty the reqQty to set
     */
    public void setReqQty(double reqQty) {
        this.reqQty = reqQty;
    }

    /**
     * @return the unitCd
     */
    public String getUnitCd() {
        return unitCd;
    }

    /**
     * @param unitCd the unitCd to set
     */
    public void setUnitCd(String unitCd) {
        this.unitCd = unitCd;
    }

    /**
     * @return the calEndQty
     */
    public double getCalEndQty() {
        return calEndQty;
    }

    /**
     * @param calEndQty the calEndQty to set
     */
    public void setCalEndQty(double calEndQty) {
        this.calEndQty = calEndQty;
    }

    /**
     * @return the endQty
     */
    public double getEndQty() {
        return endQty;
    }

    /**
     * @param endQty the endQty to set
     */
    public void setEndQty(double endQty) {
        this.endQty = endQty;
    }

    /**
     * @return the reqStrgeCd
     */
    public String getReqStrgeCd() {
        return reqStrgeCd;
    }

    /**
     * @param reqStrgeCd the reqStrgeCd to set
     */
    public void setReqStrgeCd(String reqStrgeCd) {
        this.reqStrgeCd = reqStrgeCd;
    }

    /**
     * @return the totStockQty
     */
    public double getTotStockQty() {
        return totStockQty;
    }

    /**
     * @param totStockQty the totStockQty to set
     */
    public void setTotStockQty(double totStockQty) {
        this.totStockQty = totStockQty;
    }

    /**
     * @return the avlbStockQty
     */
    public double getAvlbStockQty() {
        return avlbStockQty;
    }

    /**
     * @param avlbStockQty the avlbStockQty to set
     */
    public void setAvlbStockQty(double avlbStockQty) {
        this.avlbStockQty = avlbStockQty;
    }

    /**
     * @return the resvStockQty
     */
    public double getResvStockQty() {
        return resvStockQty;
    }

    /**
     * @param resvStockQty the resvStockQty to set
     */
    public void setResvStockQty(double resvStockQty) {
        this.resvStockQty = resvStockQty;
    }

    /**
     * @return the clamStockQty
     */
    public double getClamStockQty() {
        return clamStockQty;
    }

    /**
     * @param clamStockQty the clamStockQty to set
     */
    public void setClamStockQty(double clamStockQty) {
        this.clamStockQty = clamStockQty;
    }

    /**
     * @return the grScheQty
     */
    public double getGrScheQty() {
        return grScheQty;
    }

    /**
     * @param grScheQty the grScheQty to set
     */
    public void setGrScheQty(double grScheQty) {
        this.grScheQty = grScheQty;
    }

    /**
     * @return the giScheQty
     */
    public double getGiScheQty() {
        return giScheQty;
    }

    /**
     * @param giScheQty the giScheQty to set
     */
    public void setGiScheQty(double giScheQty) {
        this.giScheQty = giScheQty;
    }

    /**
     * @return the rentQty
     */
    public double getRentQty() {
        return rentQty;
    }

    /**
     * @param rentQty the rentQty to set
     */
    public void setRentQty(double rentQty) {
        this.rentQty = rentQty;
    }

    /**
     * @return the borrowStockQty
     */
    public double getBorrowStockQty() {
        return borrowStockQty;
    }

    /**
     * @param borrowStockQty the borrowStockQty to set
     */
    public void setBorrowStockQty(double borrowStockQty) {
        this.borrowStockQty = borrowStockQty;
    }

    /**
     * @return the resvQty
     */
    public double getResvQty() {
        return resvQty;
    }

    /**
     * @param resvQty the resvQty to set
     */
    public void setResvQty(double resvQty) {
        this.resvQty = resvQty;
    }

    /**
     * @return the giDocNo
     */
    public String getGiDocNo() {
        return giDocNo;
    }

    /**
     * @param giDocNo the giDocNo to set
     */
    public void setGiDocNo(String giDocNo) {
        this.giDocNo = giDocNo;
    }

    /**
     * @return the giDocTp
     */
    public String getGiDocTp() {
        return giDocTp;
    }

    /**
     * @param giDocTp the giDocTp to set
     */
    public void setGiDocTp(String giDocTp) {
        this.giDocTp = giDocTp;
    }

    /**
     * @return the custCd
     */
    public String getCustCd() {
        return custCd;
    }

    /**
     * @param custCd the custCd to set
     */
    public void setCustCd(String custCd) {
        this.custCd = custCd;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the serPrsnId
     */
    public String getSerPrsnId() {
        return serPrsnId;
    }

    /**
     * @param serPrsnId the serPrsnId to set
     */
    public void setSerPrsnId(String serPrsnId) {
        this.serPrsnId = serPrsnId;
    }

    /**
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }

    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    /**
     * @return the carlineNm
     */
    public String getCarlineNm() {
        return carlineNm;
    }

    /**
     * @param carlineNm the carlineNm to set
     */
    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    /**
     * @return the dbYn
     */
    public String getDbYn() {
        return dbYn;
    }

    /**
     * @param dbYn the dbYn to set
     */
    public void setDbYn(String dbYn) {
        this.dbYn = dbYn;
    }

    /**
     * @return the giDocStatCd
     */
    public String getGiDocStatCd() {
        return giDocStatCd;
    }

    /**
     * @param giDocStatCd the giDocStatCd to set
     */
    public void setGiDocStatCd(String giDocStatCd) {
        this.giDocStatCd = giDocStatCd;
    }

    /**
     * @return the giStatCd
     */
    public String getGiStatCd() {
        return giStatCd;
    }

    /**
     * @param giStatCd the giStatCd to set
     */
    public void setGiStatCd(String giStatCd) {
        this.giStatCd = giStatCd;
    }

    /**
     * @return the receiveId
     */
    public String getReceiveId() {
        return receiveId;
    }

    /**
     * @param receiveId the receiveId to set
     */
    public void setReceiveId(String receiveId) {
        this.receiveId = receiveId;
    }

    /**
     * @return the receiveNm
     */
    public String getReceiveNm() {
        return receiveNm;
    }

    /**
     * @param receiveNm the receiveNm to set
     */
    public void setReceiveNm(String receiveNm) {
        this.receiveNm = receiveNm;
    }

    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }

    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    /**
     * @return the receiveDt
     */
    public Date getReceiveDt() {
        return receiveDt;
    }

    /**
     * @param receiveDt the receiveDt to set
     */
    public void setReceiveDt(Date receiveDt) {
        this.receiveDt = receiveDt;
    }

    /**
     * @return the receiveDtString
     */
    public String getReceiveDtString() {
        return receiveDtString;
    }

    /**
     * @param receiveDtString the receiveDtString to set
     */
    public void setReceiveDtString(String receiveDtString) {
        this.receiveDtString = receiveDtString;
    }

    /**
     * @return the receiveTime
     */
    public Date getReceiveTime() {
        return receiveTime;
    }

    /**
     * @param receiveTime the receiveTime to set
     */
    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    /**
     * @return the receiveTimeString
     */
    public String getReceiveTimeString() {
        return receiveTimeString;
    }

    /**
     * @param receiveTimeString the receiveTimeString to set
     */
    public void setReceiveTimeString(String receiveTimeString) {
        this.receiveTimeString = receiveTimeString;
    }

    /**
     * @return the returnPartsQty
     */
    public double getReturnPartsQty() {
        return returnPartsQty;
    }

    /**
     * @param returnPartsQty the returnPartsQty to set
     */
    public void setReturnPartsQty(double returnPartsQty) {
        this.returnPartsQty = returnPartsQty;
    }

    /**
     * @return the returnId
     */
    public String getReturnId() {
        return returnId;
    }

    /**
     * @param returnId the returnId to set
     */
    public void setReturnId(String returnId) {
        this.returnId = returnId;
    }

    /**
     * @return the returnNm
     */
    public String getReturnNm() {
        return returnNm;
    }

    /**
     * @param returnNm the returnNm to set
     */
    public void setReturnNm(String returnNm) {
        this.returnNm = returnNm;
    }

    /**
     * @return the returnDt
     */
    public Date getReturnDt() {
        return returnDt;
    }

    /**
     * @param returnDt the returnDt to set
     */
    public void setReturnDt(Date returnDt) {
        this.returnDt = returnDt;
    }

    /**
     * @return the cancId
     */
    public String getCancId() {
        return cancId;
    }

    /**
     * @param cancId the cancId to set
     */
    public void setCancId(String cancId) {
        this.cancId = cancId;
    }

    /**
     * @return the cancDt
     */
    public Date getCancDt() {
        return cancDt;
    }

    /**
     * @param cancDt the cancDt to set
     */
    public void setCancDt(Date cancDt) {
        this.cancDt = cancDt;
    }

    /**
     * @return the itemPrc
     */
    public double getItemPrc() {
        return itemPrc;
    }

    /**
     * @param itemPrc the itemPrc to set
     */
    public void setItemPrc(double itemPrc) {
        this.itemPrc = itemPrc;
    }

    /**
     * @return the taxPrc
     */
    public double getTaxPrc() {
        return taxPrc;
    }

    /**
     * @param taxPrc the taxPrc to set
     */
    public void setTaxPrc(double taxPrc) {
        this.taxPrc = taxPrc;
    }

    /**
     * @return the itemAmt
     */
    public double getItemAmt() {
        return itemAmt;
    }

    /**
     * @param itemAmt the itemAmt to set
     */
    public void setItemAmt(double itemAmt) {
        this.itemAmt = itemAmt;
    }

    /**
     * @return the taxDdctAmt
     */
    public double getTaxDdctAmt() {
        return taxDdctAmt;
    }

    /**
     * @param taxDdctAmt the taxDdctAmt to set
     */
    public void setTaxDdctAmt(double taxDdctAmt) {
        this.taxDdctAmt = taxDdctAmt;
    }

    /**
     * @return the taxAmt
     */
    public double getTaxAmt() {
        return taxAmt;
    }

    /**
     * @param taxAmt the taxAmt to set
     */
    public void setTaxAmt(double taxAmt) {
        this.taxAmt = taxAmt;
    }

    /**
     * @return the salePrcAmt
     */
    public double getSalePrcAmt() {
        return salePrcAmt;
    }

    /**
     * @param salePrcAmt the salePrcAmt to set
     */
    public void setSalePrcAmt(double salePrcAmt) {
        this.salePrcAmt = salePrcAmt;
    }

    /**
     * @return the bmpPurcPrc
     */
    public double getBmpPurcPrc() {
        return bmpPurcPrc;
    }

    /**
     * @param bmpPurcPrc the bmpPurcPrc to set
     */
    public void setBmpPurcPrc(double bmpPurcPrc) {
        this.bmpPurcPrc = bmpPurcPrc;
    }

    /**
     * @return the taxDdctGrtePrc
     */
    public double getTaxDdctGrtePrc() {
        return taxDdctGrtePrc;
    }

    /**
     * @param taxDdctGrtePrc the taxDdctGrtePrc to set
     */
    public void setTaxDdctGrtePrc(double taxDdctGrtePrc) {
        this.taxDdctGrtePrc = taxDdctGrtePrc;
    }

    /**
     * @return the giCauNm
     */
    public String getGiCauNm() {
        return giCauNm;
    }

    /**
     * @param giCauNm the giCauNm to set
     */
    public void setGiCauNm(String giCauNm) {
        this.giCauNm = giCauNm;
    }

    /**
     * @return the etcGiTp
     */
    public String getEtcGiTp() {
        return etcGiTp;
    }

    /**
     * @param etcGiTp the etcGiTp to set
     */
    public void setEtcGiTp(String etcGiTp) {
        this.etcGiTp = etcGiTp;
    }

    /**
     * @return the movingAvgPrc
     */
    public double getMovingAvgPrc() {
        return movingAvgPrc;
    }

    /**
     * @param movingAvgPrc the movingAvgPrc to set
     */
    public void setMovingAvgPrc(double movingAvgPrc) {
        this.movingAvgPrc = movingAvgPrc;
    }

    /**
     * @return the movingAvgAmt
     */
    public double getMovingAvgAmt() {
        return movingAvgAmt;
    }

    /**
     * @param movingAvgAmt the movingAvgAmt to set
     */
    public void setMovingAvgAmt(double movingAvgAmt) {
        this.movingAvgAmt = movingAvgAmt;
    }

    /**
     * @return the movingAvgTaxDdctPrc
     */
    public double getMovingAvgTaxDdctPrc() {
        return movingAvgTaxDdctPrc;
    }

    /**
     * @param movingAvgTaxDdctPrc the movingAvgTaxDdctPrc to set
     */
    public void setMovingAvgTaxDdctPrc(double movingAvgTaxDdctPrc) {
        this.movingAvgTaxDdctPrc = movingAvgTaxDdctPrc;
    }

    /**
     * @return the movingAvgTaxDdctAmt
     */
    public double getMovingAvgTaxDdctAmt() {
        return movingAvgTaxDdctAmt;
    }

    /**
     * @param movingAvgTaxDdctAmt the movingAvgTaxDdctAmt to set
     */
    public void setMovingAvgTaxDdctAmt(double movingAvgTaxDdctAmt) {
        this.movingAvgTaxDdctAmt = movingAvgTaxDdctAmt;
    }

    /**
     * @return the readyDocNo
     */
    public String getReadyDocNo() {
        return readyDocNo;
    }

    /**
     * @param readyDocNo the readyDocNo to set
     */
    public void setReadyDocNo(String readyDocNo) {
        this.readyDocNo = readyDocNo;
    }

    /**
     * @return the readyRemark
     */
    public String getReadyRemark() {
        return readyRemark;
    }

    /**
     * @param readyRemark the readyRemark to set
     */
    public void setReadyRemark(String readyRemark) {
        this.readyRemark = readyRemark;
    }

    /**
     * @return the readyUsrId
     */
    public String getReadyUsrId() {
        return readyUsrId;
    }

    /**
     * @param readyUsrId the readyUsrId to set
     */
    public void setReadyUsrId(String readyUsrId) {
        this.readyUsrId = readyUsrId;
    }

    /**
     * @return the readyUsrNm
     */
    public String getReadyUsrNm() {
        return readyUsrNm;
    }

    /**
     * @param readyUsrNm the readyUsrNm to set
     */
    public void setReadyUsrNm(String readyUsrNm) {
        this.readyUsrNm = readyUsrNm;
    }

    /**
     * @return the readyRegDt
     */
    public Date getReadyRegDt() {
        return readyRegDt;
    }

    /**
     * @param readyRegDt the readyRegDt to set
     */
    public void setReadyRegDt(Date readyRegDt) {
        this.readyRegDt = readyRegDt;
    }

    /**
     * @return the readyRegDtString
     */
    public String getReadyRegDtString() {
        return readyRegDtString;
    }

    /**
     * @param readyRegDtString the readyRegDtString to set
     */
    public void setReadyRegDtString(String readyRegDtString) {
        this.readyRegDtString = readyRegDtString;
    }

    /**
     * @return the readyRegEndDt
     */
    public Date getReadyRegEndDt() {
        return readyRegEndDt;
    }

    /**
     * @param readyRegEndDt the readyRegEndDt to set
     */
    public void setReadyRegEndDt(Date readyRegEndDt) {
        this.readyRegEndDt = readyRegEndDt;
    }

    /**
     * @return the readyCancRemark
     */
    public String getReadyCancRemark() {
        return readyCancRemark;
    }

    /**
     * @param readyCancRemark the readyCancRemark to set
     */
    public void setReadyCancRemark(String readyCancRemark) {
        this.readyCancRemark = readyCancRemark;
    }

    /**
     * @return the readyCancUsrId
     */
    public String getReadyCancUsrId() {
        return readyCancUsrId;
    }

    /**
     * @param readyCancUsrId the readyCancUsrId to set
     */
    public void setReadyCancUsrId(String readyCancUsrId) {
        this.readyCancUsrId = readyCancUsrId;
    }

    /**
     * @return the readyCancUsrNm
     */
    public String getReadyCancUsrNm() {
        return readyCancUsrNm;
    }

    /**
     * @param readyCancUsrNm the readyCancUsrNm to set
     */
    public void setReadyCancUsrNm(String readyCancUsrNm) {
        this.readyCancUsrNm = readyCancUsrNm;
    }

    /**
     * @return the readyCancRegDt
     */
    public Date getReadyCancRegDt() {
        return readyCancRegDt;
    }

    /**
     * @param readyCancRegDt the readyCancRegDt to set
     */
    public void setReadyCancRegDt(Date readyCancRegDt) {
        this.readyCancRegDt = readyCancRegDt;
    }

    /**
     * @return the readyCancRegDtString
     */
    public String getReadyCancRegDtString() {
        return readyCancRegDtString;
    }

    /**
     * @param readyCancRegDtString the readyCancRegDtString to set
     */
    public void setReadyCancRegDtString(String readyCancRegDtString) {
        this.readyCancRegDtString = readyCancRegDtString;
    }

    /**
     * @return the regDt
     */
    public Date getRegDt() {
        return regDt;
    }

    /**
     * @param regDt the regDt to set
     */
    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    /**
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    /**
     * @return the resvUsrId
     */
    public String getResvUsrId() {
        return resvUsrId;
    }

    /**
     * @param resvUsrId the resvUsrId to set
     */
    public void setResvUsrId(String resvUsrId) {
        this.resvUsrId = resvUsrId;
    }

    /**
     * @return the resvUsrNm
     */
    public String getResvUsrNm() {
        return resvUsrNm;
    }

    /**
     * @param resvUsrNm the resvUsrNm to set
     */
    public void setResvUsrNm(String resvUsrNm) {
        this.resvUsrNm = resvUsrNm;
    }

    /**
     * @return the partsResvUsrId
     */
    public String getPartsResvUsrId() {
        return partsResvUsrId;
    }

    /**
     * @param partsResvUsrId the partsResvUsrId to set
     */
    public void setPartsResvUsrId(String partsResvUsrId) {
        this.partsResvUsrId = partsResvUsrId;
    }

    /**
     * @return the partsResvUsrNm
     */
    public String getPartsResvUsrNm() {
        return partsResvUsrNm;
    }

    /**
     * @param partsResvUsrNm the partsResvUsrNm to set
     */
    public void setPartsResvUsrNm(String partsResvUsrNm) {
        this.partsResvUsrNm = partsResvUsrNm;
    }

    /**
     * @return the borrowDocNo
     */
    public String getBorrowDocNo() {
        return borrowDocNo;
    }

    /**
     * @param borrowDocNo the borrowDocNo to set
     */
    public void setBorrowDocNo(String borrowDocNo) {
        this.borrowDocNo = borrowDocNo;
    }

    /**
     * @return the borrowDocNoUseYn
     */
    public String getBorrowDocNoUseYn() {
        return borrowDocNoUseYn;
    }

    /**
     * @param borrowDocNoUseYn the borrowDocNoUseYn to set
     */
    public void setBorrowDocNoUseYn(String borrowDocNoUseYn) {
        this.borrowDocNoUseYn = borrowDocNoUseYn;
    }

    /**
     * @return the borrowLineNo
     */
    public int getBorrowLineNo() {
        return borrowLineNo;
    }

    /**
     * @param borrowLineNo the borrowLineNo to set
     */
    public void setBorrowLineNo(int borrowLineNo) {
        this.borrowLineNo = borrowLineNo;
    }

    /**
     * @return the borrowTp
     */
    public String getBorrowTp() {
        return borrowTp;
    }

    /**
     * @param borrowTp the borrowTp to set
     */
    public void setBorrowTp(String borrowTp) {
        this.borrowTp = borrowTp;
    }

    /**
     * @return the borrowStatCd
     */
    public String getBorrowStatCd() {
        return borrowStatCd;
    }

    /**
     * @param borrowStatCd the borrowStatCd to set
     */
    public void setBorrowStatCd(String borrowStatCd) {
        this.borrowStatCd = borrowStatCd;
    }

    /**
     * @return the borrowUpdateStatCd
     */
    public String getBorrowUpdateStatCd() {
        return borrowUpdateStatCd;
    }

    /**
     * @param borrowUpdateStatCd the borrowUpdateStatCd to set
     */
    public void setBorrowUpdateStatCd(String borrowUpdateStatCd) {
        this.borrowUpdateStatCd = borrowUpdateStatCd;
    }

    /**
     * @return the borrowQty
     */
    public double getBorrowQty() {
        return borrowQty;
    }

    /**
     * @param borrowQty the borrowQty to set
     */
    public void setBorrowQty(double borrowQty) {
        this.borrowQty = borrowQty;
    }

    /**
     * @return the borrowUsrId
     */
    public String getBorrowUsrId() {
        return borrowUsrId;
    }

    /**
     * @param borrowUsrId the borrowUsrId to set
     */
    public void setBorrowUsrId(String borrowUsrId) {
        this.borrowUsrId = borrowUsrId;
    }


    /**
     * @return the borrowUsrNm
     */
    public String getBorrowUsrNm() {
        return borrowUsrNm;
    }

    /**
     * @param borrowUsrNm the borrowUsrNm to set
     */
    public void setBorrowUsrNm(String borrowUsrNm) {
        this.borrowUsrNm = borrowUsrNm;
    }

    /**
     * @return the borrowDeptCd
     */
    public String getBorrowDeptCd() {
        return borrowDeptCd;
    }

    /**
     * @param borrowDeptCd the borrowDeptCd to set
     */
    public void setBorrowDeptCd(String borrowDeptCd) {
        this.borrowDeptCd = borrowDeptCd;
    }

    /**
     * @return the borrowDeptNm
     */
    public String getBorrowDeptNm() {
        return borrowDeptNm;
    }

    /**
     * @param borrowDeptNm the borrowDeptNm to set
     */
    public void setBorrowDeptNm(String borrowDeptNm) {
        this.borrowDeptNm = borrowDeptNm;
    }

    /**
     * @return the borrowRegDt
     */
    public Date getBorrowRegDt() {
        return borrowRegDt;
    }

    /**
     * @param borrowRegDt the borrowRegDt to set
     */
    public void setBorrowRegDt(Date borrowRegDt) {
        this.borrowRegDt = borrowRegDt;
    }

    /**
     * @return the etcRvDocNo
     */
    public String getEtcRvDocNo() {
        return etcRvDocNo;
    }

    /**
     * @param etcRvDocNo the etcRvDocNo to set
     */
    public void setEtcRvDocNo(String etcRvDocNo) {
        this.etcRvDocNo = etcRvDocNo;
    }

    /**
     * @return the etcRvLineNo
     */
    public int getEtcRvLineNo() {
        return etcRvLineNo;
    }

    /**
     * @param etcRvLineNo the etcRvLineNo to set
     */
    public void setEtcRvLineNo(int etcRvLineNo) {
        this.etcRvLineNo = etcRvLineNo;
    }

    /**
     * @return the etcRvStatCd
     */
    public String getEtcRvStatCd() {
        return etcRvStatCd;
    }

    /**
     * @param etcRvStatCd the etcRvStatCd to set
     */
    public void setEtcRvStatCd(String etcRvStatCd) {
        this.etcRvStatCd = etcRvStatCd;
    }

    /**
     * @return the etcRvQty
     */
    public double getEtcRvQty() {
        return etcRvQty;
    }

    /**
     * @param etcRvQty the etcRvQty to set
     */
    public void setEtcRvQty(double etcRvQty) {
        this.etcRvQty = etcRvQty;
    }

    /**
     * @return the etcRvPrsnId
     */
    public String getEtcRvPrsnId() {
        return etcRvPrsnId;
    }

    /**
     * @param etcRvPrsnId the etcRvPrsnId to set
     */
    public void setEtcRvPrsnId(String etcRvPrsnId) {
        this.etcRvPrsnId = etcRvPrsnId;
    }

    /**
     * @return the etcRvRegDt
     */
    public Date getEtcRvRegDt() {
        return etcRvRegDt;
    }

    /**
     * @param etcRvRegDt the etcRvRegDt to set
     */
    public void setEtcRvRegDt(Date etcRvRegDt) {
        this.etcRvRegDt = etcRvRegDt;
    }

    /**
     * @return the mvtDocYyMm
     */
    public String getMvtDocYyMm() {
        return mvtDocYyMm;
    }

    /**
     * @param mvtDocYyMm the mvtDocYyMm to set
     */
    public void setMvtDocYyMm(String mvtDocYyMm) {
        this.mvtDocYyMm = mvtDocYyMm;
    }

    /**
     * @return the mvtDocNo
     */
    public String getMvtDocNo() {
        return mvtDocNo;
    }

    /**
     * @param mvtDocNo the mvtDocNo to set
     */
    public void setMvtDocNo(String mvtDocNo) {
        this.mvtDocNo = mvtDocNo;
    }

    /**
     * @return the mvtDocLineNo
     */
    public int getMvtDocLineNo() {
        return mvtDocLineNo;
    }

    /**
     * @param mvtDocLineNo the mvtDocLineNo to set
     */
    public void setMvtDocLineNo(int mvtDocLineNo) {
        this.mvtDocLineNo = mvtDocLineNo;
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
     * @return the itemSalePrc
     */
    public double getItemSalePrc() {
        return itemSalePrc;
    }

    /**
     * @param itemSalePrc the itemSalePrc to set
     */
    public void setItemSalePrc(double itemSalePrc) {
        this.itemSalePrc = itemSalePrc;
    }

    /**
     * @return the itemSaleAmt
     */
    public double getItemSaleAmt() {
        return itemSaleAmt;
    }

    /**
     * @param itemSaleAmt the itemSaleAmt to set
     */
    public void setItemSaleAmt(double itemSaleAmt) {
        this.itemSaleAmt = itemSaleAmt;
    }

    /**
     * @return the dcRate
     */
    public double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the dcAmt
     */
    public double getDcAmt() {
        return dcAmt;
    }

    /**
     * @param dcAmt the dcAmt to set
     */
    public void setDcAmt(double dcAmt) {
        this.dcAmt = dcAmt;
    }

    /**
     * @return the itemTotAmt
     */
    public double getItemTotAmt() {
        return itemTotAmt;
    }

    /**
     * @param itemTotAmt the itemTotAmt to set
     */
    public void setItemTotAmt(double itemTotAmt) {
        this.itemTotAmt = itemTotAmt;
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
     * @return the updtUsrNm
     */
    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    /**
     * @param updtUsrNm the updtUsrNm to set
     */
    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    /**
     * @return the deptCd
     */
    public String getDeptCd() {
        return deptCd;
    }

    /**
     * @param deptCd the deptCd to set
     */
    public void setDeptCd(String deptCd) {
        this.deptCd = deptCd;
    }

    /**
     * @return the deptNm
     */
    public String getDeptNm() {
        return deptNm;
    }

    /**
     * @param deptNm the deptNm to set
     */
    public void setDeptNm(String deptNm) {
        this.deptNm = deptNm;
    }

    /**
     * @return the paymCd
     */
    public String getPaymCd() {
        return paymCd;
    }

    /**
     * @param paymCd the paymCd to set
     */
    public void setPaymCd(String paymCd) {
        this.paymCd = paymCd;
    }

    /**
     * @return the paymTp
     */
    public String getPaymTp() {
        return paymTp;
    }

    /**
     * @param paymTp the paymTp to set
     */
    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    /**
     * @return the paymUsrNm
     */
    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    /**
     * @param paymUsrNm the paymUsrNm to set
     */
    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

    /**
     * @return the retlPrc
     */
    public double getRetlPrc() {
        return retlPrc;
    }

    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(double retlPrc) {
        this.retlPrc = retlPrc;
    }

    /**
     * @return the whslPrc
     */
    public double getWhslPrc() {
        return whslPrc;
    }

    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(double whslPrc) {
        this.whslPrc = whslPrc;
    }

    /**
     * @return the incPrc
     */
    public double getIncPrc() {
        return incPrc;
    }

    /**
     * @param incPrc the incPrc to set
     */
    public void setIncPrc(double incPrc) {
        this.incPrc = incPrc;
    }

    /**
     * @return the grtePrc
     */
    public double getGrtePrc() {
        return grtePrc;
    }

    /**
     * @param grtePrc the grtePrc to set
     */
    public void setGrtePrc(double grtePrc) {
        this.grtePrc = grtePrc;
    }

    /**
     * @return the partsPrcTp
     */
    public String getPartsPrcTp() {
        return partsPrcTp;
    }

    /**
     * @param partsPrcTp the partsPrcTp to set
     */
    public void setPartsPrcTp(String partsPrcTp) {
        this.partsPrcTp = partsPrcTp;
    }

    /**
     * @return the roRegUsrNm
     */
    public String getRoRegUsrNm() {
        return roRegUsrNm;
    }

    /**
     * @param roRegUsrNm the roRegUsrNm to set
     */
    public void setRoRegUsrNm(String roRegUsrNm) {
        this.roRegUsrNm = roRegUsrNm;
    }

    /**
     * @return the markUp
     */
    public double getMarkUp() {
        return markUp;
    }

    /**
     * @param markUp the markUp to set
     */
    public void setMarkUp(double markUp) {
        this.markUp = markUp;
    }

    /**
     * @return the taxRate
     */
    public double getTaxRate() {
        return taxRate;
    }

    /**
     * @param taxRate the taxRate to set
     */
    public void setTaxRate(double taxRate) {
        this.taxRate = taxRate;
    }


}
