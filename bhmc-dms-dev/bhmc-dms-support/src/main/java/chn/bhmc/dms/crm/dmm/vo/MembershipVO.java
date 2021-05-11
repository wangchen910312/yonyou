package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee In Moon
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee In Moon     최초 생성
 * </pre>
 */

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Jin Suk
 * @since 2017. 2. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 28.     Kim Jin Suk     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"     , mesgKey="CR_0801T.lbl.dlrCd")
    ,@ValidField(field="seq"       , mesgKey="CR_0801T.lbl.seq")
    ,@ValidField(field="custNo"    , mesgKey="CR_0801T.lbl.custNo")
    ,@ValidField(field="carId"     , mesgKey="CR_0801T.lbl.carId")
    ,@ValidField(field="vinNo"     , mesgKey="CR_0801T.lbl.vinNo")
    ,@ValidField(field="gradeCd"   , mesgKey="CR_0801T.lbl.gradeCd")
    ,@ValidField(field="fileDocNo" , mesgKey="CR_0801T.lbl.fileDocNo")
    ,@ValidField(field="pointYn"   , mesgKey="CR_0801T.lbl.pointYn")
    ,@ValidField(field="rechargeYn", mesgKey="CR_0801T.lbl.rechargeYn")
    ,@ValidField(field="rechargeCd", mesgKey="CR_0801T.lbl.rechargeCd")
    ,@ValidField(field="regUsrId"  , mesgKey="CR_0801T.lbl.regUsrId")
    ,@ValidField(field="regDt"     , mesgKey="CR_0801T.lbl.regDt")
    ,@ValidField(field="updtUsrId" , mesgKey="CR_0801T.lbl.updtUsrId")
    ,@ValidField(field="updtDt"    , mesgKey="CR_0801T.lbl.updtDt")
    })
