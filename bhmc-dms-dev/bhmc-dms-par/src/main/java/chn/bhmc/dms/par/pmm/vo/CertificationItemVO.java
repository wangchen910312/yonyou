package chn.bhmc.dms.par.pmm.vo;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.support.excel.AbstractExcelDataBinder;
import chn.bhmc.dms.core.support.excel.ExcelDataBindContext;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelUploadError;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 합격증 VO
 * </pre>
 *
 * @ClassName   : CertificationItemVO.java
 * @Description : CertificationItemVO.class
 * @author Eun Jung Jang
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.     Eun Jung Jang     최초 생성
 * </pre>
 */

@ValidDescriptor({
     @ValidField(field="dlrCd"                , mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="certNo"               , mesgKey="par.lbl.certNo")
    ,@ValidField(field="certStatCd"           , mesgKey="par.lbl.certStatCd")
    ,@ValidField(field="certTp"               , mesgKey="par.lbl.certTp")
    ,@ValidField(field="telNo"                , mesgKey="par.lbl.telNo")
    ,@ValidField(field="hpNo"                 , mesgKey="par.lbl.hpNo")
    ,@ValidField(field="custNo"               , mesgKey="par.lbl.custNo")
    ,@ValidField(field="custNm"               , mesgKey="par.lbl.custNm")
    ,@ValidField(field="itemCd"               , mesgKey="par.lbl.itemCd")
    ,@ValidField(field="itemNm"               , mesgKey="par.lbl.itemNm")
    ,@ValidField(field="baseVinNo"            , mesgKey="par.lbl.baseVinNo")
    ,@ValidField(field="newVinNo"             , mesgKey="par.lbl.newVinNo")
    ,@ValidField(field="carBodyVinNo"         , mesgKey="par.lbl.carBodyVinNo")
    ,@ValidField(field="detlCont"             , mesgKey="par.lbl.detlCont")
    ,@ValidField(field="evalRsltNm"           , mesgKey="par.lbl.evalRsltNm")
    ,@ValidField(field="evalOpnCont"          , mesgKey="par.lbl.evalOpnCont")
    ,@ValidField(field="zipCd"                , mesgKey="par.lbl.zipCd")
    ,@ValidField(field="zipSendDt"            , mesgKey="par.lbl.zipSendDt")
    ,@ValidField(field="procRsltDetlCont"     , mesgKey="par.lbl.procRsltDetlCont")
    ,@ValidField(field="trsfCmpCd"            , mesgKey="par.lbl.trsfCmpCd")
    ,@ValidField(field="oldEnginCylPhotoNm"   , mesgKey="par.lbl.oldEnginCylPhotoNm")
    ,@ValidField(field="oldEnginCylNo"        , mesgKey="par.lbl.oldEnginCylNo")
    ,@ValidField(field="newEnginCylPhotoNm"   , mesgKey="par.lbl.newEnginCylPhotoNm")
    ,@ValidField(field="newEnginCylNo"        , mesgKey="par.lbl.newEnginCylNo")
    ,@ValidField(field="fileDocNo"            , mesgKey="par.lbl.fileDocNo")
    ,@ValidField(field="regUsrId"             , mesgKey="par.lbl.regUsrId")
    ,@ValidField(field="regDt"                , mesgKey="par.lbl.regDt")
    ,@ValidField(field="updtUsrId"            , mesgKey="par.lbl.updtUsrId")
    ,@ValidField(field="updtDt"               , mesgKey="par.lbl.updtDt")
})

public class CertificationItemVO extends AbstractExcelDataBinder {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1193013746207144208L;

    /**
        * 딜러코드
        **/
       @NotEmpty

       private  String                dlrCd;

       /**
        * 합격증번호
        **/

       private  String                certNo;

       /**
        * 합격증상태코드
        **/
       //CERT_STAT_CD

       private  String                certStatCd;

       /**
        * 합격증유형
        **/
       //CERT_TP

       private  String                certTp;

       /**
        * 전화번호
        **/
       //TEL_NO

       private  String                telNo;

