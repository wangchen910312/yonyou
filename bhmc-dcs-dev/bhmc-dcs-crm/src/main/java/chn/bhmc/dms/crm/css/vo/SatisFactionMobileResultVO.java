package chn.bhmc.dms.crm.css.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.validator.groups.Draft;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionMobileVO.java
 * @Description : 만족도 조사를 진행합니다.
 * @author hyun ho kim
 * @since 2016. 3. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since author     description
 *  ===========    =============    ===========================
 *  2016. 3. 17.     hyun ho kim     최초 생성
 * </pre>
 */

@ValidDescriptor({
        @ValidField(field="dlrCd"             , mesgKey="crm.lbl.dlrCd")
        ,@ValidField(field="stsfIvstRsltSeq"   , mesgKey="crm.lbl.stsfIvstRsltSeq")
        ,@ValidField(field="stsfIvstSeq"       , mesgKey="crm.lbl.stsfIvstSeq")
        ,@ValidField(field="subyTmplSeq"       , mesgKey="crm.lbl.subyTmplSeq")
        ,@ValidField(field="custNo"            , mesgKey="crm.lbl.custNo")
        ,@ValidField(field="stsfIvstScoreVal"  , mesgKey="crm.lbl.stsfIvstScoreVal")
        ,@ValidField(field="stsfIvstDt"        , mesgKey="crm.lbl.stsfIvstDt")
        ,@ValidField(field="stsfIvstEmpId"     , mesgKey="crm.lbl.stsfIvstEmpId")
        ,@ValidField(field="vocYn"             , mesgKey="crm.lbl.vocYn")
        ,@ValidField(field="vocRegDt"          , mesgKey="crm.lbl.vocRegDt")
        ,@ValidField(field="delYn"             , mesgKey="crm.lbl.delYn")
        ,@ValidField(field="regUsrId"          , mesgKey="crm.lbl.regUsrId")
        ,@ValidField(field="regDt"             , mesgKey="crm.lbl.regDt")
        ,@ValidField(field="updtUsrId"         , mesgKey="crm.lbl.updtUsrId")
        ,@ValidField(field="updtDt"            , mesgKey="crm.lbl.updtDt")
        ,@ValidField(field="empId"             , mesgKey="crm.lbl.empId")
        ,@ValidField(field="cmplReasonCont"    , mesgKey="crm.lbl.cmplReasonCont")
        ,@ValidField(field="custExtrTermNo"    , mesgKey="crm.lbl.custExtrTermNo")
        ,@ValidField(field="telNo"             , mesgKey="crm.lbl.telNo")
        ,@ValidField(field="hpNo"              , mesgKey="crm.lbl.hpNo")
        ,@ValidField(field="wechatId"          , mesgKey="crm.lbl.wechatId")
        ,@ValidField(field="emailNm"           , mesgKey="crm.lbl.emailNm")
        ,@ValidField(field="sungNm"            , mesgKey="crm.lbl.sungNm")
        ,@ValidField(field="cityNm"            , mesgKey="crm.lbl.cityNm")
        ,@ValidField(field="distNm"            , mesgKey="crm.lbl.distNm")
        ,@ValidField(field="zipCd"             , mesgKey="crm.lbl.zipCd")
        ,@ValidField(field="extZipCd"          , mesgKey="crm.lbl.extZipCd")
        ,@ValidField(field="addrNm"            , mesgKey="crm.lbl.addrNm")
        ,@ValidField(field="addrDetlCont"      , mesgKey="crm.lbl.addrDetlCont")
        ,@ValidField(field="callCenSendDt"     , mesgKey="crm.lbl.callCenSendDt")
        ,@ValidField(field="callCenRsltCont"   , mesgKey="crm.lbl.callCenRsltCont")
        })
public class SatisFactionMobileResultVO extends BaseVO {


        /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3806020926921940949L;


        /**
        * 딜러코드
        **/
        private  String             dlrCd;

