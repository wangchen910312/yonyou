package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 시승 노선 VO

 *
 * @ClassName   : TestDriveClineVO.java
 * @Description : TestDriveClineVO Class
 * @author in moon lee
 * @since 2016.05.12
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.05.12     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"      , mesgKey="crm.lbl.dlrCd")          // 딜러코드
    ,@ValidField(field="pltCd"      , mesgKey="crm.lbl.pltCd")          // 센터코드
    ,@ValidField(field="clineDocNo" , mesgKey="crm.lbl.clineDocNo")     // 노선문서번호
    ,@ValidField(field="clineSeq"   , mesgKey="crm.lbl.clineSeq")       // 노선일련번호
    ,@ValidField(field="clineNm"    , mesgKey="crm.lbl.clineNm")        // 노선명
    ,@ValidField(field="useYn"      , mesgKey="crm.lbl.useYn")          // 사용여부
    ,@ValidField(field="regUsrId"   , mesgKey="global.lbl.regUsrId")    // 등록자
    ,@ValidField(field="regDt"      , mesgKey="global.lbl.regDt")       // 등록일
    ,@ValidField(field="updtUsrId"  , mesgKey="global.lbl.updtUsrId")   // 수정자
    ,@ValidField(field="updtDt"     , mesgKey="global.lbl.updtDt")      // 수정일

})

public class TestDriveClineVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3451162124970060342L;

    /**
     * 딜러코드
     **/
    private  String      dlrCd;

    /**
     * 센터코드
     **/
    private  String      pltCd;


    /**
     * 노선문서번호
     **/
    @NotBlank
    private  String      clineDocNo;

    /**
     * 노선일련번호
     **/
    private  int         clineSeq;

    /**
     * 노선명
     **/
    @NotBlank
    private  String      clineNm;

    /**
     * 사용여부
     **/
    @NotBlank
    private  String      useYn;

    /**
     * 등록자ID
     **/
    private  String      regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        regDt;

    /**
     * 수정자ID
     **/
    private  String      updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        updtDt;

    private  String      fileDocNo;
    private  int         fileNo;

    @NotBlank
    private  String      fileNm;

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
     * @return the clineDocNo
     */
    public String getClineDocNo() {
        return clineDocNo;
    }

    /**
     * @param clineDocNo the clineDocNo to set
     */
    public void setClineDocNo(String clineDocNo) {
        this.clineDocNo = clineDocNo;
    }

    /**
     * @return the clineSeq
     */
    public int getClineSeq() {
        return clineSeq;
    }

    /**
     * @param clineSeq the clineSeq to set
     */
    public void setClineSeq(int clineSeq) {
        this.clineSeq = clineSeq;
    }

    /**
     * @return the clineNm
     */
    public String getClineNm() {
        return clineNm;
    }

    /**
     * @param clineNm the clineNm to set
     */
    public void setClineNm(String clineNm) {
        this.clineNm = clineNm;
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
     * @return the fileNo
     */
    public int getFileNo() {
        return fileNo;
    }

    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }

    /**
     * @return the fileNm
     */
    public String getFileNm() {
        return fileNm;
    }

    /**
     * @param fileNm the fileNm to set
     */
    public void setFileNm(String fileNm) {
        this.fileNm = fileNm;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return "TestDriveClineVO [dlrCd=" + dlrCd + ", pltCd=" + pltCd + ", clineDocNo=" + clineDocNo + ", clineSeq="
                + clineSeq + ", clineNm=" + clineNm + ", useYn=" + useYn + ", regUsrId=" + regUsrId + ", regDt="
                + regDt + ", updtUsrId=" + updtUsrId + ", updtDt=" + updtDt + ", fileDocNo=" + fileDocNo + ", fileNo="
                + fileNo + ", fileNm=" + fileNm + "]";
    }
}