package chn.bhmc.dms.sal.veh.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleMasterVO.java
 * @Description : 차량마스터 VO
 * @author kim yewon
 * @since 2016. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Jin Suk Kim        최초 생성
 *
 * </pre>
 */

public class VehicleMasterVO extends BaseVO {

    private static final long serialVersionUID = -7796263780712753237L;

    //차량마스터 정보
    private String carId;                               // CAR ID
    private String ncarDstinCd;                         // 신차량구분코드
    private String ncarDstinNm;
    private int stockMonth;                             // 재고월령
    private String carlineCd;                           // 차종코드
    private String carlineNm;
    private String carlineCdNm;
    private String modelCd;                             // 모델코드
    private String modelNm;
    private String modelCdNm;
    private String ocnCd;                               // OCN코드
    private String ocnNm;
    private String ocnCdNm;
    private String extColorCd;                          // 외장색코드
    private String extColorNm;
    private String extColorCdNm;
    private String intColorCd;                          // 내장색코드
    private String intColorNm;
    private String intColorCdNm;
    private String carStatCd;
    private String carStatNm;                           // 차량상태
    private String ownStatCd;
    private String ownStatNm;                           // 보유상태
    private String stockTp;
    private String stockNm;                             // 재고유형
    private String carDstinCd;
    private String carDstinNm;                          // 승/상용
    private String strgeCd;                             // 창고
    private String strgeNm;                             // 창고명
    private String locCd;                               // 위치
    private String locNm;                               // 위치명
    private String saleTp;                              // 판매유형
    private String contractNo;                          // 계약번호
    private String greyYn;                              // 그레이여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grDt;                                  // 입고일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteStartDt;                           // 보증시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date grteEndDt;                             // 보증종료일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date disuseDt;                              // 폐기일
    private String grteStdCd;                           // 보증기준
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carRegDt;                              // 차량등록일
    private String corpCarDstinCd;                      // 자사차량구분
    private String ordDlrCd;                            // 주문딜러
    private String cmpCarYn;                            // 회사차여부
    private String cmpCarDstinCd;                       // 회사차구분
    private String cmpCarDstinNm;
    private String tecId;                               // 서비스고문
    private String ordTp;                               // 오더유형
    private String ordTpNm;
    private String lv2DlrStockYn;                       // 2급딜러재고
    private String lv2DlrOrgCd;                         // 2급딜러
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date lv2DlrStockGrDt;                       // 2급딜러입고일
    private String rfidNo;                              // rfid번호
    private String enginModelCd;                        // 엔진모델코드
    private String enginSerialNo;                       // 엔진번호
    private String certNo;                              // 합격증번호
    private String keyNo;                               // key번호
    private String carNm;                               // 차량명
    private Date custSaleDt;                            // 판매출고일자
    private String remark;                              // 비고
    private String updtUsrId;                           // 수정자
    private String preGiYn;                             // 선출고여부
    private String damageCd;                            // 손상여부
    private int mmCnt;                                  // 월령
    private int ddCnt;                                  // 일령
    private Double retlPrc;                             // 구매가격
    private Double whslPrc;                             // 지도가격
    private Double ddctRate;                            // 공제비율
    private String blockSaleAdvNo;                      // 배정딜러
    private String certSecu2Cd;                         // 합격증저당2번호
    private String jeongpanNo;                          // 정판형호번호
    private String saleEmpNm;                           // 판매사원명
    private String openYn;                              // 공개여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date expcChkDt;                             // 예정점검일자
    private int expcChkRunDistVal;                      // 예정점검일자
    private String fscpRegGrade;                        // 배기등급
    private long damt;                                  // 공제금액
    private long damtRate;                              // 공제율
    private String purcYn;                              // 중고차여부
    private String stockDays;                           // 입고재고일령
    private String facOffDays;                          // 공장출고일령
    private String strYn;                               // 선출고여부
    private String vinmF20010;                          // 제조공장
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrtStrtDt;                             // 보증시작일
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date signoffDt;                             // 생산일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date pltGiDt;                               // 공장출고일자