        /**
        * 만족도조사결과일련번호
        **/
        private  int                stsfIvstRsltSeq;

        /**
        * 만족도조사일련번호
        **/
        private  int                stsfIvstSeq;

        /**
        * 설문템플릿일련번호
        **/
        private  int                subyTmplSeq;

        /**
        * 고객번호
        **/
        private  String             custNo;

        /**
        * 만족도조사점수값
        **/
        private  double                stsfIvstScoreVal;

        /**
        * 만족도조사일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date               stsfIvstDt;

        /**
         * 만족도조사일자
         **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date               stsfIvstDtFormat;

        /**
        * 만족도조사사원ID
        **/
        private  String             stsfIvstEmpId;

        /**
        * VOC요청여부
        **/
        @NotEmpty(groups=Draft.class)
        private  String             vocYn;

        /**
        * VOC요청일자
        **/
        //VOC_REG_DT
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date               vocRegDt;

        /**
        * 삭제여부
        **/
        @NotEmpty(groups=Draft.class)
        private  String             delYn;

        /**
        * 사원ID
        **/
        private  String             empId;

        /**
        * 총결
        **/
        private  String             cmplReasonCont;

        /**
         * 만족여부
         **/
        private  String             stsfIvstYn;

        /**
        * 고객추출조건번호
        **/
        private  String             custExtrTermNo;

        /**
        * 전화번호
        **/
        private  String             telNo;

        /**
        * 휴대폰번호
        **/
        private  String             hpNo;

        /**
        * 위챗ID
        **/
        private  String             wechatId;

        /**
        * 이메일명
        **/
        private  String             emailNm;

        /**
        * 성명
        **/
        private  String             sungNm;

        /**
        * 도시명
        **/
        private  String             cityNm;

        /**
        * 지역명
        **/
        private  String             distNm;

        /**
        * 우편번호
        **/
        private  String             zipCd;

        /**
        * 확장우편번호
        **/
        private  String             extZipCd;

        /**
        * 주소명
        **/
        private  String             addrNm;

        /**
        * 주소상세내용
        **/
        private  String             addrDetlCont;

        /**
        * 콜센터전송일자
        **/
        @JsonDeserialize(using=JsonDateDeserializer.class)
        private  Date               callCenSendDt;

        /**
        * 콜센터결과내용
        **/
        private  String             callCenRsltCont;

        /**
         * 일련번호
         **/
         private  int seq;

         /**
         * 만족도조사명
         **/
         @NotEmpty(groups=Draft.class)
         private  String stsfIvstNm;

         /**
         * 만족도조사유형코드
         **/
         @NotEmpty(groups=Draft.class)
         private  String stsfIvstMthCd;

         /**
         * 만족도조사수단코드
         **/
         @NotEmpty(groups=Draft.class)
         private  String stsfIvstExpdCd;

         /**
          * 만족도조사타입코드
          **/
         //[TODO] 판매고문,정비고문 인지 판별해서 넣어줄 수 있도록 수정해야함
         //@NotEmpty
         private  String stsfIvstTpCd;

         /**
         * 대상자추출일련번호
         **/
         @NotEmpty(groups=Draft.class)
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
         @NotEmpty(groups=Draft.class)
         private  String useYn;

         /**
          * 고객대상 여부
          **/
          @NotEmpty(groups=Draft.class)
          private  String custTargYn;

          //추가
          private String custNm;
          @JsonDeserialize(using=JsonDateDeserializer.class)
          private Date vocProcDt;//VOC처리일자
          @JsonDeserialize(using=JsonDateDeserializer.class)
          private Date vocProcDtFormat;//VOC처리일자
          private String vocProcId;//VOC처리 ID
          private String vocProcNm;//VOC처리 이름
          private String vocProcCont;//VOC처리내용
          @JsonDeserialize(using=JsonDateDeserializer.class)
          private Date callCenRsltDt;//콜센터결과일