public class MembershipVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1830004834371095179L;

        private String dlrCd;  // 딜러코드
        private String membershipNo;    // 멤버십 일련번호
        private String custNo; // 고객번호
        private String carId;   // 차량ID
        private String vinNo;   // 차대번호
        private String gradeCd; // 멤버십 회원등급
        private String gradeNm; // 멤버십 회원등급 명
        private String fileDocNo;   // 첨부문서번호
        private int seq;    // 일련번호
        private double lastPointVal;//가용포인트
        private int totMinusPointVal;//총사용포인트
        private int PointExtcExpcVal;//소멸예정포인트
        private double realTotAmt;//충전가용금액                  // 20170602 REAL_TOT_AMT 컬럼 용도 변경 ( 수납금액 입력 ) 함에 따라 최종 금액은 LAST_POINT_VAL을 사용한다.
        private double totMinusRealAmt;//총사용충전가용금액

        @NotEmpty
        private String pointYn; // 포인트식 가입여부
        @NotEmpty
        private String rechargeYn;  // 충전식 가입여부
        private String rechargeCd;  // 상품선택코드


        /*
         * VIN번호 , 차량번호, 차종/모델 조회로 인하여 하단 추가
         */
        private String ncarDstinCd; //신차량구분코드
        private String carlineCd; // 차종코드
        private String carlineNm; //코드포함 차종명
        private String carlineNmNc; //코드미포함 차종명
        private String modelCd; // 모델코드
        private String modelNm; //코드포함 도델명
        private String modelNmNc; //코드미포함 모델명
        private String carNm; //차량명
        private String carRegNo; //차량등록번호

        /*
         * 고객정보 추가
         */
        private String custNm; //고객명
        private String custCd;//고객코드
        private String custCdNm;//潜客 保客  贾明 2018-9-28
        private String custTp;//고객유형
        private String custTpNm;//客户类型  贾明 2018-9-28
        private String ssnCrnNo;//주민사업자등록번호
        private String emailNm;//이메일명
        private String prefCommMthCd;//선호연락방법코드
        private String prefCommNo;//선호연락번호
        private String prefContactMthCd;//우선연락방법
        private String prefContactTimeCd;//우선연락시간
        private String telNo;//전화번호
        private String hpNo;//휴대폰번호
        private String mathDocTp;//주요인증문서유형
        private String cardTpCd;//카드종류코드
        private String cardNo;//카드번호
        private String bfCardNo;//카드번호
        private String befGradeCd;//이전등급
        private String stan;    // 딜러사마다 설정한 멤버십 고객,자동차 값

        /*
         * 특별포인트 추가
         */
        private String specialPointReason; //특별포인트 사유
        private Double occrPointVal;//특별포인트점수
        private String pointCd;//포인트 코드
        private String pointTp;//포인트 타입
        private String signDocId;//결재양식id

        /*
         * 주소 추가
         */
        private String zipCd;
        private String sungCd;
        private String cityCd;
        private String distCd;
        private String addrDetlCont;
        private String sungNm;
        private String cityNm;
        private String distNm;
        private String addrFull;

        /*
         * 참조시 Return해주기 위한 결과
         */
        private Boolean isResult;// 멤버십 조회 결과
        private String resultMsg;// 멤버십 결과 Message


        private List<MembershipGradeMngVO> membershipGradeMngList;  //멤버십 등급 리스트
        private List<PackageCouponHisVO> packageCouponHisList;      //멤버십 쿠폰 리스트
        private List<CardIssueVO> cardIssueList;                    //멤버십 선불 카드 리스트

        private double membershipPointExchgPoint;       // 멤버십포인트 환산기준 ( 포인트 )
        private double membershipPointExchgMoney;       // 멤버십포인트 환산기준 ( 위안 )
        private double pointExchgScale;//멤버십포인트 환산비율 ( 위안 / 포인트 )


        @JsonDeserialize(using=JsonDateDeserializer.class)
        private Date pointExtcExpcDt;

        int membershipPointUseMaxPoint; // 멤버십 포인트 사용 상한치

        private List<MembershipVO> membershipInfoList;  //멤버십 정보 목록
        private int membershipInfoListCnt;  //멤버십 정보 목록 수량


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
         * @return the cardNo
         */
        public String getCardNo() {
            return cardNo;
        }

        /**
         * @param cardNo the cardNo to set
         */
        public void setCardNo(String cardNo) {
            this.cardNo = cardNo;
        }


        /**
         * @return the bfCardNo
         */
        public String getBfCardNo() {
            return bfCardNo;
        }

        /**
         * @param bfCardNo the bfCardNo to set
         */
        public void setBfCardNo(String bfCardNo) {
            this.bfCardNo = bfCardNo;
        }

        /**
         * @return the seq
         */
        public int getSeq() {
            return seq;
        }

        /**
         * @param seq the seq to set
         */
        public void setSeq(int seq) {
            this.seq = seq;
        }

        /**
         * @return the custNo
         */
        public String getCustNo() {
            return custNo;
        }

        /**
         * @param custNo the custNo to set
         */
        public void setCustNo(String custNo) {
            this.custNo = custNo;
        }

        /**
         * @return the carId
         */
        public String getCarId() {
            return carId;
        }

        /**
         * @param carId the carId to set
         */
        public void setCarId(String carId) {
            this.carId = carId;
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
         * @return the gradeCd
         */
        public String getGradeCd() {
            return gradeCd;
        }

        /**
         * @param gradeCd the gradeCd to set
         */
        public void setGradeCd(String gradeCd) {
            this.gradeCd = gradeCd;
        }

        /**
         * @return the fileDocNo
         */
        public String getFileDocNo() {
            return fileDocNo;
        }

        /**
         * @param fileDocNo the fileDocNo to set
         */
        public void setFileDocNo(String fileDocNo) {
            this.fileDocNo = fileDocNo;
        }

        /**
         * @return the pointYn
         */
        public String getPointYn() {
            return pointYn;
        }

        /**
         * @param pointYn the pointYn to set
         */
        public void setPointYn(String pointYn) {
            this.pointYn = pointYn;
        }

        /**
         * @return the rechargeYn
         */
        public String getRechargeYn() {
            return rechargeYn;
        }

        /**
         * @param rechargeYn the rechargeYn to set
         */
        public void setRechargeYn(String rechargeYn) {
            this.rechargeYn = rechargeYn;
        }

        /**
         * @return the rechargeCd
         */
        public String getRechargeCd() {
            return rechargeCd;
        }

        /**
         * @param rechargeCd the rechargeCd to set
         */
        public void setRechargeCd(String rechargeCd) {
            this.rechargeCd = rechargeCd;
        }



        /**
         * @return the ncarDstinCd
         */
        public String getNcarDstinCd() {
            return ncarDstinCd;
        }

        /**
         * @param ncarDstinCd the ncarDstinCd to set
         */
        public void setNcarDstinCd(String ncarDstinCd) {
            this.ncarDstinCd = ncarDstinCd;
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
         * @return the carlineNmNc
         */
        public String getCarlineNmNc() {
            return carlineNmNc;
        }

        /**
         * @param carlineNmNc the carlineNmNc to set
         */
        public void setCarlineNmNc(String carlineNmNc) {
            this.carlineNmNc = carlineNmNc;
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
         * @return the modelNm
         */
        public String getModelNm() {
            return modelNm;
        }

        /**
         * @param modelNm the modelNm to set
         */
        public void setModelNm(String modelNm) {
            this.modelNm = modelNm;
        }

        /**
         * @return the modelNmNc
         */
        public String getModelNmNc() {
            return modelNmNc;
        }

        /**
         * @param modelNmNc the modelNmNc to set
         */
        public void setModelNmNc(String modelNmNc) {
            this.modelNmNc = modelNmNc;
        }

        /**
         * @return the carNm
         */
        public String getCarNm() {
            return carNm;
        }

        /**
         * @param carNm the carNm to set
         */
        public void setCarNm(String carNm) {
            this.carNm = carNm;
        }

        /**
         * @return the carRegNo
         */
        public String getCarRegNo() {
            return carRegNo;
        }

        /**
         * @param carRegNo the carRegNo to set
         */
        public void setCarRegNo(String carRegNo) {
            this.carRegNo = carRegNo;
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
         * @return the ssnCrnNo
         */
        public String getSsnCrnNo() {
            return ssnCrnNo;
        }

        /**
         * @param ssnCrnNo the ssnCrnNo to set
         */
        public void setSsnCrnNo(String ssnCrnNo) {
            this.ssnCrnNo = ssnCrnNo;
        }

        /**
         * @return the custTp
         */
        public String getCustTp() {
            return custTp;
        }

        /**
         * @param custTp the custTp to set
         */
        public void setCustTp(String custTp) {
            this.custTp = custTp;
        }

        /**
         * @return the emailNm
         */
        public String getEmailNm() {
            return emailNm;
        }

        /**
         * @param emailNm the emailNm to set
         */
        public void setEmailNm(String emailNm) {
            this.emailNm = emailNm;
        }

        /**
         * @return the prefCommMthCd
         */
        public String getPrefCommMthCd() {
            return prefCommMthCd;
        }

        /**
         * @param prefCommMthCd the prefCommMthCd to set
         */
        public void setPrefCommMthCd(String prefCommMthCd) {
            this.prefCommMthCd = prefCommMthCd;
        }

        /**
         * @return the prefCommNo
         */
        public String getPrefCommNo() {
            return prefCommNo;
        }

        /**
         * @param prefCommNo the prefCommNo to set
         */
        public void setPrefCommNo(String prefCommNo) {
            this.prefCommNo = prefCommNo;
        }

        /**
         * @return the prefContactMthCd
         */
        public String getPrefContactMthCd() {
            return prefContactMthCd;
        }

        /**
         * @param prefContactMthCd the prefContactMthCd to set
         */
        public void setPrefContactMthCd(String prefContactMthCd) {
            this.prefContactMthCd = prefContactMthCd;
        }

        /**
         * @return the prefContactTimeCd
         */
        public String getPrefContactTimeCd() {
            return prefContactTimeCd;
        }

        /**
         * @param prefContactTimeCd the prefContactTimeCd to set
         */
        public void setPrefContactTimeCd(String prefContactTimeCd) {
            this.prefContactTimeCd = prefContactTimeCd;
        }

        /**
         * @return the telNo
         */
        public String getTelNo() {
            return telNo;
        }

        /**
         * @param telNo the telNo to set
         */
        public void setTelNo(String telNo) {
            this.telNo = telNo;
        }

        /**
         * @return the hpNo
         */
        public String getHpNo() {
            return hpNo;
        }

        /**
         * @param hpNo the hpNo to set
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
         * @param mathDocTp the mathDocTp to set
         */
        public void setMathDocTp(String mathDocTp) {
            this.mathDocTp = mathDocTp;
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

        /**
         * @return the stan
         */
        public String getStan() {
            return stan;
        }

        /**
         * @param stan the stan to set
         */
        public void setStan(String stan) {
            this.stan = stan;
        }

        /**
         * @return the cardTpCd
         */
        public String getCardTpCd() {
            return cardTpCd;
        }

        /**
         * @param cardTpCd the cardTpCd to set
         */
        public void setCardTpCd(String cardTpCd) {
            this.cardTpCd = cardTpCd;
        }



        /**
         * @return the befGradeCd
         */
        public String getBefGradeCd() {
            return befGradeCd;
        }

        /**
         * @param befGradeCd the befGradeCd to set
         */
        public void setBefGradeCd(String befGradeCd) {
            this.befGradeCd = befGradeCd;
        }



        /**
         * @return the specialPointReason
         */
        public String getSpecialPointReason() {
            return specialPointReason;
        }

        /**
         * @param specialPointReason the specialPointReason to set
         */
        public void setSpecialPointReason(String specialPointReason) {
            this.specialPointReason = specialPointReason;
        }

        /**
         * @return the occrPointVal
         */
        public Double getOccrPointVal() {
            return occrPointVal;
        }

        /**
         * @param occrPointVal the occrPointVal to set
         */
        public void setOccrPointVal(Double occrPointVal) {
            this.occrPointVal = occrPointVal;
        }

        /**
         * @return the pointCd
         */
        public String getPointCd() {
            return pointCd;
        }

        /**
         * @param pointCd the pointCd to set
         */
        public void setPointCd(String pointCd) {
            this.pointCd = pointCd;
        }

        /**
         * @return the signDocId
         */
        public String getSignDocId() {
            return signDocId;
        }

        /**
         * @param signDocId the signDocId to set
         */
        public void setSignDocId(String signDocId) {
            this.signDocId = signDocId;
        }

        /**
         * @return the pointTp
         */
        public String getPointTp() {
            return pointTp;
        }

        /**
         * @param pointTp the pointTp to set
         */
        public void setPointTp(String pointTp) {
            this.pointTp = pointTp;
        }

        /**
         * @return the lastPointVal
         */
        public double  getLastPointVal() {
            return lastPointVal;
        }

        /**
         * @param lastPointVal the lastPointVal to set
         */
        public void setLastPointVal(double lastPointVal) {
            this.lastPointVal = lastPointVal;
        }



        /**
         * @return the realTotAmt
         */
        public double getRealTotAmt() {
            return realTotAmt;
        }

        /**
         * @param realTotAmt the realTotAmt to set
         */
        public void setRealTotAmt(double realTotAmt) {
            this.realTotAmt = realTotAmt;
        }



        /**
         * @return the zipCd
         */
        public String getZipCd() {
            return zipCd;
        }

        /**
         * @param zipCd the zipCd to set
         */
        public void setZipCd(String zipCd) {
            this.zipCd = zipCd;
        }

        /**
         * @return the sungCd
         */
        public String getSungCd() {
            return sungCd;
        }

        /**
         * @param sungCd the sungCd to set
         */
        public void setSungCd(String sungCd) {
            this.sungCd = sungCd;
        }

        /**
         * @return the cityCd
         */
        public String getCityCd() {
            return cityCd;
        }

        /**
         * @param cityCd the cityCd to set
         */
        public void setCityCd(String cityCd) {
            this.cityCd = cityCd;
        }

        /**
         * @return the distCd
         */
        public String getDistCd() {
            return distCd;
        }

        /**
         * @param distCd the distCd to set
         */
        public void setDistCd(String distCd) {
            this.distCd = distCd;
        }

        /**
         * @return the addrDetlCont
         */
        public String getAddrDetlCont() {
            return addrDetlCont;
        }

        /**
         * @param addrDetlCont the addrDetlCont to set
         */
        public void setAddrDetlCont(String addrDetlCont) {
            this.addrDetlCont = addrDetlCont;
        }

        /**
         * @return the sungNm
         */
        public String getSungNm() {
            return sungNm;
        }

        /**
         * @param sungNm the sungNm to set
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
         * @param cityNm the cityNm to set
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
         * @param distNm the distNm to set
         */
        public void setDistNm(String distNm) {
            this.distNm = distNm;
        }

        /**
         * @return the addrFull
         */
        public String getAddrFull() {
            return addrFull;
        }

        /**
         * @param addrFull the addrFull to set
         */
        public void setAddrFull(String addrFull) {
            this.addrFull = addrFull;
        }



        /**
         * @return the isResult
         */
        public Boolean getIsResult() {
            return isResult;
        }

        /**
         * @param isResult the isResult to set
         */
        public void setIsResult(Boolean isResult) {
            this.isResult = isResult;
        }

        /**
         * @return the resultMsg
         */
        public String getResultMsg() {
            return resultMsg;
        }

        /**
         * @param resultMsg the resultMsg to set
         */
        public void setResultMsg(String resultMsg) {
            this.resultMsg = resultMsg;
        }

        /**
         * @return the gradeNm
         */
        public String getGradeNm() {
            return gradeNm;
        }

        /**
         * @param gradeNm the gradeNm to set
         */
        public void setGradeNm(String gradeNm) {
            this.gradeNm = gradeNm;
        }



        /**
         * @return the membershipGradeMngList
         */
        public List<MembershipGradeMngVO> getMembershipGradeMngList() {
            return membershipGradeMngList;
        }

        /**
         * @param membershipGradeMngList the membershipGradeMngList to set
         */
        public void setMembershipGradeMngList(List<MembershipGradeMngVO> membershipGradeMngList) {
            this.membershipGradeMngList = membershipGradeMngList;
        }


        /**
         * @return the packageCouponHisList
         */
        public List<PackageCouponHisVO> getPackageCouponHisList() {
            return packageCouponHisList;
        }

        /**
         * @param packageCouponHisList the packageCouponHisList to set
         */
        public void setPackageCouponHisList(List<PackageCouponHisVO> packageCouponHisList) {
            this.packageCouponHisList = packageCouponHisList;
        }

        /**
         * @return the cardIssueList
         */
        public List<CardIssueVO> getCardIssueList() {
            return cardIssueList;
        }

        /**
         * @param cardIssueList the cardIssueList to set
         */
        public void setCardIssueList(List<CardIssueVO> cardIssueList) {
            this.cardIssueList = cardIssueList;
        }
        /**
         * @return the membershipPointExchgPoint
         */
        public double getMembershipPointExchgPoint() {
            return membershipPointExchgPoint;
        }

        /**
         * @param membershipPointExchgPoint the membershipPointExchgPoint to set
         */
        public void setMembershipPointExchgPoint(double membershipPointExchgPoint) {
            this.membershipPointExchgPoint = membershipPointExchgPoint;
        }

        /**
         * @return the membershipPointExchgMoney
         */
        public double getMembershipPointExchgMoney() {
            return membershipPointExchgMoney;
        }

        /**
         * @param membershipPointExchgMoney the membershipPointExchgMoney to set
         */
        public void setMembershipPointExchgMoney(double membershipPointExchgMoney) {
            this.membershipPointExchgMoney = membershipPointExchgMoney;
        }

        /**
         * @return the pointExchgScale
         */
        public double getPointExchgScale() {
            return pointExchgScale;
        }

        /**
         * @param pointExchgScale the pointExchgScale to set
         */
        public void setPointExchgScale(double pointExchgScale) {
            this.pointExchgScale = pointExchgScale;
        }



        /**
         * @return the pointExtcExpcDt
         */
        public Date getPointExtcExpcDt() {
            return pointExtcExpcDt;
        }

        /**
         * @param pointExtcExpcDt the pointExtcExpcDt to set
         */
        public void setPointExtcExpcDt(Date pointExtcExpcDt) {
            this.pointExtcExpcDt = pointExtcExpcDt;
        }

        /**
         * @return the membershipPointUseMaxPoint
         */
        public int getMembershipPointUseMaxPoint() {
            return membershipPointUseMaxPoint;
        }

        /**
         * @param membershipPointUseMaxPoint the membershipPointUseMaxPoint to set
         */
        public void setMembershipPointUseMaxPoint(int membershipPointUseMaxPoint) {
            this.membershipPointUseMaxPoint = membershipPointUseMaxPoint;
        }

        /**
         * @return the membershipInfoList
         */
        public List<MembershipVO> getMembershipInfoList() {
            return membershipInfoList;
        }

        /**
         * @param membershipInfoList the membershipInfoList to set
         */
        public void setMembershipInfoList(List<MembershipVO> membershipInfoList) {
            this.membershipInfoList = membershipInfoList;
        }




        /**
         * @return the membershipInfoListCnt
         */
        public int getMembershipInfoListCnt() {
            return membershipInfoListCnt;
        }

        /**
         * @param membershipInfoListCnt the membershipInfoListCnt to set
         */
        public void setMembershipInfoListCnt(int membershipInfoListCnt) {
            this.membershipInfoListCnt = membershipInfoListCnt;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

        /**
         * @return the totMinusPointVal
         */
        public int getTotMinusPointVal() {
            return totMinusPointVal;
        }

        /**
         * @param totMinusPointVal the totMinusPointVal to set
         */
        public void setTotMinusPointVal(int totMinusPointVal) {
            this.totMinusPointVal = totMinusPointVal;
        }

        /**
         * @return the totMinusRealAmt
         */
        public double getTotMinusRealAmt() {
            return totMinusRealAmt;
        }

        /**
         * @param totMinusRealAmt the totMinusRealAmt to set
         */
        public void setTotMinusRealAmt(double totMinusRealAmt) {
            this.totMinusRealAmt = totMinusRealAmt;
        }

        /**
         * @return the pointExtcExpcVal
         */
        public int getPointExtcExpcVal() {
            return PointExtcExpcVal;
        }

        /**
         * @param pointExtcExpcVal the pointExtcExpcVal to set
         */
        public void setPointExtcExpcVal(int pointExtcExpcVal) {
            PointExtcExpcVal = pointExtcExpcVal;
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
         * @return the custCdNm
         */
		public String getCustCdNm() {
			return custCdNm;
		}
		/**
         * @param custCdNm the custCdNm to set
         */
		public void setCustCdNm(String custCdNm) {
			this.custCdNm = custCdNm;
		}
        
        
    }
