package chn.bhmc.dms.sal.usc.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName  : TopSelectionCertifyImgInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since         author              description
 *  ===========    =============    ===========================
 *  2017. 3. 27.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class TopSelectionCertifyImgInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 988886448311462935L;

    /**
     * 차량ID
     **/
    @NotEmpty
    private int carId;

    /**
     * 순번
     **/
    @NotEmpty
    private int id;

    /**
     * 사용자ID
     **/
    //USERID
    private int userid;

    /**
     * 회사ID
     **/
    //COMPANYID
    private int companyid;

    /**
     * 자동차등록증1-2
     **/
    //IMGJDCDJZ12
    private String imgjdcdjz12;

    /**
     * 자동차등록증3-4
     **/
    //IMGJDCDJZ34
    private String imgjdcdjz34;

    /**
     * 자동차등록증
     **/
    //IMGJDCXSZ
    private String imgjdcxsz;

    /**
     * 신분증증면
     **/
    //IMGIDCARD1
    private String imgidcard1;

    /**
     * 신분증뒷면
     **/
    //IMGIDCARD2
    private String imgidcard2;

    /**
     * 110항점검리스트
     **/
    //IMG110JCD
    private String img110jcd;

    /**
     * 차량좌측전방이미지
     **/
    //IMGCARFRONT
    private String imgcarfront;

    /**
     * 주행거리이미지
     **/
    //IMGCARMILEAGE
    private String imgcarmileage;

    /**
     * VIN이미지
     **/
    //IMGCARVIN
    private String imgcarvin;

    /**
     * 전방내부이미지
     **/
    //IMGCARDECORATION1
    private String imgcardecoration1;

    /**
     * 후방내부이미지
     **/
    //IMGCARDECORATION2
    private String imgcardecoration2;

    /**
     * 엔진룸이미지
     **/
    //IMGCARENGINE
    private String imgcarengine;

    /**
     * 인터페이스생성일자
     **/
    //CREATEDATE
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date createdate;

    /**
     * 심사신청시간
     **/
    //SUBMITTIME
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date submittime;

    /**
     * 라스트심사시간
     **/
    //SHENHETIME
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date shenhetime;

    /**
     * 심사의견
     **/
    //SHENHEMSG
    private String shenhemsg;

    /**
     * 인증정보상태
     **/
    //SHENHESTATE
    private String shenhestate;

    /**
     * 인증요청제출차수
     **/
    //SHENHESUBMITTIMES
    private String shenhesubmittimes;

    /**
     * 이미지삭제표시여부
     **/
    //IMGJDCDJZ12SIGN
    private String imgjdcdjz12sign;

    /**
     * 이미지삭제표시여부1
     **/
    //IMGJDCDJZ34SIGN
    private String imgjdcdjz34sign;

    /**
     * 이미지삭제표시여부2
     **/
    //IMGCARFRONTSIGN
    private String imgcarfrontsign;

    /**
     * 이미지삭제표시여부3
     **/
    //IMGCARMILEAGESIGN
    private String imgcarmileagesign;

    /**
     * 이미지삭제표시여부4
     **/
    //IMGCARVINSIGN
    private String imgcarvinsign;

    /**
     * 이미지삭제표시여부5
     **/
    //IMGCARDECORATION1SIGN
    private String imgcardecoration1sign;

    /**
     * 이미지삭제표시여부6
     **/
    //IMGCARDECORATION2SIGN
    private String imgcardecoration2sign;

    /**
     * 이미지삭제표시여부7
     **/
    //IMGCARENGINESIGN
    private String imgcarenginesign;

    /**
     * 신차영수증
     **/
    //NEWTICKETNO
    private String newticketno;

    /**
     * 신차영수증일자
     **/
    //NEWTICKETDATE
    private Date newticketdate;

    /**
     * 신차영수증이미지
     **/
    //IMGNEWTICKET
    private String imgnewticket;

    /**
     * 신차영수증1
     **/
    //IMGBNEWCARINVOICE
    private String imgbnewcarinvoice;

    /**
     * 중고차영수증
     **/
    //IMGBTRANSFERINVOICE
    private String imgbtransferinvoice;

    /**
     * 신차소유자신분증
     **/
    //IMGBTRANSFERCARD
    private String imgbtransfercard;

    /**
     * 중고차등록증서
     **/
    //IMGBTRANSFERREGCERT
    private String imgbtransferregcert;

    /**
     * 차량인증서
     **/
    //IMGBCERT
    private String imgbcert;

    /**
     * 심사상태
     **/
    //BSTATUS
    private String bstatus;

    /**
     * 실패이유
     **/
    //BREASON
    private String breason;

    /**
     * 중고차등록증서PAGE2
     **/
    //IMGBTRANSFERREGCERT1
    private String imgbtransferregcert1;

    /**
     * 중고차등록증서PAGE3
     **/
    //IMGBTRANSFERREGCERT2
    private String imgbtransferregcert2;

    /**
     * 중고차등록증서PAGE4
     **/
    //IMGBTRANSFERREGCERT3
    private String imgbtransferregcert3;

    /**
     * 중고차등록증서PAGE5
     **/
    //IMGBTRANSFERREGCERT4
    private String imgbtransferregcert4;

    /**
     * 중고차등록증서PAGE6
     **/
    //IMGBTRANSFERREGCERT5
    private String imgbtransferregcert5;

    /**
     * @return the carId
     */
    public int getCarId() {
        return carId;
    }

    /**
     * @param carId the carId to set
     */
    public void setCarId(int carId) {
        this.carId = carId;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the userid
     */
    public int getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(int userid) {
        this.userid = userid;
    }

    /**
     * @return the companyid
     */
    public int getCompanyid() {
        return companyid;
    }

    /**
     * @param companyid the companyid to set
     */
    public void setCompanyid(int companyid) {
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
     * @return the submittime
     */
    public Date getSubmittime() {
        return submittime;
    }

    /**
     * @param submittime the submittime to set
     */
    public void setSubmittime(Date submittime) {
        this.submittime = submittime;
    }

    /**
     * @return the shenhetime
     */
    public Date getShenhetime() {
        return shenhetime;
    }

    /**
     * @param shenhetime the shenhetime to set
     */
    public void setShenhetime(Date shenhetime) {
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





}
