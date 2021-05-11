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
 * @ClassName   : TopSelectionUsedCarVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.      Kim yewon              최초 생성
 * </pre>
 */


public class TopSelectionUsedCarVO extends BaseVO {

    /**sellerexpectprive
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;


    private String carId;                                   //차량ID
    private String vin;                                     //VIN번호
    private String carmodel;                                //차형
    private String place;                                   //차양소속지
    private String producecompany;                          //제조사
    private String licensenostart;                          //번호판번호스타트
    private String brand;                                   //브랜드
    private String color;                                   //차색
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date factorydate;                               //출교일자
    private String carkind;                                 //차량유형
    private String carstyle;                                //차종
    private String coveredmiles;                            //주행거리
    private Double sellerexpectprice;                       //예매가격
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date registdate;                                //등록년월일
    private Double bluerefprice;                            //차량판매가격
    private Double intendbuyprice;                          //평가가격
    private String engineno;                                //엔진번호
    private String exchangetype;                            //거래유형
    private String licenseno;                               //번호판
    private String sellwithlicense;                         //등록판과같이판매여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date taxdate;                                   //차배세완료기한
    private String maintain;                                //보양정상여부
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date mustinsure;                                //교통사고강제보험기한
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String commerceinsure;                          //상업보험기한
    private String carconfig;                               //차령스팩
    private String imgs;                                    //이미지
    private String remarks;                                 //보증서유무
    private Double companyid;                               //회사ID
    private Double usersid;                                 //사용자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date createdate;                                //생성시간
    private String bkcol1;                                  //치환여부
    private String bkcol2;                                  //평가자
    private String isregcard;                               //고객소유영수증정보
    private String isregcard1;                              //고객소유영수증정보 - 등록증
    private String isregcard2;                              //고객소유영수증정보 - 운전증
    private String isregcard3;                              //고객소유영수증정보 - 구매세증
    private String isregcard4;                              //고객소유영수증정보 - 차량구입영수증(신차영수증)
    private String isregcard5;                              //고객소유영수증정보 - 구매세표
    private String isregcard6;                              //고객소유영수증정보 - 인도표
    private String isregcard7;                              //고객소유영수증정보 - 환경보호증
    private String dangwei;                                 //기어
    private String chandi;                                  //산지
    private String youqi;                                   //페인트
    private String carleixing;                              //차량유형
    private String carfdj;                                  //엔진
    private String carranliao;                              //연료
    private String carkuanshi;                              //차량신상식
    private String carpailiang;                             //배기량
    private String carpaifangbz;                            //배출기준
    private String dangwei1;                                //GEARS
    private String carleixing1;                             //유형
    private String carleixing2;                             //구동유형
    private Double callid;                                  //CALLID
    private Double isrents;                                 //ISRENTS
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date acquisitiondate;                           //매입일자
    private Double is4snewcar;                              //딜러점신차여부
    private String contractnum;                             //계약번호
    private Double usedforcarexid;                          //차량치환테이블연관ID
    private String buyfrom;                                 //매입채널$정보유통경로
    private String buyfrom1;                                //매입채널
    private String buyfrom2;                                //정보유통경로
    private String storeplace;                              //창고장소
    private String newlicenseno;                            //번호판번호(인도후)
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date verdatetime;                               //라스트갱신시간
    private Double modelid;                                 //모델ID
    private Double makeid;                                  //메이커ID
    private Double trimid;                                  //TRIMID
    private Double isweb;                                   //온라인으로배포여부
    private Double isoldcar;                                //구로차여부
    private String billing;                                 //영수증번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String billingtime;                             //영수증일자
    private int issave;                                     //저장모드
    private Double isvinerperar;                            //VIN중복여부
    private Double jzgmakeid;                               //JZGMAKEID
    private Double jzgmodelid;                              //JZGMODELID
    private Double jzgstyleid;                              //JZGSTYLEID
    private String position;                                //차량이미지대응위치
    private Double iswebfailure;                            //인터넷배포실패여부
    private String ewmimgname;                              //QR CODE
    private Double dycwcarid;                               //CARID
    private String orderno;                                 //주문번호
    private String ismustinsure;                            //교강보험여부
    private String insurance;                               //사업보험
    private String insurance1;                              //사업보험 - 무
    private String insurance2;                              //사업보험 - 차량손해
    private String insurance3;                              //사업보험 - 제삼자
    private String insurance4;                              //사업보험 - 도난
    private String insurance5;                              //사업보험 - 차량인원
    private String insurance6;                              //사업보험 - 부가
    private String insurance7;                              //사업보험 - 유리
    private String insurance8;                              //사업보험 - 스크래치
    private String insurance9;                              //사업보험 - 침수
    private Double isrzstatus;                              //인증치환여부
    private String regUsrId;                                //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                                     //등록일자
    private String updtUsrId;                               //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                                    //수정일자

    //상업보험배열
    private String insuranceArray;
    //고객소유영수증
    private String isregcardArray;
    //매입채널&정보유통경로
    private String buyfromArray;




    /**
     * @return the isregcard1
     */
    public String getIsregcard1() {
        return isregcard1;
    }
    /**
     * @param isregcard1 the isregcard1 to set
     */
    public void setIsregcard1(String isregcard1) {
        this.isregcard1 = isregcard1;
    }
    /**
     * @return the isregcard2
     */
    public String getIsregcard2() {
        return isregcard2;
    }
    /**
     * @param isregcard2 the isregcard2 to set
     */
    public void setIsregcard2(String isregcard2) {
        this.isregcard2 = isregcard2;
    }
    /**
     * @return the isregcard3
     */
    public String getIsregcard3() {
        return isregcard3;
    }
    /**
     * @param isregcard3 the isregcard3 to set
     */
    public void setIsregcard3(String isregcard3) {
        this.isregcard3 = isregcard3;
    }
    /**
     * @return the isregcard4
     */
    public String getIsregcard4() {
        return isregcard4;
    }
    /**
     * @param isregcard4 the isregcard4 to set
     */
    public void setIsregcard4(String isregcard4) {
        this.isregcard4 = isregcard4;
    }
    /**
     * @return the isregcard5
     */
    public String getIsregcard5() {
        return isregcard5;
    }
    /**
     * @param isregcard5 the isregcard5 to set
     */
    public void setIsregcard5(String isregcard5) {
        this.isregcard5 = isregcard5;
    }
    /**
     * @return the isregcard6
     */
    public String getIsregcard6() {
        return isregcard6;
    }
    /**
     * @param isregcard6 the isregcard6 to set
     */
    public void setIsregcard6(String isregcard6) {
        this.isregcard6 = isregcard6;
    }
    /**
     * @return the isregcard7
     */
    public String getIsregcard7() {
        return isregcard7;
    }
    /**
     * @param isregcard7 the isregcard7 to set
     */
    public void setIsregcard7(String isregcard7) {
        this.isregcard7 = isregcard7;
    }
    /**
     * @return the insurance1
     */
    public String getInsurance1() {
        return insurance1;
    }
    /**
     * @param insurance1 the insurance1 to set
     */
    public void setInsurance1(String insurance1) {
        this.insurance1 = insurance1;
    }
    /**
     * @return the insurance2
     */
    public String getInsurance2() {
        return insurance2;
    }
    /**
     * @param insurance2 the insurance2 to set
     */
    public void setInsurance2(String insurance2) {
        this.insurance2 = insurance2;
    }
    /**
     * @return the insurance3
     */
    public String getInsurance3() {
        return insurance3;
    }
    /**
     * @param insurance3 the insurance3 to set
     */
    public void setInsurance3(String insurance3) {
        this.insurance3 = insurance3;
    }
    /**
     * @return the insurance4
     */
    public String getInsurance4() {
        return insurance4;
    }
    /**
     * @param insurance4 the insurance4 to set
     */
    public void setInsurance4(String insurance4) {
        this.insurance4 = insurance4;
    }
    /**
     * @return the insurance5
     */
    public String getInsurance5() {
        return insurance5;
    }
    /**
     * @param insurance5 the insurance5 to set
     */
    public void setInsurance5(String insurance5) {
        this.insurance5 = insurance5;
    }
    /**
     * @return the insurance6
     */
    public String getInsurance6() {
        return insurance6;
    }
    /**
     * @param insurance6 the insurance6 to set
     */
    public void setInsurance6(String insurance6) {
        this.insurance6 = insurance6;
    }
    /**
     * @return the insurance7
     */
    public String getInsurance7() {
        return insurance7;
    }
    /**
     * @param insurance7 the insurance7 to set
     */
    public void setInsurance7(String insurance7) {
        this.insurance7 = insurance7;
    }
    /**
     * @return the insurance8
     */
    public String getInsurance8() {
        return insurance8;
    }
    /**
     * @param insurance8 the insurance8 to set
     */
    public void setInsurance8(String insurance8) {
        this.insurance8 = insurance8;
    }
    /**
     * @return the insurance9
     */
    public String getInsurance9() {
        return insurance9;
    }
    /**
     * @param insurance9 the insurance9 to set
     */
    public void setInsurance9(String insurance9) {
        this.insurance9 = insurance9;
    }
    /**
     * @return the insuranceArray
     */
    public String getInsuranceArray() {
        return insuranceArray;
    }
    /**
     * @param insuranceArray the insuranceArray to set
     */
    public void setInsuranceArray(String insuranceArray) {
        this.insuranceArray = insuranceArray;
    }
    /**
     * @return the isregcardArray
     */
    public String getIsregcardArray() {
        return isregcardArray;
    }
    /**
     * @param isregcardArray the isregcardArray to set
     */
    public void setIsregcardArray(String isregcardArray) {
        this.isregcardArray = isregcardArray;
    }
    /**
     * @return the buyfromArray
     */
    public String getBuyfromArray() {
        return buyfromArray;
    }
    /**
     * @param buyfromArray the buyfromArray to set
     */
    public void setBuyfromArray(String buyfromArray) {
        this.buyfromArray = buyfromArray;
    }
    /**
     * @return the buyfrom1
     */
    public String getBuyfrom1() {
        return buyfrom1;
    }
    /**
     * @param buyfrom1 the buyfrom1 to set
     */
    public void setBuyfrom1(String buyfrom1) {
        this.buyfrom1 = buyfrom1;
    }
    /**
     * @return the buyfrom2
     */
    public String getBuyfrom2() {
        return buyfrom2;
    }
    /**
     * @param buyfrom2 the buyfrom2 to set
     */
    public void setBuyfrom2(String buyfrom2) {
        this.buyfrom2 = buyfrom2;
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
     * @return the vin
     */
    public String getVin() {
        return vin;
    }
    /**
     * @param vin the vin to set
     */
    public void setVin(String vin) {
        this.vin = vin;
    }
    /**
     * @return the carmodel
     */
    public String getCarmodel() {
        return carmodel;
    }
    /**
     * @param carmodel the carmodel to set
     */
    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel;
    }
    /**
     * @return the place
     */
    public String getPlace() {
        return place;
    }
    /**
     * @param place the place to set
     */
    public void setPlace(String place) {
        this.place = place;
    }
    /**
     * @return the producecompany
     */
    public String getProducecompany() {
        return producecompany;
    }
    /**
     * @param producecompany the producecompany to set
     */
    public void setProducecompany(String producecompany) {
        this.producecompany = producecompany;
    }
    /**
     * @return the licensenostart
     */
    public String getLicensenostart() {
        return licensenostart;
    }
    /**
     * @param licensenostart the licensenostart to set
     */
    public void setLicensenostart(String licensenostart) {
        this.licensenostart = licensenostart;
    }
    /**
     * @return the brand
     */
    public String getBrand() {
        return brand;
    }
    /**
     * @param brand the brand to set
     */
    public void setBrand(String brand) {
        this.brand = brand;
    }
    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }
    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }
    /**
     * @return the factorydate
     */
    public Date getFactorydate() {
        return factorydate;
    }
    /**
     * @param factorydate the factorydate to set
     */
    public void setFactorydate(Date factorydate) {
        this.factorydate = factorydate;
    }
    /**
     * @return the carkind
     */
    public String getCarkind() {
        return carkind;
    }
    /**
     * @param carkind the carkind to set
     */
    public void setCarkind(String carkind) {
        this.carkind = carkind;
    }
    /**
     * @return the carstyle
     */
    public String getCarstyle() {
        return carstyle;
    }
    /**
     * @param carstyle the carstyle to set
     */
    public void setCarstyle(String carstyle) {
        this.carstyle = carstyle;
    }
    /**
     * @return the coveredmiles
     */
    public String getCoveredmiles() {
        return coveredmiles;
    }
    /**
     * @param coveredmiles the coveredmiles to set
     */
    public void setCoveredmiles(String coveredmiles) {
        this.coveredmiles = coveredmiles;
    }
    /**
     * @return the sellerexpectprice
     */
    public Double getSellerexpectprice() {
        return sellerexpectprice;
    }
    /**
     * @param sellerexpectprice the sellerexpectprice to set
     */
    public void setSellerexpectprice(Double sellerexpectprice) {
        this.sellerexpectprice = sellerexpectprice;
    }
    /**
     * @return the registdate
     */
    public Date getRegistdate() {
        return registdate;
    }
    /**
     * @param registdate the registdate to set
     */
    public void setRegistdate(Date registdate) {
        this.registdate = registdate;
    }
    /**
     * @return the bluerefprice
     */
    public Double getBluerefprice() {
        return bluerefprice;
    }
    /**
     * @param bluerefprice the bluerefprice to set
     */
    public void setBluerefprice(Double bluerefprice) {
        this.bluerefprice = bluerefprice;
    }
    /**
     * @return the intendbuyprice
     */
    public Double getIntendbuyprice() {
        return intendbuyprice;
    }
    /**
     * @param intendbuyprice the intendbuyprice to set
     */
    public void setIntendbuyprice(Double intendbuyprice) {
        this.intendbuyprice = intendbuyprice;
    }
    /**
     * @return the engineno
     */
    public String getEngineno() {
        return engineno;
    }
    /**
     * @param engineno the engineno to set
     */
    public void setEngineno(String engineno) {
        this.engineno = engineno;
    }
    /**
     * @return the exchangetype
     */
    public String getExchangetype() {
        return exchangetype;
    }
    /**
     * @param exchangetype the exchangetype to set
     */
    public void setExchangetype(String exchangetype) {
        this.exchangetype = exchangetype;
    }
    /**
     * @return the licenseno
     */
    public String getLicenseno() {
        return licenseno;
    }
    /**
     * @param licenseno the licenseno to set
     */
    public void setLicenseno(String licenseno) {
        this.licenseno = licenseno;
    }
    /**
     * @return the sellwithlicense
     */
    public String getSellwithlicense() {
        return sellwithlicense;
    }
    /**
     * @param sellwithlicense the sellwithlicense to set
     */
    public void setSellwithlicense(String sellwithlicense) {
        this.sellwithlicense = sellwithlicense;
    }
    /**
     * @return the taxdate
     */
    public Date getTaxdate() {
        return taxdate;
    }
    /**
     * @param taxdate the taxdate to set
     */
    public void setTaxdate(Date taxdate) {
        this.taxdate = taxdate;
    }
    /**
     * @return the maintain
     */
    public String getMaintain() {
        return maintain;
    }
    /**
     * @param maintain the maintain to set
     */
    public void setMaintain(String maintain) {
        this.maintain = maintain;
    }
    /**
     * @return the mustinsure
     */
    public Date getMustinsure() {
        return mustinsure;
    }
    /**
     * @param mustinsure the mustinsure to set
     */
    public void setMustinsure(Date mustinsure) {
        this.mustinsure = mustinsure;
    }
    /**
     * @return the commerceinsure
     */
    public String getCommerceinsure() {
        return commerceinsure;
    }
    /**
     * @param commerceinsure the commerceinsure to set
     */
    public void setCommerceinsure(String commerceinsure) {
        this.commerceinsure = commerceinsure;
    }
    /**
     * @return the carconfig
     */
    public String getCarconfig() {
        return carconfig;
    }
    /**
     * @param carconfig the carconfig to set
     */
    public void setCarconfig(String carconfig) {
        this.carconfig = carconfig;
    }
    /**
     * @return the imgs
     */
    public String getImgs() {
        return imgs;
    }
    /**
     * @param imgs the imgs to set
     */
    public void setImgs(String imgs) {
        this.imgs = imgs;
    }
    /**
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }
    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    /**
     * @return the companyid
     */
    public Double getCompanyid() {
        return companyid;
    }
    /**
     * @param companyid the companyid to set
     */
    public void setCompanyid(Double companyid) {
        this.companyid = companyid;
    }
    /**
     * @return the usersid
     */
    public Double getUsersid() {
        return usersid;
    }
    /**
     * @param usersid the usersid to set
     */
    public void setUsersid(Double usersid) {
        this.usersid = usersid;
    }
    /**
     * @return the createdate
     */
    public Date getCreatedate() {
        return createdate;
    }
    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
    /**
     * @return the bkcol1
     */
    public String getBkcol1() {
        return bkcol1;
    }
    /**
     * @param bkcol1 the bkcol1 to set
     */
    public void setBkcol1(String bkcol1) {
        this.bkcol1 = bkcol1;
    }
    /**
     * @return the bkcol2
     */
    public String getBkcol2() {
        return bkcol2;
    }
    /**
     * @param bkcol2 the bkcol2 to set
     */
    public void setBkcol2(String bkcol2) {
        this.bkcol2 = bkcol2;
    }
    /**
     * @return the isregcard
     */
    public String getIsregcard() {
        return isregcard;
    }
    /**
     * @param isregcard the isregcard to set
     */
    public void setIsregcard(String isregcard) {
        this.isregcard = isregcard;
    }
    /**
     * @return the dangwei
     */
    public String getDangwei() {
        return dangwei;
    }
    /**
     * @param dangwei the dangwei to set
     */
    public void setDangwei(String dangwei) {
        this.dangwei = dangwei;
    }
    /**
     * @return the chandi
     */
    public String getChandi() {
        return chandi;
    }
    /**
     * @param chandi the chandi to set
     */
    public void setChandi(String chandi) {
        this.chandi = chandi;
    }
    /**
     * @return the youqi
     */
    public String getYouqi() {
        return youqi;
    }
    /**
     * @param youqi the youqi to set
     */
    public void setYouqi(String youqi) {
        this.youqi = youqi;
    }
    /**
     * @return the carleixing
     */
    public String getCarleixing() {
        return carleixing;
    }
    /**
     * @param carleixing the carleixing to set
     */
    public void setCarleixing(String carleixing) {
        this.carleixing = carleixing;
    }
    /**
     * @return the carfdj
     */
    public String getCarfdj() {
        return carfdj;
    }
    /**
     * @param carfdj the carfdj to set
     */
    public void setCarfdj(String carfdj) {
        this.carfdj = carfdj;
    }
    /**
     * @return the carranliao
     */
    public String getCarranliao() {
        return carranliao;
    }
    /**
     * @param carranliao the carranliao to set
     */
    public void setCarranliao(String carranliao) {
        this.carranliao = carranliao;
    }
    /**
     * @return the carkuanshi
     */
    public String getCarkuanshi() {
        return carkuanshi;
    }
    /**
     * @param carkuanshi the carkuanshi to set
     */
    public void setCarkuanshi(String carkuanshi) {
        this.carkuanshi = carkuanshi;
    }
    /**
     * @return the carpailiang
     */
    public String getCarpailiang() {
        return carpailiang;
    }
    /**
     * @param carpailiang the carpailiang to set
     */
    public void setCarpailiang(String carpailiang) {
        this.carpailiang = carpailiang;
    }
    /**
     * @return the carpaifangbz
     */
    public String getCarpaifangbz() {
        return carpaifangbz;
    }
    /**
     * @param carpaifangbz the carpaifangbz to set
     */
    public void setCarpaifangbz(String carpaifangbz) {
        this.carpaifangbz = carpaifangbz;
    }
    /**
     * @return the dangwei1
     */
    public String getDangwei1() {
        return dangwei1;
    }
    /**
     * @param dangwei1 the dangwei1 to set
     */
    public void setDangwei1(String dangwei1) {
        this.dangwei1 = dangwei1;
    }
    /**
     * @return the carleixing1
     */
    public String getCarleixing1() {
        return carleixing1;
    }
    /**
     * @param carleixing1 the carleixing1 to set
     */
    public void setCarleixing1(String carleixing1) {
        this.carleixing1 = carleixing1;
    }
    /**
     * @return the carleixing2
     */
    public String getCarleixing2() {
        return carleixing2;
    }
    /**
     * @param carleixing2 the carleixing2 to set
     */
    public void setCarleixing2(String carleixing2) {
        this.carleixing2 = carleixing2;
    }
    /**
     * @return the callid
     */
    public Double getCallid() {
        return callid;
    }
    /**
     * @param callid the callid to set
     */
    public void setCallid(Double callid) {
        this.callid = callid;
    }
    /**
     * @return the isrents
     */
    public Double getIsrents() {
        return isrents;
    }
    /**
     * @param isrents the isrents to set
     */
    public void setIsrents(Double isrents) {
        this.isrents = isrents;
    }
    /**
     * @return the acquisitiondate
     */
    public Date getAcquisitiondate() {
        return acquisitiondate;
    }
    /**
     * @param acquisitiondate the acquisitiondate to set
     */
    public void setAcquisitiondate(Date acquisitiondate) {
        this.acquisitiondate = acquisitiondate;
    }
    /**
     * @return the is4snewcar
     */
    public Double getIs4snewcar() {
        return is4snewcar;
    }
    /**
     * @param is4snewcar the is4snewcar to set
     */
    public void setIs4snewcar(Double is4snewcar) {
        this.is4snewcar = is4snewcar;
    }
    /**
     * @return the contractnum
     */
    public String getContractnum() {
        return contractnum;
    }
    /**
     * @param contractnum the contractnum to set
     */
    public void setContractnum(String contractnum) {
        this.contractnum = contractnum;
    }
    /**
     * @return the usedforcarexid
     */
    public Double getUsedforcarexid() {
        return usedforcarexid;
    }
    /**
     * @param usedforcarexid the usedforcarexid to set
     */
    public void setUsedforcarexid(Double usedforcarexid) {
        this.usedforcarexid = usedforcarexid;
    }
    /**
     * @return the buyfrom
     */
    public String getBuyfrom() {
        return buyfrom;
    }
    /**
     * @param buyfrom the buyfrom to set
     */
    public void setBuyfrom(String buyfrom) {
        this.buyfrom = buyfrom;
    }
    /**
     * @return the storeplace
     */
    public String getStoreplace() {
        return storeplace;
    }
    /**
     * @param storeplace the storeplace to set
     */
    public void setStoreplace(String storeplace) {
        this.storeplace = storeplace;
    }
    /**
     * @return the newlicenseno
     */
    public String getNewlicenseno() {
        return newlicenseno;
    }
    /**
     * @param newlicenseno the newlicenseno to set
     */
    public void setNewlicenseno(String newlicenseno) {
        this.newlicenseno = newlicenseno;
    }
    /**
     * @return the verdatetime
     */
    public Date getVerdatetime() {
        return verdatetime;
    }
    /**
     * @param verdatetime the verdatetime to set
     */
    public void setVerdatetime(Date verdatetime) {
        this.verdatetime = verdatetime;
    }
    /**
     * @return the modelid
     */
    public Double getModelid() {
        return modelid;
    }
    /**
     * @param modelid the modelid to set
     */
    public void setModelid(Double modelid) {
        this.modelid = modelid;
    }
    /**
     * @return the makeid
     */
    public Double getMakeid() {
        return makeid;
    }
    /**
     * @param makeid the makeid to set
     */
    public void setMakeid(Double makeid) {
        this.makeid = makeid;
    }
    /**
     * @return the trimid
     */
    public Double getTrimid() {
        return trimid;
    }
    /**
     * @param trimid the trimid to set
     */
    public void setTrimid(Double trimid) {
        this.trimid = trimid;
    }
    /**
     * @return the isweb
     */
    public Double getIsweb() {
        return isweb;
    }
    /**
     * @param isweb the isweb to set
     */
    public void setIsweb(Double isweb) {
        this.isweb = isweb;
    }
    /**
     * @return the isoldcar
     */
    public Double getIsoldcar() {
        return isoldcar;
    }
    /**
     * @param isoldcar the isoldcar to set
     */
    public void setIsoldcar(Double isoldcar) {
        this.isoldcar = isoldcar;
    }
    /**
     * @return the billing
     */
    public String getBilling() {
        return billing;
    }
    /**
     * @param billing the billing to set
     */
    public void setBilling(String billing) {
        this.billing = billing;
    }
    /**
     * @return the billingtime
     */
    public String getBillingtime() {
        return billingtime;
    }
    /**
     * @param billingtime the billingtime to set
     */
    public void setBillingtime(String billingtime) {
        this.billingtime = billingtime;
    }
    /**
     * @return the issave
     */
    public int getIssave() {
        return issave;
    }
    /**
     * @param issave the issave to set
     */
    public void setIssave(int issave) {
        this.issave = issave;
    }
    /**
     * @return the isvinerperar
     */
    public Double getIsvinerperar() {
        return isvinerperar;
    }
    /**
     * @param isvinerperar the isvinerperar to set
     */
    public void setIsvinerperar(Double isvinerperar) {
        this.isvinerperar = isvinerperar;
    }
    /**
     * @return the jzgmakeid
     */
    public Double getJzgmakeid() {
        return jzgmakeid;
    }
    /**
     * @param jzgmakeid the jzgmakeid to set
     */
    public void setJzgmakeid(Double jzgmakeid) {
        this.jzgmakeid = jzgmakeid;
    }
    /**
     * @return the jzgmodelid
     */
    public Double getJzgmodelid() {
        return jzgmodelid;
    }
    /**
     * @param jzgmodelid the jzgmodelid to set
     */
    public void setJzgmodelid(Double jzgmodelid) {
        this.jzgmodelid = jzgmodelid;
    }
    /**
     * @return the jzgstyleid
     */
    public Double getJzgstyleid() {
        return jzgstyleid;
    }
    /**
     * @param jzgstyleid the jzgstyleid to set
     */
    public void setJzgstyleid(Double jzgstyleid) {
        this.jzgstyleid = jzgstyleid;
    }
    /**
     * @return the position
     */
    public String getPosition() {
        return position;
    }
    /**
     * @param position the position to set
     */
    public void setPosition(String position) {
        this.position = position;
    }
    /**
     * @return the iswebfailure
     */
    public Double getIswebfailure() {
        return iswebfailure;
    }
    /**
     * @param iswebfailure the iswebfailure to set
     */
    public void setIswebfailure(Double iswebfailure) {
        this.iswebfailure = iswebfailure;
    }
    /**
     * @return the ewmimgname
     */
    public String getEwmimgname() {
        return ewmimgname;
    }
    /**
     * @param ewmimgname the ewmimgname to set
     */
    public void setEwmimgname(String ewmimgname) {
        this.ewmimgname = ewmimgname;
    }
    /**
     * @return the dycwcarid
     */
    public Double getDycwcarid() {
        return dycwcarid;
    }
    /**
     * @param dycwcarid the dycwcarid to set
     */
    public void setDycwcarid(Double dycwcarid) {
        this.dycwcarid = dycwcarid;
    }
    /**
     * @return the orderno
     */
    public String getOrderno() {
        return orderno;
    }
    /**
     * @param orderno the orderno to set
     */
    public void setOrderno(String orderno) {
        this.orderno = orderno;
    }
    /**
     * @return the ismustinsure
     */
    public String getIsmustinsure() {
        return ismustinsure;
    }
    /**
     * @param ismustinsure the ismustinsure to set
     */
    public void setIsmustinsure(String ismustinsure) {
        this.ismustinsure = ismustinsure;
    }
    /**
     * @return the insurance
     */
    public String getInsurance() {
        return insurance;
    }
    /**
     * @param insurance the insurance to set
     */
    public void setInsurance(String insurance) {
        this.insurance = insurance;
    }
    /**
     * @return the isrzstatus
     */
    public Double getIsrzstatus() {
        return isrzstatus;
    }
    /**
     * @param isrzstatus the isrzstatus to set
     */
    public void setIsrzstatus(Double isrzstatus) {
        this.isrzstatus = isrzstatus;
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
