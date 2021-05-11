package chn.bhmc.dms.crm.slm.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.i18n.LocaleContextHolder;

import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
import chn.bhmc.dms.crm.cmm.vo.CarLineInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LeadInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="global.lbl.dlrCd")
    ,@ValidField(field="pltCd"         , mesgKey="global.lbl.pltCd")
    ,@ValidField(field="leadNo"        , mesgKey="global.lbl.leadNo")
    ,@ValidField(field="custNo"        , mesgKey="global.lbl.custNo")
    ,@ValidField(field="opptNo"        , mesgKey="global.lbl.opptNo")
    ,@ValidField(field="hpNo"          , mesgKey="global.lbl.hpNo")
    ,@ValidField(field="telNo"         , mesgKey="global.lbl.telNo")
    ,@ValidField(field="leadSrcCd"     , mesgKey="global.lbl.leadSrcCd")
    ,@ValidField(field="bhmcYn"        , mesgKey="global.lbl.bhmcYn")
    ,@ValidField(field="bhmcLeadNo"    , mesgKey="global.lbl.bhmcLeadNo")
    ,@ValidField(field="respDeptCd"    , mesgKey="global.lbl.respDeptCd")
    ,@ValidField(field="prsnId"        , mesgKey="global.lbl.prsnId")
    ,@ValidField(field="statCd"        , mesgKey="global.lbl.statCd")
    ,@ValidField(field="ddlnDt"        , mesgKey="global.lbl.ddlnDt")
    ,@ValidField(field="opptChgDt"     , mesgKey="global.lbl.opptChgDt")
    ,@ValidField(field="expcSaleDt"    , mesgKey="global.lbl.expcSaleDt")
    ,@ValidField(field="succPrbCd"     , mesgKey="global.lbl.succPrbCd")
    ,@ValidField(field="bhmcReceiveDt" , mesgKey="global.lbl.bhmcReceiveDt")
    ,@ValidField(field="bhmcSendDt"    , mesgKey="global.lbl.bhmcSendDt")
    ,@ValidField(field="remark"        , mesgKey="global.lbl.remark")
    ,@ValidField(field="regUsrId"      , mesgKey="global.lbl.regUsrId")
    ,@ValidField(field="regDt"         , mesgKey="global.lbl.regDt")
    ,@ValidField(field="updtUsrId"     , mesgKey="global.lbl.updtUsrId")
    ,@ValidField(field="updtDt"        , mesgKey="global.lbl.updtDt")
   })

public class LeadInfoVO extends AbstractExcelDataBinder {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8071043107693818960L;

   /**
    * 딜러코드
    **/
   @NotEmpty
   private  String         dlrCd;

   /**
    * 사업장코드
    **/
   @NotEmpty
   private  String         pltCd;

   /**
    * 리드번호
    **/
   @NotEmpty
   private  String         leadNo;

   /**
    * 고객번호
    **/
   //CUST_NO
   private  String         custNo;

   /**
    * 기회번호
    **/
   //OPPT_NO
   private  String         opptNo;

   /**
    * 휴대폰번호
    **/
   //HP_NO
   private  String         hpNo;

   /**
    * 전화번호
    **/
   //TEL_NO
   private  String         telNo;

   /**
    * 리드출처코드
    **/
   //LEAD_SRC_CD
   private  String         leadSrcCd;

   /**
    * BHMC여부
    **/
   //@NotEmpty
   private  String         bhmcYn = "N";

   /**
    * BHMC리드번호
    **/
   //BHMC_LEAD_NO
   private  String         bhmcLeadNo;

   /**
    * 담당부서코드
    **/
   //RESP_DEPT_CD
   private  String         respDeptCd;

   /**
    * 콜업무담당자
    **/
   //PRSN_ID
   private  String         prsnId;

   /**
    * 판매고문
    **/
   private  String         mngScId;

   /**
    * 판매고문명
    **/
   private  String         mngScNm;

   /**
    * 상태코드
    **/
   //STAT_CD

   private  String         statCd;

   /**
    * 마감일자
    **/
   //DDLN_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           ddlnDt;

   /**
    * 기회전환일자
    **/
   //OPPT_CHG_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           opptChgDt;

   /**
    * 예상판매일자
    **/
   //EXPC_SALE_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           expcSaleDt;

