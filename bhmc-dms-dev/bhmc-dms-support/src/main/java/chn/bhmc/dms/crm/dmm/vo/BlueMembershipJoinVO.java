package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName : BlueMembershipJoinVO.java
 * @Description : 블루멤버십 가입신청 VO
 * @author Lee In Moon
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 *
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.     Lee In Moon     최초 생성
 * </pre>
 */

@ValidDescriptor({ @ValidField(field = "dlrCd", mesgKey = "CR_0807T.lbl.dlrCd"),
@ValidField(field = "custNo", mesgKey = "CR_0807T.lbl.custNo"),
@ValidField(field = "custNm", mesgKey = "CR_0807T.lbl.custNm"),
@ValidField(field = "custTp", mesgKey = "CR_0807T.lbl.custTp"),
@ValidField(field = "carOwnYn", mesgKey = "CR_0807T.lbl.carOwnYn"),
@ValidField(field = "hpNo", mesgKey = "CR_0807T.lbl.hpNo"),
@ValidField(field = "mathDocTp", mesgKey = "CR_0807T.lbl.mathDocTp"),
@ValidField(field = "ssnCrnNo", mesgKey = "CR_0807T.lbl.ssnCrnNo"),
@ValidField(field = "sungNm", mesgKey = "CR_0807T.lbl.sungNm"),
@ValidField(field = "cityNm", mesgKey = "CR_0807T.lbl.cityNm"),
@ValidField(field = "distNm", mesgKey = "CR_0807T.lbl.distNm"),
@ValidField(field = "zipCd", mesgKey = "CR_0807T.lbl.zipCd"),
@ValidField(field = "extZipCd", mesgKey = "CR_0807T.lbl.extZipCd"),
@ValidField(field = "addrNm", mesgKey = "CR_0807T.lbl.addrNm"),
@ValidField(field = "addrDetlCont", mesgKey = "CR_0807T.lbl.addrDetlCont"),
@ValidField(field = "joinDlrCd", mesgKey = "CR_0807T.lbl.joinDlrCd"),
@ValidField(field = "joinReqAgreeYn", mesgKey = "CR_0807T.lbl.joinReqAgreeYn"),
@ValidField(field = "policyAgreeYn", mesgKey = "CR_0807T.lbl.policyAgreeYn"),
@ValidField(field = "joinApproveYn", mesgKey = "CR_0807T.lbl.joinApproveYn"),
@ValidField(field = "joinApproveDt", mesgKey = "CR_0807T.lbl.joinApproveDt"),
@ValidField(field = "regUsrId", mesgKey = "CR_0807T.lbl.regUsrId"),
@ValidField(field = "regDt", mesgKey = "CR_0807T.lbl.regDt"),
@ValidField(field = "updtUsrId", mesgKey = "CR_0807T.lbl.updtUsrId"),
@ValidField(field = "updtDt", mesgKey = "CR_0807T.lbl.updtDt") })
public class BlueMembershipJoinVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8817130645475573968L;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 고객번호
     **/
    @NotEmpty
    private String custNo;

    /**
     * 고객명
     **/
    private String custNm;
    /**
     * 고객유형
     **/
    private String custTp;

    /**
     * 차량소유여부
     **/
    @NotEmpty
    private String carOwnYn;

    /**
     * 휴대폰번호
     **/
    private String hpNo;

    /**
     * 주요인증문서유형
     **/
    private String mathDocTp;

    /**
     * 주민사업자등록번호
     **/
    private String ssnCrnNo;

    /**
     * 성명
     **/
    private String sungNm;

    /**
     * 도시명
     **/
    private String cityNm;

    /**
     * 지역명
     **/
    private String distNm;

    /**
     * 우편번호
     **/
    private String zipCd;

    /**
     * 확장우편번호
     **/
    private String extZipCd;

    /**
     * 주소명
     **/
    private String addrNm;

    /**
     * 주소상세내용
     **/
    private String addrDetlCont;

    /**
     * 가입딜러코드
     **/
    private String joinDlrCd;

    /**
     * 가입요청동의여부
     **/
    @NotEmpty
    private String joinReqAgreeYn;

    /**
     * 정책동의여부
     **/
    @NotEmpty
    private String policyAgreeYn;

    /**
     * 가입승인여부
     **/
    @NotEmpty
    private String joinApproveYn;

    /**
     * 가입승인일자
     **/
    // JOIN_APPROVE_DT
    @JsonDeserialize(using = JsonDateDeserializer.class)
    private Date joinApproveDt;

    /**
     * 지불금액
     **/
    // PAY_AMT
    private int payAmt;

    private String blueGradeNm; // 블루멤버십 등급(crm806)
    private String blueGradeName;//蓝缤等级  缴费获取积分记录下载功能   贾明 2018-10-22
    private Date blueGradeChdDt; // 블루멤버십 등급변경일
    
    private String blueMember ;//蓝缤会员 BLUE_MEMBER CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载
    private String custTpNm ;//客户类型 CUST_TP_NM  CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载
    private String mathDocTpNm ; // 证件类型  MATH_DOC_TP_NM CRM_蓝缤入会管理_蓝缤入会履历 新增Excel 下载
   
    /*
     * 추가
     */
    private Date joinApproveDtForm;
    private Date regDtForm;
    private String modelNm;
    private Date blueMembershipJoinDtFormat;
    private String blueMembershipJoinDt;// 블루멤버쉽 가입일자
    private String blueMembershipJoinDlrCd;// 블루멤버십 가입딜러코드
    private String blueGradeChgDt;// 블루멤버십등급변경일자
    private String blueGradeChgNm;// 블루멤버십등급명
    private String blueAvlbPointVal;// 블루멤버십가용포인트값
    private String remark;// 비고

    // 인터페이스 파라미터용
    private String phoneNumber; // 휴대폰 번호
    private String paperWork; // 신분증 유형(신분증 =1, 여권=2, 군관증=3)
    private String identityNumber;// 신분증 번호
    private String dealerId;// 딜러 ID
    private String amount;// 지불 금액
    private String consumeType;// 소비 유형(0:사고차 수리(보통), 1:첫 정비, 2: 차량 구매, 3: 정기
                               // 정비, 8:판금 )
    private String consumePoints;// 소비 포인트 ( 적립인 경우 값을 0 )
    private String consumePointsCost;// 소비 포인트 환산 비용
    private String totalCost;// 총 비용
    private String consumeDate;// 소비 시간 (yyyyMMddHHmmss)
    private String operatorDate;// 입력 날짜
    private String beginDate;// 시작 날짜(yyyyMMddHHmmss)
    private String endDate;// 완료 날짜(yyyyMMddHHmmss)
    private String blueMembershipNo;// 회원 카드 번호
    private String blueMembershipId;// 회원 아이디
    private String cardType;// 쿠폰 유형
    private String cardNo;// 쿠폰 번호(인증 번호)
    private String cardCost;//쿠폰 비용
    private String cardConsumeCost;//쿠폰 사용 비용
    private String carCategory;// 차형
    private String custName;// 고객명
    private String mileAge;// 주행 거리
    private String operator;// 입력자 ID
    private String roDocNo;// RO문서번호
    private String contractNo;// 계약번호
    private String regUsrNm;// 등록자명

    private String modelCd;// 모델 코드
    private String agree;// 지불 여부(1: 지불 완료, 0: 미 지불 )
    private String vinNo;// VIN 번호
    private String vin;// VIN 번호
    private String paymentCost;// 지불 총 비용

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd
     *            the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the custNo
     */
    public String getCustNo() {
        return custNo;
    }

    /**
     * @param custNo
     *            the custNo to set
     */
    public void setCustNo(String custNo) {
        this.custNo = custNo;
    }

    /**
     * @return the custNm
     */
    public String getCustNm() {
        return custNm;
    }

    /**
     * @param custNm
     *            the custNm to set
     */
    public void setCustNm(String custNm) {
        this.custNm = custNm;
    }

    /**
     * @return the custTp
     */
    public String getCustTp() {
        return custTp;
    }

    /**
     * @param custTp
     *            the custTp to set
     */
    public void setCustTp(String custTp) {
        this.custTp = custTp;
    }

    /**
     * @return the carOwnYn
     */
    public String getCarOwnYn() {
        return carOwnYn;
    }

    /**
     * @param carOwnYn
     *            the carOwnYn to set
     */
    public void setCarOwnYn(String carOwnYn) {
        this.carOwnYn = carOwnYn;
    }

    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }

    /**
     * @param hpNo
     *            the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }

    /**
     * @return the mathDocTp
     */
    public String getMathDocTp() {
        return mathDocTp;
    }

    /**
     * @param mathDocTp
     *            the mathDocTp to set
     */
    public void setMathDocTp(String mathDocTp) {
        this.mathDocTp = mathDocTp;
    }

    /**
     * @return the ssnCrnNo
     */
    public String getSsnCrnNo() {
        return ssnCrnNo;
    }

    /**
     * @param ssnCrnNo
     *            the ssnCrnNo to set
     */
    public void setSsnCrnNo(String ssnCrnNo) {
        this.ssnCrnNo = ssnCrnNo;
    }

    /**
     * @return the sungNm
     */
    public String getSungNm() {
        return sungNm;
    }

    /**
     * @param sungNm
     *            the sungNm to set
     */
    public void setSungNm(String sungNm) {
        this.sungNm = sungNm;
    }

    /**
     * @return the cityNm
     */
    public String getCityNm() {
        return cityNm;
    }

    /**
     * @param cityNm
     *            the cityNm to set
     */
    public void setCityNm(String cityNm) {
        this.cityNm = cityNm;
    }

    /**
     * @return the distNm
     */
    public String getDistNm() {
        return distNm;
    }

    /**
     * @param distNm
     *            the distNm to set
     */
    public void setDistNm(String distNm) {
        this.distNm = distNm;
    }

    /**
     * @return the zipCd
     */
    public String getZipCd() {
        return zipCd;
    }

    /**
     * @param zipCd
     *            the zipCd to set
     */
    public void setZipCd(String zipCd) {
        this.zipCd = zipCd;
    }

    /**
     * @return the extZipCd
     */
    public String getExtZipCd() {
        return extZipCd;
    }

    /**
     * @param extZipCd
     *            the extZipCd to set
     */
    public void setExtZipCd(String extZipCd) {
        this.extZipCd = extZipCd;
    }

    /**
     * @return the addrNm
     */
    public String getAddrNm() {
        return addrNm;
    }

    /**
     * @param addrNm
     *            the addrNm to set
     */
    public void setAddrNm(String addrNm) {
        this.addrNm = addrNm;
    }

    /**
     * @return the addrDetlCont
     */
    public String getAddrDetlCont() {
        return addrDetlCont;
    }

    /**
     * @param addrDetlCont
     *            the addrDetlCont to set
     */
    public void setAddrDetlCont(String addrDetlCont) {
        this.addrDetlCont = addrDetlCont;
    }

    /**
     * @return the joinDlrCd
     */
    public String getJoinDlrCd() {
        return joinDlrCd;
    }

    /**
     * @param joinDlrCd
     *            the joinDlrCd to set
     */
    public void setJoinDlrCd(String joinDlrCd) {
        this.joinDlrCd = joinDlrCd;
    }

    /**
     * @return the joinReqAgreeYn
     */
    public String getJoinReqAgreeYn() {
        return joinReqAgreeYn;
    }

    /**
     * @param joinReqAgreeYn
     *            the joinReqAgreeYn to set
     */
    public void setJoinReqAgreeYn(String joinReqAgreeYn) {
        this.joinReqAgreeYn = joinReqAgreeYn;
    }

    /**
     * @return the policyAgreeYn
     */
    public String getPolicyAgreeYn() {
        return policyAgreeYn;
    }

    /**
     * @param policyAgreeYn
     *            the policyAgreeYn to set
     */
    public void setPolicyAgreeYn(String policyAgreeYn) {
        this.policyAgreeYn = policyAgreeYn;
    }

    /**
     * @return the joinApproveYn
     */
    public String getJoinApproveYn() {
        return joinApproveYn;
    }

    /**
     * @param joinApproveYn
     *            the joinApproveYn to set
     */
    public void setJoinApproveYn(String joinApproveYn) {
        this.joinApproveYn = joinApproveYn;
    }

    /**
     * @return the joinApproveDt
     */
    public Date getJoinApproveDt() {
        return joinApproveDt;
    }

    /**
     * @param joinApproveDt
     *            the joinApproveDt to set
     */
    public void setJoinApproveDt(Date joinApproveDt) {
        this.joinApproveDt = joinApproveDt;
    }

    /**
     * @return the joinApproveDtForm
     */
    public Date getJoinApproveDtForm() {
        return joinApproveDtForm;
    }

    /**
     * @param joinApproveDtForm
     *            the joinApproveDtForm to set
     */
    public void setJoinApproveDtForm(Date joinApproveDtForm) {
        this.joinApproveDtForm = joinApproveDtForm;
    }

    /**
     * @return the regDtForm
     */
    public Date getRegDtForm() {
        return regDtForm;
    }

    /**
     * @param regDtForm
     *            the regDtForm to set
     */
    public void setRegDtForm(Date regDtForm) {
        this.regDtForm = regDtForm;
    }

    /**
     * @return the blueMembershipJoinDtFormat
     */
    public Date getBlueMembershipJoinDtFormat() {
        return blueMembershipJoinDtFormat;
    }

    /**
     * @param blueMembershipJoinDtFormat
     *            the blueMembershipJoinDtFormat to set
     */
    public void setBlueMembershipJoinDtFormat(Date blueMembershipJoinDtFormat) {
        this.blueMembershipJoinDtFormat = blueMembershipJoinDtFormat;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber
     *            the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the paperWork
     */
    public String getPaperWork() {
        return paperWork;
    }

    /**
     * @param paperWork
     *            the paperWork to set
     */
    public void setPaperWork(String paperWork) {
        this.paperWork = paperWork;
    }

    /**
     * @return the identityNumber
     */
    public String getIdentityNumber() {
        return identityNumber;
    }

    /**
     * @param identityNumber
     *            the identityNumber to set
     */
    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    /**
     * @return the dealerId
     */
    public String getDealerId() {
        return dealerId;
    }

    /**
     * @param dealerId
     *            the dealerId to set
     */
    public void setDealerId(String dealerId) {
        this.dealerId = dealerId;
    }

    /**
     * @return the agree
     */
    public String getAgree() {
        return agree;
    }

    /**
     * @param agree
     *            the agree to set
     */
    public void setAgree(String agree) {
        this.agree = agree;
    }

    /**
     * @return the amount
     */
    public String getAmount() {
        return amount;
    }

    /**
     * @param amount
     *            the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * @return the vin
     */
    public String getVin() {
        return vin;
    }

    /**
     * @param vin
     *            the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }

    /**
     * @return the consumeType
     */
    public String getConsumeType() {
        return consumeType;
    }

    /**
     * @param consumeType
     *            the consumeType to set
     */
    public void setConsumeType(String consumeType) {
        this.consumeType = consumeType;
    }

    /**
     * @return the consumePoints
     */
    public String getConsumePoints() {
        return consumePoints;
    }

    /**
     * @param consumePoints
     *            the consumePoints to set
     */
    public void setConsumePoints(String consumePoints) {
        this.consumePoints = consumePoints;
    }

    /**
     * @return the totalCost
     */
    public String getTotalCost() {
        return totalCost;
    }

    /**
     * @param totalCost
     *            the totalCost to set
     */
    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
    }

    /**
     * @return the consumeDate
     */
    public String getConsumeDate() {
        return consumeDate;
    }

    /**
     * @param consumeDate
     *            the consumeDate to set
     */
    public void setConsumeDate(String consumeDate) {
        this.consumeDate = consumeDate;
    }

    /**
     * @return the operatorDate
     */
    public String getOperatorDate() {
        return operatorDate;
    }

    /**
     * @param operatorDate
     *            the operatorDate to set
     */
    public void setOperatorDate(String operatorDate) {
        this.operatorDate = operatorDate;
    }

    /**
     * @return the beginDate
     */
    public String getBeginDate() {
        return beginDate;
    }

    /**
     * @param beginDate
     *            the beginDate to set
     */
    public void setBeginDate(String beginDate) {
        this.beginDate = beginDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * @param endDate
     *            the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the blueMembershipNo
     */
    public String getBlueMembershipNo() {
        return blueMembershipNo;
    }

    /**
     * @param blueMembershipNo
     *            the blueMembershipNo to set
     */
    public void setBlueMembershipNo(String blueMembershipNo) {
        this.blueMembershipNo = blueMembershipNo;
    }


    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    /**
     * @return the cardNo
     */
    public String getCardNo() {
        return cardNo;
    }

    /**
     * @param cardNo
     *            the cardNo to set
     */
    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    /**
     * @return the carCategory
     */
    public String getCarCategory() {
        return carCategory;
    }

    /**
     * @param carCategory
     *            the carCategory to set
     */
    public void setCarCategory(String carCategory) {
        this.carCategory = carCategory;
    }

    /**
     * @return the custName
     */
    public String getCustName() {
        return custName;
    }

    /**
     * @param custName
     *            the custName to set
     */
    public void setCustName(String custName) {
        this.custName = custName;
    }

    /**
     * @return the mileAge
     */
    public String getMileAge() {
        return mileAge;
    }

    /**
     * @param mileAge
     *            the mileAge to set
     */
    public void setMileAge(String mileAge) {
        this.mileAge = mileAge;
    }

    /**
     * @return the operator
     */
    public String getOperator() {
        return operator;
    }

    /**
     * @param operator
     *            the operator to set
     */
    public void setOperator(String operator) {
        this.operator = operator;
    }

    /**
     * @return the modelNm
     */
    public String getModelNm() {
        return modelNm;
    }

    /**
     * @param modelNm
     *            the modelNm to set
     */
    public void setModelNm(String modelNm) {
        this.modelNm = modelNm;
    }

    /**
     * @return the blueMembershipJoinDt
     */
    public String getBlueMembershipJoinDt() {
        return blueMembershipJoinDt;
    }

    /**
     * @param blueMembershipJoinDt
     *            the blueMembershipJoinDt to set
     */
    public void setBlueMembershipJoinDt(String blueMembershipJoinDt) {
        this.blueMembershipJoinDt = blueMembershipJoinDt;
    }

    /**
     * @return the blueMembershipJoinDlrCd
     */
    public String getBlueMembershipJoinDlrCd() {
        return blueMembershipJoinDlrCd;
    }

    /**
     * @param blueMembershipJoinDlrCd
     *            the blueMembershipJoinDlrCd to set
     */
    public void setBlueMembershipJoinDlrCd(String blueMembershipJoinDlrCd) {
        this.blueMembershipJoinDlrCd = blueMembershipJoinDlrCd;
    }

    /**
     * @return the blueGradeChgDt
     */
    public String getBlueGradeChgDt() {
        return blueGradeChgDt;
    }

    /**
     * @param blueGradeChgDt
     *            the blueGradeChgDt to set
     */
    public void setBlueGradeChgDt(String blueGradeChgDt) {
        this.blueGradeChgDt = blueGradeChgDt;
    }

    /**
     * @return the blueGradeChgNm
     */
    public String getBlueGradeChgNm() {
        return blueGradeChgNm;
    }

    /**
     * @param blueGradeChgNm
     *            the blueGradeChgNm to set
     */
    public void setBlueGradeChgNm(String blueGradeChgNm) {
        this.blueGradeChgNm = blueGradeChgNm;
    }

    /**
     * @return the blueAvlbPointVal
     */
    public String getBlueAvlbPointVal() {
        return blueAvlbPointVal;
    }

    /**
     * @param blueAvlbPointVal
     *            the blueAvlbPointVal to set
     */
    public void setBlueAvlbPointVal(String blueAvlbPointVal) {
        this.blueAvlbPointVal = blueAvlbPointVal;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }

    /**
     * @param roDocNo
     *            the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo
     *            the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the blueMembershipId
     */
    public String getBlueMembershipId() {
        return blueMembershipId;
    }

    /**
     * @param blueMembershipId
     *            the blueMembershipId to set
     */
    public void setBlueMembershipId(String blueMembershipId) {
        this.blueMembershipId = blueMembershipId;
    }

    /**
     * @return the payAmt
     */
    public int getPayAmt() {
        return payAmt;
    }

    /**
     * @param payAmt
     *            the payAmt to set
     */
    public void setPayAmt(int payAmt) {
        this.payAmt = payAmt;
    }

    /**
     * @return the blueGradeNm
     */
    public String getBlueGradeNm() {
        return blueGradeNm;
    }

    /**
     * @param blueGradeNm
     *            the blueGradeNm to set
     */
    public void setBlueGradeNm(String blueGradeNm) {
        this.blueGradeNm = blueGradeNm;
    }

    /**
     * @return the blueGradeChdDt
     */
    public Date getBlueGradeChdDt() {
        return blueGradeChdDt;
    }

    /**
     * @param blueGradeChdDt
     *            the blueGradeChdDt to set
     */
    public void setBlueGradeChdDt(Date blueGradeChdDt) {
        this.blueGradeChdDt = blueGradeChdDt;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     *            the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the consumePointsCost
     */
    public String getConsumePointsCost() {
        return consumePointsCost;
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
     * @param consumePointsCost
     *            the consumePointsCost to set
     */
    public void setConsumePointsCost(String consumePointsCost) {
        this.consumePointsCost = consumePointsCost;
    }

    /**
     * @return the cardCost
     */
    public String getCardCost() {
        return cardCost;
    }

    /**
     * @param cardCost the cardCost to set
     */
    public void setCardCost(String cardCost) {
        this.cardCost = cardCost;
    }

    /**
     * @return the cardConsumeCost
     */
    public String getCardConsumeCost() {
        return cardConsumeCost;
    }

    /**
     * @param cardConsumeCost the cardConsumeCost to set
     */
    public void setCardConsumeCost(String cardConsumeCost) {
        this.cardConsumeCost = cardConsumeCost;
    }

    /**
     * @return the modelCd
     */
    public String getModelCd() {
        return modelCd;
    }

    /**
     * @param modelCd the modelCd to set
     */
    public void setModelCd(String modelCd) {
        this.modelCd = modelCd;
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
     * @return the paymentCost
     */
    public String getPaymentCost() {
        return paymentCost;
    }

    /**
     * @param paymentCost the paymentCost to set
     */
    public void setPaymentCost(String paymentCost) {
        this.paymentCost = paymentCost;
    }
    
    /**
     * @return the blueGradeName
     */
	public String getBlueGradeName() {
		return blueGradeName;
	}
	 /**
     * @param blueGradeName the blueGradeName to set
     */
	public void setBlueGradeName(String blueGradeName) {
		this.blueGradeName = blueGradeName;
	}
	/**
     * @return the blueMember
     */
	public String getBlueMember() {
		return blueMember;
	}
	 /**
     * @param blueMember the blueMember to set
     */
	public void setBlueMember(String blueMember) {
		this.blueMember = blueMember;
	}
	/**
     * @return the custTpNm
     */
	public String getCustTpNm() {
		return custTpNm;
	}
	 /**
     * @param custTpNm the custTpNm to set
     */
	public void setCustTpNm(String custTpNm) {
		this.custTpNm = custTpNm;
	}
	/**
     * @return the mathDocTpNm
     */
	public String getMathDocTpNm() {
		return mathDocTpNm;
	}
	 /**
     * @param mathDocTpNm the mathDocTpNm to set
     */
	public void setMathDocTpNm(String mathDocTpNm) {
		this.mathDocTpNm = mathDocTpNm;
	}


}