          //만족도 조사결과 현황의 설문항목 상세로 인하여 추가
          private int qestSeq          ;
          private int answSeq          ;
          private int answScoreVal     ;
          private String sbjvAnswCont     ;
          private String subyTmplNm       ;
          private int subyTmplQestSeq  ;
          private String qestCont         ;
          private int qestWgtVal       ;
          private String qestTpCd         ;
          private int answSelCnt       ;
          private int sortOrder        ;
          private int itemSeq          ;
          private String answCont         ;

          private String stsfIvstMthCdNm;       //만족도조사방법코드
          private String stsfIvstYnNm;          //만족여부
          private String stsfIvstExpdCdNm;      //만족도조사수단코드
          private String stsfIvstTpCdNm;        //만족도조사유형코드
          private String usrNm;                 //조사담당자

          private int resultCnt;                 //만족도결과 참여인원
          private int resultPer;                 //만족도결과 참여퍼센트


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
         * @return the stsfIvstRsltSeq
         */
        public int getStsfIvstRsltSeq() {
            return stsfIvstRsltSeq;
        }




        /**
         * @return the callCenRsltDt
         */
        public Date getCallCenRsltDt() {
            return callCenRsltDt;
        }


        /**
         * @param callCenRsltDt the callCenRsltDt to set
         */
        public void setCallCenRsltDt(Date callCenRsltDt) {
            this.callCenRsltDt = callCenRsltDt;
        }


        /**
         * @return the vocProcDt
         */
        public Date getVocProcDt() {
            return vocProcDt;
        }


        /**
         * @param vocProcDt the vocProcDt to set
         */
        public void setVocProcDt(Date vocProcDt) {
            this.vocProcDt = vocProcDt;
        }


        /**
         * @return the vocProcId
         */
        public String getVocProcId() {
            return vocProcId;
        }


        /**
         * @param vocProcId the vocProcId to set
         */
        public void setVocProcId(String vocProcId) {
            this.vocProcId = vocProcId;
        }


        /**
         * @return the vocProcCont
         */
        public String getVocProcCont() {
            return vocProcCont;
        }


