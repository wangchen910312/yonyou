package chn.bhmc.dms.sal.cmp.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CmpCarRunMngVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.       Kim yewon             최초 생성
 *
 * </pre>
 */

public class CmpCarRunMngVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String vinNo;                               //VIN NO
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useStartDt;                            //사용시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date useEndDt;                              //사용종료일자
    private String carRegNo;                            //차량등록번호
    private String carlineCd;                           //차종코드
    private String carlineNm;                           //차종명
    private String modelCd;                             //모델코드
    private String modelNm;                             //모델명
    private String ocnCd;                               //OCN코드
    private String ocnNm;                               //OCN명
    private String usrId;                               //사용자
    private String usrNm;                               //사용자명
    private String useStartKmVal;                       //사용시작km값
    private String useEndKmVal;                         //사용종료km값
    private String cmpCarDstinCd;                       //회사차구분코드
    private String remark;                              //비고
    private String regUsrId;                            //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                 //등록일자
    private String updtUsrId;                           //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                //수정일자
    private String gb;                                  //구분자
    private String chkUseEndKm;                         //종료km 체크
    private int useFuelQty;								//오일소모량
    private String gubun;								//구분
    private String carStatCd;                           //차량상태
    private String cpnCarTp;                            //회사차구분
    private String extColorNm;                          //외색명
    private String extColorCd;                          //외색코드
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date startDt;                               //회사차사용시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date endDt;                               //회사차사용종료일
    private int ingDtCnt;                             //경과일
    private int totRunKm;                             //총운행거리
    private String engineNo;                          //엔진번호
    private int seq;                                  //총운행거리
    private String userId;                            //사용자id
    private int startKm;                              //시작km
    private int endKm;                                //종료km
    private int runKm;                                //주행km
    private int lastRunKm;                                //주행km
    private String etcCmnt;                           //비고
    private Double usedOil;                              //사용연료량L
    private String dlrCd;
    private int sumKm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date oldUseStartDt;                            //사용시작일자_구
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date oldUseEndDt;                              //사용종료일자_구
    private String ordTp;
    private String cpnCarTpNm;
    private String enginSerialNo;
    private int subDataCnt;

    /**
     * @return the subDataCnt
     */
    public int getSubDataCnt() {
        return subDataCnt;
    }
    /**
     * @param subDataCnt the subDataCnt to set
     */
    public void setSubDataCnt(int subDataCnt) {
        this.subDataCnt = subDataCnt;
    }
    /**
     * @return the enginSerialNo
     */
    public String getEnginSerialNo() {
        return enginSerialNo;
    }
    /**
     * @param enginSerialNo the enginSerialNo to set
     */
    public void setEnginSerialNo(String enginSerialNo) {
        this.enginSerialNo = enginSerialNo;
    }
    /**
     * @return the cpnCarTpNm
     */
    public String getCpnCarTpNm() {
        return cpnCarTpNm;
    }
    /**
     * @param cpnCarTpNm the cpnCarTpNm to set
     */
    public void setCpnCarTpNm(String cpnCarTpNm) {
        this.cpnCarTpNm = cpnCarTpNm;
    }
    /**
     * @return the ordTp
     */
    public String getOrdTp() {
        return ordTp;
    }
    /**
     * @param ordTp the ordTp to set
     */
    public void setOrdTp(String ordTp) {
        this.ordTp = ordTp;
    }
    /**
     * @return the lastRunKm
     */
    public int getLastRunKm() {
        return lastRunKm;
    }
    /**
     * @param lastRunKm the lastRunKm to set
     */
    public void setLastRunKm(int lastRunKm) {
        this.lastRunKm = lastRunKm;
    }
    /**
     * @return the oldUseStartDt
     */
    public Date getOldUseStartDt() {
        return oldUseStartDt;
    }
    /**
     * @param oldUseStartDt the oldUseStartDt to set
     */
    public void setOldUseStartDt(Date oldUseStartDt) {
        this.oldUseStartDt = oldUseStartDt;
    }
    /**
     * @return the oldUseEndDt
     */
    public Date getOldUseEndDt() {
        return oldUseEndDt;
    }
    /**
     * @param oldUseEndDt the oldUseEndDt to set
     */
    public void setOldUseEndDt(Date oldUseEndDt) {
        this.oldUseEndDt = oldUseEndDt;
    }
    /**
     * @return the sumKm
     */
    public int getSumKm() {
        return sumKm;
    }
    /**
     * @param sumKm the sumKm to set
     */
    public void setSumKm(int sumKm) {
        this.sumKm = sumKm;
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
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }
    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    /**
     * @return the startKm
     */
    public int getStartKm() {
        return startKm;
    }
    /**
     * @param startKm the startKm to set
     */
    public void setStartKm(int startKm) {
        this.startKm = startKm;
    }
    /**
     * @return the endKm
     */
    public int getEndKm() {
        return endKm;
    }
    /**
     * @param endKm the endKm to set
     */
    public void setEndKm(int endKm) {
        this.endKm = endKm;
    }
    /**
     * @return the runKm
     */
    public int getRunKm() {
        return runKm;
    }
    /**
     * @param runKm the runKm to set
     */
    public void setRunKm(int runKm) {
        this.runKm = runKm;
    }
    /**
     * @return the etcCmnt
     */
    public String getEtcCmnt() {
        return etcCmnt;
    }
    /**
     * @param etcCmnt the etcCmnt to set
     */
    public void setEtcCmnt(String etcCmnt) {
        this.etcCmnt = etcCmnt;
    }

    /**
     * @return the usedOil
     */
    public Double getUsedOil() {
        return usedOil;
    }
    /**
     * @param usedOil the usedOil to set
     */
    public void setUsedOil(Double usedOil) {
        this.usedOil = usedOil;
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
     * @return the useStartDt
     */
    public Date getUseStartDt() {
        return useStartDt;
    }
    /**
     * @param useStartDt the useStartDt to set
     */
    public void setUseStartDt(Date useStartDt) {
        this.useStartDt = useStartDt;
    }
    /**
     * @return the useEndDt
     */
    public Date getUseEndDt() {
        return useEndDt;
    }
    /**
     * @param useEndDt the useEndDt to set
     */
    public void setUseEndDt(Date useEndDt) {
        this.useEndDt = useEndDt;
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
     * @return the ocnCd
     */
    public String getOcnCd() {
        return ocnCd;
    }
    /**
     * @param ocnCd the ocnCd to set
     */
    public void setOcnCd(String ocnCd) {
        this.ocnCd = ocnCd;
    }
    /**
     * @return the ocnNm
     */
    public String getOcnNm() {
        return ocnNm;
    }
    /**
     * @param ocnNm the ocnNm to set
     */
    public void setOcnNm(String ocnNm) {
        this.ocnNm = ocnNm;
    }
    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }
    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
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
     * @return the useStartKmVal
     */
    public String getUseStartKmVal() {
        return useStartKmVal;
    }
    /**
     * @param useStartKmVal the useStartKmVal to set
     */
    public void setUseStartKmVal(String useStartKmVal) {
        this.useStartKmVal = useStartKmVal;
    }
    /**
     * @return the useEndKmVal
     */
    public String getUseEndKmVal() {
        return useEndKmVal;
    }
    /**
     * @param useEndKmVal the useEndKmVal to set
     */
    public void setUseEndKmVal(String useEndKmVal) {
        this.useEndKmVal = useEndKmVal;
    }
    /**
     * @return the cmpCarDstinCd
     */
    public String getCmpCarDstinCd() {
        return cmpCarDstinCd;
    }
    /**
     * @param cmpCarDstinCd the cmpCarDstinCd to set
     */
    public void setCmpCarDstinCd(String cmpCarDstinCd) {
        this.cmpCarDstinCd = cmpCarDstinCd;
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
     * @return the gb
     */
    public String getGb() {
        return gb;
    }
    /**
     * @param gb the gb to set
     */
    public void setGb(String gb) {
        this.gb = gb;
    }
    /**
     * @return the chkUseEndKm
     */
    public String getChkUseEndKm() {
        return chkUseEndKm;
    }
    /**
     * @param chkUseEndKm the chkUseEndKm to set
     */
    public void setChkUseEndKm(String chkUseEndKm) {
        this.chkUseEndKm = chkUseEndKm;
    }
    /**
     * @return the useFuelQty
     */
    public int getUseFuelQty() {
        return useFuelQty;
    }
    /**
     * @param useFuelQty the useFuelQty to set
     */
    public void setUseFuelQty(int useFuelQty) {
        this.useFuelQty = useFuelQty;
    }
    /**
     * @return the gubun
     */
    public String getGubun() {
        return gubun;
    }
    /**
     * @param gubun the gubun to set
     */
    public void setGubun(String gubun) {
        this.gubun = gubun;
    }
    /**
     * @return the carStatCd
     */
    public String getCarStatCd() {
        return carStatCd;
    }
    /**
     * @param carStatCd the carStatCd to set
     */
    public void setCarStatCd(String carStatCd) {
        this.carStatCd = carStatCd;
    }
    /**
     * @return the cpnCarTp
     */
    public String getCpnCarTp() {
        return cpnCarTp;
    }
    /**
     * @param cpnCarTp the cpnCarTp to set
     */
    public void setCpnCarTp(String cpnCarTp) {
        this.cpnCarTp = cpnCarTp;
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
     * @return the ingDtCnt
     */
    public int getIngDtCnt() {
        return ingDtCnt;
    }
    /**
     * @param ingDtCnt the ingDtCnt to set
     */
    public void setIngDtCnt(int ingDtCnt) {
        this.ingDtCnt = ingDtCnt;
    }
    /**
     * @return the totRunKm
     */
    public int getTotRunKm() {
        return totRunKm;
    }
    /**
     * @param totRunKm the totRunKm to set
     */
    public void setTotRunKm(int totRunKm) {
        this.totRunKm = totRunKm;
    }
    /**
     * @return the engineNo
     */
    public String getEngineNo() {
        return engineNo;
    }
    /**
     * @param engineNo the engineNo to set
     */
    public void setEngineNo(String engineNo) {
        this.engineNo = engineNo;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}