   /**
    * 성공확률코드
    **/
   //SUCC_PRB_CD

   private  String         succPrbCd;

   /**
    * BHMC수신일자
    **/
   //BHMC_RECEIVE_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           bhmcReceiveDt;

   /**
    * BHNC송신일자
    **/
   //BHMC_SEND_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           bhmcSendDt;

   /**
    * 비고
    **/
   //REMARK
   private  String         remark;

   /**
    * 등록자ID
    **/
   //@NotEmpty
   private  String         regUsrId;

   /**
    * 등록일자
    **/
   //@NotEmpty
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           regDt;

   /**
    * 수정자ID
    **/
   //UPDT_USR_ID

   private  String         updtUsrId;

   /**
    * 수정일자
    **/
   //UPDT_DT
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date           updtDt;

   private  String         custNm;

   private  String         custCd;

   /**
    * 담당자명
    **/
   private  String         prsnNm;

   /**
    * 등록자명
    **/
   private  String         regUsrNm;

   private  String         updateTp;

   /**
    * 리드타입(IDCC,COMMON)
    **/
   private  String         leadTp;

   private  int             callCount;

   private  String          callStatCd;

   private  String          nextCallDt;

   /**
    * 배정일
    **/
   //@JsonDeserialize(using=JsonDateDeserializer.class)
   private  Date            allocDt;

   /**
    * 지연여부
    **/
   private  String         delayYn = "N";

   private  String         leadSrcDtl;


   private  String         carlineNm; // 관심차종 이름
   private  String         modelNm;     // 관심모델 이름

   private List<CarLineInfoVO> carLineInfoVO = new ArrayList<CarLineInfoVO>();

   private String          prefCommNo; // 주요연락번호

   private String          prefCommMthCd;
   private String          custTp;
   private String          custHpNo;
   private String          officeTelNo;

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
     * @return the leadNo
     */
    public String getLeadNo() {
        return leadNo;
    }

