package chn.bhmc.dms.crm.cso.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 시승 차량 VO

 *
 * @ClassName   : TestDriveCarVO.java
 * @Description : TestDriveCarVO Class
 * @author in moon lee
 * @since 2016.04.20
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.20     in moon lee     최초 생성
 * </pre>
 */

@ValidDescriptor({

     @ValidField(field="dlrCd"      , mesgKey="crm.lbl.dlrCd")          // 딜러코드
    ,@ValidField(field="pltCd"      , mesgKey="crm.lbl.pltCd")          // 센터코드
    ,@ValidField(field="tdrvVinNo"  , mesgKey="crm.lbl.tdrvVinNo")      // 시승차대번호
    ,@ValidField(field="useYn"      , mesgKey="crm.lbl.useYn")          // 사용여부
    ,@ValidField(field="tdrvCont"   , mesgKey="crm.lbl.tdrvCont")       // 사용중지상세
    ,@ValidField(field="regUsrId"   , mesgKey="global.lbl.regUsrId")    // 등록자
    ,@ValidField(field="regDt"      , mesgKey="global.lbl.regDt")       // 등록일
    ,@ValidField(field="updtUsrId"  , mesgKey="global.lbl.updtUsrId")   // 수정자
    ,@ValidField(field="updtDt"     , mesgKey="global.lbl.updtDt")      // 수정일

})

public class TestDriveCarVO extends BaseVO {


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2370917433253441449L;

    /**
     * 딜러코드
     **/
    private  String            dlrCd;

    /**
     * 센터코드
     **/
    private  String            pltCd;

    /**
     * 시승차대번호
     **/
    private  String            tdrvVinNo;

    /**
     * 사용여부
     **/
    private  String            useYn;

    /**
     * 사용중지 상세
     **/
    private  String            tdrvCont;

    /**
     * 주행거리
     **/
    private  int               runDistVal;

    /**
     * 등록자ID
     **/
    private  String            regUsrId;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              regDt;

    /**
     * 수정자ID
     **/
    private  String            updtUsrId;

    /**
     * 수정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              updtDt;

    private  String            carlineCd;           //관심차종
    private  String            carlineNm;           //관심차종 이름
    private  String            modelCd;             //관심모델
    private  String            modelNm;             //관심모델 이름
    private  String            carRegNo;            //모델번호
    private  String            extColorCd;          //외장색

    private  String            carInfo; // 스케쥴러 우측 차량정보
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
     * @return the tdrvVinNo
     */
    public String getTdrvVinNo() {
        return tdrvVinNo;
    }
    /**
     * @param tdrvVinNo the tdrvVinNo to set
     */
    public void setTdrvVinNo(String tdrvVinNo) {
        this.tdrvVinNo = tdrvVinNo;
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
     * @return the tdrvCont
     */
    public String getTdrvCont() {
        return tdrvCont;
    }
    /**
     * @param tdrvCont the tdrvCont to set
     */
    public void setTdrvCont(String tdrvCont) {
        this.tdrvCont = tdrvCont;
    }
    /**
     * @return the runDistVal
     */
    public int getRunDistVal() {
        return runDistVal;
    }
    /**
     * @param runDistVal the runDistVal to set
     */
    public void setRunDistVal(int runDistVal) {
        this.runDistVal = runDistVal;
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
     * @return the extColorCd
     */
    public String getExtColorCd() {
        return extColorCd;
    }
    /**
     * @param extColorCd the extColorCd to set
     */
    public void setExtColorCd(String extColorCd) {
        this.extColorCd = extColorCd;
    }

    /**
     * @return the carInfo
     */
    public String getCarInfo() {
        carInfo = carlineNm+"/"+" "+modelNm+"/"+carRegNo+"/"+tdrvVinNo;
        return carInfo;
    }
    /**
     * @param carInfo the carInfo to set
     */
    public void setCarInfo(String carInfo) {
        this.carInfo = carInfo;
    }

}

