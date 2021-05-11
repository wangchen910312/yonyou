package chn.bhmc.dms.sal.usc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalImageVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class PurcEvalImageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String dlrCd;                       //딜러코드
    private String purcNo;                      //매입번호
    private String dlrNm;                       //딜러명
    private String custNm;                      //고객명
    private String imsNm;                       //제조사명
    private String carModelCd;                  //차량모델명
    private String telNo;                       //전화번호
    private String carNo;                       //차량번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date giDt;                        //출고일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carRegDt;                      //차량등록일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carOwnChgHisDt;                //차량명의변경이력일자(라스트등록일자)
    private String vinNo;                       //차대번호
    private String enginNo;                     //엔진번호
    private String carDispQty;                  //차량배기량
    private String extColorNm;                  //외장색상명
    private String intColorNm;                  //내장색상명
    private String drvMthCd;                    //구동방식코드
    private String trmsTp;                      //변속기유형
    private String fuelCd;                      //연료코드
    private String carUseTp;                    //차량용도유형
    private String srfDstinCd;                  //썬루프구분코드
    private int airbackQty;                     //에어백수량
    private String seatTp;                      //시트유형
    private String airconTp;                   //에어컨유형
    private String stcTp;                       //시동유형
    private String elecSeatYn;                  //전동시트여부
    private String heatSeatYn;                  //열선시트여부
    private String airSeatYn;                   //통풍시트여부
    private String dvdYn;                       //DVD여부
    private String naviYn;                      //네비게이션여부
    private String rcamYn;                      //후방카메라여부
    private String autoHlgtYn;                  //오토헤드라이트여부
    private String hidHlampYn;                  //HID헤드램프여부
    private String haloLampYn;                  //할로겐램프여부
    private String regCertYn;                   //등록증여부
    private String runCertYn;                   //주행증여부
    private String purcTaxCertYn;               //구매세금증명서여부
    private String purcCertYn;                  //구매증명서여부
    private String ownChgRcptYn;                //명의변경영수증여부
    private String commInsYn;                   //상업보험여부
    private String spcInsYn;                    //교강보험여부
    private String envPrtcLabelYn;              //환경보호라벨여부
    private String commInsValidYyMm;            //상업보험유효일자
    private String commInsValidDtYear;          //상업보험유효일자 - 년
    private String commInsValidDtMonth;         //상업보험유효일자 - 월
    private String spcIncValidYyMm;             //교강보험유효일자
    private String spcIncValidDtYear;           //교강보험유효일자 - 년
    private String spcIncValidDtMonth;          //교강보험유효일자 - 월
    private String etcCont;                     //기타내용
    private String extCont;                     //외장내용
    private String intCont;                     //내장내용
    private String vinCont;                     //차대내용
    private String mechCont;                    //기계내용
    private String statCont;                    //상태코드
    private String totEvalCont;                 //종합평가내용
    private String carAccCont;                  //차량악세서리내용
    private String remark;                      //비고
    private Double ncarPltGuidePrc;             //신차량공장지도가격
    private Double ncarMarketPrc;               //신차량시장가격
    private Double custHopePrc;                 //고객희망가격
    private Double evalCmpEstPrc;               //평가사견적가격
    private Double lastContractPrc;             //최종계약가격
    private String regUsrId;                    //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                         //등록일자
    private String updtUsrId;                   //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                        //수정일자




    /**
     * @return the commInsValidYyMm
     */
    public String getCommInsValidYyMm() {
        return commInsValidYyMm;
    }
    /**
     * @param commInsValidYyMm the commInsValidYyMm to set
     */
    public void setCommInsValidYyMm(String commInsValidYyMm) {
        this.commInsValidYyMm = commInsValidYyMm;
    }
    /**
     * @return the spcIncValidYyMm
     */
    public String getSpcIncValidYyMm() {
        return spcIncValidYyMm;
    }
    /**
     * @param spcIncValidYyMm the spcIncValidYyMm to set
     */
    public void setSpcIncValidYyMm(String spcIncValidYyMm) {
        this.spcIncValidYyMm = spcIncValidYyMm;
    }
    /**
     * @return the commInsValidDtYear
     */
    public String getCommInsValidDtYear() {
        return commInsValidDtYear;
    }
    /**
     * @param commInsValidDtYear the commInsValidDtYear to set
     */
    public void setCommInsValidDtYear(String commInsValidDtYear) {
        this.commInsValidDtYear = commInsValidDtYear;
    }
    /**
     * @return the commInsValidDtMonth
     */
    public String getCommInsValidDtMonth() {
        return commInsValidDtMonth;
    }
    /**
     * @param commInsValidDtMonth the commInsValidDtMonth to set
     */
    public void setCommInsValidDtMonth(String commInsValidDtMonth) {
        this.commInsValidDtMonth = commInsValidDtMonth;
    }
    /**
     * @return the spcIncValidDtYear
     */
    public String getSpcIncValidDtYear() {
        return spcIncValidDtYear;
    }
    /**
     * @param spcIncValidDtYear the spcIncValidDtYear to set
     */
    public void setSpcIncValidDtYear(String spcIncValidDtYear) {
        this.spcIncValidDtYear = spcIncValidDtYear;
    }
    /**
     * @return the spcIncValidDtMonth
     */
    public String getSpcIncValidDtMonth() {
        return spcIncValidDtMonth;
    }
    /**
     * @param spcIncValidDtMonth the spcIncValidDtMonth to set
     */
    public void setSpcIncValidDtMonth(String spcIncValidDtMonth) {
        this.spcIncValidDtMonth = spcIncValidDtMonth;
    }
    /**
     * @return the giDt
     */
    public Date getGiDt() {
        return giDt;
    }
    /**
     * @param giDt the giDt to set
     */
    public void setGiDt(Date giDt) {
        this.giDt = giDt;
    }
    /**
     * @return the airconTp
     */
    public String getAirconTp() {
        return airconTp;
    }
    /**
     * @param airconTp the airconTp to set
     */
    public void setAirconTp(String airconTp) {
        this.airconTp = airconTp;
    }
    /**
     * @return the airbackQty
     */
    public int getAirbackQty() {
        return airbackQty;
    }
    /**
     * @param airbackQty the airbackQty to set
     */
    public void setAirbackQty(int airbackQty) {
        this.airbackQty = airbackQty;
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
     * @return the purcNo
     */
    public String getPurcNo() {
        return purcNo;
    }
    /**
     * @param purcNo the purcNo to set
     */
    public void setPurcNo(String purcNo) {
        this.purcNo = purcNo;
    }
    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }
    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
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
     * @return the imsNm
     */
    public String getImsNm() {
        return imsNm;
    }
    /**
     * @param imsNm the imsNm to set
     */
    public void setImsNm(String imsNm) {
        this.imsNm = imsNm;
    }
    /**
     * @return the carModelCd
     */
    public String getCarModelCd() {
        return carModelCd;
    }
    /**
     * @param carModelCd the carModelCd to set
     */
    public void setCarModelCd(String carModelCd) {
        this.carModelCd = carModelCd;
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
     * @return the carNo
     */
    public String getCarNo() {
        return carNo;
    }
    /**
     * @param carNo the carNo to set
     */
    public void setCarNo(String carNo) {
        this.carNo = carNo;
    }
    /**
     * @return the carRegDt
     */
    public Date getCarRegDt() {
        return carRegDt;
    }
    /**
     * @param carRegDt the carRegDt to set
     */
    public void setCarRegDt(Date carRegDt) {
        this.carRegDt = carRegDt;
    }
    /**
     * @return the carOwnChgHisDt
     */
    public Date getCarOwnChgHisDt() {
        return carOwnChgHisDt;
    }
    /**
     * @param carOwnChgHisDt the carOwnChgHisDt to set
     */
    public void setCarOwnChgHisDt(Date carOwnChgHisDt) {
        this.carOwnChgHisDt = carOwnChgHisDt;
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
     * @return the enginNo
     */
    public String getEnginNo() {
        return enginNo;
    }
    /**
     * @param enginNo the enginNo to set
     */
    public void setEnginNo(String enginNo) {
        this.enginNo = enginNo;
    }
    /**
     * @return the carDispQty
     */
    public String getCarDispQty() {
        return carDispQty;
    }
    /**
     * @param carDispQty the carDispQty to set
     */
    public void setCarDispQty(String carDispQty) {
        this.carDispQty = carDispQty;
    }
    /**
     * @return the extColorNm
     */
    public String getExtColorNm() {
        return extColorNm;
    }
    /**
     * @param extColorNm the extColorNm to set
     */
    public void setExtColorNm(String extColorNm) {
        this.extColorNm = extColorNm;
    }
    /**
     * @return the intColorNm
     */
    public String getIntColorNm() {
        return intColorNm;
    }
    /**
     * @param intColorNm the intColorNm to set
     */
    public void setIntColorNm(String intColorNm) {
        this.intColorNm = intColorNm;
    }
    /**
     * @return the drvMthCd
     */
    public String getDrvMthCd() {
        return drvMthCd;
    }
    /**
     * @param drvMthCd the drvMthCd to set
     */
    public void setDrvMthCd(String drvMthCd) {
        this.drvMthCd = drvMthCd;
    }
    /**
     * @return the trmsTp
     */
    public String getTrmsTp() {
        return trmsTp;
    }
    /**
     * @param trmsTp the trmsTp to set
     */
    public void setTrmsTp(String trmsTp) {
        this.trmsTp = trmsTp;
    }
    /**
     * @return the fuelCd
     */
    public String getFuelCd() {
        return fuelCd;
    }
    /**
     * @param fuelCd the fuelCd to set
     */
    public void setFuelCd(String fuelCd) {
        this.fuelCd = fuelCd;
    }
    /**
     * @return the carUseTp
     */
    public String getCarUseTp() {
        return carUseTp;
    }
    /**
     * @param carUseTp the carUseTp to set
     */
    public void setCarUseTp(String carUseTp) {
        this.carUseTp = carUseTp;
    }
    /**
     * @return the srfDstinCd
     */
    public String getSrfDstinCd() {
        return srfDstinCd;
    }
    /**
     * @param srfDstinCd the srfDstinCd to set
     */
    public void setSrfDstinCd(String srfDstinCd) {
        this.srfDstinCd = srfDstinCd;
    }
    /**
     * @return the seatTp
     */
    public String getSeatTp() {
        return seatTp;
    }
    /**
     * @param seatTp the seatTp to set
     */
    public void setSeatTp(String seatTp) {
        this.seatTp = seatTp;
    }
    /**
     * @return the stcTp
     */
    public String getStcTp() {
        return stcTp;
    }
    /**
     * @param stcTp the stcTp to set
     */
    public void setStcTp(String stcTp) {
        this.stcTp = stcTp;
    }
    /**
     * @return the elecSeatYn
     */
    public String getElecSeatYn() {
        return elecSeatYn;
    }
    /**
     * @param elecSeatYn the elecSeatYn to set
     */
    public void setElecSeatYn(String elecSeatYn) {
        this.elecSeatYn = elecSeatYn;
    }
    /**
     * @return the heatSeatYn
     */
    public String getHeatSeatYn() {
        return heatSeatYn;
    }
    /**
     * @param heatSeatYn the heatSeatYn to set
     */
    public void setHeatSeatYn(String heatSeatYn) {
        this.heatSeatYn = heatSeatYn;
    }
    /**
     * @return the airSeatYn
     */
    public String getAirSeatYn() {
        return airSeatYn;
    }
    /**
     * @param airSeatYn the airSeatYn to set
     */
    public void setAirSeatYn(String airSeatYn) {
        this.airSeatYn = airSeatYn;
    }
    /**
     * @return the dvdYn
     */
    public String getDvdYn() {
        return dvdYn;
    }
    /**
     * @param dvdYn the dvdYn to set
     */
    public void setDvdYn(String dvdYn) {
        this.dvdYn = dvdYn;
    }
    /**
     * @return the naviYn
     */
    public String getNaviYn() {
        return naviYn;
    }
    /**
     * @param naviYn the naviYn to set
     */
    public void setNaviYn(String naviYn) {
        this.naviYn = naviYn;
    }
    /**
     * @return the rcamYn
     */
    public String getRcamYn() {
        return rcamYn;
    }
    /**
     * @param rcamYn the rcamYn to set
     */
    public void setRcamYn(String rcamYn) {
        this.rcamYn = rcamYn;
    }
    /**
     * @return the autoHlgtYn
     */
    public String getAutoHlgtYn() {
        return autoHlgtYn;
    }
    /**
     * @param autoHlgtYn the autoHlgtYn to set
     */
    public void setAutoHlgtYn(String autoHlgtYn) {
        this.autoHlgtYn = autoHlgtYn;
    }
    /**
     * @return the hidHlampYn
     */
    public String getHidHlampYn() {
        return hidHlampYn;
    }
    /**
     * @param hidHlampYn the hidHlampYn to set
     */
    public void setHidHlampYn(String hidHlampYn) {
        this.hidHlampYn = hidHlampYn;
    }
    /**
     * @return the haloLampYn
     */
    public String getHaloLampYn() {
        return haloLampYn;
    }
    /**
     * @param haloLampYn the haloLampYn to set
     */
    public void setHaloLampYn(String haloLampYn) {
        this.haloLampYn = haloLampYn;
    }
    /**
     * @return the regCertYn
     */
    public String getRegCertYn() {
        return regCertYn;
    }
    /**
     * @param regCertYn the regCertYn to set
     */
    public void setRegCertYn(String regCertYn) {
        this.regCertYn = regCertYn;
    }
    /**
     * @return the runCertYn
     */
    public String getRunCertYn() {
        return runCertYn;
    }
    /**
     * @param runCertYn the runCertYn to set
     */
    public void setRunCertYn(String runCertYn) {
        this.runCertYn = runCertYn;
    }
    /**
     * @return the purcTaxCertYn
     */
    public String getPurcTaxCertYn() {
        return purcTaxCertYn;
    }
    /**
     * @param purcTaxCertYn the purcTaxCertYn to set
     */
    public void setPurcTaxCertYn(String purcTaxCertYn) {
        this.purcTaxCertYn = purcTaxCertYn;
    }
    /**
     * @return the purcCertYn
     */
    public String getPurcCertYn() {
        return purcCertYn;
    }
    /**
     * @param purcCertYn the purcCertYn to set
     */
    public void setPurcCertYn(String purcCertYn) {
        this.purcCertYn = purcCertYn;
    }
    /**
     * @return the ownChgRcptYn
     */
    public String getOwnChgRcptYn() {
        return ownChgRcptYn;
    }
    /**
     * @param ownChgRcptYn the ownChgRcptYn to set
     */
    public void setOwnChgRcptYn(String ownChgRcptYn) {
        this.ownChgRcptYn = ownChgRcptYn;
    }
    /**
     * @return the commInsYn
     */
    public String getCommInsYn() {
        return commInsYn;
    }
    /**
     * @param commInsYn the commInsYn to set
     */
    public void setCommInsYn(String commInsYn) {
        this.commInsYn = commInsYn;
    }
    /**
     * @return the spcInsYn
     */
    public String getSpcInsYn() {
        return spcInsYn;
    }
    /**
     * @param spcInsYn the spcInsYn to set
     */
    public void setSpcInsYn(String spcInsYn) {
        this.spcInsYn = spcInsYn;
    }
    /**
     * @return the envPrtcLabelYn
     */
    public String getEnvPrtcLabelYn() {
        return envPrtcLabelYn;
    }
    /**
     * @param envPrtcLabelYn the envPrtcLabelYn to set
     */
    public void setEnvPrtcLabelYn(String envPrtcLabelYn) {
        this.envPrtcLabelYn = envPrtcLabelYn;
    }
    /**
     * @return the etcCont
     */
    public String getEtcCont() {
        return etcCont;
    }
    /**
     * @param etcCont the etcCont to set
     */
    public void setEtcCont(String etcCont) {
        this.etcCont = etcCont;
    }
    /**
     * @return the extCont
     */
    public String getExtCont() {
        return extCont;
    }
    /**
     * @param extCont the extCont to set
     */
    public void setExtCont(String extCont) {
        this.extCont = extCont;
    }
    /**
     * @return the intCont
     */
    public String getIntCont() {
        return intCont;
    }
    /**
     * @param intCont the intCont to set
     */
    public void setIntCont(String intCont) {
        this.intCont = intCont;
    }
    /**
     * @return the vinCont
     */
    public String getVinCont() {
        return vinCont;
    }
    /**
     * @param vinCont the vinCont to set
     */
    public void setVinCont(String vinCont) {
        this.vinCont = vinCont;
    }
    /**
     * @return the mechCont
     */
    public String getMechCont() {
        return mechCont;
    }
    /**
     * @param mechCont the mechCont to set
     */
    public void setMechCont(String mechCont) {
        this.mechCont = mechCont;
    }
    /**
     * @return the statCont
     */
    public String getStatCont() {
        return statCont;
    }
    /**
     * @param statCont the statCont to set
     */
    public void setStatCont(String statCont) {
        this.statCont = statCont;
    }
    /**
     * @return the totEvalCont
     */
    public String getTotEvalCont() {
        return totEvalCont;
    }
    /**
     * @param totEvalCont the totEvalCont to set
     */
    public void setTotEvalCont(String totEvalCont) {
        this.totEvalCont = totEvalCont;
    }
    /**
     * @return the carAccCont
     */
    public String getCarAccCont() {
        return carAccCont;
    }
    /**
     * @param carAccCont the carAccCont to set
     */
    public void setCarAccCont(String carAccCont) {
        this.carAccCont = carAccCont;
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
     * @return the ncarPltGuidePrc
     */
    public Double getNcarPltGuidePrc() {
        return ncarPltGuidePrc;
    }
    /**
     * @param ncarPltGuidePrc the ncarPltGuidePrc to set
     */
    public void setNcarPltGuidePrc(Double ncarPltGuidePrc) {
        this.ncarPltGuidePrc = ncarPltGuidePrc;
    }
    /**
     * @return the ncarMarketPrc
     */
    public Double getNcarMarketPrc() {
        return ncarMarketPrc;
    }
    /**
     * @param ncarMarketPrc the ncarMarketPrc to set
     */
    public void setNcarMarketPrc(Double ncarMarketPrc) {
        this.ncarMarketPrc = ncarMarketPrc;
    }
    /**
     * @return the custHopePrc
     */
    public Double getCustHopePrc() {
        return custHopePrc;
    }
    /**
     * @param custHopePrc the custHopePrc to set
     */
    public void setCustHopePrc(Double custHopePrc) {
        this.custHopePrc = custHopePrc;
    }
    /**
     * @return the evalCmpEstPrc
     */
    public Double getEvalCmpEstPrc() {
        return evalCmpEstPrc;
    }
    /**
     * @param evalCmpEstPrc the evalCmpEstPrc to set
     */
    public void setEvalCmpEstPrc(Double evalCmpEstPrc) {
        this.evalCmpEstPrc = evalCmpEstPrc;
    }
    /**
     * @return the lastContractPrc
     */
    public Double getLastContractPrc() {
        return lastContractPrc;
    }
    /**
     * @param lastContractPrc the lastContractPrc to set
     */
    public void setLastContractPrc(Double lastContractPrc) {
        this.lastContractPrc = lastContractPrc;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
