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
 * @since 2016. 6. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 3.      Kim yewon              최초 생성
 * </pre>
 */


public class TopSelectionVO extends BaseVO {

    /**sellerexpectprive
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;



    //인증테이블
    private String carId;                       //차량ID
    private Double id;                          //순번
    private Double userid;                      //사용자ID
    private Double companyid;                   //회사ID
    private String imgjdcdjz12;                 //자동차등록증1-2
    private String imgjdcdjz34;                 //자동차등록증3-4
    private String imgjdcxsz;                   //자동차등록증
    private String imgidcard1;                  //신분증증면
    private String imgidcard2;                  //신분증뒷면
    private String img110jcd;                   //110항점검리스트
    private String imgcarfront;                 //차량좌측전방이미지
    private String imgcarmileage;               //주행거리이미지
    private String imgcarvin;                   //VIN이미지
    private String imgcardecoration1;           //전방내부이미지
    private String imgcardecoration2;           //후방내부이미지
    private String imgcarengine;                //엔진룸이미지
    private String createtime;                  //인증차량생성시간
    private String submittime;                  //심사신청시간
    private String shenhetime;                  //라스트심사시간
    private String shenhemsg;                   //심사의견
    private String shenhestate;                 //인증정보상태
    private String shenhesubmittimes;           //인증요청제출차수
    private String imgjdcdjz12sign;             //이미지삭제표시여부(자동차등록증1-2)
    private String imgjdcdjz34sign;             //이미지삭제표시여부1(자동차등록증3-4)
    private String imgcarfrontsign;             //이미지삭제표시여부2(차량좌측전방이미지)
    private String imgcarmileagesign;           //이미지삭제표시여부3(주행거리이미지)
    private String imgcarvinsign;               //이미지삭제표시여부4(VIN이미지)
    private String imgcardecoration1sign;       //이미지삭제표시여부5(전방내부이미지)
    private String imgcardecoration2sign;       //이미지삭제표시여부6(후방내부이미지)
    private String imgcarenginesign;            //이미지삭제표시여부7(엔진룸이미지)
    private String newticketno;                 //신차영수증
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date newticketdate;                 //신차영수증일자
    private String imgnewticket;                //신차영수증이미지
    private String imgbnewcarinvoice;           //신차영수증1
    private String imgbtransferinvoice;         //중고차영수증
    private String imgbtransfercard;            //신차소유자신분증
    private String imgbtransferregcert;         //중고차등록증서
    private String imgbcert;                    //차량인증서
    private String bstatus;                     //심사상태
    private String breason;                     //실패이유
    private String imgbtransferregcert1;        //중고차등록증서PAGE2
    private String imgbtransferregcert2;        //중고차등록증서PAGE3
    private String imgbtransferregcert3;        //중고차등록증서PAGE4
    private String imgbtransferregcert4;        //중고차등록증서PAGE5
    private String imgbtransferregcert5;        //중고차등록증서PAGE6
    private String regUsrId;                    //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                         //등록시간
    private String updtUsrId;                   //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                        //수정일자



    //중고차차량마스터 - 수선차량
    private String vin;                         //VIN NO
    private String carstyle;                    //차량명
    private String produceCompany;              //제조사
    private String brand;                       //브랜드
    private String licenseNo;                   //차량번호판
    private String registDate;                  //등록일자
    private String isVinRepear;                 //VIN번호중복사용여부


    //
    private String vinNo;                       //VIN NO
    private String perName;                     //소유자명
    private String ownerType;                   //소유자유형(고객유형)
    private String perPaperNo;                  //ID번호
    private String perHu;                       //ID주소





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
     * @return the perName
     */
    public String getPerName() {
        return perName;
    }
    /**
     * @param perName the perName to set
     */
    public void setPerName(String perName) {
        this.perName = perName;
    }
    /**
     * @return the ownerType
     */
    public String getOwnerType() {
        return ownerType;
    }
    /**
     * @param ownerType the ownerType to set
     */
    public void setOwnerType(String ownerType) {
        this.ownerType = ownerType;
    }
    /**
     * @return the perPaperNo
     */
    public String getPerPaperNo() {
        return perPaperNo;
    }
    /**
     * @param perPaperNo the perPaperNo to set
     */
    public void setPerPaperNo(String perPaperNo) {
        this.perPaperNo = perPaperNo;
    }
    /**
     * @return the perHu
     */
    public String getPerHu() {
        return perHu;
    }
    /**
     * @param perHu the perHu to set
     */
    public void setPerHu(String perHu) {
        this.perHu = perHu;
    }
    /**
     * @return the produceCompany
     */
    public String getProduceCompany() {
        return produceCompany;
    }
    /**
     * @param produceCompany the produceCompany to set
     */
    public void setProduceCompany(String produceCompany) {
        this.produceCompany = produceCompany;
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
     * @return the licenseNo
     */
    public String getLicenseNo() {
        return licenseNo;
    }
    /**
     * @param licenseNo the licenseNo to set
     */
    public void setLicenseNo(String licenseNo) {
        this.licenseNo = licenseNo;
    }
    /**
     * @return the registDate
     */
    public String getRegistDate() {
        return registDate;
    }
    /**
     * @param registDate the registDate to set
     */
    public void setRegistDate(String registDate) {
        this.registDate = registDate;
    }
    /**
     * @return the isVinRepear
     */
    public String getIsVinRepear() {
        return isVinRepear;
    }
    /**
     * @param isVinRepear the isVinRepear to set
     */
    public void setIsVinRepear(String isVinRepear) {
        this.isVinRepear = isVinRepear;
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
     * @return the id
     */
    public Double getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(Double id) {
        this.id = id;
    }
    /**
     * @return the userid
     */
    public Double getUserid() {
        return userid;
    }
    /**
     * @param userid the userid to set
     */
    public void setUserid(Double userid) {
        this.userid = userid;
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
     * @return the imgjdcdjz12
     */
    public String getImgjdcdjz12() {
        return imgjdcdjz12;
    }
    /**
     * @param imgjdcdjz12 the imgjdcdjz12 to set
     */
    public void setImgjdcdjz12(String imgjdcdjz12) {
        this.imgjdcdjz12 = imgjdcdjz12;
    }
    /**
     * @return the imgjdcdjz34
     */
    public String getImgjdcdjz34() {
        return imgjdcdjz34;
    }
    /**
     * @param imgjdcdjz34 the imgjdcdjz34 to set
     */
    public void setImgjdcdjz34(String imgjdcdjz34) {
        this.imgjdcdjz34 = imgjdcdjz34;
    }
    /**
     * @return the imgjdcxsz
     */
    public String getImgjdcxsz() {
        return imgjdcxsz;
    }
    /**
     * @param imgjdcxsz the imgjdcxsz to set
     */
    public void setImgjdcxsz(String imgjdcxsz) {
        this.imgjdcxsz = imgjdcxsz;
    }
    /**
     * @return the imgidcard1
     */
    public String getImgidcard1() {
        return imgidcard1;
    }
    /**
     * @param imgidcard1 the imgidcard1 to set
     */
    public void setImgidcard1(String imgidcard1) {
        this.imgidcard1 = imgidcard1;
    }
    /**
     * @return the imgidcard2
     */
    public String getImgidcard2() {
        return imgidcard2;
    }
    /**
     * @param imgidcard2 the imgidcard2 to set
     */
    public void setImgidcard2(String imgidcard2) {
        this.imgidcard2 = imgidcard2;
    }
    /**
     * @return the img110jcd
     */
    public String getImg110jcd() {
        return img110jcd;
    }
    /**
     * @param img110jcd the img110jcd to set
     */
    public void setImg110jcd(String img110jcd) {
        this.img110jcd = img110jcd;
    }
    /**
     * @return the imgcarfront
     */
    public String getImgcarfront() {
        return imgcarfront;
    }
    /**
     * @param imgcarfront the imgcarfront to set
     */
    public void setImgcarfront(String imgcarfront) {
        this.imgcarfront = imgcarfront;
    }
    /**
     * @return the imgcarmileage
     */
    public String getImgcarmileage() {
        return imgcarmileage;
    }
    /**
     * @param imgcarmileage the imgcarmileage to set
     */
    public void setImgcarmileage(String imgcarmileage) {
        this.imgcarmileage = imgcarmileage;
    }
    /**
     * @return the imgcarvin
     */
    public String getImgcarvin() {
        return imgcarvin;
    }
    /**
     * @param imgcarvin the imgcarvin to set
     */
    public void setImgcarvin(String imgcarvin) {
        this.imgcarvin = imgcarvin;
    }
    /**
     * @return the imgcardecoration1
     */
    public String getImgcardecoration1() {
        return imgcardecoration1;
    }
    /**
     * @param imgcardecoration1 the imgcardecoration1 to set
     */
    public void setImgcardecoration1(String imgcardecoration1) {
        this.imgcardecoration1 = imgcardecoration1;
    }
    /**
     * @return the imgcardecoration2
     */
    public String getImgcardecoration2() {
        return imgcardecoration2;
    }
    /**
     * @param imgcardecoration2 the imgcardecoration2 to set
     */
    public void setImgcardecoration2(String imgcardecoration2) {
        this.imgcardecoration2 = imgcardecoration2;
    }
    /**
     * @return the imgcarengine
     */
    public String getImgcarengine() {
        return imgcarengine;
    }
    /**
     * @param imgcarengine the imgcarengine to set
     */
    public void setImgcarengine(String imgcarengine) {
        this.imgcarengine = imgcarengine;
    }
    /**
     * @return the createtime
     */
    public String getCreatetime() {
        return createtime;
    }
    /**
     * @param createtime the createtime to set
     */
    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
    /**
     * @return the submittime
     */
    public String getSubmittime() {
        return submittime;
    }
    /**
     * @param submittime the submittime to set
     */
    public void setSubmittime(String submittime) {
        this.submittime = submittime;
    }
    /**
     * @return the shenhetime
     */
    public String getShenhetime() {
        return shenhetime;
    }
    /**
     * @param shenhetime the shenhetime to set
     */
    public void setShenhetime(String shenhetime) {
        this.shenhetime = shenhetime;
    }
    /**
     * @return the shenhemsg
     */
    public String getShenhemsg() {
        return shenhemsg;
    }
    /**
     * @param shenhemsg the shenhemsg to set
     */
    public void setShenhemsg(String shenhemsg) {
        this.shenhemsg = shenhemsg;
    }
    /**
     * @return the shenhestate
     */
    public String getShenhestate() {
        return shenhestate;
    }
    /**
     * @param shenhestate the shenhestate to set
     */
    public void setShenhestate(String shenhestate) {
        this.shenhestate = shenhestate;
    }
    /**
     * @return the shenhesubmittimes
     */
    public String getShenhesubmittimes() {
        return shenhesubmittimes;
    }
    /**
     * @param shenhesubmittimes the shenhesubmittimes to set
     */
    public void setShenhesubmittimes(String shenhesubmittimes) {
        this.shenhesubmittimes = shenhesubmittimes;
    }
    /**
     * @return the imgjdcdjz12sign
     */
    public String getImgjdcdjz12sign() {
        return imgjdcdjz12sign;
    }
    /**
     * @param imgjdcdjz12sign the imgjdcdjz12sign to set
     */
    public void setImgjdcdjz12sign(String imgjdcdjz12sign) {
        this.imgjdcdjz12sign = imgjdcdjz12sign;
    }
    /**
     * @return the imgjdcdjz34sign
     */
    public String getImgjdcdjz34sign() {
        return imgjdcdjz34sign;
    }
    /**
     * @param imgjdcdjz34sign the imgjdcdjz34sign to set
     */
    public void setImgjdcdjz34sign(String imgjdcdjz34sign) {
        this.imgjdcdjz34sign = imgjdcdjz34sign;
    }
    /**
     * @return the imgcarfrontsign
     */
    public String getImgcarfrontsign() {
        return imgcarfrontsign;
    }
    /**
     * @param imgcarfrontsign the imgcarfrontsign to set
     */
    public void setImgcarfrontsign(String imgcarfrontsign) {
        this.imgcarfrontsign = imgcarfrontsign;
    }
    /**
     * @return the imgcarmileagesign
     */
    public String getImgcarmileagesign() {
        return imgcarmileagesign;
    }
    /**
     * @param imgcarmileagesign the imgcarmileagesign to set
     */
    public void setImgcarmileagesign(String imgcarmileagesign) {
        this.imgcarmileagesign = imgcarmileagesign;
    }
    /**
     * @return the imgcarvinsign
     */
    public String getImgcarvinsign() {
        return imgcarvinsign;
    }
    /**
     * @param imgcarvinsign the imgcarvinsign to set
     */
    public void setImgcarvinsign(String imgcarvinsign) {
        this.imgcarvinsign = imgcarvinsign;
    }
    /**
     * @return the imgcardecoration1sign
     */
    public String getImgcardecoration1sign() {
        return imgcardecoration1sign;
    }
    /**
     * @param imgcardecoration1sign the imgcardecoration1sign to set
     */
    public void setImgcardecoration1sign(String imgcardecoration1sign) {
        this.imgcardecoration1sign = imgcardecoration1sign;
    }
    /**
     * @return the imgcardecoration2sign
     */
    public String getImgcardecoration2sign() {
        return imgcardecoration2sign;
    }
    /**
     * @param imgcardecoration2sign the imgcardecoration2sign to set
     */
    public void setImgcardecoration2sign(String imgcardecoration2sign) {
        this.imgcardecoration2sign = imgcardecoration2sign;
    }
    /**
     * @return the imgcarenginesign
     */
    public String getImgcarenginesign() {
        return imgcarenginesign;
    }
    /**
     * @param imgcarenginesign the imgcarenginesign to set
     */
    public void setImgcarenginesign(String imgcarenginesign) {
        this.imgcarenginesign = imgcarenginesign;
    }
    /**
     * @return the newticketno
     */
    public String getNewticketno() {
        return newticketno;
    }
    /**
     * @param newticketno the newticketno to set
     */
    public void setNewticketno(String newticketno) {
        this.newticketno = newticketno;
    }
    /**
     * @return the newticketdate
     */
    public Date getNewticketdate() {
        return newticketdate;
    }
    /**
     * @param newticketdate the newticketdate to set
     */
    public void setNewticketdate(Date newticketdate) {
        this.newticketdate = newticketdate;
    }
    /**
     * @return the imgnewticket
     */
    public String getImgnewticket() {
        return imgnewticket;
    }
    /**
     * @param imgnewticket the imgnewticket to set
     */
    public void setImgnewticket(String imgnewticket) {
        this.imgnewticket = imgnewticket;
    }
    /**
     * @return the imgbnewcarinvoice
     */
    public String getImgbnewcarinvoice() {
        return imgbnewcarinvoice;
    }
    /**
     * @param imgbnewcarinvoice the imgbnewcarinvoice to set
     */
    public void setImgbnewcarinvoice(String imgbnewcarinvoice) {
        this.imgbnewcarinvoice = imgbnewcarinvoice;
    }
    /**
     * @return the imgbtransferinvoice
     */
    public String getImgbtransferinvoice() {
        return imgbtransferinvoice;
    }
    /**
     * @param imgbtransferinvoice the imgbtransferinvoice to set
     */
    public void setImgbtransferinvoice(String imgbtransferinvoice) {
        this.imgbtransferinvoice = imgbtransferinvoice;
    }
    /**
     * @return the imgbtransfercard
     */
    public String getImgbtransfercard() {
        return imgbtransfercard;
    }
    /**
     * @param imgbtransfercard the imgbtransfercard to set
     */
    public void setImgbtransfercard(String imgbtransfercard) {
        this.imgbtransfercard = imgbtransfercard;
    }
    /**
     * @return the imgbtransferregcert
     */
    public String getImgbtransferregcert() {
        return imgbtransferregcert;
    }
    /**
     * @param imgbtransferregcert the imgbtransferregcert to set
     */
    public void setImgbtransferregcert(String imgbtransferregcert) {
        this.imgbtransferregcert = imgbtransferregcert;
    }
    /**
     * @return the imgbcert
     */
    public String getImgbcert() {
        return imgbcert;
    }
    /**
     * @param imgbcert the imgbcert to set
     */
    public void setImgbcert(String imgbcert) {
        this.imgbcert = imgbcert;
    }
    /**
     * @return the bstatus
     */
    public String getBstatus() {
        return bstatus;
    }
    /**
     * @param bstatus the bstatus to set
     */
    public void setBstatus(String bstatus) {
        this.bstatus = bstatus;
    }
    /**
     * @return the breason
     */
    public String getBreason() {
        return breason;
    }
    /**
     * @param breason the breason to set
     */
    public void setBreason(String breason) {
        this.breason = breason;
    }
    /**
     * @return the imgbtransferregcert1
     */
    public String getImgbtransferregcert1() {
        return imgbtransferregcert1;
    }
    /**
     * @param imgbtransferregcert1 the imgbtransferregcert1 to set
     */
    public void setImgbtransferregcert1(String imgbtransferregcert1) {
        this.imgbtransferregcert1 = imgbtransferregcert1;
    }
    /**
     * @return the imgbtransferregcert2
     */
    public String getImgbtransferregcert2() {
        return imgbtransferregcert2;
    }
    /**
     * @param imgbtransferregcert2 the imgbtransferregcert2 to set
     */
    public void setImgbtransferregcert2(String imgbtransferregcert2) {
        this.imgbtransferregcert2 = imgbtransferregcert2;
    }
    /**
     * @return the imgbtransferregcert3
     */
    public String getImgbtransferregcert3() {
        return imgbtransferregcert3;
    }
    /**
     * @param imgbtransferregcert3 the imgbtransferregcert3 to set
     */
    public void setImgbtransferregcert3(String imgbtransferregcert3) {
        this.imgbtransferregcert3 = imgbtransferregcert3;
    }
    /**
     * @return the imgbtransferregcert4
     */
    public String getImgbtransferregcert4() {
        return imgbtransferregcert4;
    }
    /**
     * @param imgbtransferregcert4 the imgbtransferregcert4 to set
     */
    public void setImgbtransferregcert4(String imgbtransferregcert4) {
        this.imgbtransferregcert4 = imgbtransferregcert4;
    }
    /**
     * @return the imgbtransferregcert5
     */
    public String getImgbtransferregcert5() {
        return imgbtransferregcert5;
    }
    /**
     * @param imgbtransferregcert5 the imgbtransferregcert5 to set
     */
    public void setImgbtransferregcert5(String imgbtransferregcert5) {
        this.imgbtransferregcert5 = imgbtransferregcert5;
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }









}