    //정비에서 신차정보 저장시 필요되는 파라미터
    private String dlrCd;                               // 판매딜러
    private String vinNo;                               // 차대번호
    private String carBrandCd;                          // 브랜드
    private String temp1;                               // 차량명
    private String manufactYyMmDt;                      // 제작년월
    private String carRunDistVal;                       // 주행거리
    private String carDispQty;                          // 배기량
    private String carRegNo;                            // 차량등록번호
    private String regUsrId;

    // 차량소유자
    private String ownerPk;
    private int seq;
    private String bpCd;
    private String bpNm;
    private String useYn;
    private String txtObjectCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;
    private long nCnt;      // 자사차량 보유 수량
    private long oCnt;      // 타사차량 보유 수량

    // 차량운전자
    private String driverPk;
    private String mdriverYn;
    private String carOwnerRelCd;   // 차량소유자관계

    // 옵션
    private String pkgCd;
    private String pkgNm;

    // 계약
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date contractDt;    // 계약일자
    private String saleEmpNo;    //판매사원번호
    private String custCd;
    private String custNm;
    private String addr;
    private String regTp;   // 차량등록
    private String incAapCd; // 보험대행
    private String fincCmpCd;  // 금융회사
    private String fincCmpNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date allocDt;
    private String incCmpCd;  //보험회사
    private String incAapTp;  //보험유형

    // 주문
    private String ordDlrYyMmDt;
    private String ordMmDt;
    private String ordSeq;
    private long whPrc;
    private long msPrc;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date dlrOrdReqDt;
    private String carDumpCd;
    private String erpOrdNo;
    private String trsfDlrCd;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carVinAllocDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date carAllocCancDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcPublDt;

    // 재고
    private String statChgCd;
    private String statChgBefCont;
    private String statChgAftCont;
    private String blockYn;

    //입출고내역
    private String kmvin;
    private String kmopt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date workDt;
    private String kmcncd;
    private String kmtrdy;
    private String bhmcYn;
    private String custNo;
    private String telNo;
    private String hpNo;
    private String expAprYn;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date wrrntEndDt;