        /**
         * @param vocProcCont the vocProcCont to set
         */
        public void setVocProcCont(String vocProcCont) {
            this.vocProcCont = vocProcCont;
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
         * @return the subyTmplSeq
         */
        public int getSubyTmplSeq() {
            return subyTmplSeq;
        }


        /**
         * @param subyTmplSeq the subyTmplSeq to set
         */
        public void setSubyTmplSeq(int subyTmplSeq) {
            this.subyTmplSeq = subyTmplSeq;
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
         * @return the stsfIvstDt
         */
        public Date getStsfIvstDt() {
            return stsfIvstDt;
        }


        /**
         * @param stsfIvstDt the stsfIvstDt to set
         */
        public void setStsfIvstDt(Date stsfIvstDt) {
            this.stsfIvstDt = stsfIvstDt;
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
         * @return the vocYn
         */
        public String getVocYn() {
            return vocYn;
        }


        /**
         * @param vocYn the vocYn to set
         */
        public void setVocYn(String vocYn) {
            this.vocYn = vocYn;
        }


        /**
         * @return the vocRegDt
         */
        public Date getVocRegDt() {
            return vocRegDt;
        }


        /**
         * @param vocRegDt the vocRegDt to set
         */
        public void setVocRegDt(Date vocRegDt) {
            this.vocRegDt = vocRegDt;
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
         * @return the stsfIvstScoreVal
         */
        public double getStsfIvstScoreVal() {
            return stsfIvstScoreVal;
        }


        /**
         * @param stsfIvstScoreVal the stsfIvstScoreVal to set
         */
        public void setStsfIvstScoreVal(double stsfIvstScoreVal) {
            this.stsfIvstScoreVal = stsfIvstScoreVal;
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
         * @return the cmplReasonCont
         */
        public String getCmplReasonCont() {
            return cmplReasonCont;
        }


        /**
         * @param cmplReasonCont the cmplReasonCont to set
         */
        public void setCmplReasonCont(String cmplReasonCont) {
            this.cmplReasonCont = cmplReasonCont;
        }



        /**
         * @return the stsfIvstYn
         */
        public String getStsfIvstYn() {
            return stsfIvstYn;
        }


        /**
         * @param stsfIvstYn the stsfIvstYn to set
         */
        public void setStsfIvstYn(String stsfIvstYn) {
            this.stsfIvstYn = stsfIvstYn;
        }


        /**
         * @return the custExtrTermNo
         */
        public String getCustExtrTermNo() {
            return custExtrTermNo;
        }


        /**
         * @param custExtrTermNo the custExtrTermNo to set
         */
        public void setCustExtrTermNo(String custExtrTermNo) {
            this.custExtrTermNo = custExtrTermNo;
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
         * @return the wechatId
         */
        public String getWechatId() {
            return wechatId;
        }


        /**
         * @param wechatId the wechatId to set
         */
        public void setWechatId(String wechatId) {
            this.wechatId = wechatId;
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
         * @return the extZipCd
         */
        public String getExtZipCd() {
            return extZipCd;
        }


        /**
         * @param extZipCd the extZipCd to set
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
         * @param addrNm the addrNm to set
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
         * @param addrDetlCont the addrDetlCont to set
         */
        public void setAddrDetlCont(String addrDetlCont) {
            this.addrDetlCont = addrDetlCont;
        }


        /**
         * @return the callCenSendDt
         */
        public Date getCallCenSendDt() {
            return callCenSendDt;
        }

        /**
         * @param callCenSendDt the callCenSendDt to set
         */
        public void setCallCenSendDt(Date callCenSendDt) {
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
         * @return the qestSeq
         */
        public int getQestSeq() {
            return qestSeq;
        }


        /**
         * @param qestSeq the qestSeq to set
         */
        public void setQestSeq(int qestSeq) {
            this.qestSeq = qestSeq;
        }


        /**
         * @return the answSeq
         */
        public int getAnswSeq() {
            return answSeq;
        }


        /**
         * @param answSeq the answSeq to set
         */
        public void setAnswSeq(int answSeq) {
            this.answSeq = answSeq;
        }


        /**
         * @return the answScoreVal
         */
        public int getAnswScoreVal() {
            return answScoreVal;
        }


        /**
         * @param answScoreVal the answScoreVal to set
         */
        public void setAnswScoreVal(int answScoreVal) {
            this.answScoreVal = answScoreVal;
        }


        /**
         * @return the sbjvAnswCont
         */
        public String getSbjvAnswCont() {
            return sbjvAnswCont;
        }


        /**
         * @param sbjvAnswCont the sbjvAnswCont to set
         */
        public void setSbjvAnswCont(String sbjvAnswCont) {
            this.sbjvAnswCont = sbjvAnswCont;
        }


        /**
         * @return the subyTmplNm
         */
        public String getSubyTmplNm() {
            return subyTmplNm;
        }


        /**
         * @param subyTmplNm the subyTmplNm to set
         */
        public void setSubyTmplNm(String subyTmplNm) {
            this.subyTmplNm = subyTmplNm;
        }


        /**
         * @return the subyTmplQestSeq
         */
        public int getSubyTmplQestSeq() {
            return subyTmplQestSeq;
        }


        /**
         * @param subyTmplQestSeq the subyTmplQestSeq to set
         */
        public void setSubyTmplQestSeq(int subyTmplQestSeq) {
            this.subyTmplQestSeq = subyTmplQestSeq;
        }


        /**
         * @return the qestCont
         */
        public String getQestCont() {
            return qestCont;
        }


        /**
         * @param qestCont the qestCont to set
         */
        public void setQestCont(String qestCont) {
            this.qestCont = qestCont;
        }


        /**
         * @return the qestWgtVal
         */
        public int getQestWgtVal() {
            return qestWgtVal;
        }


        /**
         * @param qestWgtVal the qestWgtVal to set
         */
        public void setQestWgtVal(int qestWgtVal) {
            this.qestWgtVal = qestWgtVal;
        }


        /**
         * @return the qestTpCd
         */
        public String getQestTpCd() {
            return qestTpCd;
        }


        /**
         * @param qestTpCd the qestTpCd to set
         */
        public void setQestTpCd(String qestTpCd) {
            this.qestTpCd = qestTpCd;
        }


        /**
         * @return the answSelCnt
         */
        public int getAnswSelCnt() {
            return answSelCnt;
        }


        /**
         * @param answSelCnt the answSelCnt to set
         */
        public void setAnswSelCnt(int answSelCnt) {
            this.answSelCnt = answSelCnt;
        }


        /**
         * @return the sortOrder
         */
        public int getSortOrder() {
            return sortOrder;
        }


        /**
         * @param sortOrder the sortOrder to set
         */
        public void setSortOrder(int sortOrder) {
            this.sortOrder = sortOrder;
        }


        /**
         * @return the itemSeq
         */
        public int getItemSeq() {
            return itemSeq;
        }


        /**
         * @param itemSeq the itemSeq to set
         */
        public void setItemSeq(int itemSeq) {
            this.itemSeq = itemSeq;
        }


        /**
         * @return the answCont
         */
        public String getAnswCont() {
            return answCont;
        }


        /**
         * @param answCont the answCont to set
         */
        public void setAnswCont(String answCont) {
            this.answCont = answCont;
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
         * @return the stsfIvstYnNm
         */
        public String getStsfIvstYnNm() {
            return stsfIvstYnNm;
        }


        /**
         * @param stsfIvstYnNm the stsfIvstYnNm to set
         */
        public void setStsfIvstYnNm(String stsfIvstYnNm) {
            this.stsfIvstYnNm = stsfIvstYnNm;
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


    /**
         * @return the stsfIvstDtFormat
         */
        public Date getStsfIvstDtFormat() {
            return stsfIvstDtFormat;
        }


        /**
         * @param stsfIvstDtFormat the stsfIvstDtFormat to set
         */
        public void setStsfIvstDtFormat(Date stsfIvstDtFormat) {
            this.stsfIvstDtFormat = stsfIvstDtFormat;
        }


        /**
         * @return the vocProcDtFormat
         */
        public Date getVocProcDtFormat() {
            return vocProcDtFormat;
        }


        /**
         * @param vocProcDtFormat the vocProcDtFormat to set
         */
        public void setVocProcDtFormat(Date vocProcDtFormat) {
            this.vocProcDtFormat = vocProcDtFormat;
        }


    /**
         * @return the usrNm
         */
        public String getUsrNm() {
            return usrNm;
        }


        /**
         * @param usrNm the usrNm to set
         */
        public void setUsrNm(String usrNm) {
            this.usrNm = usrNm;
        }




    /**
         * @return the resultCnt
         */
        public int getResultCnt() {
            return resultCnt;
        }


        /**
         * @param resultCnt the resultCnt to set
         */
        public void setResultCnt(int resultCnt) {
            this.resultCnt = resultCnt;
        }


        /**
         * @return the resultPer
         */
        public int getResultPer() {
            return resultPer;
        }


        /**
         * @param resultPer the resultPer to set
         */
        public void setResultPer(int resultPer) {
            this.resultPer = resultPer;
        }




    /**
         * @return the vocProcNm
         */
        public String getVocProcNm() {
            return vocProcNm;
        }


        /**
         * @param vocProcNm the vocProcNm to set
         */
        public void setVocProcNm(String vocProcNm) {
            this.vocProcNm = vocProcNm;
        }


    /*
       * @see java.lang.Object#toString()
       */
      @Override
      public String toString() {
          return ReflectionToStringBuilder.toString(this);
      }
}
