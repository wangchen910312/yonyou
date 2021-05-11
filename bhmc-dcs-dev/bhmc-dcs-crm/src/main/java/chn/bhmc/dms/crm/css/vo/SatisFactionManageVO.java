package chn.bhmc.dms.crm.css.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.databind.JsonDateListDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionManageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 11.     Kim Hyun Ho     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="subyTmplSeq", mesgKey="crm.lbl.subyTmplSeq")
    ,@ValidField(field="stsfIvstMthCd", mesgKey="crm.lbl.stsfIvstMthCd")
    ,@ValidField(field="stsfIvstExpdCd", mesgKey="crm.lbl.stsfIvstExpdCd")
    ,@ValidField(field="stsfIvstTpCd", mesgKey="crm.lbl.stsfIvstTpCd")
    ,@ValidField(field="rcpeExtrSeq", mesgKey="crm.lbl.rcpeExtrSeq")
    ,@ValidField(field="useYn", mesgKey="crm.lbl.useYn")
})
public class SatisFactionManageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4387832869625063520L;


        /**
        * 일련번호
        **/
        private  int seq;

        /**
         * 딜러코드
         **/
        private  String dlrCd;

        /**
        * 만족도조사명
        **/
        @NotEmpty
        private  String stsfIvstNm;

        /**
        * 만족도조사유형코드
        **/
        @NotEmpty
        private  String stsfIvstMthCd;

        /**
        * 만족도조사수단코드
        **/
        @NotEmpty
        private  String stsfIvstExpdCd;

        /**
         * 만족도조사타입코드
         **/
        //[TODO] 판매고문,정비고문 인지 판별해서 넣어줄 수 있도록 수정해야함
        //@NotEmpty
        private  String stsfIvstTpCd;

        /**
        * 설문템플릿일련번호
        **/
        @NotEmpty
        private  String subyTmplSeq;

        /**
        * 대상자추출일련번호
        **/
        private  String rcpeExtrSeq;

        /**
        * 시작일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date startDt;

        /**
        * 종료일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date endDt;

        /**
        * 사용여부
        **/
        @NotEmpty
        private  String useYn;

        /**
         * 고객대상 여부
         **/
         @NotEmpty
         private  String custTargYn;

         private String custExtrAutoYn;//고객추출자동여부
         @JsonDeserialize(using=JsonDateDeserializer.class)
         private Date lastExtrDt;//최종추출일자
         private String stsfCont;//설명/화술
         private String batOperId;//배치ID

         //추가
         private int stsfIvstRsltSeq;
         private int stsfIvstSeq;
         private String custNo;
         private String custNm;
         private String stsfIvstEmpId;
         private String empId;
         private String hpNo;
         private String callCenSendDt;
         private String callCenRsltCont;
         private String stsfIvstMthCdNm;        //만족도조사방법코드
         private String stsfIvstExpdCdNm;        //만족도조사수단코드
         private String stsfIvstTpCdNm;        //만족도조사유형코드

         //만족도 조사현황 에서 사용
         private int stsfCustCnt; //대상자수
         private int surveyUsrCnt; //설문완료수
         private int avgScore; //평균점수
         private String editYn; //수정가능여부

         private String custExtrCycleCont;//고객추출주기내용 ( 요일 또는 선택된 날짜  )
         private String custExtrCycleTp; //고객추출주기유형 ( D : 매일 / W : 매주 / S : 날짜 선택 )
         private List<String> custExtrCycleWeek;//고객추출주기 (주)
         @JsonDeserialize(using=JsonDateListDeserializer.class)
         private List<Date> custExtrCycleDt;//고객추출주기내용    ( 날짜 선택 )

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
         * @return the stsfIvstNm
         */
        public String getStsfIvstNm() {
            return stsfIvstNm;
        }

        /**
         * @param stsfIvstNm the stsfIvstNm to set
         */
        public void setStsfIvstNm(String stsfIvstNm) {
            this.stsfIvstNm = stsfIvstNm;
        }

        /**
         * @return the stsfIvstMthCd
         */
        public String getStsfIvstMthCd() {
            return stsfIvstMthCd;
        }

        /**
         * @param stsfIvstMthCd the stsfIvstMthCd to set
         */
        public void setStsfIvstMthCd(String stsfIvstMthCd) {
            this.stsfIvstMthCd = stsfIvstMthCd;
        }

        /**
         * @return the stsfIvstExpdCd
         */
        public String getStsfIvstExpdCd() {
            return stsfIvstExpdCd;
        }

        /**
         * @param stsfIvstExpdCd the stsfIvstExpdCd to set
         */
        public void setStsfIvstExpdCd(String stsfIvstExpdCd) {
            this.stsfIvstExpdCd = stsfIvstExpdCd;
        }

        /**
         * @return the subyTmplSeq
         */
        public String getSubyTmplSeq() {
            return subyTmplSeq;
        }

        /**
         * @param subyTmplSeq the subyTmplSeq to set
         */
        public void setSubyTmplSeq(String subyTmplSeq) {
            this.subyTmplSeq = subyTmplSeq;
        }

        /**
         * @return the rcpeExtrSeq
         */
        public String getRcpeExtrSeq() {
            return rcpeExtrSeq;
        }

        /**
         * @param rcpeExtrSeq the rcpeExtrSeq to set
         */
        public void setRcpeExtrSeq(String rcpeExtrSeq) {
            this.rcpeExtrSeq = rcpeExtrSeq;
        }


        /**
         * @return the startDt
         */
        public Date getStartDt() {
            return startDt;
        }

        /**
         * @param startDt the startDt to set
         */
        public void setStartDt(Date startDt) {
            this.startDt = startDt;
        }

        /**
         * @return the endDt
         */
        public Date getEndDt() {
            return endDt;
        }

        /**
         * @param endDt the endDt to set
         */
        public void setEndDt(Date endDt) {
            this.endDt = endDt;
        }

        /**
         * @return the useYn
         */
        public String getUseYn() {
            return useYn;
        }

        /**
         * @param useYn the useYn to set
         */
        public void setUseYn(String useYn) {
            this.useYn = useYn;
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
         * @return the custTargYn
         */
        public String getCustTargYn() {
            return custTargYn;
        }

        /**
         * @param custTargYn the custTargYn to set
         */
        public void setCustTargYn(String custTargYn) {
            this.custTargYn = custTargYn;
        }



        /**
         * @return the stsfIvstTpCd
         */
        public String getStsfIvstTpCd() {
            return stsfIvstTpCd;
        }

        /**
         * @param stsfIvstTpCd the stsfIvstTpCd to set
         */
        public void setStsfIvstTpCd(String stsfIvstTpCd) {
            this.stsfIvstTpCd = stsfIvstTpCd;
        }



        /**
         * @return the stsfIvstRsltSeq
         */
        public int getStsfIvstRsltSeq() {
            return stsfIvstRsltSeq;
        }

        /**
         * @param stsfIvstRsltSeq the stsfIvstRsltSeq to set
         */
        public void setStsfIvstRsltSeq(int stsfIvstRsltSeq) {
            this.stsfIvstRsltSeq = stsfIvstRsltSeq;
        }

        /**
         * @return the stsfIvstSeq
         */
        public int getStsfIvstSeq() {
            return stsfIvstSeq;
        }

        /**
         * @param stsfIvstSeq the stsfIvstSeq to set
         */
        public void setStsfIvstSeq(int stsfIvstSeq) {
            this.stsfIvstSeq = stsfIvstSeq;
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
         * @return the stsfIvstEmpId
         */
        public String getStsfIvstEmpId() {
            return stsfIvstEmpId;
        }

        /**
         * @param stsfIvstEmpId the stsfIvstEmpId to set
         */
        public void setStsfIvstEmpId(String stsfIvstEmpId) {
            this.stsfIvstEmpId = stsfIvstEmpId;
        }

        /**
         * @return the empId
         */
        public String getEmpId() {
            return empId;
        }

        /**
         * @param empId the empId to set
         */
        public void setEmpId(String empId) {
            this.empId = empId;
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
         * @return the callCenSendDt
         */
        public String getCallCenSendDt() {
            return callCenSendDt;
        }

        /**
         * @param callCenSendDt the callCenSendDt to set
         */
        public void setCallCenSendDt(String callCenSendDt) {
            this.callCenSendDt = callCenSendDt;
        }

        /**
         * @return the callCenRsltCont
         */
        public String getCallCenRsltCont() {
            return callCenRsltCont;
        }

        /**
         * @param callCenRsltCont the callCenRsltCont to set
         */
        public void setCallCenRsltCont(String callCenRsltCont) {
            this.callCenRsltCont = callCenRsltCont;
        }



        /**
         * @return the custExtrAutoYn
         */
        public String getCustExtrAutoYn() {
            return custExtrAutoYn;
        }

        /**
         * @param custExtrAutoYn the custExtrAutoYn to set
         */
        public void setCustExtrAutoYn(String custExtrAutoYn) {
            this.custExtrAutoYn = custExtrAutoYn;
        }

        /**
         * @return the lastExtrDt
         */
        public Date getLastExtrDt() {
            return lastExtrDt;
        }

        /**
         * @param lastExtrDt the lastExtrDt to set
         */
        public void setLastExtrDt(Date lastExtrDt) {
            this.lastExtrDt = lastExtrDt;
        }

        /**
         * @return the stsfCont
         */
        public String getStsfCont() {
            return stsfCont;
        }

        /**
         * @param stsfCont the stsfCont to set
         */
        public void setStsfCont(String stsfCont) {
            this.stsfCont = stsfCont;
        }



        /**
         * @return the stsfCustCnt
         */
        public int getStsfCustCnt() {
            return stsfCustCnt;
        }

        /**
         * @param stsfCustCnt the stsfCustCnt to set
         */
        public void setStsfCustCnt(int stsfCustCnt) {
            this.stsfCustCnt = stsfCustCnt;
        }

        /**
         * @return the surveyUsrCnt
         */
        public int getSurveyUsrCnt() {
            return surveyUsrCnt;
        }

        /**
         * @param surveyUsrCnt the surveyUsrCnt to set
         */
        public void setSurveyUsrCnt(int surveyUsrCnt) {
            this.surveyUsrCnt = surveyUsrCnt;
        }

        /**
         * @return the avgScore
         */
        public int getAvgScore() {
            return avgScore;
        }

        /**
         * @param avgScore the avgScore to set
         */
        public void setAvgScore(int avgScore) {
            this.avgScore = avgScore;
        }

        /**
         * @return the editYn
         */
        public String getEditYn() {
            return editYn;
        }

        /**
         * @param editYn the editYn to set
         */
        public void setEditYn(String editYn) {
            this.editYn = editYn;
        }



        /**
         * @return the batOperId
         */
        public String getBatOperId() {
            return batOperId;
        }

        /**
         * @param batOperId the batOperId to set
         */
        public void setBatOperId(String batOperId) {
            this.batOperId = batOperId;
        }

        /*
         * @see java.lang.Object#toString()
         */
        @Override
        public String toString() {
            return ReflectionToStringBuilder.toString(this);
        }

        /**
         * @return the custExtrCycleTp
         */
        public String getCustExtrCycleTp() {
            return custExtrCycleTp;
        }

        /**
         * @param custExtrCycleTp the custExtrCycleTp to set
         */
        public void setCustExtrCycleTp(String custExtrCycleTp) {
            this.custExtrCycleTp = custExtrCycleTp;
        }

        /**
         * @return the custExtrCycleCont
         */
        public String getCustExtrCycleCont() {
            return custExtrCycleCont;
        }

        /**
         * @param custExtrCycleCont the custExtrCycleCont to set
         */
        public void setCustExtrCycleCont(String custExtrCycleCont) {
            this.custExtrCycleCont = custExtrCycleCont;
        }

        /**
         * @return the custExtrCycleWeek
         */
        public List<String> getCustExtrCycleWeek() {
            return custExtrCycleWeek;
        }

        /**
         * @param custExtrCycleWeek the custExtrCycleWeek to set
         */
        public void setCustExtrCycleWeek(List<String> custExtrCycleWeek) {
            this.custExtrCycleWeek = custExtrCycleWeek;
        }

        /**
         * @return the custExtrCycleDt
         */
        public List<Date> getCustExtrCycleDt() {
            return custExtrCycleDt;
        }

        /**
         * @param custExtrCycleDt the custExtrCycleDt to set
         */
        public void setCustExtrCycleDt(List<Date> custExtrCycleDt) {
            this.custExtrCycleDt = custExtrCycleDt;
        }

        /**
         * @return the stsfIvstMthCdNm
         */
        public String getStsfIvstMthCdNm() {
            return stsfIvstMthCdNm;
        }

        /**
         * @param stsfIvstMthCdNm the stsfIvstMthCdNm to set
         */
        public void setStsfIvstMthCdNm(String stsfIvstMthCdNm) {
            this.stsfIvstMthCdNm = stsfIvstMthCdNm;
        }

        /**
         * @return the stsfIvstExpdCdNm
         */
        public String getStsfIvstExpdCdNm() {
            return stsfIvstExpdCdNm;
        }

        /**
         * @param stsfIvstExpdCdNm the stsfIvstExpdCdNm to set
         */
        public void setStsfIvstExpdCdNm(String stsfIvstExpdCdNm) {
            this.stsfIvstExpdCdNm = stsfIvstExpdCdNm;
        }

        /**
         * @return the stsfIvstTpCdNm
         */
        public String getStsfIvstTpCdNm() {
            return stsfIvstTpCdNm;
        }

        /**
         * @param stsfIvstTpCdNm the stsfIvstTpCdNm to set
         */
        public void setStsfIvstTpCdNm(String stsfIvstTpCdNm) {
            this.stsfIvstTpCdNm = stsfIvstTpCdNm;
        }

}