    /**
     * @param leadNo the leadNo to set
     */
    public void setLeadNo(String leadNo) {
        this.leadNo = leadNo;
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
     * @return the opptNo
     */
    public String getOpptNo() {
        return opptNo;
    }

    /**
     * @param opptNo the opptNo to set
     */
    public void setOpptNo(String opptNo) {
        this.opptNo = opptNo;
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
     * @return the leadSrcCd
     */
    public String getLeadSrcCd() {
        return leadSrcCd;
    }

    /**
     * @param leadSrcCd the leadSrcCd to set
     */
    public void setLeadSrcCd(String leadSrcCd) {
        this.leadSrcCd = leadSrcCd;
    }

    /**
     * @return the bhmcYn
     */
    public String getBhmcYn() {
        return bhmcYn;
    }

    /**
     * @param bhmcYn the bhmcYn to set
     */
    public void setBhmcYn(String bhmcYn) {
        this.bhmcYn = bhmcYn;
    }

    /**
     * @return the bhmcLeadNo
     */
    public String getBhmcLeadNo() {
        return bhmcLeadNo;
    }

    /**
     * @param bhmcLeadNo the bhmcLeadNo to set
     */
    public void setBhmcLeadNo(String bhmcLeadNo) {
        this.bhmcLeadNo = bhmcLeadNo;
    }

    /**
     * @return the respDeptCd
     */
    public String getRespDeptCd() {
        return respDeptCd;
    }

    /**
     * @param respDeptCd the respDeptCd to set
     */
    public void setRespDeptCd(String respDeptCd) {
        this.respDeptCd = respDeptCd;
    }

    /**
     * @return the prsnId
     */
    public String getPrsnId() {
        return prsnId;
    }

    /**
     * @param prsnId the prsnId to set
     */
    public void setPrsnId(String prsnId) {
        this.prsnId = prsnId;
    }

    /**
     * @return the statCd
     */
    public String getStatCd() {
        return statCd;
    }

    /**
     * @param statCd the statCd to set
     */
    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    /**
     * @return the ddlnDt
     */
    public Date getDdlnDt() {
        return ddlnDt;
    }

    /**
     * @param ddlnDt the ddlnDt to set
     */
    public void setDdlnDt(Date ddlnDt) {
        this.ddlnDt = ddlnDt;
    }

    /**
     * @return the opptChgDt
     */
    public Date getOpptChgDt() {
        return opptChgDt;
    }

    /**
     * @param opptChgDt the opptChgDt to set
     */
    public void setOpptChgDt(Date opptChgDt) {
        this.opptChgDt = opptChgDt;
    }

    /**
     * @return the expcSaleDt
     */
    public Date getExpcSaleDt() {
        return expcSaleDt;
    }

    /**
     * @param expcSaleDt the expcSaleDt to set
     */
    public void setExpcSaleDt(Date expcSaleDt) {
        this.expcSaleDt = expcSaleDt;
    }

    /**
     * @return the succPrbCd
     */
    public String getSuccPrbCd() {
        return succPrbCd;
    }

    /**
     * @param succPrbCd the succPrbCd to set
     */
    public void setSuccPrbCd(String succPrbCd) {
        this.succPrbCd = succPrbCd;
    }

    /**
     * @return the bhmcReceiveDt
     */
    public Date getBhmcReceiveDt() {
        return bhmcReceiveDt;
    }

    /**
     * @param bhmcReceiveDt the bhmcReceiveDt to set
     */
    public void setBhmcReceiveDt(Date bhmcReceiveDt) {
        this.bhmcReceiveDt = bhmcReceiveDt;
    }

    /**
     * @return the bhmcSendDt
     */
    public Date getBhmcSendDt() {
        return bhmcSendDt;
    }

    /**
     * @param bhmcSendDt the bhmcSendDt to set
     */
    public void setBhmcSendDt(Date bhmcSendDt) {
        this.bhmcSendDt = bhmcSendDt;
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
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
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
     * @return the prsnNm
     */
    public String getPrsnNm() {
        return prsnNm;
    }

    /**
     * @param prsnNm the prsnNm to set
     */
    public void setPrsnNm(String prsnNm) {
        this.prsnNm = prsnNm;
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
     * @return the updateTp
     */
    public String getUpdateTp() {
        return updateTp;
    }

    /**
     * @param updateTp the updateTp to set
     */
    public void setUpdateTp(String updateTp) {
        this.updateTp = updateTp;
    }

    /**
     * @return the leadTp
     */
    public String getLeadTp() {
        return leadTp;
    }

    /**
     * @param leadTp the leadTp to set
     */
    public void setLeadTp(String leadTp) {
        this.leadTp = leadTp;
    }

    /**
     * @return the callCount
     */
    public int getCallCount() {
        return callCount;
    }

    /**
     * @param callCount the callCount to set
     */
    public void setCallCount(int callCount) {
        this.callCount = callCount;
    }

    /**
     * @return the callStatCd
     */
    public String getCallStatCd() {
        return callStatCd;
    }

    /**
     * @param callStatCd the callStatCd to set
     */
    public void setCallStatCd(String callStatCd) {
        this.callStatCd = callStatCd;
    }

    /**
     * @return the nextCallDt
     */
    public String getNextCallDt() {
        return nextCallDt;
    }

    /**
     * @param nextCallDt the nextCallDt to set
     */
    public void setNextCallDt(String nextCallDt) {
        this.nextCallDt = nextCallDt;
    }

    /**
     * @return the allocDt
     */
    public Date getAllocDt() {
        return allocDt;
    }

    /**
     * @param allocDt the allocDt to set
     */
    public void setAllocDt(Date allocDt) {
        this.allocDt = allocDt;
    }

    /**
     * @return the delayYn
     */
    public String getDelayYn() {
        return delayYn;
    }

    /**
     * @param delayYn the delayYn to set
     */
    public void setDelayYn(String delayYn) {
        this.delayYn = delayYn;
    }

    /**
     * @return the leadSrcDtl
     */
    public String getLeadSrcDtl() {
        return leadSrcDtl;
    }

    /**
     * @param leadSrcDtl the leadSrcDtl to set
     */
    public void setLeadSrcDtl(String leadSrcDtl) {
        this.leadSrcDtl = leadSrcDtl;
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

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                //case 1 :this.setCustNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 0 :this.setLeadTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 1 :this.setCustNm(ExcelDataBinderUtil.toString(value).trim()); break;
                case 2 :this.setHpNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 3 :this.setTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
                case 4 :this.setLeadSrcCd(ExcelDataBinderUtil.toString(value).trim()); break;
                case 5 :this.setPrsnId(ExcelDataBinderUtil.toString(value).trim()); break;
                case 6 :this.setLeadSrcDtl(ExcelDataBinderUtil.toString(value).trim()); break;
                case 7 :this.setCustTp(ExcelDataBinderUtil.toString(value).trim()); break;
                case 8 :this.setOfficeTelNo(ExcelDataBinderUtil.toString(value).trim()); break;
            }
        }catch(Exception e){

            ExcelDataBindingException bindingException = new ExcelDataBindingException(messageSource.getMessage("global.err.excelUpload.dataExtract", null, LocaleContextHolder.getLocale()), e);
            bindingException.setRowNo(rowNo);
            bindingException.setColNo(cellNo);
            bindingException.setFieldValue(value.toString());

            throw bindingException;
        }
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {
        List<ExcelUploadError> errors = new ArrayList<ExcelUploadError>();

        if (StringUtils.isBlank(this.getLeadTp())){
            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                    messageSource.getMessage("global.lbl.type", null, LocaleContextHolder.getLocale())
                }

                , LocaleContextHolder.getLocale()
            );
                errors.add(new ExcelUploadError(context.getRow(), 0, this.getLeadTp(), msg));
            }

/*        if (StringUtils.isBlank(this.getCustNo())){
            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.custNo", null, LocaleContextHolder.getLocale())
                    }

                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustNo(), msg));
        }
*/
        if (StringUtils.isBlank(this.getCustNm())){
            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{
                    messageSource.getMessage("global.lbl.custNm", null, LocaleContextHolder.getLocale())
                }

                , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustNo(), msg));
        }

