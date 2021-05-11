package chn.bhmc.dms.mob.api.crm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RepairOrderVO.java
 * @Description : RO마스터 VO
 * @author KyungMok Kim
 * @since 2016. 3. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 14.    KyungMok Kim     최초 생성
 * </pre>
 */

public class RepairOrderVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2251377407572090894L;

    /**
     * PREFIX
     **/
    private String preFixId;

    /**
    * 딜러코드
    **/
    private String dlrCd;

    /**
    * RO문서번호
    **/
    private String roDocNo;

    /**
    * RO유형
    **/
    private String roTp;

    /**
    * RO유형명
    **/
    private String roTpNm;

    /**
    * 예약문서번호
    **/
    private String resvDocNo;

    /**
    * 차대번호
    **/
    private String vinNo;

    /**
    * 차량등록번호
    **/
    private String carRegNo;

    /**
    * 엔진시리얼번호
    **/
    private String enginNo;

    /**
    * 차량소유자ID
    **/
    private String carOwnerId;

    /**
    * 차량소유자명
    **/
    private String carOwnerNm;

    /**
    * 운전자ID
    **/
    private String driverId;

    /**
    * 운전자명
    **/
    private String driverNm;

    /**
     * 운전자 휴대폰
     **/
    private String driverHpNo;

    /**
    * 예약유형
    **/
    private String resvTp;

    /**
    * 예약일자
    **/
    private Date resvDt;

    /**
    * 베이번호
    **/
    private String bayNo;

    /**
    * 베이명
    **/
    private String bayNm;

    /**
    * TecManID
    **/
    private String tecId;

    /**
    * TecMan명
    **/
    private String tecNm;

    /**
    * SAID
    **/
    private String saId;

    /**
    * SA명
    **/
    private String saNm;

    /**
    * 작업예약일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date operResvDt;

    /**
    * 서비스예약시작일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvStartDt;

    /**
    * 서비스예약종료일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date serResvEndDt;

    /**
    * 부품금액
    **/
    private Double parAmt;

    /**
    * 공임금액
    **/
    private Double lbrAmt;

    /**
    * 기타금액
    **/
    private Double etcAmt;

    /**
    * 할인금액
    **/
    private Double dcAmt;

    /**
    * 합계금액
    **/
    private Double sumAmt;

    /**
    * 부가가치세금액
    **/
    private Double vatAmt;

    /**
    * 총금액
    **/
    private Double totAmt;

    /**
    * 예치금액
    **/
    private Double balAmt;

    /**
    * 취소사유코드
    **/
    private String cancReasonCd;

    /**
    * 취소사유코드명
    **/
    private String cancReasonNm;

    /**
    * 취소사유내용
    **/
    private String cancReasonCont;

    /**
    * 거리단위코드
    **/
    private String distUnitCd;

    /**
    * 주행거리값
    **/
    private int runDistVal;

    /**
     * 사전점검 상태
     */
    private String diagStatCd;


    /**
     * 최종 주행거리값
     **/
    private int lastRunDistVal;

    /**
    * 사전점검번호
    **/
    private String diagDocNo;

    /**
    * 사전점검시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date preChkDt;

    /**
    * 원RO번호
    **/
    private String baseRoNo;

    /**
    * 보험신청번호
    **/
    private String incReqNo;

    /**
    * 보험신청일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date incReqDt;

    /**
    * 고객대기방법코드
    **/
    private String custWaitMthCd;

    /**
    * 고객대기방법명칭
    **/
    private String custWaitMthNm;

    /**
    * 고품처리유형
    **/
    private String atqProcTp;

    /**
    * 고품처리유형명
    **/
    private String atqProcTpNm;

    /**
    * 차량세차유형
    **/
    private String carWashTp;

    /**
    * 차량세차유형명
    **/
    private String carWashTpNm;

    /**
    * 차량시승요청유형
    **/
    private String carDriveReqTp;

    /**
    * 차량시승요청유형명
    **/
    private String carDriveReqTpNm;

    /**
     * 예정인도시작일자(인도보드용)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcDlStartDt;

    /**
    * 예정인도일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcDlDt;

    /**
    * RO완료여부
    **/
    private String roEndYn;

    /**
    * 고품처리여부
    **/
    private String atqProcYn;

    /**
    * 차량세차여부
    **/
    private String carWashYn;

    /**
    * 서비스태그여부
    **/
    private String serTagYn;

    /**
    * 방문차량수령시간
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitCarReceiveDt;

    /**
    * 방문차량수령연계인명
    **/
    private String vsitCarReceiveIfNm;

    /**
    * 방문차량수령연락처번호
    **/
    private String vsitCarReceiveCinoNo;

    /**
    * 방문차량수령주소명
    **/
    private String vsitCarReceiveAddrNm;

    /**
    * 차량수령일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carReceiveDt;

    /**
    * 방문인도연계인명
    **/
    private String vsitDlIfNm;

    /**
    * 방문인도연락처번호
    **/
    private String vsitDlCinoNo;

    /**
    * 방문인도주소명
    **/
    private String vsitDlAddrNm;

    /**
    * 방문일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date vsitDt;

    /**
    * 방문연계인명
    **/
    private String vsitIfNm;

    /**
    * 방문연락처번호
    **/
    private String vsitCinoNo;

    /**
    * 방문주소명
    **/
    private String vsitAddrNm;

    /**
    * RO상태코드
    **/
    private String roStatCd;

    /**
    * RO상태코드명
    **/
    private String roStatNm;

    /**
    * RO발행일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roDt;

    /**
    * 차량세차상태코드
    **/
    private String carWashStatCd;

    /**
    * 차량세차상태명
    **/
    private String carWashStatNm;

    /**
     * 페인트상태코드
     **/
    private String paintStatCd;

    /**
     * 페인트상태명칭
     **/
    private String paintStatNm;

    /**
     * 품질검사상태코드
     **/
    private String qtTestStatCd;

    /**
     * 품질검사상태명
     **/
    private String qtTestStatNm;

    /**
     * RO그룹번호
     **/
    private String roGrpNo;

    /**
     * 페인트수량
     **/
    private int paintQty;

    /**
     * 페인트색상코드
     **/
    private String paintColorCd;

    /**
     * 차량색상코드
     **/
    private String carColorCd;

    /**
     * 페인트유형
     **/
    private String paintTp;

    /**
     * RO시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roStartDt;

    /**
     * RO종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roEndDt;

    /**
     * RO비고
     **/
    private String roRemark;

    /**
     * 작업배정상태
     **/
    private String allocStatCd;

    /**
     * 작업배정상태명
     **/
    private String allocStatNm;

    /**
     * 진도상태
     **/
    private String wrkStatCd;

    /**
     * 진도상태명
     **/
    private String wrkStatNm;

    /**
     * 인도상태
     **/
    private String dlStatCd;

    /**
     * 인도상태명
     **/
    private String dlStatNm;

    /**
     * 품질검사방법코드
     **/
    private String qtTestMthCd;

    /**
     * 품질검사방법코드명
     **/
    private String qtTestMthNm;

    /**
     * 변경예정인도일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date chgExpcDlDt;

    /**
     * 원인코드1
     */
    private String cauCd1;
    /**
     * 원인코드명1
     */
    private String cauNm1;
    /**
     * 현상코드1
     */
    private String phenCd1;
    /**
     * 현상코드1
     */
    private String phenNm1;
    /**
     * 원인코드2
     */
    private String cauCd2;
    /**
     * 원인코드명2
     */
    private String cauNm2;
    /**
     * 현상코드2
     */
    private String phenCd2;
    /**
     * 현상코드명2
     */
    private String phenNm2;
    /**
     * 세차자명
     */
    private String carWashPrsnNm;
    /**
     * 세차자코드
     */
    private String carWashPrsnCd;
    /**
     * 세차시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashStartDt;
    /**
     * 세차완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashEndDt;
    /**
     * 세차취소시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carWashCancDt;
    /**
     * 품질검사자명
     */
    private String qtTestPrsnNm;
    /**
     * 품질검사자코드
     */
    private String qtTestPrsnCd;

    /**
     * 품질검사 시작시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestStartDt;

    /**
     * 품질검사 세차완료시간
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date qtTestEndDt;

    /**
     * 판금페인트
     */
    private String bpNo;

    /**
     * 리워크코드
     */
    private String rwrkCd;

    /**
     * 리워크 비고
     */
    private String rwrkRemark;

    /**
     * ro완료여부
     */
    private String roEndChkYn;

    /**
     * 고품처리여부
     */
    private String atqProcChkYn;

    /**
     * 품질검사여부
     */
    private String qtChkYn;

    /**
     * 세차여부
     */
    private String carWashChkYn;

    /**
     * 서비스태그회수여부
     */
    private String serTagChkYn;

    /**
     * 인도검사자코드
     */
    private String dlChkPrsnCd;

    /**
     * 인도검사자명칭
     */
    private String dlChkPrsnNm;

    /**
     * 출고주행거리
     */
    private double giRunDistVal;

    /**
     * 출고주행거리
     */
    private String giRunDistValText;


    /**
     * 지불방식
     */
    private String paymTp;


    /**
     * 지불자 코드
     */
    private String paymUsrCd;


    /**
     * 지불자 명
     */
    private String paymUsrNm;

    /**
     * 정산번호
     **/
    private String calcDocNo;

     /**
      * 최종 정산금액
      **/
    private Double lastCalcTotAmt;


     /**
      * 선수금 금액
      **/
    private Double preAmt;

     /**
      * 다음보양 기준 월
      */
    private String nextFreeMonth;

     /**
      * 다음보양 주행거리
      */
    private String nextFreeRunDistVal;

     /**
      * lts model cd
      */
    private String ltsModelCd;

     /**
      * 차종명
      */
    private String carlineNm;

     /**
      * 모델명
      */
    private String modelNm;

    private String regUsrNm;

    private String updtUsrNm;

     /**
      * RO 취소자
      */
    private String roCancNm;

     /**
      * RO 취소일자
      */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roCancDt;

     /**
      * BM 포인트 사용금액
      */
    private Double bmPointUseAmt;

    /**
     * BM 포인트 사용금액
     */
   private Double bmCupnUseAmt;

    /**
      * 포인트 사용금액
      */
    private Double pointUseAmt;

    /**
     * 정산 부품금액
     **/
     private Double calcParAmt;

     /**
     * 정산 공임금액
     **/
     private Double calcLbrAmt;

     /**
     * 정산 기타금액
     **/
     private Double calcEtcAmt;

     /**
     * 정산 할인금액
     **/
     private Double calcDcAmt;

     /**
     * 기타혜택금액
     **/
     private Double calcEtcDcAmt;

     /**
      * 정산 합계금액
      **/
     private Double calcSumAmt;

     /**
      * 정산확정일자
      */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcDt;

    /**
     * 정산확인일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date calcRegDt;

    private String calcPrsnNm;

    private String carId;

    private String pauseCauCd;

    private String searchGubun;

    private String goodwillYn;

    private String goodwillYnNm;

    private String goodwillStatCd;

    /**
     * 세차취소자명
     */
    private String carWashCancPrsnNm;
    /**
     * 세차취소자코드
     */
    private String carWashCancPrsnCd;

    /**
     * 세차취소원인코드
     */
    private String carWashCancReasonCd;

    /**
     * 세차취소원인내용
     */
    private String carWashCancReasonCont;

    /**
     * 딜러자체 RO유형
     */
    private String dlrRoTp;

    /**
     * 딜러자체 RO유형명
     */
    private String dlrRoTpNm;

    /**
     * 인쇄여부
     */
    private String printYn;

    /**
     * 인도체크일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlChkDt;

    /**
     * 인쇄일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date roPrintDt;

    /**
     * 칸반 그룹번호
     */
    private String grpNo;

    /**
     * 예정인도일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlDt;

    /**
     * 작업시작 시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrkStartDt;

    /**
     * 작업완료 시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrkEndDt;

    /**
     * 배정시작 시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocStartDt;

    /**
     * 배정완료 시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocEndDt;

    /**
     * 공임할인금액
     **/
    private Double lbrDcAmt;

    /**
     * 부품할인금액
     **/
    private Double parDcAmt;

    /**
     * 지불완료여부
     **/
    private String paidYn;

    /**
     * 지불완료여부
     **/
    private String paidYnNm;


     /**
     * 배분시간
     **/
    //DSTB_HM
    private Double dstbHm;

    /**
     * 패키지품목코드
     **/
    private String pkgItemCd;

    /**
     * 공임코드
     **/
    //LBR_CD
    private String lbrCd;

    /**
     * 공임명
     **/
    //LBR_NM
    private String lbrNm;

    /**
     * 공임유형
     **/
    //LBR_TP
    private String lbrTp;

    /**
     * 수불공임
     **/
    private Double lbrHm;

    /**
     * 공임유형명
     **/
    //LBR_TP
    private String lbrTpNm;

    /**
     * 정비소조번호
     */
    private String wkgrpNo;

    /**
     * 정비소조명칭
     */
    private String wkgrpNm;

    /**
     * 정비건수
     */
    private int serCnt;

    /**
     * 난의도계수
     */
    private int diffVal;

    /**
     * 정산비고
     */
    private String calcRemark;

    private String pdiYn;

    /**
     * 외주거래처코드
     **/
    //SUB_BP_CD
    private String subBpCd;

    /**
     * 외주거래처명
     **/
    //SUB_BP_NM
    private String subBpNm;

    /**
     * 취소구분
     **/
    private String cancelType;

    /**
     * 정산완료자명
     **/
    private String calcCompUsrNm;

    /**
     * 수납여부
     **/
    private String paymYnNm;

    /**
     * 절사금액
     **/
    private Double wonUnitCutAmt;

    /**
     * 제로절사금액
     **/
    private Double demicPointCutAmt;

    /**
     * 수납금액
     **/
    private Double paymAmt;

    /**
     * 미수금액
     **/
    private Double npayAmt;

    /**
     * 실수금액
     **/
    private Double rcvAmt;

    /**
     * 예약여부
     **/
    private String resvYn;

    private String resvYnNm;

    /**
     * 정비예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcChkDt;

    /**
     * 예정주행거리
     **/
    private int expcChkRunDistVal;

    /**
     * 부품요청상태
     **/
    private String itemReqStatCd;

    /**
     * 고객의견코드
     **/
    private String custReqCd;

    /**
     * 고객의견내용
     **/
    private String custReqCont;

    /**
     * 기타사항코드
     **/
    private String etcTpCd;

    /**
     * 기타사항명
     **/
    private String etcTpNm;

    /**
     * 기타사항금액
     **/
    private String etcReqPrc;

    /**
     * 공임단가
     **/
    private Double lbrPrc;

    /**
     * 공임할인율
     **/
    private Double lbrDcRate;

    /**
     * 공임할인후 금액
     **/
    private Double lbrTotAmt;

    /**
     * 예정시작시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date exptStartDt;

    /**
     * 예정완료시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date exptEndDt;

    /**
     * 배정비고
     **/
    private String allocRemark;

    /**
     * 정비중단비고
     **/
    private String pauseCauRmk;

    /**
     * 캠페인번호
     **/
    private String crNo;

    /**
     * 캠페인유형 코드
     **/
    private String crTp;

    /**
     * 캠페인유형 명칭
     **/
    private String crTpNm;

    /**
     * 캠페인명칭
     **/
    private String crNm;

    /**
     * 배정대기사용시간
     **/
    private Double allocReadyTime;

    /**
     * 배정사용시간
     **/
    private Double allocUseTime;

    /**
     * 정비서비스사용시간
     **/
    private Double rpirSerTime;

    /**
     * 정비대기사용시간
     **/
    private Double rpirReadyTime;

    /**
     * 정비조작사용시간
     **/
    private Double rpirTime;

    /**
     * 품질점검대기사용시간
     **/
    private Double qtTestReadyTime;

    /**
     * 품질점검사용시간
     **/
    private Double qtTestTime;

    /**
     * On time 작업시작
     **/
    private String onTimeStartYn;

    /**
     * On time 작업완료
     **/
    private String onTimeEndYn;

    /**
     * 지연 작업시작
     **/
    private String delayStartYn;

    /**
     * 지연 작업완료
     **/
    private String delayEndYn;

    /**
     * 차량판매일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;

    /**
     * 처음수리여부
     **/
    private String firstRoYn;
    private String firstRoYnNm;

    /**
     * 처음보양여부
     */
    private String freeRoYn;
    private String freeRoYnNm;

    /**
     * 수납완료이력일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date rcvCpltDt;

    /**
     * 지불완료시간
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date payEndDt;

    /**
     * 판매딜러코드
     **/
     private String ordDlrCd;

     /**
      * BM회원번호
      **/
      private String blueMembershipNo;

      /**
       * 딜러회원번호
       **/
       private String membershipNo;


    public String getPreFixId() {
        return preFixId;
    }

    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }

    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getRoDocNo() {
        return roDocNo;
    }

    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    public String getRoTp() {
        return roTp;
    }

    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }

    public String getRoTpNm() {
        return roTpNm;
    }

    public void setRoTpNm(String roTpNm) {
        this.roTpNm = roTpNm;
    }

    public String getResvDocNo() {
        return resvDocNo;
    }

    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getCarRegNo() {
        return carRegNo;
    }

    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }

    public String getEnginNo() {
        return enginNo;
    }

    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }

    public String getCarOwnerId() {
        return carOwnerId;
    }

    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    public String getDriverId() {
        return driverId;
    }

    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }

    public String getDriverNm() {
        return driverNm;
    }

    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }

    public String getDriverHpNo() {
        return driverHpNo;
    }

    public void setDriverHpNo(String driverHpNo) {
        this.driverHpNo = driverHpNo;
    }

    public String getResvTp() {
        return resvTp;
    }

    public void setResvTp(String resvTp) {
        this.resvTp = resvTp;
    }

    public Date getResvDt() {
        return resvDt;
    }

    public void setResvDt(Date resvDt) {
        this.resvDt = resvDt;
    }

    public String getBayNo() {
        return bayNo;
    }

    public void setBayNo(String bayNo) {
        this.bayNo = bayNo;
    }

    public String getTecId() {
        return tecId;
    }

    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    public String getTecNm() {
        return tecNm;
    }

    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId;
    }

    public String getSaNm() {
        return saNm;
    }

    public void setSaNm(String saNm) {
        this.saNm = saNm;
    }

    public Date getOperResvDt() {
        return operResvDt;
    }

    public void setOperResvDt(Date operResvDt) {
        this.operResvDt = operResvDt;
    }

    public Date getSerResvStartDt() {
        return serResvStartDt;
    }

    public void setSerResvStartDt(Date serResvStartDt) {
        this.serResvStartDt = serResvStartDt;
    }

    public Date getSerResvEndDt() {
        return serResvEndDt;
    }

    public void setSerResvEndDt(Date serResvEndDt) {
        this.serResvEndDt = serResvEndDt;
    }

    public Double getParAmt() {
        return parAmt;
    }

    public void setParAmt(Double parAmt) {
        this.parAmt = parAmt;
    }

    public Double getLbrAmt() {
        return lbrAmt;
    }

    public void setLbrAmt(Double lbrAmt) {
        this.lbrAmt = lbrAmt;
    }

    public Double getEtcAmt() {
        return etcAmt;
    }

    public void setEtcAmt(Double etcAmt) {
        this.etcAmt = etcAmt;
    }

    public Double getDcAmt() {
        return dcAmt;
    }

    public void setDcAmt(Double dcAmt) {
        this.dcAmt = dcAmt;
    }

    public Double getSumAmt() {
        return sumAmt;
    }

    public void setSumAmt(Double sumAmt) {
        this.sumAmt = sumAmt;
    }

    public Double getVatAmt() {
        return vatAmt;
    }

    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    public Double getTotAmt() {
        return totAmt;
    }

    public void setTotAmt(Double totAmt) {
        this.totAmt = totAmt;
    }

    public Double getBalAmt() {
        return balAmt;
    }

    public void setBalAmt(Double balAmt) {
        this.balAmt = balAmt;
    }

    public String getCancReasonCd() {
        return cancReasonCd;
    }

    public void setCancReasonCd(String cancReasonCd) {
        this.cancReasonCd = cancReasonCd;
    }

    public String getCancReasonNm() {
        return cancReasonNm;
    }

    public void setCancReasonNm(String cancReasonNm) {
        this.cancReasonNm = cancReasonNm;
    }

    public String getCancReasonCont() {
        return cancReasonCont;
    }

    public void setCancReasonCont(String cancReasonCont) {
        this.cancReasonCont = cancReasonCont;
    }

    public String getDistUnitCd() {
        return distUnitCd;
    }

    public void setDistUnitCd(String distUnitCd) {
        this.distUnitCd = distUnitCd;
    }

    public int getRunDistVal() {
        return runDistVal;
    }

    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
    }

    public String getDiagStatCd() {
        return diagStatCd;
    }

    public void setDiagStatCd(String diagStatCd) {
        this.diagStatCd = diagStatCd;
    }

    public int getLastRunDistVal() {
        return lastRunDistVal;
    }

    public void setLastRunDistVal(int lastRunDistVal) {
        this.lastRunDistVal = lastRunDistVal;
    }

    public String getDiagDocNo() {
        return diagDocNo;
    }

    public void setDiagDocNo(String diagDocNo) {
        this.diagDocNo = diagDocNo;
    }

    public Date getPreChkDt() {
        return preChkDt;
    }

    public void setPreChkDt(Date preChkDt) {
        this.preChkDt = preChkDt;
    }

    public String getBaseRoNo() {
        return baseRoNo;
    }

    public void setBaseRoNo(String baseRoNo) {
        this.baseRoNo = baseRoNo;
    }

    public String getIncReqNo() {
        return incReqNo;
    }

    public void setIncReqNo(String incReqNo) {
        this.incReqNo = incReqNo;
    }

    public Date getIncReqDt() {
        return incReqDt;
    }

    public void setIncReqDt(Date incReqDt) {
        this.incReqDt = incReqDt;
    }

    public String getCustWaitMthCd() {
        return custWaitMthCd;
    }

    public void setCustWaitMthCd(String custWaitMthCd) {
        this.custWaitMthCd = custWaitMthCd;
    }

    public String getCustWaitMthNm() {
        return custWaitMthNm;
    }

    public void setCustWaitMthNm(String custWaitMthNm) {
        this.custWaitMthNm = custWaitMthNm;
    }

    public String getAtqProcTp() {
        return atqProcTp;
    }

    public void setAtqProcTp(String atqProcTp) {
        this.atqProcTp = atqProcTp;
    }

    public String getAtqProcTpNm() {
        return atqProcTpNm;
    }

    public void setAtqProcTpNm(String atqProcTpNm) {
        this.atqProcTpNm = atqProcTpNm;
    }

    public String getCarWashTp() {
        return carWashTp;
    }

    public void setCarWashTp(String carWashTp) {
        this.carWashTp = carWashTp;
    }

    public String getCarWashTpNm() {
        return carWashTpNm;
    }

    public void setCarWashTpNm(String carWashTpNm) {
        this.carWashTpNm = carWashTpNm;
    }

    public String getCarDriveReqTp() {
        return carDriveReqTp;
    }

    public void setCarDriveReqTp(String carDriveReqTp) {
        this.carDriveReqTp = carDriveReqTp;
    }

    public String getCarDriveReqTpNm() {
        return carDriveReqTpNm;
    }

    public void setCarDriveReqTpNm(String carDriveReqTpNm) {
        this.carDriveReqTpNm = carDriveReqTpNm;
    }

    public Date getExpcDlStartDt() {
        return expcDlStartDt;
    }

    public void setExpcDlStartDt(Date expcDlStartDt) {
        this.expcDlStartDt = expcDlStartDt;
    }

    public Date getExpcDlDt() {
        return expcDlDt;
    }

    public void setExpcDlDt(Date expcDlDt) {
        this.expcDlDt = expcDlDt;
    }

    public String getRoEndYn() {
        return roEndYn;
    }

    public void setRoEndYn(String roEndYn) {
        this.roEndYn = roEndYn;
    }

    public String getAtqProcYn() {
        return atqProcYn;
    }

    public void setAtqProcYn(String atqProcYn) {
        this.atqProcYn = atqProcYn;
    }

    public String getCarWashYn() {
        return carWashYn;
    }

    public void setCarWashYn(String carWashYn) {
        this.carWashYn = carWashYn;
    }

    public String getSerTagYn() {
        return serTagYn;
    }

    public void setSerTagYn(String serTagYn) {
        this.serTagYn = serTagYn;
    }

    public Date getVsitCarReceiveDt() {
        return vsitCarReceiveDt;
    }

    public void setVsitCarReceiveDt(Date vsitCarReceiveDt) {
        this.vsitCarReceiveDt = vsitCarReceiveDt;
    }

    public String getVsitCarReceiveIfNm() {
        return vsitCarReceiveIfNm;
    }

    public void setVsitCarReceiveIfNm(String vsitCarReceiveIfNm) {
        this.vsitCarReceiveIfNm = vsitCarReceiveIfNm;
    }

    public String getVsitCarReceiveCinoNo() {
        return vsitCarReceiveCinoNo;
    }

    public void setVsitCarReceiveCinoNo(String vsitCarReceiveCinoNo) {
        this.vsitCarReceiveCinoNo = vsitCarReceiveCinoNo;
    }

    public String getVsitCarReceiveAddrNm() {
        return vsitCarReceiveAddrNm;
    }

    public void setVsitCarReceiveAddrNm(String vsitCarReceiveAddrNm) {
        this.vsitCarReceiveAddrNm = vsitCarReceiveAddrNm;
    }

    public Date getCarReceiveDt() {
        return carReceiveDt;
    }

    public void setCarReceiveDt(Date carReceiveDt) {
        this.carReceiveDt = carReceiveDt;
    }

    public String getVsitDlIfNm() {
        return vsitDlIfNm;
    }

    public void setVsitDlIfNm(String vsitDlIfNm) {
        this.vsitDlIfNm = vsitDlIfNm;
    }

    public String getVsitDlCinoNo() {
        return vsitDlCinoNo;
    }

    public void setVsitDlCinoNo(String vsitDlCinoNo) {
        this.vsitDlCinoNo = vsitDlCinoNo;
    }

    public String getVsitDlAddrNm() {
        return vsitDlAddrNm;
    }

    public void setVsitDlAddrNm(String vsitDlAddrNm) {
        this.vsitDlAddrNm = vsitDlAddrNm;
    }

    public Date getVsitDt() {
        return vsitDt;
    }

    public void setVsitDt(Date vsitDt) {
        this.vsitDt = vsitDt;
    }

    public String getVsitIfNm() {
        return vsitIfNm;
    }

    public void setVsitIfNm(String vsitIfNm) {
        this.vsitIfNm = vsitIfNm;
    }

    public String getVsitCinoNo() {
        return vsitCinoNo;
    }

    public void setVsitCinoNo(String vsitCinoNo) {
        this.vsitCinoNo = vsitCinoNo;
    }

    public String getVsitAddrNm() {
        return vsitAddrNm;
    }

    public void setVsitAddrNm(String vsitAddrNm) {
        this.vsitAddrNm = vsitAddrNm;
    }

    public String getRoStatCd() {
        return roStatCd;
    }

    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }

    public String getRoStatNm() {
        return roStatNm;
    }

    public void setRoStatNm(String roStatNm) {
        this.roStatNm = roStatNm;
    }

    public Date getRoDt() {
        return roDt;
    }

    public void setRoDt(Date roDt) {
        this.roDt = roDt;
    }

    public String getCarWashStatCd() {
        return carWashStatCd;
    }

    public void setCarWashStatCd(String carWashStatCd) {
        this.carWashStatCd = carWashStatCd;
    }

    public String getCarWashStatNm() {
        return carWashStatNm;
    }

    public void setCarWashStatNm(String carWashStatNm) {
        this.carWashStatNm = carWashStatNm;
    }

    public String getPaintStatCd() {
        return paintStatCd;
    }

    public void setPaintStatCd(String paintStatCd) {
        this.paintStatCd = paintStatCd;
    }

    public String getQtTestStatCd() {
        return qtTestStatCd;
    }

    public void setQtTestStatCd(String qtTestStatCd) {
        this.qtTestStatCd = qtTestStatCd;
    }

    public String getRoGrpNo() {
        return roGrpNo;
    }

    public void setRoGrpNo(String roGrpNo) {
        this.roGrpNo = roGrpNo;
    }

    public int getPaintQty() {
        return paintQty;
    }

    public void setPaintQty(int paintQty) {
        this.paintQty = paintQty;
    }

    public String getPaintColorCd() {
        return paintColorCd;
    }

    public void setPaintColorCd(String paintColorCd) {
        this.paintColorCd = paintColorCd;
    }

    public String getCarColorCd() {
        return carColorCd;
    }

    public void setCarColorCd(String carColorCd) {
        this.carColorCd = carColorCd;
    }

    public String getPaintTp() {
        return paintTp;
    }

    public void setPaintTp(String paintTp) {
        this.paintTp = paintTp;
    }

    public Date getRoStartDt() {
        return roStartDt;
    }

    public void setRoStartDt(Date roStartDt) {
        this.roStartDt = roStartDt;
    }

    public Date getRoEndDt() {
        return roEndDt;
    }

    public void setRoEndDt(Date roEndDt) {
        this.roEndDt = roEndDt;
    }

    public String getRoRemark() {
        return roRemark;
    }

    public void setRoRemark(String roRemark) {
        this.roRemark = roRemark;
    }

    public String getAllocStatCd() {
        return allocStatCd;
    }

    public void setAllocStatCd(String allocStatCd) {
        this.allocStatCd = allocStatCd;
    }

    public String getWrkStatCd() {
        return wrkStatCd;
    }

    public void setWrkStatCd(String wrkStatCd) {
        this.wrkStatCd = wrkStatCd;
    }

    public String getWrkStatNm() {
        return wrkStatNm;
    }

    public void setWrkStatNm(String wrkStatNm) {
        this.wrkStatNm = wrkStatNm;
    }

    public String getDlStatCd() {
        return dlStatCd;
    }

    public void setDlStatCd(String dlStatCd) {
        this.dlStatCd = dlStatCd;
    }

    public String getQtTestMthCd() {
        return qtTestMthCd;
    }

    public void setQtTestMthCd(String qtTestMthCd) {
        this.qtTestMthCd = qtTestMthCd;
    }

    public String getQtTestMthNm() {
        return qtTestMthNm;
    }

    public void setQtTestMthNm(String qtTestMthNm) {
        this.qtTestMthNm = qtTestMthNm;
    }

    public Date getChgExpcDlDt() {
        return chgExpcDlDt;
    }

    public void setChgExpcDlDt(Date chgExpcDlDt) {
        this.chgExpcDlDt = chgExpcDlDt;
    }

    public String getCauCd1() {
        return cauCd1;
    }

    public void setCauCd1(String cauCd1) {
        this.cauCd1 = cauCd1;
    }

    public String getCauNm1() {
        return cauNm1;
    }

    public void setCauNm1(String cauNm1) {
        this.cauNm1 = cauNm1;
    }

    public String getPhenCd1() {
        return phenCd1;
    }

    public void setPhenCd1(String phenCd1) {
        this.phenCd1 = phenCd1;
    }

    public String getPhenNm1() {
        return phenNm1;
    }

    public void setPhenNm1(String phenNm1) {
        this.phenNm1 = phenNm1;
    }

    public String getCauCd2() {
        return cauCd2;
    }

    public void setCauCd2(String cauCd2) {
        this.cauCd2 = cauCd2;
    }

    public String getCauNm2() {
        return cauNm2;
    }

    public void setCauNm2(String cauNm2) {
        this.cauNm2 = cauNm2;
    }

    public String getPhenCd2() {
        return phenCd2;
    }

    public void setPhenCd2(String phenCd2) {
        this.phenCd2 = phenCd2;
    }

    public String getPhenNm2() {
        return phenNm2;
    }

    public void setPhenNm2(String phenNm2) {
        this.phenNm2 = phenNm2;
    }

    public String getCarWashPrsnNm() {
        return carWashPrsnNm;
    }

    public void setCarWashPrsnNm(String carWashPrsnNm) {
        this.carWashPrsnNm = carWashPrsnNm;
    }

    public String getCarWashPrsnCd() {
        return carWashPrsnCd;
    }

    public void setCarWashPrsnCd(String carWashPrsnCd) {
        this.carWashPrsnCd = carWashPrsnCd;
    }

    public Date getCarWashStartDt() {
        return carWashStartDt;
    }

    public void setCarWashStartDt(Date carWashStartDt) {
        this.carWashStartDt = carWashStartDt;
    }

    public Date getCarWashEndDt() {
        return carWashEndDt;
    }

    public void setCarWashEndDt(Date carWashEndDt) {
        this.carWashEndDt = carWashEndDt;
    }

    public Date getCarWashCancDt() {
        return carWashCancDt;
    }

    public void setCarWashCancDt(Date carWashCancDt) {
        this.carWashCancDt = carWashCancDt;
    }

    public String getQtTestPrsnNm() {
        return qtTestPrsnNm;
    }

    public void setQtTestPrsnNm(String qtTestPrsnNm) {
        this.qtTestPrsnNm = qtTestPrsnNm;
    }

    public String getQtTestPrsnCd() {
        return qtTestPrsnCd;
    }

    public void setQtTestPrsnCd(String qtTestPrsnCd) {
        this.qtTestPrsnCd = qtTestPrsnCd;
    }

    public Date getQtTestStartDt() {
        return qtTestStartDt;
    }

    public void setQtTestStartDt(Date qtTestStartDt) {
        this.qtTestStartDt = qtTestStartDt;
    }

    public Date getQtTestEndDt() {
        return qtTestEndDt;
    }

    public void setQtTestEndDt(Date qtTestEndDt) {
        this.qtTestEndDt = qtTestEndDt;
    }

    public String getBpNo() {
        return bpNo;
    }

    public void setBpNo(String bpNo) {
        this.bpNo = bpNo;
    }

    public String getRwrkCd() {
        return rwrkCd;
    }

    public void setRwrkCd(String rwrkCd) {
        this.rwrkCd = rwrkCd;
    }

    public String getRwrkRemark() {
        return rwrkRemark;
    }

    public void setRwrkRemark(String rwrkRemark) {
        this.rwrkRemark = rwrkRemark;
    }

    public String getRoEndChkYn() {
        return roEndChkYn;
    }

    public void setRoEndChkYn(String roEndChkYn) {
        this.roEndChkYn = roEndChkYn;
    }

    public String getAtqProcChkYn() {
        return atqProcChkYn;
    }

    public void setAtqProcChkYn(String atqProcChkYn) {
        this.atqProcChkYn = atqProcChkYn;
    }

    public String getQtChkYn() {
        return qtChkYn;
    }

    public void setQtChkYn(String qtChkYn) {
        this.qtChkYn = qtChkYn;
    }

    public String getCarWashChkYn() {
        return carWashChkYn;
    }

    public void setCarWashChkYn(String carWashChkYn) {
        this.carWashChkYn = carWashChkYn;
    }

    public String getSerTagChkYn() {
        return serTagChkYn;
    }

    public void setSerTagChkYn(String serTagChkYn) {
        this.serTagChkYn = serTagChkYn;
    }

    public String getDlChkPrsnCd() {
        return dlChkPrsnCd;
    }

    public void setDlChkPrsnCd(String dlChkPrsnCd) {
        this.dlChkPrsnCd = dlChkPrsnCd;
    }

    public String getDlChkPrsnNm() {
        return dlChkPrsnNm;
    }

    public void setDlChkPrsnNm(String dlChkPrsnNm) {
        this.dlChkPrsnNm = dlChkPrsnNm;
    }

    public double getGiRunDistVal() {
        return giRunDistVal;
    }

    public void setGiRunDistVal(double giRunDistVal) {
        this.giRunDistVal = giRunDistVal;
    }

    public String getGiRunDistValText() {
        return giRunDistValText;
    }

    public void setGiRunDistValText(String giRunDistValText) {
        this.giRunDistValText = giRunDistValText;
    }

    public String getPaymTp() {
        return paymTp;
    }

    public void setPaymTp(String paymTp) {
        this.paymTp = paymTp;
    }

    public String getPaymUsrCd() {
        return paymUsrCd;
    }

    public void setPaymUsrCd(String paymUsrCd) {
        this.paymUsrCd = paymUsrCd;
    }

    public String getPaymUsrNm() {
        return paymUsrNm;
    }

    public void setPaymUsrNm(String paymUsrNm) {
        this.paymUsrNm = paymUsrNm;
    }

    public String getCalcDocNo() {
        return calcDocNo;
    }

    public void setCalcDocNo(String calcDocNo) {
        this.calcDocNo = calcDocNo;
    }

    public Double getLastCalcTotAmt() {
        return lastCalcTotAmt;
    }

    public void setLastCalcTotAmt(Double lastCalcTotAmt) {
        this.lastCalcTotAmt = lastCalcTotAmt;
    }

    public Double getPreAmt() {
        return preAmt;
    }

    public void setPreAmt(Double preAmt) {
        this.preAmt = preAmt;
    }

    public String getNextFreeMonth() {
        return nextFreeMonth;
    }

    public void setNextFreeMonth(String nextFreeMonth) {
        this.nextFreeMonth = nextFreeMonth;
    }

    public String getNextFreeRunDistVal() {
        return nextFreeRunDistVal;
    }

    public void setNextFreeRunDistVal(String nextFreeRunDistVal) {
        this.nextFreeRunDistVal = nextFreeRunDistVal;
    }

    public String getLtsModelCd() {
        return ltsModelCd;
    }

    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }

    public String getCarlineNm() {
        return carlineNm;
    }

    public void setCarlineNm(String carlineNm) {
        this.carlineNm = carlineNm;
    }

    public String getModelNm() {
        return modelNm;
    }

    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    public String getRegUsrNm() {
        return regUsrNm;
    }

    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    public String getUpdtUsrNm() {
        return updtUsrNm;
    }

    public void setUpdtUsrNm(String updtUsrNm) {
        this.updtUsrNm = updtUsrNm;
    }

    public String getRoCancNm() {
        return roCancNm;
    }

    public void setRoCancNm(String roCancNm) {
        this.roCancNm = roCancNm;
    }

    public Date getRoCancDt() {
        return roCancDt;
    }

    public void setRoCancDt(Date roCancDt) {
        this.roCancDt = roCancDt;
    }

    public Double getBmPointUseAmt() {
        return bmPointUseAmt;
    }

    public void setBmPointUseAmt(Double bmPointUseAmt) {
        this.bmPointUseAmt = bmPointUseAmt;
    }

    public Double getBmCupnUseAmt() {
        return bmCupnUseAmt;
    }

    public void setBmCupnUseAmt(Double bmCupnUseAmt) {
        this.bmCupnUseAmt = bmCupnUseAmt;
    }

    public Double getPointUseAmt() {
        return pointUseAmt;
    }

    public void setPointUseAmt(Double pointUseAmt) {
        this.pointUseAmt = pointUseAmt;
    }

    public Double getCalcParAmt() {
        return calcParAmt;
    }

    public void setCalcParAmt(Double calcParAmt) {
        this.calcParAmt = calcParAmt;
    }

    public Double getCalcLbrAmt() {
        return calcLbrAmt;
    }

    public void setCalcLbrAmt(Double calcLbrAmt) {
        this.calcLbrAmt = calcLbrAmt;
    }

    public Double getCalcEtcAmt() {
        return calcEtcAmt;
    }

    public void setCalcEtcAmt(Double calcEtcAmt) {
        this.calcEtcAmt = calcEtcAmt;
    }

    public Double getCalcDcAmt() {
        return calcDcAmt;
    }

    public void setCalcDcAmt(Double calcDcAmt) {
        this.calcDcAmt = calcDcAmt;
    }

    public Double getCalcEtcDcAmt() {
        return calcEtcDcAmt;
    }

    public void setCalcEtcDcAmt(Double calcEtcDcAmt) {
        this.calcEtcDcAmt = calcEtcDcAmt;
    }

    public Double getCalcSumAmt() {
        return calcSumAmt;
    }

    public void setCalcSumAmt(Double calcSumAmt) {
        this.calcSumAmt = calcSumAmt;
    }

    public Date getCalcDt() {
        return calcDt;
    }

    public void setCalcDt(Date calcDt) {
        this.calcDt = calcDt;
    }

    public String getCalcPrsnNm() {
        return calcPrsnNm;
    }

    public void setCalcPrsnNm(String calcPrsnNm) {
        this.calcPrsnNm = calcPrsnNm;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getPauseCauCd() {
        return pauseCauCd;
    }

    public void setPauseCauCd(String pauseCauCd) {
        this.pauseCauCd = pauseCauCd;
    }

    public String getSearchGubun() {
        return searchGubun;
    }

    public void setSearchGubun(String searchGubun) {
        this.searchGubun = searchGubun;
    }

    public String getGoodwillYn() {
        return goodwillYn;
    }

    public void setGoodwillYn(String goodwillYn) {
        this.goodwillYn = goodwillYn;
    }

    public String getGoodwillYnNm() {
        return goodwillYnNm;
    }

    public void setGoodwillYnNm(String goodwillYnNm) {
        this.goodwillYnNm = goodwillYnNm;
    }

    public String getGoodwillStatCd() {
        return goodwillStatCd;
    }

    public void setGoodwillStatCd(String goodwillStatCd) {
        this.goodwillStatCd = goodwillStatCd;
    }

    public String getCarWashCancPrsnNm() {
        return carWashCancPrsnNm;
    }

    public void setCarWashCancPrsnNm(String carWashCancPrsnNm) {
        this.carWashCancPrsnNm = carWashCancPrsnNm;
    }

    public String getCarWashCancPrsnCd() {
        return carWashCancPrsnCd;
    }

    public void setCarWashCancPrsnCd(String carWashCancPrsnCd) {
        this.carWashCancPrsnCd = carWashCancPrsnCd;
    }

    public String getCarWashCancReasonCd() {
        return carWashCancReasonCd;
    }

    public void setCarWashCancReasonCd(String carWashCancReasonCd) {
        this.carWashCancReasonCd = carWashCancReasonCd;
    }

    public String getCarWashCancReasonCont() {
        return carWashCancReasonCont;
    }

    public void setCarWashCancReasonCont(String carWashCancReasonCont) {
        this.carWashCancReasonCont = carWashCancReasonCont;
    }

    public String getDlrRoTp() {
        return dlrRoTp;
    }

    public void setDlrRoTp(String dlrRoTp) {
        this.dlrRoTp = dlrRoTp;
    }

    public String getDlrRoTpNm() {
        return dlrRoTpNm;
    }

    public void setDlrRoTpNm(String dlrRoTpNm) {
        this.dlrRoTpNm = dlrRoTpNm;
    }

    public String getPrintYn() {
        return printYn;
    }

    public void setPrintYn(String printYn) {
        this.printYn = printYn;
    }

    public Date getDlChkDt() {
        return dlChkDt;
    }

    public void setDlChkDt(Date dlChkDt) {
        this.dlChkDt = dlChkDt;
    }

    public Date getRoPrintDt() {
        return roPrintDt;
    }

    public void setRoPrintDt(Date roPrintDt) {
        this.roPrintDt = roPrintDt;
    }

    public String getGrpNo() {
        return grpNo;
    }

    public void setGrpNo(String grpNo) {
        this.grpNo = grpNo;
    }

    public Date getDlDt() {
        return dlDt;
    }

    public void setDlDt(Date dlDt) {
        this.dlDt = dlDt;
    }

    public Double getLbrDcAmt() {
        return lbrDcAmt;
    }

    public void setLbrDcAmt(Double lbrDcAmt) {
        this.lbrDcAmt = lbrDcAmt;
    }

    public Double getParDcAmt() {
        return parDcAmt;
    }

    public void setParDcAmt(Double parDcAmt) {
        this.parDcAmt = parDcAmt;
    }

    public String getPaidYn() {
        return paidYn;
    }

    public void setPaidYn(String paidYn) {
        this.paidYn = paidYn;
    }

    public String getPaidYnNm() {
        return paidYnNm;
    }

    public void setPaidYnNm(String paidYnNm) {
        this.paidYnNm = paidYnNm;
    }

    public Double getDstbHm() {
        return dstbHm;
    }

    public void setDstbHm(Double dstbHm) {
        this.dstbHm = dstbHm;
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

    public String getLbrCd() {
        return lbrCd;
    }

    public void setLbrCd(String lbrCd) {
        this.lbrCd = lbrCd;
    }

    public String getLbrNm() {
        return lbrNm;
    }

    public void setLbrNm(String lbrNm) {
        this.lbrNm = lbrNm;
    }

    public String getLbrTp() {
        return lbrTp;
    }

    public void setLbrTp(String lbrTp) {
        this.lbrTp = lbrTp;
    }

    public String getLbrTpNm() {
        return lbrTpNm;
    }

    public void setLbrTpNm(String lbrTpNm) {
        this.lbrTpNm = lbrTpNm;
    }

    /**
     * @return the wkgrpNm
     */
    public String getWkgrpNm() {
        return wkgrpNm;
    }

    /**
     * @param wkgrpNm the wkgrpNm to set
     */
    public void setWkgrpNm(String wkgrpNm) {
        this.wkgrpNm = wkgrpNm;
    }

    /**
     * @return the serCnt
     */
    public int getSerCnt() {
        return serCnt;
    }

    /**
     * @param serCnt the serCnt to set
     */
    public void setSerCnt(int serCnt) {
        this.serCnt = serCnt;
    }

    /**
     * @return the diffVal
     */
    public int getDiffVal() {
        return diffVal;
    }

    /**
     * @param diffVal the diffVal to set
     */
    public void setDiffVal(int diffVal) {
        this.diffVal = diffVal;
    }

    /**
     * @return the bayNm
     */
    public String getBayNm() {
        return bayNm;
    }

    /**
     * @param bayNm the bayNm to set
     */
    public void setBayNm(String bayNm) {
        this.bayNm = bayNm;
    }

    /**
     * @return the lbrHm
     */
    public Double getLbrHm() {
        return lbrHm;
    }

    /**
     * @param lbrHm the lbrHm to set
     */
    public void setLbrHm(Double lbrHm) {
        this.lbrHm = lbrHm;
    }

    /**
     * @return the calcRemark
     */
    public String getCalcRemark() {
        return calcRemark;
    }

    /**
     * @param calcRemark the calcRemark to set
     */
    public void setCalcRemark(String calcRemark) {
        this.calcRemark = calcRemark;
    }

    /**
     * @return the pdiYn
     */
    public String getPdiYn() {
        return pdiYn;
    }

    /**
     * @param pdiYn the pdiYn to set
     */
    public void setPdiYn(String pdiYn) {
        this.pdiYn = pdiYn;
    }

    /**
     * @return the subBpCd
     */
    public String getSubBpCd() {
        return subBpCd;
    }

    /**
     * @param subBpCd the subBpCd to set
     */
    public void setSubBpCd(String subBpCd) {
        this.subBpCd = subBpCd;
    }

    /**
     * @return the subBpNm
     */
    public String getSubBpNm() {
        return subBpNm;
    }

    /**
     * @param subBpNm the subBpNm to set
     */
    public void setSubBpNm(String subBpNm) {
        this.subBpNm = subBpNm;
    }

    /**
     * @return the allocStatNm
     */
    public String getAllocStatNm() {
        return allocStatNm;
    }

    /**
     * @param allocStatNm the allocStatNm to set
     */
    public void setAllocStatNm(String allocStatNm) {
        this.allocStatNm = allocStatNm;
    }

    /**
     * @return the wrkStartDt
     */
    public Date getWrkStartDt() {
        return wrkStartDt;
    }

    /**
     * @param wrkStartDt the wrkStartDt to set
     */
    public void setWrkStartDt(Date wrkStartDt) {
        this.wrkStartDt = wrkStartDt;
    }

    /**
     * @return the wrkEndDt
     */
    public Date getWrkEndDt() {
        return wrkEndDt;
    }

    /**
     * @param wrkEndDt the wrkEndDt to set
     */
    public void setWrkEndDt(Date wrkEndDt) {
        this.wrkEndDt = wrkEndDt;
    }

    /**
     * @return the allocStartDt
     */
    public Date getAllocStartDt() {
        return allocStartDt;
    }

    /**
     * @param allocStartDt the allocStartDt to set
     */
    public void setAllocStartDt(Date allocStartDt) {
        this.allocStartDt = allocStartDt;
    }

    /**
     * @return the allocEndDt
     */
    public Date getAllocEndDt() {
        return allocEndDt;
    }

    /**
     * @param allocEndDt the allocEndDt to set
     */
    public void setAllocEndDt(Date allocEndDt) {
        this.allocEndDt = allocEndDt;
    }

    /**
     * @return the qtTestStatNm
     */
    public String getQtTestStatNm() {
        return qtTestStatNm;
    }

    /**
     * @param qtTestStatNm the qtTestStatNm to set
     */
    public void setQtTestStatNm(String qtTestStatNm) {
        this.qtTestStatNm = qtTestStatNm;
    }

    /**
     * @return the dlStatNm
     */
    public String getDlStatNm() {
        return dlStatNm;
    }

    /**
     * @param dlStatNm the dlStatNm to set
     */
    public void setDlStatNm(String dlStatNm) {
        this.dlStatNm = dlStatNm;
    }

    /**
     * @return the cancelType
     */
    public String getCancelType() {
        return cancelType;
    }

    /**
     * @param cancelType the cancelType to set
     */
    public void setCancelType(String cancelType) {
        this.cancelType = cancelType;
    }

    /**
     * @return the calcRegDt
     */
    public Date getCalcRegDt() {
        return calcRegDt;
    }

    /**
     * @param calcRegDt the calcRegDt to set
     */
    public void setCalcRegDt(Date calcRegDt) {
        this.calcRegDt = calcRegDt;
    }

    /**
     * @return the calcCompUsrNm
     */
    public String getCalcCompUsrNm() {
        return calcCompUsrNm;
    }

    /**
     * @param calcCompUsrNm the calcCompUsrNm to set
     */
    public void setCalcCompUsrNm(String calcCompUsrNm) {
        this.calcCompUsrNm = calcCompUsrNm;
    }

    /**
     * @return the paymYnNm
     */
    public String getPaymYnNm() {
        return paymYnNm;
    }

    /**
     * @param paymYnNm the paymYnNm to set
     */
    public void setPaymYnNm(String paymYnNm) {
        this.paymYnNm = paymYnNm;
    }

    /**
     * @return the wonUnitCutAmt
     */
    public Double getWonUnitCutAmt() {
        return wonUnitCutAmt;
    }

    /**
     * @param wonUnitCutAmt the wonUnitCutAmt to set
     */
    public void setWonUnitCutAmt(Double wonUnitCutAmt) {
        this.wonUnitCutAmt = wonUnitCutAmt;
    }

    /**
     * @return the demicPointCutAmt
     */
    public Double getDemicPointCutAmt() {
        return demicPointCutAmt;
    }

    /**
     * @param demicPointCutAmt the demicPointCutAmt to set
     */
    public void setDemicPointCutAmt(Double demicPointCutAmt) {
        this.demicPointCutAmt = demicPointCutAmt;
    }

    /**
     * @return the paymAmt
     */
    public Double getPaymAmt() {
        return paymAmt;
    }

    /**
     * @param paymAmt the paymAmt to set
     */
    public void setPaymAmt(Double paymAmt) {
        this.paymAmt = paymAmt;
    }

    /**
     * @return the npayAmt
     */
    public Double getNpayAmt() {
        return npayAmt;
    }

    /**
     * @param npayAmt the npayAmt to set
     */
    public void setNpayAmt(Double npayAmt) {
        this.npayAmt = npayAmt;
    }

    /**
     * @return the rcvAmt
     */
    public Double getRcvAmt() {
        return rcvAmt;
    }

    /**
     * @param rcvAmt the rcvAmt to set
     */
    public void setRcvAmt(Double rcvAmt) {
        this.rcvAmt = rcvAmt;
    }

    /**
     * @return the resvYn
     */
    public String getResvYn() {
        return resvYn;
    }

    /**
     * @param resvYn the resvYn to set
     */
    public void setResvYn(String resvYn) {
        this.resvYn = resvYn;
    }

    /**
     * @return the resvYnNm
     */
    public String getResvYnNm() {
        return resvYnNm;
    }

    /**
     * @param resvYnNm the resvYnNm to set
     */
    public void setResvYnNm(String resvYnNm) {
        this.resvYnNm = resvYnNm;
    }

    /**
     * @return the expcChkDt
     */
    public Date getExpcChkDt() {
        return expcChkDt;
    }

    /**
     * @param expcChkDt the expcChkDt to set
     */
    public void setExpcChkDt(Date expcChkDt) {
        this.expcChkDt = expcChkDt;
    }

    /**
     * @return the expcChkRunDistVal
     */
    public int getExpcChkRunDistVal() {
        return expcChkRunDistVal;
    }

    /**
     * @param expcChkRunDistVal the expcChkRunDistVal to set
     */
    public void setExpcChkRunDistVal(int expcChkRunDistVal) {
        this.expcChkRunDistVal = expcChkRunDistVal;
    }

    /**
     * @return the itemReqStatCd
     */
    public String getItemReqStatCd() {
        return itemReqStatCd;
    }

    /**
     * @param itemReqStatCd the itemReqStatCd to set
     */
    public void setItemReqStatCd(String itemReqStatCd) {
        this.itemReqStatCd = itemReqStatCd;
    }

    /**
     * @return the custReqCd
     */
    public String getCustReqCd() {
        return custReqCd;
    }

    /**
     * @param custReqCd the custReqCd to set
     */
    public void setCustReqCd(String custReqCd) {
        this.custReqCd = custReqCd;
    }

    /**
     * @return the custReqCont
     */
    public String getCustReqCont() {
        return custReqCont;
    }

    /**
     * @param custReqCont the custReqCont to set
     */
    public void setCustReqCont(String custReqCont) {
        this.custReqCont = custReqCont;
    }

    /**
     * @param etcTpCd the etcTpCd to set
     */
    public void setEtcTpCd(String etcTpCd) {
        this.etcTpCd = etcTpCd;
    }

    /**
     * @return the etcTpCd
     */
    public String getEtcTpCd() {
        return etcTpCd;
    }

    /**
     * @param etcTpNm the etcTpNm to set
     */
    public void setEtcTpNm(String etcTpNm) {
        this.etcTpNm = etcTpNm;
    }

    /**
     * @return the etcTpNm
     */
    public String getEtcTpNm() {
        return etcTpNm;
    }

    /**
     * @param etcReqPrc the etcReqPrc to set
     */
    public void setEtcReqPrc(String etcReqPrc) {
        this.etcReqPrc = etcReqPrc;
    }

    /**
     * @return the etcReqPrc
     */
    public String getEtcReqPrc() {
        return etcReqPrc;
    }

    /**
     * @return the lbrPrc
     */
    public Double getLbrPrc() {
        return lbrPrc;
    }

    /**
     * @param lbrPrc the lbrPrc to set
     */
    public void setLbrPrc(Double lbrPrc) {
        this.lbrPrc = lbrPrc;
    }

    /**
     * @return the lbrDcRate
     */
    public Double getLbrDcRate() {
        return lbrDcRate;
    }

    /**
     * @param lbrDcRate the lbrDcRate to set
     */
    public void setLbrDcRate(Double lbrDcRate) {
        this.lbrDcRate = lbrDcRate;
    }

    /**
     * @return the lbrTotAmt
     */
    public Double getLbrTotAmt() {
        return lbrTotAmt;
    }

    /**
     * @param lbrTotAmt the lbrTotAmt to set
     */
    public void setLbrTotAmt(Double lbrTotAmt) {
        this.lbrTotAmt = lbrTotAmt;
    }

    /**
     * @return the paintStatNm
     */
    public String getPaintStatNm() {
        return paintStatNm;
    }

    /**
     * @param paintStatNm the paintStatNm to set
     */
    public void setPaintStatNm(String paintStatNm) {
        this.paintStatNm = paintStatNm;
    }

    /**
     * @return the wkgrpNo
     */
    public String getWkgrpNo() {
        return wkgrpNo;
    }

    /**
     * @param wkgrpNo the wkgrpNo to set
     */
    public void setWkgrpNo(String wkgrpNo) {
        this.wkgrpNo = wkgrpNo;
    }

    /**
     * @return the exptStartDt
     */
    public Date getExptStartDt() {
        return exptStartDt;
    }

    /**
     * @param exptStartDt the exptStartDt to set
     */
    public void setExptStartDt(Date exptStartDt) {
        this.exptStartDt = exptStartDt;
    }

    /**
     * @return the exptEndDt
     */
    public Date getExptEndDt() {
        return exptEndDt;
    }

    /**
     * @param exptEndDt the exptEndDt to set
     */
    public void setExptEndDt(Date exptEndDt) {
        this.exptEndDt = exptEndDt;
    }

    /**
     * @return the allocRemark
     */
    public String getAllocRemark() {
        return allocRemark;
    }

    /**
     * @param allocRemark the allocRemark to set
     */
    public void setAllocRemark(String allocRemark) {
        this.allocRemark = allocRemark;
    }

    /**
     * @return the pauseCauRmk
     */
    public String getPauseCauRmk() {
        return pauseCauRmk;
    }

    /**
     * @param pauseCauRmk the pauseCauRmk to set
     */
    public void setPauseCauRmk(String pauseCauRmk) {
        this.pauseCauRmk = pauseCauRmk;
    }

    /**
     * @return the crNo
     */
    public String getCrNo() {
        return crNo;
    }

    /**
     * @param crNo the crNo to set
     */
    public void setCrNo(String crNo) {
        this.crNo = crNo;
    }

    /**
     * @return the crTp
     */
    public String getCrTp() {
        return crTp;
    }

    /**
     * @param crTp the crTp to set
     */
    public void setCrTp(String crTp) {
        this.crTp = crTp;
    }

    /**
     * @return the crNm
     */
    public String getCrNm() {
        return crNm;
    }

    /**
     * @param crNm the crNm to set
     */
    public void setCrNm(String crNm) {
        this.crNm = crNm;
    }

    /**
     * @param allocReadyTime the allocReadyTime to set
     */
    public void setAllocReadyTime(Double allocReadyTime) {
        this.allocReadyTime = allocReadyTime;
    }

    /**
     * @return the allocReadyTime
     */
    public Double getAllocReadyTime() {
        return allocReadyTime;
    }

    /**
     * @param allocUseTime the allocUseTime to set
     */
    public void setAllocUseTime(Double allocUseTime) {
        this.allocUseTime = allocUseTime;
    }

    /**
     * @return the allocUseTime
     */
    public Double getAllocUseTime() {
        return allocUseTime;
    }

    /**
     * @param crTpNm the crTpNm to set
     */
    public void setCrTpNm(String crTpNm) {
        this.crTpNm = crTpNm;
    }

    /**
     * @return the crTpNm
     */
    public String getCrTpNm() {
        return crTpNm;
    }

    /**
     * @param rpirReadyTime the rpirReadyTime to set
     */
    public void setRpirReadyTime(Double rpirReadyTime) {
        this.rpirReadyTime = rpirReadyTime;
    }

    /**
     * @return the rpirReadyTime
     */
    public Double getRpirReadyTime() {
        return rpirReadyTime;
    }

    /**
     * @param rpirTime the rpirTime to set
     */
    public void setRpirTime(Double rpirTime) {
        this.rpirTime = rpirTime;
    }

    /**
     * @return the rpirTime
     */
    public Double getRpirTime() {
        return rpirTime;
    }

    /**
     * @param rpirSerTime the rpirSerTime to set
     */
    public void setRpirSerTime(Double rpirSerTime) {
        this.rpirSerTime = rpirSerTime;
    }

    /**
     * @return the rpirSerTime
     */
    public Double getRpirSerTime() {
        return rpirSerTime;
    }

    /**
     * @param qtTestReadyTime the qtTestReadyTime to set
     */
    public void setQtTestReadyTime(Double qtTestReadyTime) {
        this.qtTestReadyTime = qtTestReadyTime;
    }

    /**
     * @return the qtTestReadyTime
     */
    public Double getQtTestReadyTime() {
        return qtTestReadyTime;
    }

    /**
     * @param qtTestTime the qtTestTime to set
     */
    public void setQtTestTime(Double qtTestTime) {
        this.qtTestTime = qtTestTime;
    }

    /**
     * @return the qtTestTime
     */
    public Double getQtTestTime() {
        return qtTestTime;
    }

    /**
     * @param onTimeStartYn the onTimeStartYn to set
     */
    public void setOnTimeStartYn(String onTimeStartYn) {
        this.onTimeStartYn = onTimeStartYn;
    }

    /**
     * @return the onTimeStartYn
     */
    public String getOnTimeStartYn() {
        return onTimeStartYn;
    }

    /**
     * @param onTimeEndYn the onTimeEndYn to set
     */
    public void setOnTimeEndYn(String onTimeEndYn) {
        this.onTimeEndYn = onTimeEndYn;
    }

    /**
     * @return the onTimeEndYn
     */
    public String getOnTimeEndYn() {
        return onTimeEndYn;
    }

    /**
     * @param delayStartYn the delayStartYn to set
     */
    public void setDelayStartYn(String delayStartYn) {
        this.delayStartYn = delayStartYn;
    }

    /**
     * @return the delayStartYn
     */
    public String getDelayStartYn() {
        return delayStartYn;
    }

    /**
     * @param delayEndYn the delayEndYn to set
     */
    public void setDelayEndYn(String delayEndYn) {
        this.delayEndYn = delayEndYn;
    }

    /**
     * @return the delayEndYn
     */
    public String getDelayEndYn() {
        return delayEndYn;
    }

    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }

    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }

    /**
     * @param firstRoYn the firstRoYn to set
     */
    public void setFirstRoYn(String firstRoYn) {
        this.firstRoYn = firstRoYn;
    }

    /**
     * @return the firstRoYn
     */
    public String getFirstRoYn() {
        return firstRoYn;
    }

    /**
     * @param firstRoYnNm the firstRoYnNm to set
     */
    public void setFirstRoYnNm(String firstRoYnNm) {
        this.firstRoYnNm = firstRoYnNm;
    }

    /**
     * @return the firstRoYnNm
     */
    public String getFirstRoYnNm() {
        return firstRoYnNm;
    }

    /**
     * @param freeRoYn the freeRoYn to set
     */
    public void setFreeRoYn(String freeRoYn) {
        this.freeRoYn = freeRoYn;
    }

    /**
     * @return the freeRoYn
     */
    public String getFreeRoYn() {
        return freeRoYn;
    }

    /**
     * @param freeRoYnNm the freeRoYnNm to set
     */
    public void setFreeRoYnNm(String freeRoYnNm) {
        this.freeRoYnNm = freeRoYnNm;
    }

    /**
     * @return the freeRoYnNm
     */
    public String getFreeRoYnNm() {
        return freeRoYnNm;
    }

    /**
     * @param rcvCpltDt the rcvCpltDt to set
     */
    public void setRcvCpltDt(Date rcvCpltDt) {
        this.rcvCpltDt = rcvCpltDt;
    }

    /**
     * @return the rcvCpltDt
     */
    public Date getRcvCpltDt() {
        return rcvCpltDt;
    }

    /**
     * @param payEndDt the payEndDt to set
     */
    public void setPayEndDt(Date payEndDt) {
        this.payEndDt = payEndDt;
    }

    /**
     * @return the payEndDt
     */
    public Date getPayEndDt() {
        return payEndDt;
    }

    /**
     * @return the ordDlrCd
     */
    public String getOrdDlrCd() {
        return ordDlrCd;
    }

    /**
     * @param ordDlrCd the ordDlrCd to set
     */
    public void setOrdDlrCd(String ordDlrCd) {
        this.ordDlrCd = ordDlrCd;
    }

    /**
     * @return the blueMembershipNo
     */
    public String getBlueMembershipNo() {
        return blueMembershipNo;
    }

    /**
     * @param blueMembershipNo the blueMembershipNo to set
     */
    public void setBlueMembershipNo(String blueMembershipNo) {
        this.blueMembershipNo = blueMembershipNo;
    }

    /**
     * @return the membershipNo
     */
    public String getMembershipNo() {
        return membershipNo;
    }

    /**
     * @param membershipNo the membershipNo to set
     */
    public void setMembershipNo(String membershipNo) {
        this.membershipNo = membershipNo;
    }

}