       /**
        * 휴대폰번호
        **/
       //HP_NO

       private  String                hpNo;

       /**
        * 고객번호
        **/
       @NotEmpty

       private  String                custNo;

       /**
        * 고객명
        **/
       //CUST_NM

       private  String                custNm;

       /**
        * 품목코드
        **/
       //ITEM_CD

       private  String                itemCd;

       /**
        * 품목명
        **/
       //ITEM_NM

       private  String                itemNm;

       /**
        * 원차대번호
        **/
       @NotEmpty

       private  String                baseVinNo;

       /**
        * 신차대번호
        **/
       //NEW_VIN_NO

       private  String                newVinNo;

       /**
        * 차량바디차대번호
        **/
       //CAR_BODY_VIN_NO

       private  String                carBodyVinNo;

       /**
        * 상세내용
        **/
       //DETL_CONT

       private  String                detlCont;

       /**
        * 심사결과명(BMP I/F)
        **/
       //EVAL_RSLT_NM

       private  String                evalRsltNm;

       /**
        * 심사의견내용(BMP I/F)
        **/
       //EVAL_OPN_CONT

       private  String                evalOpnCont;

       /**
        * 우편번호(BMP I/F)
        **/
       //ZIP_CD

       private  String                zipCd;

       /**
        * 우편발송일자(BMP I/F)
        **/
       //ZIP_SEND_DT
       @JsonDeserialize(using=JsonDateDeserializer.class)
       private  Date                  zipSendDt;

       /**
        * 처리결과상세내용(BMP I/F)
        **/
       //PROC_RSLT_DETL_CONT

       private  String                procRsltDetlCont;

       /**
        * 운송회사코드(BMP I/F)
        **/
       //TRSF_CMP_CD

       private  String                trsfCmpCd;

       /**
        * 구엔진실린더사진명(BMP I/F)
        **/
       //OLD_ENGIN_CYL_PHOTO_NM

       private  String                oldEnginCylPhotoNm;

       /**
        * 구엔진실린더번호(BMP I/F)
        **/
       //OLD_ENGIN_CYL_NO

       private  String                oldEnginCylNo;

       /**
        * 신엔진실린더사진명(BMP I/F)
        **/
       //NEW_ENGIN_CYL_PHOTO_NM

       private  String                newEnginCylPhotoNm;

       /**
        * 신엔진실린더번호(BMP I/F)
        **/
       //NEW_ENGIN_CYL_NO

       private  String                newEnginCylNo;

       /**
        * 첨부파일문서번호(BMP I/F)
        **/
       //FILE_DOC_NO

       private  String                fileDocNo;

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
     * @return the certNo
     */
    public String getCertNo() {
        return certNo;
    }

    /**
     * @param certNo the certNo to set
     */
    public void setCertNo(String certNo) {
        this.certNo = certNo;
    }

    /**
     * @return the certStatCd
     */
    public String getCertStatCd() {
        return certStatCd;
    }

    /**
     * @param certStatCd the certStatCd to set
     */
    public void setCertStatCd(String certStatCd) {
        this.certStatCd = certStatCd;
    }

    /**
     * @return the certTp
     */
    public String getCertTp() {
        return certTp;
    }