        if (StringUtils.isBlank(this.getCustTp())){
            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.custTp", null, LocaleContextHolder.getLocale())
                    }

                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getCustTp(), msg));
        }

        if (StringUtils.isBlank(this.getHpNo())){
            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.hpNo", null, LocaleContextHolder.getLocale())
                    }

                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getHpNo(), msg));
        }

        if (StringUtils.isBlank(this.getOfficeTelNo())){
            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{
                            messageSource.getMessage("global.lbl.officeTelNo", null, LocaleContextHolder.getLocale())
                    }

                    , LocaleContextHolder.getLocale()
            );
            errors.add(new ExcelUploadError(context.getRow(), 0, this.getOfficeTelNo(), msg));
        }

        if (StringUtils.isBlank(this.getLeadSrcCd())){
            if (this.getLeadSrcCd() == "02") {

                if (StringUtils.isBlank(this.getLeadSrcDtl())){
                    String msg = messageSource.getMessage(
                        "global.info.required.field"
                        , new String[]{
                            messageSource.getMessage("global.lbl.crNo", null, LocaleContextHolder.getLocale())
                        }

                        , LocaleContextHolder.getLocale()
                    );
                    errors.add(new ExcelUploadError(context.getRow(), 0, this.getLeadSrcDtl(), msg));
                }

            }
        }


        return errors;
    }

    /**
     * @return the carLineInfoVO
     */
    public List<CarLineInfoVO> getCarLineInfoVO() {
        return carLineInfoVO;
    }

    /**
     * @param carLineInfoVO the carLineInfoVO to set
     */
    public void setCarLineInfoVO(List<CarLineInfoVO> carLineInfoVO) {
        this.carLineInfoVO = carLineInfoVO;
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
     * @return the mngScId
     */
    public String getMngScId() {
        return mngScId;
    }

    /**
     * @param mngScId the mngScId to set
     */
    public void setMngScId(String mngScId) {
        this.mngScId = mngScId;
    }

    /**
     * @return the mngScNm
     */
    public String getMngScNm() {
        return mngScNm;
    }

    /**
     * @param mngScNm the mngScNm to set
     */
    public void setMngScNm(String mngScNm) {
        this.mngScNm = mngScNm;
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
     * @return the custHpNo
     */
    public String getCustHpNo() {
        return custHpNo;
    }

    /**
     * @param custHpNo the custHpNo to set
     */
    public void setCustHpNo(String custHpNo) {
        this.custHpNo = custHpNo;
    }

    /**
     * @return the officeTelNo
     */
    public String getOfficeTelNo() {
        return officeTelNo;
    }

    /**
     * @param officeTelNo the officeTelNo to set
     */
    public void setOfficeTelNo(String officeTelNo) {
        this.officeTelNo = officeTelNo;
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


}
