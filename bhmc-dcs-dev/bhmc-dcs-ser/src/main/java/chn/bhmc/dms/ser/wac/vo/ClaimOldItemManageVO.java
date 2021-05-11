package chn.bhmc.dms.ser.wac.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.context.i18n.LocaleContextHolder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBinderUtil;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;

/**
 * <pre>
 * 고품관리 VO
 * </pre>
 *
 * @ClassName   : ClaimOldItemManageVO.java
 * @Description : 고품관리 VO.
 * @author Yin Xueyuan
 * @since 2016. 5. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 6.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class ClaimOldItemManageVO extends AbstractExcelDataBinder {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5253601436605460124L;

    /**
     * 딜러코드
     */
    @NotBlank
    private String  dlrCd;

    /**
     * 딜러코드
     */
    private String  dlrNm;

    private String reqDeptNm;

    /**
     * 차대번호
     */
    private String vinNo;

    /**
     * 클레임문서번호
     */
    @NotBlank
    private String claimDocNo;

    /**
     * 상태코드
     */
    private String statCd;

    /**
     * 상태코드
     */
    private String statNm;

    /**
     * 고품신청번호
     */
    private String atqReqNo;

    /**
     * 일련번호
     */
    private String seq;

    /**
     * 주행거리값
     */
    private Double runDistVal;

    /**
     * 반납일자
     */
    private String returnDt;

    /**
     * 품목코드
     */
    @NotBlank
    private String itemCd;

    /**
     * 품목명
     */
    private String itemNm;

    /**
     * 품목단위코드
     */
    private String itemUnitCd;

    /**
     * 회수수량
     */
    private Double collcQty;

    /**
     * 클레임수량
     */
    private Double claimQty;

    /**
     * 요청상태코드
     */
    private String reqStatCd;

    /**
     * 요청사유내용
     */
    private String reqReasonCont;

    /**
     * 회수요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date collcReqDt;

    /**
     * 요청자ID
     */
    private String reqId;

    /**
     * 요청자명
     */
    private String reqNm;

    /**
     * 요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;

    /**
     * 요청부서코드
     */
    private String reqDeptCd;

    /**
     * 회수자ID
     */
    private String collcId;

    /**
     * 회수일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date collcDt;

    /**
     * 공제자ID
     */
    private String ddctId;

    /**
     * 공제일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ddctDt;

    /**
     * 출고구분코드
     */
    private String giDstinCd;

    /**
     * 출고일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;

    /**
     * 클레임일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date claimStartDt;

    /**
     * 출고부서코드
     */
    private String giDeptCd;

    /**
     * 출고자ID
     */
    private String giId;

    /**
     * 전화
     */
    private String reqTelNo;

    /**
     * 출고사유
     */
    private String giReasonCont;

    /**
     * 공제수량
     */
    private double ddctQty;

    /**
     * 수취인ID
     */
    private String rcipId;

    /**
     * 수취인주소명
     */
    private String rcipAddrNm;

    /**
     * 수취인전화번호
     */
    private String rcipTelNo;

    /**
     * 택배회사명
     */
    private String expsCmpNm;

    /**
     * 지불유형
     */
    private String payTp;

    /**
     * 부취인ID
     */
    private String senderId;

    /**
     * 부취인전화번호
     */
    private String senderTelNo;

    /**
     * 운송장번호
     */
    private String trsfNo;

    /**
     * 클레임건수
     */
    private int claimCnt;

    /**
     * 딜러건수
     */
    private int dlrCnt;

    /**
     * 차량건수
     */
    private int vinCnt;

    /**
     * 미전송원인
     */
    private String notSendCauseCont;

    /**
     * 미전송원인 일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date notSendDt;

    /**
     * 고품상태
     */
    private String olditemStatCd;

    /**
     * 고품상태
     */
    private String olditemStatNm;

    /**
     * 접수확인조작자
     */
    private String controllUsrId;

    /**
     * 접수확인조작자명
     */
    private String controllUsrNm;

    /**
     * 접수여부
     */
    private String acceptYn;

    /**
     * 접수여부명
     */
    private String acceptYnNm;

    /**
     * 공제여부
     */
    private String ddctYn;

    /**
     * 공제여부
     */
    private String ddctYnNm;

    /**
     * 주의사항
     */
    private String warningInfo;

    /**
     * 고품회수회사
     */
    private String olditemCmpNm;

    /**
     * 보가금액
     */
    private Double expsAmt;

    private String orgStatCd;

     /**
     * 조작일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date controllDt;



    public String getDlrCd() {
        return dlrCd;
    }

    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    public String getDlrNm() {
        return dlrNm;
    }

    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    public String getReqDeptNm() {
        return reqDeptNm;
    }

    public void setReqDeptNm(String reqDeptNm) {
        this.reqDeptNm = reqDeptNm;
    }

    public String getVinNo() {
        return vinNo;
    }

    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    public String getClaimDocNo() {
        return claimDocNo;
    }

    public void setClaimDocNo(String claimDocNo) {
        this.claimDocNo = claimDocNo;
    }

    public String getStatCd() {
        return statCd;
    }

    public void setStatCd(String statCd) {
        this.statCd = statCd;
    }

    public String getStatNm() {
        return statNm;
    }

    public void setStatNm(String statNm) {
        this.statNm = statNm;
    }

    public String getAtqReqNo() {
        return atqReqNo;
    }

    public void setAtqReqNo(String atqReqNo) {
        this.atqReqNo = atqReqNo;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public Double getRunDistVal() {
        return runDistVal;
    }

    public void setRunDistVal(Double runDistVal) {
        this.runDistVal = runDistVal;
    }

    public String getReturnDt() {
        return returnDt;
    }

    public void setReturnDt(String returnDt) {
        this.returnDt = returnDt;
    }

    public String getItemCd() {
        return itemCd;
    }

    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    public String getItemNm() {
        return itemNm;
    }

    public void setItemNm(String itemNm) {
        this.itemNm = itemNm;
    }

    public String getItemUnitCd() {
        return itemUnitCd;
    }

    public void setItemUnitCd(String itemUnitCd) {
        this.itemUnitCd = itemUnitCd;
    }

    public Double getCollcQty() {
        return collcQty;
    }

    public void setCollcQty(Double collcQty) {
        this.collcQty = collcQty;
    }

    public Double getClaimQty() {
        return claimQty;
    }

    public void setClaimQty(Double claimQty) {
        this.claimQty = claimQty;
    }

    public String getReqStatCd() {
        return reqStatCd;
    }

    public void setReqStatCd(String reqStatCd) {
        this.reqStatCd = reqStatCd;
    }

    public String getReqReasonCont() {
        return reqReasonCont;
    }

    public void setReqReasonCont(String reqReasonCont) {
        this.reqReasonCont = reqReasonCont;
    }

    public Date getCollcReqDt() {
        return collcReqDt;
    }

    public void setCollcReqDt(Date collcReqDt) {
        this.collcReqDt = collcReqDt;
    }

    public String getReqId() {
        return reqId;
    }

    public void setReqId(String reqId) {
        this.reqId = reqId;
    }

    public String getReqNm() {
        return reqNm;
    }

    public void setReqNm(String reqNm) {
        this.reqNm = reqNm;
    }

    public Date getReqDt() {
        return reqDt;
    }

    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    public String getReqDeptCd() {
        return reqDeptCd;
    }

    public void setReqDeptCd(String reqDeptCd) {
        this.reqDeptCd = reqDeptCd;
    }

    public String getCollcId() {
        return collcId;
    }

    public void setCollcId(String collcId) {
        this.collcId = collcId;
    }

    public Date getCollcDt() {
        return collcDt;
    }

    public void setCollcDt(Date collcDt) {
        this.collcDt = collcDt;
    }

    public String getDdctId() {
        return ddctId;
    }

    public void setDdctId(String ddctId) {
        this.ddctId = ddctId;
    }

    public Date getDdctDt() {
        return ddctDt;
    }

    public void setDdctDt(Date ddctDt) {
        this.ddctDt = ddctDt;
    }

    public String getGiDstinCd() {
        return giDstinCd;
    }

    public void setGiDstinCd(String giDstinCd) {
        this.giDstinCd = giDstinCd;
    }

    public Date getGiDt() {
        return giDt;
    }

    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }

    public Date getClaimStartDt() {
        return claimStartDt;
    }

    public void setClaimStartDt(Date claimStartDt) {
        this.claimStartDt = claimStartDt;
    }

    public String getGiDeptCd() {
        return giDeptCd;
    }

    public void setGiDeptCd(String giDeptCd) {
        this.giDeptCd = giDeptCd;
    }

    public String getGiId() {
        return giId;
    }

    public void setGiId(String giId) {
        this.giId = giId;
    }

    public String getReqTelNo() {
        return reqTelNo;
    }

    public void setReqTelNo(String reqTelNo) {
        this.reqTelNo = reqTelNo;
    }

    public String getGiReasonCont() {
        return giReasonCont;
    }

    public void setGiReasonCont(String giReasonCont) {
        this.giReasonCont = giReasonCont;
    }

    public double getDdctQty() {
        return ddctQty;
    }

    public void setDdctQty(double ddctQty) {
        this.ddctQty = ddctQty;
    }

    public String getRcipId() {
        return rcipId;
    }

    public void setRcipId(String rcipId) {
        this.rcipId = rcipId;
    }

    public String getRcipAddrNm() {
        return rcipAddrNm;
    }

    public void setRcipAddrNm(String rcipAddrNm) {
        this.rcipAddrNm = rcipAddrNm;
    }

    public String getRcipTelNo() {
        return rcipTelNo;
    }

    public void setRcipTelNo(String rcipTelNo) {
        this.rcipTelNo = rcipTelNo;
    }

    public String getExpsCmpNm() {
        return expsCmpNm;
    }

    public void setExpsCmpNm(String expsCmpNm) {
        this.expsCmpNm = expsCmpNm;
    }

    public String getPayTp() {
        return payTp;
    }

    public void setPayTp(String payTp) {
        this.payTp = payTp;
    }

    public String getSenderId() {
        return senderId;
    }

    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    public String getSenderTelNo() {
        return senderTelNo;
    }

    public void setSenderTelNo(String senderTelNo) {
        this.senderTelNo = senderTelNo;
    }

    public String getTrsfNo() {
        return trsfNo;
    }

    public void setTrsfNo(String trsfNo) {
        this.trsfNo = trsfNo;
    }

    public int getClaimCnt() {
        return claimCnt;
    }

    public void setClaimCnt(int claimCnt) {
        this.claimCnt = claimCnt;
    }

    public int getDlrCnt() {
        return dlrCnt;
    }

    public void setDlrCnt(int dlrCnt) {
        this.dlrCnt = dlrCnt;
    }

    public int getVinCnt() {
        return vinCnt;
    }

    public void setVinCnt(int vinCnt) {
        this.vinCnt = vinCnt;
    }

    public String getNotSendCauseCont() {
        return notSendCauseCont;
    }

    public void setNotSendCauseCont(String notSendCauseCont) {
        this.notSendCauseCont = notSendCauseCont;
    }

    public Date getNotSendDt() {
        return notSendDt;
    }

    public void setNotSendDt(Date notSendDt) {
        this.notSendDt = notSendDt;
    }

    public String getOlditemStatCd() {
        return olditemStatCd;
    }

    public void setOlditemStatCd(String olditemStatCd) {
        this.olditemStatCd = olditemStatCd;
    }

    public String getOlditemStatNm() {
        return olditemStatNm;
    }

    public void setOlditemStatNm(String olditemStatNm) {
        this.olditemStatNm = olditemStatNm;
    }

    public String getControllUsrId() {
        return controllUsrId;
    }

    public void setControllUsrId(String controllUsrId) {
        this.controllUsrId = controllUsrId;
    }

    public String getControllUsrNm() {
        return controllUsrNm;
    }

    public void setControllUsrNm(String controllUsrNm) {
        this.controllUsrNm = controllUsrNm;
    }

    public String getAcceptYn() {
        return acceptYn;
    }

    public void setAcceptYn(String acceptYn) {
        this.acceptYn = acceptYn;
    }

    public String getAcceptYnNm() {
        return acceptYnNm;
    }

    public void setAcceptYnNm(String acceptYnNm) {
        this.acceptYnNm = acceptYnNm;
    }

    public String getDdctYn() {
        return ddctYn;
    }

    public void setDdctYn(String ddctYn) {
        this.ddctYn = ddctYn;
    }

    public String getDdctYnNm() {
        return ddctYnNm;
    }

    public void setDdctYnNm(String ddctYnNm) {
        this.ddctYnNm = ddctYnNm;
    }

    public String getWarningInfo() {
        return warningInfo;
    }

    public void setWarningInfo(String warningInfo) {
        this.warningInfo = warningInfo;
    }

    public String getOlditemCmpNm() {
        return olditemCmpNm;
    }

    public void setOlditemCmpNm(String olditemCmpNm) {
        this.olditemCmpNm = olditemCmpNm;
    }

    public Double getExpsAmt() {
        return expsAmt;
    }

    public void setExpsAmt(Double expsAmt) {
        this.expsAmt = expsAmt;
    }

    public String getOrgStatCd() {
        return orgStatCd;
    }

    public void setOrgStatCd(String orgStatCd) {
        this.orgStatCd = orgStatCd;
    }

    public Date getControllDt() {
        return controllDt;
    }

    public void setControllDt(Date controllDt) {
        this.controllDt = controllDt;
    }

    /**
     * {@inheritDoc}
     */
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {
        try{
            switch(cellNo){
                //딜러 ,클레임번호,부품번호,부품명,수량,회수수량,단위,vin,주행거리,요청상태,신청자,신청일자,신청인연락처,  수취인, 접수자연락처,  주소
                //택배회사    요청부서    보가금액    고품회수회사  주의사항    회수건의

                case 0:this.setDlrCd(ExcelDataBinderUtil.toString(value).trim());            break;          //딜러코드
                case 1:this.setClaimDocNo(ExcelDataBinderUtil.toString(value).trim());       break;          //클레임번호
                case 2:this.setItemCd(ExcelDataBinderUtil.toString(value).trim());           break;          //부품코드
                case 3:this.setItemNm(ExcelDataBinderUtil.toString(value).trim());           break;          //부품명
                case 4:this.setClaimQty(ExcelDataBinderUtil.getDoubleValue(value));          break;          //클레임수량
                case 5:this.setItemUnitCd(ExcelDataBinderUtil.toString(value).trim());       break;          //단위
                case 6:this.setVinNo(ExcelDataBinderUtil.toString(value).trim());            break;          //VIN NO
                case 7:this.setRunDistVal(ExcelDataBinderUtil.getDoubleValue(value));        break;          //주행거리
                case 8:this.setStatCd(ExcelDataBinderUtil.toString(value).trim());          break;          //요청상태
                case 9:this.setReqId(ExcelDataBinderUtil.toString(value).trim());           break;          //신청자
                case 10:this.setReqDt(ExcelDataBinderUtil.getDateValue(value,"yyyy-MM-dd")); break;          //요청일
                case 11:this.setRcipTelNo(ExcelDataBinderUtil.toString(value).trim());       break;          //신청인연락처
                case 12:this.setRcipId(ExcelDataBinderUtil.toString(value).trim());          break;          //수취인
                case 13:this.setReqTelNo(ExcelDataBinderUtil.toString(value).trim());        break;          //접수자연락처
                case 14:this.setRcipAddrNm(ExcelDataBinderUtil.toString(value).trim());      break;          //주소
                case 15:this.setExpsCmpNm(ExcelDataBinderUtil.toString(value).trim());       break;          //택배회사
                case 16:this.setReqDeptCd(ExcelDataBinderUtil.toString(value).trim());       break;          //요청부서
                case 17:this.setExpsAmt(ExcelDataBinderUtil.getDoubleValue(value));          break;          //보가금액
                case 18:this.setOlditemCmpNm(ExcelDataBinderUtil.toString(value).trim());    break;          //고품회수회사
                case 19:this.setWarningInfo(ExcelDataBinderUtil.toString(value).trim());     break;          //주의사항
                case 20:this.setReqReasonCont(ExcelDataBinderUtil.toString(value).trim());   break;          //회수건의
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
//딜러 ,클레임번호,부품번호,부품명,수량,회수수량,단위,vin,주행거리,요청상태,신청자,신청일자,신청인연락처,  수취인, 접수자연락처,  주소
//택배회사    요청부서    보가금액    고품회수회사  주의사항    회수건의
        /*
        //딜러코드
        if(StringUtils.isBlank(this.getDlrCd())){
            String msg = messageSource.getMessage("global.info.required.field"
                , new String[]{messageSource.getMessage("ser.lbl.dealerCo", null, LocaleContextHolder.getLocale())}
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 0, this.getDlrCd(), msg));
        }

        //클레임번호
        if(StringUtils.isBlank(this.getClaimDocNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field", new String[]{messageSource.getMessage("ser.lbl.claimNo", null, LocaleContextHolder.getLocale())}
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 1, this.getClaimDocNo(), msg));
        }

        //품목코드
        if(StringUtils.isBlank(this.getItemCd())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{messageSource.getMessage("ser.lbl.oitemCd", null, LocaleContextHolder.getLocale())}
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 2, this.getItemCd(), msg));
        }


        //클레임수량
        if(this.getClaimQty() == 0 || this.getClaimQty() == null ){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{messageSource.getMessage("ser.lbl.qty", null, LocaleContextHolder.getLocale())}
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 3, this.getCollcQty().toString(), msg));
        }

        //VIN NO
        if(StringUtils.isBlank(this.getVinNo())){

            String msg = messageSource.getMessage(
                "global.info.required.field"
                , new String[]{messageSource.getMessage("ser.lbl.vinNo", null, LocaleContextHolder.getLocale())}
                , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 4, this.getVinNo(), msg));
        }
        //요청일
        if(StringUtils.isBlank(ExcelDataBinderUtil.getStrValue(this.getReqDt()))){

            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{messageSource.getMessage("ser.lbl.reqDt", null, LocaleContextHolder.getLocale())}
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 5, ExcelDataBinderUtil.getStrValue(this.getReqDt()), msg));
        }

        //요청일
        if(StringUtils.isBlank( this.getRcipId() )){

            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{messageSource.getMessage("sal.lbl.requestUsr", null, LocaleContextHolder.getLocale())}
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 6, this.getRcipId(), msg));
        }
        //신청인연락처
        if(StringUtils.isBlank( this.getRcipTelNo() )){

            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{messageSource.getMessage("ser.lbl.olditemReqHp", null, LocaleContextHolder.getLocale())}
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 7, this.getRcipTelNo(), msg));
        }
        //접수자연락처
        if(StringUtils.isBlank( this.getReqTelNo() )){

            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{messageSource.getMessage("ser.lbl.oldItemAcceptHp", null, LocaleContextHolder.getLocale())}
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 8, this.getReqTelNo(), msg));
        }
        //접수자연락처
        if(StringUtils.isBlank( this.getRcipAddrNm() )){

            String msg = messageSource.getMessage(
                    "global.info.required.field"
                    , new String[]{messageSource.getMessage("ser.lbl.addr", null, LocaleContextHolder.getLocale())}
                    , LocaleContextHolder.getLocale()
            );

            errors.add(new ExcelUploadError(context.getRow(), 9, this.getRcipAddrNm(), msg));
        }
         */

        return errors;


    }



}