    /**
     * @return the wrrntEndDt
     */
    public Date getWrrntEndDt() {
        return wrrntEndDt;
    }
    /**
     * @param wrrntEndDt the wrrntEndDt to set
     */
    public void setWrrntEndDt(Date wrrntEndDt) {
        this.wrrntEndDt = wrrntEndDt;
    }
    /**
     * @return the temp1
     */
    public String getTemp1() {
        return temp1;
    }
    /**
     * @param temp1 the temp1 to set
     */
    public void setTemp1(String temp1) {
        this.temp1 = temp1;
    }
    /**
     * @return the carlineCdNm
     */
    public String getCarlineCdNm() {
        return carlineCdNm;
    }
    /**
     * @param carlineCdNm the carlineCdNm to set
     */
    public void setCarlineCdNm(String carlineCdNm) {
        this.carlineCdNm = carlineCdNm;
    }
    /**
     * @return the modelCdNm
     */
    public String getModelCdNm() {
        return modelCdNm;
    }
    /**
     * @param modelCdNm the modelCdNm to set
     */
    public void setModelCdNm(String modelCdNm) {
        this.modelCdNm = modelCdNm;
    }
    /**
     * @return the ocnCdNm
     */
    public String getOcnCdNm() {
        return ocnCdNm;
    }
    /**
     * @param ocnCdNm the ocnCdNm to set
     */
    public void setOcnCdNm(String ocnCdNm) {
        this.ocnCdNm = ocnCdNm;
    }
    /**
     * @return the extColorCdNm
     */
    public String getExtColorCdNm() {
        return extColorCdNm;
    }
    /**
     * @param extColorCdNm the extColorCdNm to set
     */
    public void setExtColorCdNm(String extColorCdNm) {
        this.extColorCdNm = extColorCdNm;
    }
    /**
     * @return the intColorCdNm
     */
    public String getIntColorCdNm() {
        return intColorCdNm;
    }
    /**
     * @param intColorCdNm the intColorCdNm to set
     */
    public void setIntColorCdNm(String intColorCdNm) {
        this.intColorCdNm = intColorCdNm;
    }
    /**
     * @return the openYn
     */
    public String getOpenYn() {
        return openYn;
    }
    /**
     * @param openYn the openYn to set
     */
    public void setOpenYn(String openYn) {
        this.openYn = openYn;
    }
    /**
     * @return the damageCd
     */
    public String getDamageCd() {
        return damageCd;
    }
    /**
     * @param damageCd the damageCd to set
     */
    public void setDamageCd(String damageCd) {
        this.damageCd = damageCd;
    }
    /**
     * @return the certSecu2Cd
     */
    public String getCertSecu2Cd() {
        return certSecu2Cd;
    }
    /**
     * @param certSecu2Cd the certSecu2Cd to set
     */
    public void setCertSecu2Cd(String certSecu2Cd) {
        this.certSecu2Cd = certSecu2Cd;
    }
    /**
     * @return the jeongpanNo
     */
    public String getJeongpanNo() {
        return jeongpanNo;
    }
    /**
     * @param jeongpanNo the jeongpanNo to set
     */
    public void setJeongpanNo(String jeongpanNo) {
        this.jeongpanNo = jeongpanNo;
    }
    /**
     * @return the saleEmpNm
     */
    public String getSaleEmpNm() {
        return saleEmpNm;
    }
    /**
     * @param saleEmpNm the saleEmpNm to set
     */
    public void setSaleEmpNm(String saleEmpNm) {
        this.saleEmpNm = saleEmpNm;
    }
    /**
     * @return the strgeNm
     */
    public String getStrgeNm() {
        return strgeNm;
    }
    /**
     * @param strgeNm the strgeNm to set
     */
    public void setStrgeNm(String strgeNm) {
        this.strgeNm = strgeNm;
    }
    /**
     * @return the locNm
     */
    public String getLocNm() {
        return locNm;
    }
    /**
     * @param locNm the locNm to set
     */
    public void setLocNm(String locNm) {
        this.locNm = locNm;
    }
    /**
     * @return the mmCnt
     */
    public int getMmCnt() {
        return mmCnt;
    }
    /**
     * @param mmCnt the mmCnt to set
     */
    public void setMmCnt(int mmCnt) {
        this.mmCnt = mmCnt;
    }
    /**
     * @return the ddCnt
     */
    public int getDdCnt() {
        return ddCnt;
    }
    /**
     * @param ddCnt the ddCnt to set
     */
    public void setDdCnt(int ddCnt) {
        this.ddCnt = ddCnt;
    }
    /**
     * @return the retlPrc
     */
    public Double getRetlPrc() {
        return retlPrc;
    }
    /**
     * @param retlPrc the retlPrc to set
     */
    public void setRetlPrc(Double retlPrc) {
        this.retlPrc = retlPrc;
    }
    /**
     * @return the whslPrc
     */
    public Double getWhslPrc() {
        return whslPrc;
    }
    /**
     * @param whslPrc the whslPrc to set
     */
    public void setWhslPrc(Double whslPrc) {
        this.whslPrc = whslPrc;
    }
    /**
     * @return the ddctRate
     */
    public Double getDdctRate() {
        return ddctRate;
    }
    /**
     * @param ddctRate the ddctRate to set
     */
    public void setDdctRate(Double ddctRate) {
        this.ddctRate = ddctRate;
    }
    /**
     * @return the blockSaleAdvNo
     */
    public String getBlockSaleAdvNo() {
        return blockSaleAdvNo;
    }
    /**
     * @param blockSaleAdvNo the blockSaleAdvNo to set
     */
    public void setBlockSaleAdvNo(String blockSaleAdvNo) {
        this.blockSaleAdvNo = blockSaleAdvNo;
    }
    /**
     * @return the preGiYn
     */
    public String getPreGiYn() {
        return preGiYn;
    }
    /**
     * @param preGiYn the preGiYn to set
     */
    public void setPreGiYn(String preGiYn) {
        this.preGiYn = preGiYn;
    }
    /**
     * @return the incCmpCd
     */
    public String getIncCmpCd() {
        return incCmpCd;
    }
    /**
     * @param incCmpCd the incCmpCd to set
     */
    public void setIncCmpCd(String incCmpCd) {
        this.incCmpCd = incCmpCd;
    }
    /**
     * @return the incAapTp
     */
    public String getIncAapTp() {
        return incAapTp;
    }
    /**
     * @param incAapTp the incAapTp to set
     */
    public void setIncAapTp(String incAapTp) {
        this.incAapTp = incAapTp;
    }
    /**
     * @return the driverPk
     */
    public String getDriverPk() {
        return driverPk;
    }
    /**
     * @param driverPk the driverPk to set
     */
    public void setDriverPk(String driverPk) {
        this.driverPk = driverPk;
    }
    /**
     * @return the ownerPk
     */
    public String getOwnerPk() {
        return ownerPk;
    }
    /**
     * @param ownerPk the ownerPk to set
     */
    public void setOwnerPk(String ownerPk) {
        this.ownerPk = ownerPk;
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
     * @return the ncarDstinCd
     */
    public String getNcarDstinCd() {
        return ncarDstinCd;
    }
    /**
     * @param ncarDstinCd the ncarDstinCd to set
     */
    public void setNcarDstinCd(String ncarDstinCd) {
        this.ncarDstinCd = ncarDstinCd;
    }
    /**
     * @return the ncarDstinNm
     */
    public String getNcarDstinNm() {
        return ncarDstinNm;
    }
    /**
     * @param ncarDstinNm the ncarDstinNm to set
     */
    public void setNcarDstinNm(String ncarDstinNm) {
        this.ncarDstinNm = ncarDstinNm;
    }
    /**
     * @return the stockMonth
     */
    public int getStockMonth() {
        return stockMonth;
    }
    /**
     * @param stockMonth the stockMonth to set
     */
    public void setStockMonth(int stockMonth) {
        this.stockMonth = stockMonth;
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
     * @return the intColorCd
     */
    public String getIntColorCd() {
        return intColorCd;
    }
    /**
     * @param intColorCd the intColorCd to set
     */
    public void setIntColorCd(String intColorCd) {
        this.intColorCd = intColorCd;
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
     * @return the carStatNm
     */
    public String getCarStatNm() {
        return carStatNm;
    }
    /**
     * @param carStatNm the carStatNm to set
     */
    public void setCarStatNm(String carStatNm) {
        this.carStatNm = carStatNm;
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
     * @return the ownStatNm
     */
    public String getOwnStatNm() {
        return ownStatNm;
    }
    /**
     * @param ownStatNm the ownStatNm to set
     */
    public void setOwnStatNm(String ownStatNm) {
        this.ownStatNm = ownStatNm;
    }
    /**
     * @return the stockTp
     */
    public String getStockTp() {
        return stockTp;
    }
    /**
     * @param stockTp the stockTp to set
     */
    public void setStockTp(String stockTp) {
        this.stockTp = stockTp;
    }
    /**
     * @return the stockNm
     */
    public String getStockNm() {
        return stockNm;
    }
    /**
     * @param stockNm the stockNm to set
     */
    public void setStockNm(String stockNm) {
        this.stockNm = stockNm;
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
     * @return the carDstinNm
     */
    public String getCarDstinNm() {
        return carDstinNm;
    }
    /**
     * @param carDstinNm the carDstinNm to set
     */
    public void setCarDstinNm(String carDstinNm) {
        this.carDstinNm = carDstinNm;
    }
    /**
     * @return the strgeCd
     */
    public String getStrgeCd() {
        return strgeCd;
    }
    /**
     * @param strgeCd the strgeCd to set
     */
    public void setStrgeCd(String strgeCd) {
        this.strgeCd = strgeCd;
    }
    /**
     * @return the locCd
     */
    public String getLocCd() {
        return locCd;
    }
    /**
     * @param locCd the locCd to set
     */
    public void setLocCd(String locCd) {
        this.locCd = locCd;
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
     * @return the saleTp
     */
    public String getSaleTp() {
        return saleTp;
    }
    /**
     * @param saleTp the saleTp to set
     */
    public void setSaleTp(String saleTp) {
        this.saleTp = saleTp;
    }
    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }
    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }
    /**
     * @return the greyYn
     */
    public String getGreyYn() {
        return greyYn;
    }
    /**
     * @param greyYn the greyYn to set
     */
    public void setGreyYn(String greyYn) {
        this.greyYn = greyYn;
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
     * @return the manufactYyMmDt
     */
    public String getManufactYyMmDt() {
        return manufactYyMmDt;
    }
    /**
     * @param manufactYyMmDt the manufactYyMmDt to set
     */
    public void setManufactYyMmDt(String manufactYyMmDt) {
        this.manufactYyMmDt = manufactYyMmDt;
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
     * @return the disuseDt
     */
    public Date getDisuseDt() {
        return disuseDt;
    }
    /**
     * @param disuseDt the disuseDt to set
     */
    public void setDisuseDt(Date disuseDt) {
        this.disuseDt = disuseDt;
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
     * @return the cmpCarDstinNm
     */
    public String getCmpCarDstinNm() {
        return cmpCarDstinNm;
    }
    /**
     * @param cmpCarDstinNm the cmpCarDstinNm to set
     */
    public void setCmpCarDstinNm(String cmpCarDstinNm) {
        this.cmpCarDstinNm = cmpCarDstinNm;
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
     * @return the ordTpNm
     */
    public String getOrdTpNm() {
        return ordTpNm;
    }
    /**
     * @param ordTpNm the ordTpNm to set
     */
    public void setOrdTpNm(String ordTpNm) {
        this.ordTpNm = ordTpNm;
    }
    /**
     * @return the lv2DlrStockYn
     */
    public String getLv2DlrStockYn() {
        return lv2DlrStockYn;
    }
    /**
     * @param lv2DlrStockYn the lv2DlrStockYn to set
     */
    public void setLv2DlrStockYn(String lv2DlrStockYn) {
        this.lv2DlrStockYn = lv2DlrStockYn;
    }
    /**
     * @return the lv2DlrOrgCd
     */
    public String getLv2DlrOrgCd() {
        return lv2DlrOrgCd;
    }
    /**
     * @param lv2DlrOrgCd the lv2DlrOrgCd to set
     */
    public void setLv2DlrOrgCd(String lv2DlrOrgCd) {
        this.lv2DlrOrgCd = lv2DlrOrgCd;
    }
    /**
     * @return the lv2DlrStockGrDt
     */
    public Date getLv2DlrStockGrDt() {
        return lv2DlrStockGrDt;
    }
    /**
     * @param lv2DlrStockGrDt the lv2DlrStockGrDt to set
     */
    public void setLv2DlrStockGrDt(Date lv2DlrStockGrDt) {
        this.lv2DlrStockGrDt = lv2DlrStockGrDt;
    }
    /**
     * @return the rfidNo
     */
    public String getRfidNo() {
        return rfidNo;
    }
    /**
     * @param rfidNo the rfidNo to set
     */
    public void setRfidNo(String rfidNo) {
        this.rfidNo = rfidNo;
    }
    /**
     * @return the enginModelCd
     */
    public String getEnginModelCd() {
        return enginModelCd;
    }
    /**
     * @param enginModelCd the enginModelCd to set
     */
    public void setEnginModelCd(String enginModelCd) {
        this.enginModelCd = enginModelCd;
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
     * @return the keyNo
     */
    public String getKeyNo() {
        return keyNo;
    }
    /**
     * @param keyNo the keyNo to set
     */
    public void setKeyNo(String keyNo) {
        this.keyNo = keyNo;
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
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }
    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }
    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }
    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
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
     * @return the txtObjectCd
     */
    public String getTxtObjectCd() {
        return txtObjectCd;
    }
    /**
     * @param txtObjectCd the txtObjectCd to set
     */
    public void setTxtObjectCd(String txtObjectCd) {
        this.txtObjectCd = txtObjectCd;
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
     * @return the nCnt
     */
    public long getnCnt() {
        return nCnt;
    }
    /**
     * @param nCnt the nCnt to set
     */
    public void setnCnt(long nCnt) {
        this.nCnt = nCnt;
    }
    /**
     * @return the oCnt
     */
    public long getoCnt() {
        return oCnt;
    }
    /**
     * @param oCnt the oCnt to set
     */
    public void setoCnt(long oCnt) {
        this.oCnt = oCnt;
    }
    /**
     * @return the mdriverYn
     */
    public String getMdriverYn() {
        return mdriverYn;
    }
    /**
     * @param mdriverYn the mdriverYn to set
     */
    public void setMdriverYn(String mdriverYn) {
        this.mdriverYn = mdriverYn;
    }
    /**
     * @return the pkgCd
     */
    public String getPkgCd() {
        return pkgCd;
    }
    /**
     * @param pkgCd the pkgCd to set
     */
    public void setPkgCd(String pkgCd) {
        this.pkgCd = pkgCd;
    }
    /**
     * @return the pkgNm
     */
    public String getPkgNm() {
        return pkgNm;
    }
    /**
     * @param pkgNm the pkgNm to set
     */
    public void setPkgNm(String pkgNm) {
        this.pkgNm = pkgNm;
    }
    /**
     * @return the contractDt
     */
    public Date getContractDt() {
        return contractDt;
    }
    /**
     * @param contractDt the contractDt to set
     */
    public void setContractDt(Date contractDt) {
        this.contractDt = contractDt;
    }
    /**
     * @return the saleEmpNo
     */
    public String getSaleEmpNo() {
        return saleEmpNo;
    }
    /**
     * @param saleEmpNo the saleEmpNo to set
     */
    public void setSaleEmpNo(String saleEmpNo) {
        this.saleEmpNo = saleEmpNo;
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
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }
    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }
    /**
     * @return the regTp
     */
    public String getRegTp() {
        return regTp;
    }
    /**
     * @param regTp the regTp to set
     */
    public void setRegTp(String regTp) {
        this.regTp = regTp;
    }
    /**
     * @return the incAapCd
     */
    public String getIncAapCd() {
        return incAapCd;
    }
    /**
     * @param incAapCd the incAapCd to set
     */
    public void setIncAapCd(String incAapCd) {
        this.incAapCd = incAapCd;
    }
    /**
     * @return the fincCmpCd
     */
    public String getFincCmpCd() {
        return fincCmpCd;
    }
    /**
     * @param fincCmpCd the fincCmpCd to set
     */
    public void setFincCmpCd(String fincCmpCd) {
        this.fincCmpCd = fincCmpCd;
    }
    /**
     * @return the fincCmpNm
     */
    public String getFincCmpNm() {
        return fincCmpNm;
    }
    /**
     * @param fincCmpNm the fincCmpNm to set
     */
    public void setFincCmpNm(String fincCmpNm) {
        this.fincCmpNm = fincCmpNm;
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
     * @return the ordDlrYyMmDt
     */
    public String getOrdDlrYyMmDt() {
        return ordDlrYyMmDt;
    }
    /**
     * @param ordDlrYyMmDt the ordDlrYyMmDt to set
     */
    public void setOrdDlrYyMmDt(String ordDlrYyMmDt) {
        this.ordDlrYyMmDt = ordDlrYyMmDt;
    }
    /**
     * @return the ordMmDt
     */
    public String getOrdMmDt() {
        return ordMmDt;
    }
    /**
     * @param ordMmDt the ordMmDt to set
     */
    public void setOrdMmDt(String ordMmDt) {
        this.ordMmDt = ordMmDt;
    }
    /**
     * @return the ordSeq
     */
    public String getOrdSeq() {
        return ordSeq;
    }
    /**
     * @param ordSeq the ordSeq to set
     */
    public void setOrdSeq(String ordSeq) {
        this.ordSeq = ordSeq;
    }
    /**
     * @return the whPrc
     */
    public long getWhPrc() {
        return whPrc;
    }
    /**
     * @param whPrc the whPrc to set
     */
    public void setWhPrc(long whPrc) {
        this.whPrc = whPrc;
    }
    /**
     * @return the msPrc
     */
    public long getMsPrc() {
        return msPrc;
    }
    /**
     * @param msPrc the msPrc to set
     */
    public void setMsPrc(long msPrc) {
        this.msPrc = msPrc;
    }
    /**
     * @return the dlrOrdReqDt
     */
    public Date getDlrOrdReqDt() {
        return dlrOrdReqDt;
    }
    /**
     * @param dlrOrdReqDt the dlrOrdReqDt to set
     */
    public void setDlrOrdReqDt(Date dlrOrdReqDt) {
        this.dlrOrdReqDt = dlrOrdReqDt;
    }
    /**
     * @return the carDumpCd
     */
    public String getCarDumpCd() {
        return carDumpCd;
    }
    /**
     * @param carDumpCd the carDumpCd to set
     */
    public void setCarDumpCd(String carDumpCd) {
        this.carDumpCd = carDumpCd;
    }
    /**
     * @return the erpOrdNo
     */
    public String getErpOrdNo() {
        return erpOrdNo;
    }
    /**
     * @param erpOrdNo the erpOrdNo to set
     */
    public void setErpOrdNo(String erpOrdNo) {
        this.erpOrdNo = erpOrdNo;
    }
    /**
     * @return the trsfDlrCd
     */
    public String getTrsfDlrCd() {
        return trsfDlrCd;
    }
    /**
     * @param trsfDlrCd the trsfDlrCd to set
     */
    public void setTrsfDlrCd(String trsfDlrCd) {
        this.trsfDlrCd = trsfDlrCd;
    }
    /**
     * @return the carVinAllocDt
     */
    public Date getCarVinAllocDt() {
        return carVinAllocDt;
    }
    /**
     * @param carVinAllocDt the carVinAllocDt to set
     */
    public void setCarVinAllocDt(Date carVinAllocDt) {
        this.carVinAllocDt = carVinAllocDt;
    }
    /**
     * @return the carAllocCancDt
     */
    public Date getCarAllocCancDt() {
        return carAllocCancDt;
    }
    /**
     * @param carAllocCancDt the carAllocCancDt to set
     */
    public void setCarAllocCancDt(Date carAllocCancDt) {
        this.carAllocCancDt = carAllocCancDt;
    }
    /**
     * @return the invcPublDt
     */
    public Date getInvcPublDt() {
        return invcPublDt;
    }
    /**
     * @param invcPublDt the invcPublDt to set
     */
    public void setInvcPublDt(Date invcPublDt) {
        this.invcPublDt = invcPublDt;
    }
    /**
     * @return the statChgCd
     */
    public String getStatChgCd() {
        return statChgCd;
    }
    /**
     * @param statChgCd the statChgCd to set
     */
    public void setStatChgCd(String statChgCd) {
        this.statChgCd = statChgCd;
    }
    /**
     * @return the statChgBefCont
     */
    public String getStatChgBefCont() {
        return statChgBefCont;
    }
    /**
     * @param statChgBefCont the statChgBefCont to set
     */
    public void setStatChgBefCont(String statChgBefCont) {
        this.statChgBefCont = statChgBefCont;
    }
    /**
     * @return the statChgAftCont
     */
    public String getStatChgAftCont() {
        return statChgAftCont;
    }
    /**
     * @param statChgAftCont the statChgAftCont to set
     */
    public void setStatChgAftCont(String statChgAftCont) {
        this.statChgAftCont = statChgAftCont;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @return the expcChkDt
     */
    public Date getExpcChkDt() {
        return expcChkDt;
    }
    /**
     * @param expcChkDt the expcChkDt to set
     */
    public void setExpcChkDt(Date expcChkDt) {
        this.expcChkDt = expcChkDt;
    }
    /**
     * @return the expcChkRunDistVal
     */
    public int getExpcChkRunDistVal() {
        return expcChkRunDistVal;
    }
    /**
     * @param expcChkRunDistVal the expcChkRunDistVal to set
     */
    public void setExpcChkRunDistVal(int expcChkRunDistVal) {
        this.expcChkRunDistVal = expcChkRunDistVal;
    }
    /**
     * @return the blockYn
     */
    public String getBlockYn() {
        return blockYn;
    }
    /**
     * @param blockYn the blockYn to set
     */
    public void setBlockYn(String blockYn) {
        this.blockYn = blockYn;
    }
    /**
     * @return the kmvin
     */
    public String getKmvin() {
        return kmvin;
    }
    /**
     * @param kmvin the kmvin to set
     */
    public void setKmvin(String kmvin) {
        this.kmvin = kmvin;
    }
    /**
     * @return the kmopt
     */
    public String getKmopt() {
        return kmopt;
    }
    /**
     * @param kmopt the kmopt to set
     */
    public void setKmopt(String kmopt) {
        this.kmopt = kmopt;
    }

    /**
     * @return the workDt
     */
    public Date getWorkDt() {
        return workDt;
    }
    /**
     * @param workDt the workDt to set
     */
    public void setWorkDt(Date workDt) {
        this.workDt = workDt;
    }
    /**
     * @return the kmcncd
     */
    public String getKmcncd() {
        return kmcncd;
    }
    /**
     * @param kmcncd the kmcncd to set
     */
    public void setKmcncd(String kmcncd) {
        this.kmcncd = kmcncd;
    }
    /**
     * @return the kmtrdy
     */
    public String getKmtrdy() {
        return kmtrdy;
    }
    /**
     * @param kmtrdy the kmtrdy to set
     */
    public void setKmtrdy(String kmtrdy) {
        this.kmtrdy = kmtrdy;
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
     * @return the expAprYn
     */
    public String getExpAprYn() {
        return expAprYn;
    }
    /**
     * @param expAprYn the expAprYn to set
     */
    public void setExpAprYn(String expAprYn) {
        this.expAprYn = expAprYn;
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
     * @return the carOwnerRelCd
     */
    public String getCarOwnerRelCd() {
        return carOwnerRelCd;
    }
    /**
     * @param carOwnerRelCd the carOwnerRelCd to set
     */
    public void setCarOwnerRelCd(String carOwnerRelCd) {
        this.carOwnerRelCd = carOwnerRelCd;
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
     * @return the fscpRegGrade
     */
    public String getFscpRegGrade() {
        return fscpRegGrade;
    }
    /**
     * @param fscpRegGrade the fscpRegGrade to set
     */
    public void setFscpRegGrade(String fscpRegGrade) {
        this.fscpRegGrade = fscpRegGrade;
    }
    /**
     * @return the damt
     */
    public long getDamt() {
        return damt;
    }
    /**
     * @return the damtRate
     */
    public long getDamtRate() {
        return damtRate;
    }
    /**
     * @return the purcYn
     */
    public String getPurcYn() {
        return purcYn;
    }
    /**
     * @return the stockDays
     */
    public String getStockDays() {
        return stockDays;
    }
    /**
     * @return the facOffDays
     */
    public String getFacOffDays() {
        return facOffDays;
    }
    /**
     * @return the strYn
     */
    public String getStrYn() {
        return strYn;
    }
    /**
     * @return the vinmF20010
     */
    public String getVinmF20010() {
        return vinmF20010;
    }
    /**
     * @return the wrtStrtDt
     */
    public Date getWrtStrtDt() {
        return wrtStrtDt;
    }
    /**
     * @return the signoffDt
     */
    public Date getSignoffDt() {
        return signoffDt;
    }
    /**
     * @param signoffDt the signoffDt to set
     */
    public void setSignoffDt(Date signoffDt) {
        this.signoffDt = signoffDt;
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
     * @param damt the damt to set
     */
    public void setDamt(long damt) {
        this.damt = damt;
    }
    /**
     * @param damtRate the damtRate to set
     */
    public void setDamtRate(long damtRate) {
        this.damtRate = damtRate;
    }
    /**
     * @param purcYn the purcYn to set
     */
    public void setPurcYn(String purcYn) {
        this.purcYn = purcYn;
    }
    /**
     * @param stockDays the stockDays to set
     */
    public void setStockDays(String stockDays) {
        this.stockDays = stockDays;
    }
    /**
     * @param facOffDays the facOffDays to set
     */
    public void setFacOffDays(String facOffDays) {
        this.facOffDays = facOffDays;
    }
    /**
     * @param strYn the strYn to set
     */
    public void setStrYn(String strYn) {
        this.strYn = strYn;
    }
    /**
     * @param vinmF20010 the vinmF20010 to set
     */
    public void setVinmF20010(String vinmF20010) {
        this.vinmF20010 = vinmF20010;
    }
    /**
     * @param wrtStrtDt the wrtStrtDt to set
     */
    public void setWrtStrtDt(Date wrtStrtDt) {
        this.wrtStrtDt = wrtStrtDt;
    }
}