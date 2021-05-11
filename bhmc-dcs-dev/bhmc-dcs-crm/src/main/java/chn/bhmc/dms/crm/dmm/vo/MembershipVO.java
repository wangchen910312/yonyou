package chn.bhmc.dms.crm.dmm.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

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
 * @author Kim Hyun Ho
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Kim Hyun Ho     최초 생성
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


        /**
        * 딜러코드
        **/
        private  String dlrCd;

        /**
        * 일련번호
        **/
        private  int seq;

        /**
        * 멤버십 일련번호
        **/
        private  String membershipNo;

        /**
        * 고객번호
        **/
        private  String custNo;

        /**
        * 차량ID
        **/
        private  String carId;

        /**
        * 차대번호
        **/
        private  String vinNo;

        /**
        * 멤버십 회원등급
        **/
        private  String gradeCd;

        /**
        * 첨부문서번호
        **/
        private  String fileDocNo;

        /**
        * 포인트식 가입여부
        **/
        @NotEmpty
        private  String pointYn;

        /**
        * 충전식 가입여부
        **/
        @NotEmpty
        private  String rechargeYn;

        /**
        * 상품선택코드
        **/
        private  String rechargeCd;

        /**
         *
         **/
        private  int lastPointVal;


        /*
         * VIN번호 , 차량번호, 차종/모델 조회로 인하여 하단 추가
         */
        private  String ncarDstinCd; //신차량구분코드
        private  String carlineCd; // 차종코드
        private  String carlineNm; //코드포함 차종명
        private  String carlineNmNc; //코드미포함 차종명
        private  String modelCd; // 모델코드
        private  String modelNm; //코드포함 도델명
        private  String modelNmNc; //코드미포함 모델명
        private  String carNm; //차량명
        private  String carRegNo; //차량등록번호

        /*
         * 고객정보 추가
         */
        private  String custNm; //고객명
        private  String custCd;//고객코드
        private  String custTp;//고객유형
        private  String ssnCrnNo;//주민사업자등록번호
        private  String emailNm;//이메일명
        private  String prefCommMthCd;//선호연락방법코드
        private  String prefCommNo;//선호연락번호
        private  String prefContactMthCd;//우선연락방법
        private  String prefContactTimeCd;//우선연락시간
        private  String telNo;//전화번호
        private  String hpNo;//휴대폰번호
        private  String mathDocTp;//주요인증문서유형
        private  String cardTpCd;//카드종류코드
        private  String cardNo;//카드번호
        private  String befGradeCd;//이전등급

        /*
         * 딜러사마다 설정한 멤버십 고객,자동차 값
         */
        private String stan;

        /*
         * 특별포인트 추가
         */
        private String specialPointReason; //특별포인트 사유
        private int occrPointVal;//특별포인트점수
        private String pointCd;//포인트 코드
        private String pointTp;//포인트 타입
        private String signDocId;//결재양식id



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
        public int getOccrPointVal() {
            return occrPointVal;
        }

        /**
         * @param occrPointVal the occrPointVal to set
         */
        public void setOccrPointVal(int occrPointVal) {
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
        public int getLastPointVal() {
            return lastPointVal;
        }

        /**
         * @param lastPointVal the lastPointVal to set
         */
        public void setLastPointVal(int lastPointVal) {
            this.lastPointVal = lastPointVal;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }
    }