    /**
     * @param certTp the certTp to set
     */
    public void setCertTp(String certTp) {
        this.certTp = certTp;
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
     * @return the baseVinNo
     */
    public String getBaseVinNo() {
        return baseVinNo;
    }

    /**
     * @param baseVinNo the baseVinNo to set
     */
    public void setBaseVinNo(String baseVinNo) {
        this.baseVinNo = baseVinNo;
    }

    /**
     * @return the newVinNo
     */
    public String getNewVinNo() {
        return newVinNo;
    }

    /**
     * @param newVinNo the newVinNo to set
     */
    public void setNewVinNo(String newVinNo) {
        this.newVinNo = newVinNo;
    }

    /**
     * @return the carBodyVinNo
     */
    public String getCarBodyVinNo() {
        return carBodyVinNo;
    }

    /**
     * @param carBodyVinNo the carBodyVinNo to set
     */
    public void setCarBodyVinNo(String carBodyVinNo) {
        this.carBodyVinNo = carBodyVinNo;
    }

    /**
     * @return the detlCont
     */
    public String getDetlCont() {
        return detlCont;
    }

    /**
     * @param detlCont the detlCont to set
     */
    public void setDetlCont(String detlCont) {
        this.detlCont = detlCont;
    }

    /**
     * @return the evalRsltNm
     */
    public String getEvalRsltNm() {
        return evalRsltNm;
    }

    /**
     * @param evalRsltNm the evalRsltNm to set
     */
    public void setEvalRsltNm(String evalRsltNm) {
        this.evalRsltNm = evalRsltNm;
    }

    /**
     * @return the evalOpnCont
     */
    public String getEvalOpnCont() {
        return evalOpnCont;
    }

    /**
     * @param evalOpnCont the evalOpnCont to set
     */
    public void setEvalOpnCont(String evalOpnCont) {
        this.evalOpnCont = evalOpnCont;
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
     * @return the zipSendDt
     */
    public Date getZipSendDt() {
        return zipSendDt;
    }

    /**
     * @param zipSendDt the zipSendDt to set
     */
    public void setZipSendDt(Date zipSendDt) {
        this.zipSendDt = zipSendDt;
    }

    /**
     * @return the procRsltDetlCont
     */
    public String getProcRsltDetlCont() {
        return procRsltDetlCont;
    }

    /**
     * @param procRsltDetlCont the procRsltDetlCont to set
     */
    public void setProcRsltDetlCont(String procRsltDetlCont) {
        this.procRsltDetlCont = procRsltDetlCont;
    }

    /**
     * @return the trsfCmpCd
     */
    public String getTrsfCmpCd() {
        return trsfCmpCd;
    }

    /**
     * @param trsfCmpCd the trsfCmpCd to set
     */
    public void setTrsfCmpCd(String trsfCmpCd) {
        this.trsfCmpCd = trsfCmpCd;
    }

    /**
     * @return the oldEnginCylPhotoNm
     */
    public String getOldEnginCylPhotoNm() {
        return oldEnginCylPhotoNm;
    }

    /**
     * @param oldEnginCylPhotoNm the oldEnginCylPhotoNm to set
     */
    public void setOldEnginCylPhotoNm(String oldEnginCylPhotoNm) {
        this.oldEnginCylPhotoNm = oldEnginCylPhotoNm;
    }

    /**
     * @return the oldEnginCylNo
     */
    public String getOldEnginCylNo() {
        return oldEnginCylNo;
    }

    /**
     * @param oldEnginCylNo the oldEnginCylNo to set
     */
    public void setOldEnginCylNo(String oldEnginCylNo) {
        this.oldEnginCylNo = oldEnginCylNo;
    }

    /**
     * @return the newEnginCylPhotoNm
     */
    public String getNewEnginCylPhotoNm() {
        return newEnginCylPhotoNm;
    }

    /**
     * @param newEnginCylPhotoNm the newEnginCylPhotoNm to set
     */
    public void setNewEnginCylPhotoNm(String newEnginCylPhotoNm) {
        this.newEnginCylPhotoNm = newEnginCylPhotoNm;
    }

    /**
     * @return the newEnginCylNo
     */
    public String getNewEnginCylNo() {
        return newEnginCylNo;
    }

    /**
     * @param newEnginCylNo the newEnginCylNo to set
     */
    public void setNewEnginCylNo(String newEnginCylNo) {
        this.newEnginCylNo = newEnginCylNo;
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

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#bind(int, int, java.lang.Object)
     */
    @Override
    public void bind(int rowNo, int cellNo, Object value) throws ExcelDataBindingException {


    }

    /*
     * @see chn.bhmc.dms.core.support.excel.ExcelDataBinder#validate(chn.bhmc.dms.core.support.excel.ExcelDataBindContext)
     */
    @Override
    public List<ExcelUploadError> validate(ExcelDataBindContext context) {

        return null;
    }





}
