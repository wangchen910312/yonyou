package chn.bhmc.dms.sal.dsc.vo;

import java.util.Date;

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
 * @ClassName   : JudgeStepFixVO
 * @Description : 일상업무등급관리(심사단계설정) 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016.04.21      Kim Jin Suk        최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="wrkDstinCd" , mesgKey="sal.lbl.wrkDstinCd")
   ,@ValidField(field="gradeCd"    , mesgKey="sal.lbl.gradeCd")
   ,@ValidField(field="regUsrId"   , mesgKey="sal.lbl.regUsrId")
   ,@ValidField(field="regDt"      , mesgKey="sal.lbl.regDt")
   ,@ValidField(field="updtUsrId"  , mesgKey="sal.lbl.updtUsrId")
   ,@ValidField(field="updtDt"     , mesgKey="sal.lbl.updtDt")
})
public class JudgeStepFixVO extends BaseVO{
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4737676315192109273L;


    /**
     * 업무구분코드
     **/
    private  String      wrkDstinCd;

    /**
     * 업무구분코드명
     **/
    private  String      wrkDstinNm;

    /**
     * 등급코드
     **/
    private  String      gradeCd;

    /**
     * 1급
     */
    private  String      one;

    /**
     * 2급
     */
    private  String      two;

    /**
     * 3급
     */
    private  String      three;

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
    //UPDT_USR_ID

    private  String      updtUsrId;

    /**
     * 수정일자
     **/
    //UPDT_DT
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date        updtDt;

    /**
     * @return the wrkDstinCd
     */
    public String getWrkDstinCd() {
        return wrkDstinCd;
    }

    /**
     * @param wrkDstinCd the wrkDstinCd to set
     */
    public void setWrkDstinCd(String wrkDstinCd) {
        this.wrkDstinCd = wrkDstinCd;
    }

    /**
     * @return the wrkDstinNm
     */
    public String getWrkDstinNm() {
        return wrkDstinNm;
    }

    /**
     * @param wrkDstinNm the wrkDstinNm to set
     */
    public void setWrkDstinNm(String wrkDstinNm) {
        this.wrkDstinNm = wrkDstinNm;
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
     * @return the one
     */
    public String getOne() {
        return one;
    }

    /**
     * @param one the one to set
     */
    public void setOne(String one) {
        this.one = one;
    }

    /**
     * @return the two
     */
    public String getTwo() {
        return two;
    }

    /**
     * @param two the two to set
     */
    public void setTwo(String two) {
        this.two = two;
    }

    /**
     * @return the three
     */
    public String getThree() {
        return three;
    }

    /**
     * @param three the three to set
     */
    public void setThree(String three) {
        this.three = three;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
