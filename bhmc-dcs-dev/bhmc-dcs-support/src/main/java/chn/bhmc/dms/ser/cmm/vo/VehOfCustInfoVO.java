package chn.bhmc.dms.ser.cmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * 서비스 공통용 고객및차량정보
 * </pre>
 *
 * @ClassName   : VehOfCustInfoVO.java
 * @Description : 서비스 공통용 고객및차량정보 VO.
 * @author Yin Xueyuan
 * @since 2016. 3. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 7.     Yin Xueyuan     최초 생성
 * </pre>
 */

public class VehOfCustInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2328889148112310219L;

    private String dlrCd;
    private String carId;
    private String vinNo;           /*차대번호 */
    private String vinNo1;          /*차대번호1*/
    private String vinNo2;          /*차대번호2*/
    private String carlineCd;       /*차종코드 */
    private String carlineNm;       /*차종명 */
    private String modelCd;         /*모델코드 */
    private String modelNm;         /*모델명 */
    private String ocnCd;           /*OCN코드  */
    private String extColorCd;      /*외장색코드  */
    private String extColorNm;      /*외장색  */
    private String carStatCd;       /*차량상태코드*/
    private String ownStatCd;       /*소유상태코드*/
    private String carDstinCd;      /*차량구분코드*/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;                  /*입고일자    */
    private String carRegNo;            /*차량등록번호*/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteStartDt;           /*보증시작일자*/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteEndDt;             /*보증종료일자*/
    private String grteEndRemainDay;    /*보증종료까지 남은일자 */
    private String grteStdCd;           /*보증기준코드*/
    private String delYn;               /*삭제여부    */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carRegDt;        /*차량등록일자*/
    private String corpCarDstinCd;  /*자사차량구분코드 */
    private String mcarCd;          /*마스터차량코드   */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;         /*공장출고일자*/
    private String makerCd;         /*메이커코드  */
    private String enginNo;         /*엔진시리얼번호   */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date signOffDt;       /*생산일자    */
    private String cmpCd;           /*회사코드    */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleDt;      /*고객판매일자*/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date custSaleCancDt;  /*고객판매취소일자 */
    private String statCd;          /*상태코드    */
    private String carNm;           /*차량명      */
    private String cmpCarYn;        /*회사차여부  */
    private String cmpCarDstinCd;   /*회사차구분코드 */
    private String carRunDistVal;   /*차량주행거리값 */
    private String tecId;           /*TECMANID       */
    private String carBrandCd;      /*차량브랜드코드 */
    private String carBrandNm;      /*차량브랜드명 */
    private String driverId;        /*운전자ID       */
    private String driverNm;        /*운전자명       */
    private String driverSsnCrnNo;  /*운전자 증서번호       */
    private String driverMathDocTp; /*운전자 증서유형       */
    private String driverTelNo;     /*운전자전화번호 */
    private String driverHpNo;      /*운전자핸드폰   */
    private String driverAddrSeq;   /*운전자주소 SEQ  */
    private String driverZipCd;     /*운전자우편번호 */
    private String driverAddrTp;    /*운전자주소 - 주소유형*/
    private String driverSungCd;    /*운전자주소 - 성코드*/
    private String driverSungNm;    /*운전자주소 - 성명*/
    private String driverCityCd;    /*운전자주소 - 도시코드*/
    private String driverCityNm;    /*운전자주소 - 도시명*/
    private String driverDistCd;        /*운전자주소 - 지역코드*/
    private String driverDistNm;        /*운전자주소 - 지역명*/
    private String driverAddrDetlCont;  /*운전자주소 - 상세주소*/
    private String driverAddr;          /*운전자주소 - 풀주소    */
    private String driverMailNm;        /*운전자이메일   */
    private String driverOfficeTelNo;
    private String driverPrefContactMthCd;    /*운전자메인연락방법   */
    private String driverPrefContactTimeCd;   /*운전자메인연락시간   */
    private String driverPrefCommMthCd;
    private String driverPrefCommNo;
    private String driverCustTp;        // 운전자고객유형 (01 : 개인, 02 : 법인)
    private String driverCustCd;        // 운전자고객코드 (01 : 내부, 02 : 잠재)
    private String driverBirthDt;       // 운전자 생일
    private String driverBirthRemainDay;    // 운전자 생일까지 남은일자
    private String sexCd;

    private String carOwnerId;      /*소유자ID       */
    private String carOwnerNm;      /*소유자명       */
    private String carOwnerTelNo;   /*소유자전화번호 */
    private String carOwnerHpNo;    /*소유자핸드폰   */
    private String carOwnerAddrSeq; /*소유자주소 SEQ  */
    private String carOwnerZipCd;   /*소유자우편번호 */
    private String carOwnerAddrTp;    /*소유자주소 - 주소유형*/
    private String carOwnerSungCd;    /*소유자주소 - 성코드*/
    private String carOwnerSungNm;    /*소유자주소 - 성명*/
    private String carOwnerCityCd;    /*소유자주소 - 도시코드*/
    private String carOwnerCityNm;    /*소유자주소 - 도시명*/
    private String carOwnerDistCd;        /*소유자주소 - 지역코드*/
    private String carOwnerDistNm;        /*소유자주소 - 지역명*/
    private String carOwnerAddrDetlCont;  /*소유자주소 - 상세주소*/
    private String carOwnerAddr;    /*소유자주소     */
    private String carOwnerMailNm;  /*소유자이메일   */
    private String carOwnerOfficeTelNo;
    private String carOwnerPrefContactMthCd;    /*소유자메인연락방법   */
    private String carOwnerPrefContactTimeCd;   /*소유자메인연락시간   */
    private String carOwnerPrefCommMthCd;
    private String carOwnerPrefCommNo;
    private String carOwnerSsnCrnNo;        /*소유자 증서번호       */
    private String carOwnerMathDocTp;       /*운전자 증서유형       */
    private String carOwnerCustTp;          // 소유자고객유형 (01 : 개인, 02 : 법인)
    private String carOwnerCustCd;          // 소유자고객코드 (01 : 내부, 02 : 잠재)
    private String carOwnerBirthDt;         // 소유자 생일
    private String carOwnerBirthRemainDay;      // 소유자 생일까지 남은일자
    private String incNo;           /*보험번호       */
    private String befIncNo;        /*이전보험번호   */
    private String incCorpCd;       /*보험사법인코드 */
    private String incCarNo;        /*보험차량번호   */
    private String incCarNoRegDt;   /*보험차량등록일자 */
    private String incEndDt;        /*보험마감일       */
    private String incEndRemainDay;      /*보험마감일까지 남은일수       */

    private String ltsModelCd; /*LTS MODEL CODE*/
    private String ltsModelNm; /*LTS MODEL Nm*/

    private String custNo; /* CRM 사용*/



    private String salPrsnNm;   // 판매담당자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date samPoEndDt;    // 삼포 만료일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date scheChkDt;     // 정비예정일자
    private String ordDlrCd;    // 판매딜러사
    private String scheChkDist; // 정비예정주행거리

    private String carIfNm;     // 차량연계인
    private String orgCd;       // 사업자 등록번호
    private String carChar;     // 차량성질
    private String chaDrivDis;  // 교환시 주행거리
    private String custTag;     // 고객태그
    private String bmMembNo;    // BM회원번호
    private String membNo;      // 회원번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date cotcEndDt;     // 계약완료일
    private Double txtLbrDcRate;    // 공임할인률
    private Double txtParDcRate;    // 부품할인률
    private Double preBalAmt;       // 예치금
    private Double preBalBalc;      // 예치금 잔액
    private String custLvl;         // 고객레벨
    private String preFixId;
    private String pdiYn;           // PDI 여부
    private int carOwnerSeq;
    private int driverSeq;

    private String sanbaoRmMonth;//삼포잔여기간
    private String sanbaoRmRunDistVal;//삼포잔여월
    private String totWorkDay;//총 작업소요일
    private Double returnRate;;//반품 비률

    private String saveType;    // owner, driver
    private String driverSaveTp;    // save, update
    private String driveMonth;    // 운행월

    private String bhmcYn;    // BHMC 여부
    private String telNo;    // 전화번호


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
     * @return the carId
     */
    public String getCarId() {
        return carId;
    }
    /**
     * @param carId the carId to set
     */
    public void setCarId(String carId) {
        this.carId = carId;
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
     * @return the vinNo1
     */
    public String getVinNo1() {
        return vinNo1;
    }
    /**
     * @param vinNo1 the vinNo1 to set
     */
    public void setVinNo1(String vinNo1) {
        this.vinNo1 = vinNo1;
    }
    /**
     * @return the vinNo2
     */
    public String getVinNo2() {
        return vinNo2;
    }
    /**
     * @param vinNo2 the vinNo2 to set
     */
    public void setVinNo2(String vinNo2) {
        this.vinNo2 = vinNo2;
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
     * @return the ownStatCd
     */
    public String getOwnStatCd() {
        return ownStatCd;
    }
    /**
     * @param ownStatCd the ownStatCd to set
     */
    public void setOwnStatCd(String ownStatCd) {
        this.ownStatCd = ownStatCd;
    }
    /**
     * @return the carDstinCd
     */
    public String getCarDstinCd() {
        return carDstinCd;
    }
    /**
     * @param carDstinCd the carDstinCd to set
     */
    public void setCarDstinCd(String carDstinCd) {
        this.carDstinCd = carDstinCd;
    }
    /**
     * @return the grDt
     */
    public Date getGrDt() {
        return grDt;
    }
    /**
     * @param grDt the grDt to set
     */
    public void setGrDt(Date grDt) {
        this.grDt = grDt;
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
     * @return the grteStartDt
     */
    public Date getGrteStartDt() {
        return grteStartDt;
    }
    /**
     * @param grteStartDt the grteStartDt to set
     */
    public void setGrteStartDt(Date grteStartDt) {
        this.grteStartDt = grteStartDt;
    }
    /**
     * @return the grteEndDt
     */
    public Date getGrteEndDt() {
        return grteEndDt;
    }
    /**
     * @param grteEndDt the grteEndDt to set
     */
    public void setGrteEndDt(Date grteEndDt) {
        this.grteEndDt = grteEndDt;
    }
    /**
     * @return the grteEndRemainDay
     */
    public String getGrteEndRemainDay() {
        return grteEndRemainDay;
    }
    /**
     * @param grteEndRemainDay the grteEndRemainDay to set
     */
    public void setGrteEndRemainDay(String grteEndRemainDay) {
        this.grteEndRemainDay = grteEndRemainDay;
    }
    /**
     * @return the grteStdCd
     */
    public String getGrteStdCd() {
        return grteStdCd;
    }
    /**
     * @param grteStdCd the grteStdCd to set
     */
    public void setGrteStdCd(String grteStdCd) {
        this.grteStdCd = grteStdCd;
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
     * @return the corpCarDstinCd
     */
    public String getCorpCarDstinCd() {
        return corpCarDstinCd;
    }
    /**
     * @param corpCarDstinCd the corpCarDstinCd to set
     */
    public void setCorpCarDstinCd(String corpCarDstinCd) {
        this.corpCarDstinCd = corpCarDstinCd;
    }
    /**
     * @return the mcarCd
     */
    public String getMcarCd() {
        return mcarCd;
    }
    /**
     * @param mcarCd the mcarCd to set
     */
    public void setMcarCd(String mcarCd) {
        this.mcarCd = mcarCd;
    }
    /**
     * @return the pltGiDt
     */
    public Date getPltGiDt() {
        return pltGiDt;
    }
    /**
     * @param pltGiDt the pltGiDt to set
     */
    public void setPltGiDt(Date pltGiDt) {
        this.pltGiDt = pltGiDt;
    }
    /**
     * @return the makerCd
     */
    public String getMakerCd() {
        return makerCd;
    }
    /**
     * @param makerCd the makerCd to set
     */
    public void setMakerCd(String makerCd) {
        this.makerCd = makerCd;
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
     * @return the signOffDt
     */
    public Date getSignOffDt() {
        return signOffDt;
    }
    /**
     * @param signOffDt the signOffDt to set
     */
    public void setSignOffDt(Date signOffDt) {
        this.signOffDt = signOffDt;
    }
    /**
     * @return the cmpCd
     */
    public String getCmpCd() {
        return cmpCd;
    }
    /**
     * @param cmpCd the cmpCd to set
     */
    public void setCmpCd(String cmpCd) {
        this.cmpCd = cmpCd;
    }
    /**
     * @return the custSaleDt
     */
    public Date getCustSaleDt() {
        return custSaleDt;
    }
    /**
     * @param custSaleDt the custSaleDt to set
     */
    public void setCustSaleDt(Date custSaleDt) {
        this.custSaleDt = custSaleDt;
    }
    /**
     * @return the custSaleCancDt
     */
    public Date getCustSaleCancDt() {
        return custSaleCancDt;
    }
    /**
     * @param custSaleCancDt the custSaleCancDt to set
     */
    public void setCustSaleCancDt(Date custSaleCancDt) {
        this.custSaleCancDt = custSaleCancDt;
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
     * @return the carNm
     */
    public String getCarNm() {
        return carNm;
    }
    /**
     * @param carNm the carNm to set
     */
    public void setCarNm(String carNm) {
        this.carNm = carNm;
    }
    /**
     * @return the cmpCarYn
     */
    public String getCmpCarYn() {
        return cmpCarYn;
    }
    /**
     * @param cmpCarYn the cmpCarYn to set
     */
    public void setCmpCarYn(String cmpCarYn) {
        this.cmpCarYn = cmpCarYn;
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
     * @return the carRunDistVal
     */
    public String getCarRunDistVal() {
        return carRunDistVal;
    }
    /**
     * @param carRunDistVal the carRunDistVal to set
     */
    public void setCarRunDistVal(String carRunDistVal) {
        this.carRunDistVal = carRunDistVal;
    }
    /**
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }
    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
    }
    /**
     * @return the carBrandCd
     */
    public String getCarBrandCd() {
        return carBrandCd;
    }
    /**
     * @param carBrandCd the carBrandCd to set
     */
    public void setCarBrandCd(String carBrandCd) {
        this.carBrandCd = carBrandCd;
    }
    /**
     * @return the carBrandNm
     */
    public String getCarBrandNm() {
        return carBrandNm;
    }
    /**
     * @param carBrandNm the carBrandNm to set
     */
    public void setCarBrandNm(String carBrandNm) {
        this.carBrandNm = carBrandNm;
    }
    /**
     * @return the driverId
     */
    public String getDriverId() {
        return driverId;
    }
    /**
     * @param driverId the driverId to set
     */
    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }
    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }
    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
    }
    /**
     * @return the driverSsnCrnNo
     */
    public String getDriverSsnCrnNo() {
        return driverSsnCrnNo;
    }
    /**
     * @param driverSsnCrnNo the driverSsnCrnNo to set
     */
    public void setDriverSsnCrnNo(String driverSsnCrnNo) {
        this.driverSsnCrnNo = driverSsnCrnNo;
    }
    /**
     * @return the carOwnerSsnCrnNo
     */
    public String getCarOwnerSsnCrnNo() {
        return carOwnerSsnCrnNo;
    }
    /**
     * @param carOwnerSsnCrnNo the carOwnerSsnCrnNo to set
     */
    public void setCarOwnerSsnCrnNo(String carOwnerSsnCrnNo) {
        this.carOwnerSsnCrnNo = carOwnerSsnCrnNo;
    }
    /**
     * @return the driverMathDocTp
     */
    public String getDriverMathDocTp() {
        return driverMathDocTp;
    }
    /**
     * @param driverMathDocTp the driverMathDocTp to set
     */
    public void setDriverMathDocTp(String driverMathDocTp) {
        this.driverMathDocTp = driverMathDocTp;
    }
    /**
     * @return the sexCd
     */
    public String getSexCd() {
        return sexCd;
    }
    /**
     * @param sexCd the sexCd to set
     */
    public void setSexCd(String sexCd) {
        this.sexCd = sexCd;
    }
    /**
     * @return the carOwnerMathDocTp
     */
    public String getCarOwnerMathDocTp() {
        return carOwnerMathDocTp;
    }
    /**
     * @param carOwnerMathDocTp the carOwnerMathDocTp to set
     */
    public void setCarOwnerMathDocTp(String carOwnerMathDocTp) {
        this.carOwnerMathDocTp = carOwnerMathDocTp;
    }
    /**
     * @return the driverTelNo
     */
    public String getDriverTelNo() {
        return driverTelNo;
    }
    /**
     * @param driverTelNo the driverTelNo to set
     */
    public void setDriverTelNo(String driverTelNo) {
        this.driverTelNo = driverTelNo;
    }
    /**
     * @return the driverHpNo
     */
    public String getDriverHpNo() {
        return driverHpNo;
    }
    /**
     * @param driverHpNo the driverHpNo to set
     */
    public void setDriverHpNo(String driverHpNo) {
        this.driverHpNo = driverHpNo;
    }
    /**
     * @return the driverZipCd
     */
    public String getDriverZipCd() {
        return driverZipCd;
    }
    /**
     * @param driverZipCd the driverZipCd to set
     */
    public void setDriverZipCd(String driverZipCd) {
        this.driverZipCd = driverZipCd;
    }
    /**
     * @return the driverAddr
     */
    public String getDriverAddr() {
        return driverAddr;
    }
    /**
     * @param driverAddr the driverAddr to set
     */
    public void setDriverAddr(String driverAddr) {
        this.driverAddr = driverAddr;
    }
    /**
     * @return the driverMailNm
     */
    public String getDriverMailNm() {
        return driverMailNm;
    }
    /**
     * @param driverMailNm the driverMailNm to set
     */
    public void setDriverMailNm(String driverMailNm) {
        this.driverMailNm = driverMailNm;
    }
    /**
     * @return the driverPrefContactMthCd
     */
    public String getDriverPrefContactMthCd() {
        return driverPrefContactMthCd;
    }
    /**
     * @param driverPrefContactMthCd the driverPrefContactMthCd to set
     */
    public void setDriverPrefContactMthCd(String driverPrefContactMthCd) {
        this.driverPrefContactMthCd = driverPrefContactMthCd;
    }
    /**
     * @return the driverPrefContactTimeCd
     */
    public String getDriverPrefContactTimeCd() {
        return driverPrefContactTimeCd;
    }
    /**
     * @param driverPrefContactTimeCd the driverPrefContactTimeCd to set
     */
    public void setDriverPrefContactTimeCd(String driverPrefContactTimeCd) {
        this.driverPrefContactTimeCd = driverPrefContactTimeCd;
    }
    /**
     * @return the carOwnerPrefContactMthCd
     */
    public String getCarOwnerPrefContactMthCd() {
        return carOwnerPrefContactMthCd;
    }
    /**
     * @param carOwnerPrefContactMthCd the carOwnerPrefContactMthCd to set
     */
    public void setCarOwnerPrefContactMthCd(String carOwnerPrefContactMthCd) {
        this.carOwnerPrefContactMthCd = carOwnerPrefContactMthCd;
    }
    /**
     * @return the carOwnerPrefContactTimeCd
     */
    public String getCarOwnerPrefContactTimeCd() {
        return carOwnerPrefContactTimeCd;
    }
    /**
     * @param carOwnerPrefContactTimeCd the carOwnerPrefContactTimeCd to set
     */
    public void setCarOwnerPrefContactTimeCd(String carOwnerPrefContactTimeCd) {
        this.carOwnerPrefContactTimeCd = carOwnerPrefContactTimeCd;
    }
    /**
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }
    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }
    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }
    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }
    /**
     * @return the carOwnerTelNo
     */
    public String getCarOwnerTelNo() {
        return carOwnerTelNo;
    }
    /**
     * @param carOwnerTelNo the carOwnerTelNo to set
     */
    public void setCarOwnerTelNo(String carOwnerTelNo) {
        this.carOwnerTelNo = carOwnerTelNo;
    }
    /**
     * @return the carOwnerHpNo
     */
    public String getCarOwnerHpNo() {
        return carOwnerHpNo;
    }
    /**
     * @param carOwnerHpNo the carOwnerHpNo to set
     */
    public void setCarOwnerHpNo(String carOwnerHpNo) {
        this.carOwnerHpNo = carOwnerHpNo;
    }
    /**
     * @return the carOwnerZipCd
     */
    public String getCarOwnerZipCd() {
        return carOwnerZipCd;
    }
    /**
     * @param carOwnerZipCd the carOwnerZipCd to set
     */
    public void setCarOwnerZipCd(String carOwnerZipCd) {
        this.carOwnerZipCd = carOwnerZipCd;
    }
    /**
     * @return the carOwnerAddr
     */
    public String getCarOwnerAddr() {
        return carOwnerAddr;
    }
    /**
     * @param carOwnerAddr the carOwnerAddr to set
     */
    public void setCarOwnerAddr(String carOwnerAddr) {
        this.carOwnerAddr = carOwnerAddr;
    }
    /**
     * @return the carOwnerMailNm
     */
    public String getCarOwnerMailNm() {
        return carOwnerMailNm;
    }
    /**
     * @param carOwnerMailNm the carOwnerMailNm to set
     */
    public void setCarOwnerMailNm(String carOwnerMailNm) {
        this.carOwnerMailNm = carOwnerMailNm;
    }
    /**
     * @return the incNo
     */
    public String getIncNo() {
        return incNo;
    }
    /**
     * @param incNo the incNo to set
     */
    public void setIncNo(String incNo) {
        this.incNo = incNo;
    }
    /**
     * @return the befIncNo
     */
    public String getBefIncNo() {
        return befIncNo;
    }
    /**
     * @param befIncNo the befIncNo to set
     */
    public void setBefIncNo(String befIncNo) {
        this.befIncNo = befIncNo;
    }
    /**
     * @return the incCorpCd
     */
    public String getIncCorpCd() {
        return incCorpCd;
    }
    /**
     * @param incCorpCd the incCorpCd to set
     */
    public void setIncCorpCd(String incCorpCd) {
        this.incCorpCd = incCorpCd;
    }
    /**
     * @return the incCarNo
     */
    public String getIncCarNo() {
        return incCarNo;
    }
    /**
     * @param incCarNo the incCarNo to set
     */
    public void setIncCarNo(String incCarNo) {
        this.incCarNo = incCarNo;
    }
    /**
     * @return the incCarNoRegDt
     */
    public String getIncCarNoRegDt() {
        return incCarNoRegDt;
    }
    /**
     * @param incCarNoRegDt the incCarNoRegDt to set
     */
    public void setIncCarNoRegDt(String incCarNoRegDt) {
        this.incCarNoRegDt = incCarNoRegDt;
    }
    /**
     * @return the incEndDt
     */
    public String getIncEndDt() {
        return incEndDt;
    }
    /**
     * @param incEndDt the incEndDt to set
     */
    public void setIncEndDt(String incEndDt) {
        this.incEndDt = incEndDt;
    }
    /**
     * @return the incEndRemainDay
     */
    public String getIncEndRemainDay() {
        return incEndRemainDay;
    }
    /**
     * @param incEndRemainDay the incEndRemainDay to set
     */
    public void setIncEndRemainDay(String incEndRemainDay) {
        this.incEndRemainDay = incEndRemainDay;
    }
    /**
     * @return the ltsModelCd
     */
    public String getLtsModelCd() {
        return ltsModelCd;
    }
    /**
     * @param ltsModelCd the ltsModelCd to set
     */
    public void setLtsModelCd(String ltsModelCd) {
        this.ltsModelCd = ltsModelCd;
    }
    /**
     * @return the ltsModelNm
     */
    public String getLtsModelNm() {
        return ltsModelNm;
    }
    /**
     * @param ltsModelNm the ltsModelNm to set
     */
    public void setLtsModelNm(String ltsModelNm) {
        this.ltsModelNm = ltsModelNm;
    }
    /**
     * @return the salPrsnNm
     */
    public String getSalPrsnNm() {
        return salPrsnNm;
    }
    /**
     * @param salPrsnNm the salPrsnNm to set
     */
    public void setSalPrsnNm(String salPrsnNm) {
        this.salPrsnNm = salPrsnNm;
    }
    /**
     * @return the samPoEndDt
     */
    public Date getSamPoEndDt() {
        return samPoEndDt;
    }
    /**
     * @param samPoEndDt the samPoEndDt to set
     */
    public void setSamPoEndDt(Date samPoEndDt) {
        this.samPoEndDt = samPoEndDt;
    }
    /**
     * @return the scheChkDt
     */
    public Date getScheChkDt() {
        return scheChkDt;
    }
    /**
     * @param scheChkDt the scheChkDt to set
     */
    public void setScheChkDt(Date scheChkDt) {
        this.scheChkDt = scheChkDt;
    }
    /**
     * @return the ordDlrCd
     */
    public String getOrdDlrCd() {
        return ordDlrCd;
    }
    /**
     * @param ordDlrCd the ordDlrCd to set
     */
    public void setOrdDlrCd(String ordDlrCd) {
        this.ordDlrCd = ordDlrCd;
    }
    /**
     * @return the scheChkDist
     */
    public String getScheChkDist() {
        return scheChkDist;
    }
    /**
     * @param scheChkDist the scheChkDist to set
     */
    public void setScheChkDist(String scheChkDist) {
        this.scheChkDist = scheChkDist;
    }
    /**
     * @return the carIfNm
     */
    public String getCarIfNm() {
        return carIfNm;
    }
    /**
     * @param carIfNm the carIfNm to set
     */
    public void setCarIfNm(String carIfNm) {
        this.carIfNm = carIfNm;
    }
    /**
     * @return the orgCd
     */
    public String getOrgCd() {
        return orgCd;
    }
    /**
     * @param orgCd the orgCd to set
     */
    public void setOrgCd(String orgCd) {
        this.orgCd = orgCd;
    }
    /**
     * @return the carChar
     */
    public String getCarChar() {
        return carChar;
    }
    /**
     * @param carChar the carChar to set
     */
    public void setCarChar(String carChar) {
        this.carChar = carChar;
    }
    /**
     * @return the chaDrivDis
     */
    public String getChaDrivDis() {
        return chaDrivDis;
    }
    /**
     * @param chaDrivDis the chaDrivDis to set
     */
    public void setChaDrivDis(String chaDrivDis) {
        this.chaDrivDis = chaDrivDis;
    }
    /**
     * @return the custTag
     */
    public String getCustTag() {
        return custTag;
    }
    /**
     * @param custTag the custTag to set
     */
    public void setCustTag(String custTag) {
        this.custTag = custTag;
    }
    /**
     * @return the bmMembNo
     */
    public String getBmMembNo() {
        return bmMembNo;
    }
    /**
     * @param bmMembNo the bmMembNo to set
     */
    public void setBmMembNo(String bmMembNo) {
        this.bmMembNo = bmMembNo;
    }
    /**
     * @return the membNo
     */
    public String getMembNo() {
        return membNo;
    }
    /**
     * @param membNo the membNo to set
     */
    public void setMembNo(String membNo) {
        this.membNo = membNo;
    }
    /**
     * @return the cotcEndDt
     */
    public Date getCotcEndDt() {
        return cotcEndDt;
    }
    /**
     * @param cotcEndDt the cotcEndDt to set
     */
    public void setCotcEndDt(Date cotcEndDt) {
        this.cotcEndDt = cotcEndDt;
    }
    /**
     * @return the txtLbrDcRate
     */
    public Double getTxtLbrDcRate() {
        return txtLbrDcRate;
    }
    /**
     * @param txtLbrDcRate the txtLbrDcRate to set
     */
    public void setTxtLbrDcRate(Double txtLbrDcRate) {
        this.txtLbrDcRate = txtLbrDcRate;
    }
    /**
     * @return the txtParDcRate
     */
    public Double getTxtParDcRate() {
        return txtParDcRate;
    }
    /**
     * @param txtParDcRate the txtParDcRate to set
     */
    public void setTxtParDcRate(Double txtParDcRate) {
        this.txtParDcRate = txtParDcRate;
    }
    /**
     * @return the preBalAmt
     */
    public Double getPreBalAmt() {
        return preBalAmt;
    }
    /**
     * @param preBalAmt the preBalAmt to set
     */
    public void setPreBalAmt(Double preBalAmt) {
        this.preBalAmt = preBalAmt;
    }
    /**
     * @return the preBalBalc
     */
    public Double getPreBalBalc() {
        return preBalBalc;
    }
    /**
     * @param preBalBalc the preBalBalc to set
     */
    public void setPreBalBalc(Double preBalBalc) {
        this.preBalBalc = preBalBalc;
    }
    /**
     * @return the custLvl
     */
    public String getCustLvl() {
        return custLvl;
    }
    /**
     * @param custLvl the custLvl to set
     */
    public void setCustLvl(String custLvl) {
        this.custLvl = custLvl;
    }
    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }
    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }
    /**
     * @return the pdiYn
     */
    public String getPdiYn() {
        return pdiYn;
    }
    /**
     * @param pdiYn the pdiYn to set
     */
    public void setPdiYn(String pdiYn) {
        this.pdiYn = pdiYn;
    }
    /**
     * @return the carOwnerSeq
     */
    public int getCarOwnerSeq() {
        return carOwnerSeq;
    }
    /**
     * @param carOwnerSeq the carOwnerSeq to set
     */
    public void setCarOwnerSeq(int carOwnerSeq) {
        this.carOwnerSeq = carOwnerSeq;
    }
    /**
     * @return the driverSeq
     */
    public int getDriverSeq() {
        return driverSeq;
    }
    /**
     * @param driverSeq the driverSeq to set
     */
    public void setDriverSeq(int driverSeq) {
        this.driverSeq = driverSeq;
    }
    /**
     * @return the sanbaoRmMonth
     */
    public String getSanbaoRmMonth() {
        return sanbaoRmMonth;
    }
    /**
     * @param sanbaoRmMonth the sanbaoRmMonth to set
     */
    public void setSanbaoRmMonth(String sanbaoRmMonth) {
        this.sanbaoRmMonth = sanbaoRmMonth;
    }
    /**
     * @return the sanbaoRmRunDistVal
     */
    public String getSanbaoRmRunDistVal() {
        return sanbaoRmRunDistVal;
    }
    /**
     * @param sanbaoRmRunDistVal the sanbaoRmRunDistVal to set
     */
    public void setSanbaoRmRunDistVal(String sanbaoRmRunDistVal) {
        this.sanbaoRmRunDistVal = sanbaoRmRunDistVal;
    }
    /**
     * @return the totWorkDay
     */
    public String getTotWorkDay() {
        return totWorkDay;
    }
    /**
     * @param totWorkDay the totWorkDay to set
     */
    public void setTotWorkDay(String totWorkDay) {
        this.totWorkDay = totWorkDay;
    }
    /**
     * @return the returnRate
     */
    public Double getReturnRate() {
        return returnRate;
    }
    /**
     * @param returnRate the returnRate to set
     */
    public void setReturnRate(Double returnRate) {
        this.returnRate = returnRate;
    }
    /**
     * @return the driverCustTp
     */
    public String getDriverCustTp() {
        return driverCustTp;
    }
    /**
     * @param driverCustTp the driverCustTp to set
     */
    public void setDriverCustTp(String driverCustTp) {
        this.driverCustTp = driverCustTp;
    }
    /**
     * @return the driverCustCd
     */
    public String getDriverCustCd() {
        return driverCustCd;
    }
    /**
     * @param driverCustCd the driverCustCd to set
     */
    public void setDriverCustCd(String driverCustCd) {
        this.driverCustCd = driverCustCd;
    }
    /**
     * @return the carOwnerCustTp
     */
    public String getCarOwnerCustTp() {
        return carOwnerCustTp;
    }
    /**
     * @param carOwnerCustTp the carOwnerCustTp to set
     */
    public void setCarOwnerCustTp(String carOwnerCustTp) {
        this.carOwnerCustTp = carOwnerCustTp;
    }
    /**
     * @return the carOwnerCustCd
     */
    public String getCarOwnerCustCd() {
        return carOwnerCustCd;
    }
    /**
     * @param carOwnerCustCd the carOwnerCustCd to set
     */
    public void setCarOwnerCustCd(String carOwnerCustCd) {
        this.carOwnerCustCd = carOwnerCustCd;
    }
    /**
     * @return the driverOfficeTelNo
     */
    public String getDriverOfficeTelNo() {
        return driverOfficeTelNo;
    }
    /**
     * @param driverOfficeTelNo the driverOfficeTelNo to set
     */
    public void setDriverOfficeTelNo(String driverOfficeTelNo) {
        this.driverOfficeTelNo = driverOfficeTelNo;
    }
    /**
     * @return the driverPrefCommMthCd
     */
    public String getDriverPrefCommMthCd() {
        return driverPrefCommMthCd;
    }
    /**
     * @param driverPrefCommMthCd the driverPrefCommMthCd to set
     */
    public void setDriverPrefCommMthCd(String driverPrefCommMthCd) {
        this.driverPrefCommMthCd = driverPrefCommMthCd;
    }
    /**
     * @return the driverPrefCommNo
     */
    public String getDriverPrefCommNo() {
        return driverPrefCommNo;
    }
    /**
     * @param driverPrefCommNo the driverPrefCommNo to set
     */
    public void setDriverPrefCommNo(String driverPrefCommNo) {
        this.driverPrefCommNo = driverPrefCommNo;
    }
    /**
     * @return the carOwnerOfficeTelNo
     */
    public String getCarOwnerOfficeTelNo() {
        return carOwnerOfficeTelNo;
    }
    /**
     * @param carOwnerOfficeTelNo the carOwnerOfficeTelNo to set
     */
    public void setCarOwnerOfficeTelNo(String carOwnerOfficeTelNo) {
        this.carOwnerOfficeTelNo = carOwnerOfficeTelNo;
    }
    /**
     * @return the carOwnerPrefCommMthCd
     */
    public String getCarOwnerPrefCommMthCd() {
        return carOwnerPrefCommMthCd;
    }
    /**
     * @param carOwnerPrefCommMthCd the carOwnerPrefCommMthCd to set
     */
    public void setCarOwnerPrefCommMthCd(String carOwnerPrefCommMthCd) {
        this.carOwnerPrefCommMthCd = carOwnerPrefCommMthCd;
    }
    /**
     * @return the carOwnerPrefCommNo
     */
    public String getCarOwnerPrefCommNo() {
        return carOwnerPrefCommNo;
    }
    /**
     * @param carOwnerPrefCommNo the carOwnerPrefCommNo to set
     */
    public void setCarOwnerPrefCommNo(String carOwnerPrefCommNo) {
        this.carOwnerPrefCommNo = carOwnerPrefCommNo;
    }
    /**
     * @return the saveType
     */
    public String getSaveType() {
        return saveType;
    }
    /**
     * @param saveType the saveType to set
     */
    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }
    /**
     * @return the driverSaveTp
     */
    public String getDriverSaveTp() {
        return driverSaveTp;
    }
    /**
     * @param driverSaveTp the driverSaveTp to set
     */
    public void setDriverSaveTp(String driverSaveTp) {
        this.driverSaveTp = driverSaveTp;
    }
    /**
     * @return the driverAddrTp
     */
    public String getDriverAddrTp() {
        return driverAddrTp;
    }
    /**
     * @param driverAddrTp the driverAddrTp to set
     */
    public void setDriverAddrTp(String driverAddrTp) {
        this.driverAddrTp = driverAddrTp;
    }
    /**
     * @return the driverSungCd
     */
    public String getDriverSungCd() {
        return driverSungCd;
    }
    /**
     * @param driverSungCd the driverSungCd to set
     */
    public void setDriverSungCd(String driverSungCd) {
        this.driverSungCd = driverSungCd;
    }
    /**
     * @return the driverSungNm
     */
    public String getDriverSungNm() {
        return driverSungNm;
    }
    /**
     * @param driverSungNm the driverSungNm to set
     */
    public void setDriverSungNm(String driverSungNm) {
        this.driverSungNm = driverSungNm;
    }
    /**
     * @return the driverCityCd
     */
    public String getDriverCityCd() {
        return driverCityCd;
    }
    /**
     * @param driverCityCd the driverCityCd to set
     */
    public void setDriverCityCd(String driverCityCd) {
        this.driverCityCd = driverCityCd;
    }
    /**
     * @return the driverCityNm
     */
    public String getDriverCityNm() {
        return driverCityNm;
    }
    /**
     * @param driverCityNm the driverCityNm to set
     */
    public void setDriverCityNm(String driverCityNm) {
        this.driverCityNm = driverCityNm;
    }
    /**
     * @return the driverDistCd
     */
    public String getDriverDistCd() {
        return driverDistCd;
    }
    /**
     * @param driverDistCd the driverDistCd to set
     */
    public void setDriverDistCd(String driverDistCd) {
        this.driverDistCd = driverDistCd;
    }
    /**
     * @return the driverDistNm
     */
    public String getDriverDistNm() {
        return driverDistNm;
    }
    /**
     * @param driverDistNm the driverDistNm to set
     */
    public void setDriverDistNm(String driverDistNm) {
        this.driverDistNm = driverDistNm;
    }

    /**
     * @return the driverAddrDetlCont
     */
    public String getDriverAddrDetlCont() {
        return driverAddrDetlCont;
    }
    /**
     * @param driverAddrDetlCont the driverAddrDetlCont to set
     */
    public void setDriverAddrDetlCont(String driverAddrDetlCont) {
        this.driverAddrDetlCont = driverAddrDetlCont;
    }
    /**
     * @return the carOwnerAddrTp
     */
    public String getCarOwnerAddrTp() {
        return carOwnerAddrTp;
    }
    /**
     * @param carOwnerAddrTp the carOwnerAddrTp to set
     */
    public void setCarOwnerAddrTp(String carOwnerAddrTp) {
        this.carOwnerAddrTp = carOwnerAddrTp;
    }
    /**
     * @return the carOwnerSungCd
     */
    public String getCarOwnerSungCd() {
        return carOwnerSungCd;
    }
    /**
     * @param carOwnerSungCd the carOwnerSungCd to set
     */
    public void setCarOwnerSungCd(String carOwnerSungCd) {
        this.carOwnerSungCd = carOwnerSungCd;
    }
    /**
     * @return the carOwnerSungNm
     */
    public String getCarOwnerSungNm() {
        return carOwnerSungNm;
    }
    /**
     * @param carOwnerSungNm the carOwnerSungNm to set
     */
    public void setCarOwnerSungNm(String carOwnerSungNm) {
        this.carOwnerSungNm = carOwnerSungNm;
    }
    /**
     * @return the carOwnerCityCd
     */
    public String getCarOwnerCityCd() {
        return carOwnerCityCd;
    }
    /**
     * @param carOwnerCityCd the carOwnerCityCd to set
     */
    public void setCarOwnerCityCd(String carOwnerCityCd) {
        this.carOwnerCityCd = carOwnerCityCd;
    }
    /**
     * @return the carOwnerCityNm
     */
    public String getCarOwnerCityNm() {
        return carOwnerCityNm;
    }
    /**
     * @param carOwnerCityNm the carOwnerCityNm to set
     */
    public void setCarOwnerCityNm(String carOwnerCityNm) {
        this.carOwnerCityNm = carOwnerCityNm;
    }
    /**
     * @return the carOwnerDistCd
     */
    public String getCarOwnerDistCd() {
        return carOwnerDistCd;
    }
    /**
     * @param carOwnerDistCd the carOwnerDistCd to set
     */
    public void setCarOwnerDistCd(String carOwnerDistCd) {
        this.carOwnerDistCd = carOwnerDistCd;
    }
    /**
     * @return the carOwnerDistNm
     */
    public String getCarOwnerDistNm() {
        return carOwnerDistNm;
    }
    /**
     * @param carOwnerDistNm the carOwnerDistNm to set
     */
    public void setCarOwnerDistNm(String carOwnerDistNm) {
        this.carOwnerDistNm = carOwnerDistNm;
    }
    /**
     * @return the carOwnerAddrDetlCont
     */
    public String getCarOwnerAddrDetlCont() {
        return carOwnerAddrDetlCont;
    }
    /**
     * @param carOwnerAddrDetlCont the carOwnerAddrDetlCont to set
     */
    public void setCarOwnerAddrDetlCont(String carOwnerAddrDetlCont) {
        this.carOwnerAddrDetlCont = carOwnerAddrDetlCont;
    }
    /**
     * @return the driverAddrSeq
     */
    public String getDriverAddrSeq() {
        return driverAddrSeq;
    }
    /**
     * @param driverAddrSeq the driverAddrSeq to set
     */
    public void setDriverAddrSeq(String driverAddrSeq) {
        this.driverAddrSeq = driverAddrSeq;
    }
    /**
     * @return the carOwnerAddrSeq
     */
    public String getCarOwnerAddrSeq() {
        return carOwnerAddrSeq;
    }
    /**
     * @param carOwnerAddrSeq the carOwnerAddrSeq to set
     */
    public void setCarOwnerAddrSeq(String carOwnerAddrSeq) {
        this.carOwnerAddrSeq = carOwnerAddrSeq;
    }
    /**
     * @return the driverBirthDt
     */
    public String getDriverBirthDt() {
        return driverBirthDt;
    }
    /**
     * @param driverBirthDt the driverBirthDt to set
     */
    public void setDriverBirthDt(String driverBirthDt) {
        this.driverBirthDt = driverBirthDt;
    }
    /**
     * @return the driverBirthRemainDay
     */
    public String getDriverBirthRemainDay() {
        return driverBirthRemainDay;
    }
    /**
     * @param driverBirthRemainDay the driverBirthRemainDay to set
     */
    public void setDriverBirthRemainDay(String driverBirthRemainDay) {
        this.driverBirthRemainDay = driverBirthRemainDay;
    }
    /**
     * @return the carOwnerBirthDt
     */
    public String getCarOwnerBirthDt() {
        return carOwnerBirthDt;
    }
    /**
     * @param carOwnerBirthDt the carOwnerBirthDt to set
     */
    public void setCarOwnerBirthDt(String carOwnerBirthDt) {
        this.carOwnerBirthDt = carOwnerBirthDt;
    }
    /**
     * @return the carOwnerBirthRemainDay
     */
    public String getCarOwnerBirthRemainDay() {
        return carOwnerBirthRemainDay;
    }
    /**
     * @param carOwnerBirthRemainDay the carOwnerBirthRemainDay to set
     */
    public void setCarOwnerBirthRemainDay(String carOwnerBirthRemainDay) {
        this.carOwnerBirthRemainDay = carOwnerBirthRemainDay;
    }
    /**
     * @return the driveMonth
     */
    public String getDriveMonth() {
        return driveMonth;
    }
    /**
     * @param driveMonth the driveMonth to set
     */
    public void setDriveMonth(String driveMonth) {
        this.driveMonth = driveMonth;
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


}
