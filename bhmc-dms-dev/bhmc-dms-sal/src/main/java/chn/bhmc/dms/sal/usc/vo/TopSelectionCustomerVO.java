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
 * @ClassName   : TopSelectionCustomerVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.      Kim yewon              최초 생성
 * </pre>
 */


public class TopSelectionCustomerVO extends BaseVO {

    /**sellerexpectprive
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    private String carId;                           //차량ID
    private String id;                              //ID
    private String ownertype;                       //사용자유형
    private String sellorbuy;                       //구매판매여부
    private String companyid;                       //회사ID
    private String usersid;                         //사용자ID
    private String createtime;                      //생성시간
    private String pername;                         //고객명
    private String perphone;                        //고객전화
    private String perphone1;                       //고객전화1
    private String perphone2;                       //고객전화2
    private String peremail;                        //고객이메일
    private String perpapertype;                    //신분증유형
    private String perpaperno;                      //신분증번호
    private String perhu;                           //신분증주소
    private String peraddr;                         //고객주소
    private String comname;                         //회사명
    private String comcontactman;                   //회사연계인
    private String comcontactman1;                  //회사연계인1
    private String comcontactman2;                  //회사연계인2
    private String comphone;                        //회사전화번호
    private String comphone1;                       //회사전화번호1
    private String comphone2;                       //회사전화번호2
    private String comtype;                         //고객속성
    private String comaddr;                         //회사주소
    private String comzipcode;                      //회사우편
    private String verdatetime;                     //생성시간
    private String isnewcar;                        //신차여부
    private String regUsrId;                        //등록자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date regDt;                             //등록일자
    private String updtUsrId;                       //수정자ID
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date updtDt;                            //수정일자




    /**
     * @return the comcontactman1
     */
    public String getComcontactman1() {
        return comcontactman1;
    }
    /**
     * @param comcontactman1 the comcontactman1 to set
     */
    public void setComcontactman1(String comcontactman1) {
        this.comcontactman1 = comcontactman1;
    }
    /**
     * @return the comcontactman2
     */
    public String getComcontactman2() {
        return comcontactman2;
    }
    /**
     * @param comcontactman2 the comcontactman2 to set
     */
    public void setComcontactman2(String comcontactman2) {
        this.comcontactman2 = comcontactman2;
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
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the ownertype
     */
    public String getOwnertype() {
        return ownertype;
    }
    /**
     * @param ownertype the ownertype to set
     */
    public void setOwnertype(String ownertype) {
        this.ownertype = ownertype;
    }
    /**
     * @return the sellorbuy
     */
    public String getSellorbuy() {
        return sellorbuy;
    }
    /**
     * @param sellorbuy the sellorbuy to set
     */
    public void setSellorbuy(String sellorbuy) {
        this.sellorbuy = sellorbuy;
    }
    /**
     * @return the companyid
     */
    public String getCompanyid() {
        return companyid;
    }
    /**
     * @param companyid the companyid to set
     */
    public void setCompanyid(String companyid) {
        this.companyid = companyid;
    }
    /**
     * @return the usersid
     */
    public String getUsersid() {
        return usersid;
    }
    /**
     * @param usersid the usersid to set
     */
    public void setUsersid(String usersid) {
        this.usersid = usersid;
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
     * @return the pername
     */
    public String getPername() {
        return pername;
    }
    /**
     * @param pername the pername to set
     */
    public void setPername(String pername) {
        this.pername = pername;
    }
    /**
     * @return the perphone
     */
    public String getPerphone() {
        return perphone;
    }
    /**
     * @param perphone the perphone to set
     */
    public void setPerphone(String perphone) {
        this.perphone = perphone;
    }
    /**
     * @return the perphone1
     */
    public String getPerphone1() {
        return perphone1;
    }
    /**
     * @param perphone1 the perphone1 to set
     */
    public void setPerphone1(String perphone1) {
        this.perphone1 = perphone1;
    }
    /**
     * @return the perphone2
     */
    public String getPerphone2() {
        return perphone2;
    }
    /**
     * @param perphone2 the perphone2 to set
     */
    public void setPerphone2(String perphone2) {
        this.perphone2 = perphone2;
    }
    /**
     * @return the peremail
     */
    public String getPeremail() {
        return peremail;
    }
    /**
     * @param peremail the peremail to set
     */
    public void setPeremail(String peremail) {
        this.peremail = peremail;
    }
    /**
     * @return the perpapertype
     */
    public String getPerpapertype() {
        return perpapertype;
    }
    /**
     * @param perpapertype the perpapertype to set
     */
    public void setPerpapertype(String perpapertype) {
        this.perpapertype = perpapertype;
    }
    /**
     * @return the perpaperno
     */
    public String getPerpaperno() {
        return perpaperno;
    }
    /**
     * @param perpaperno the perpaperno to set
     */
    public void setPerpaperno(String perpaperno) {
        this.perpaperno = perpaperno;
    }
    /**
     * @return the perhu
     */
    public String getPerhu() {
        return perhu;
    }
    /**
     * @param perhu the perhu to set
     */
    public void setPerhu(String perhu) {
        this.perhu = perhu;
    }
    /**
     * @return the peraddr
     */
    public String getPeraddr() {
        return peraddr;
    }
    /**
     * @param peraddr the peraddr to set
     */
    public void setPeraddr(String peraddr) {
        this.peraddr = peraddr;
    }
    /**
     * @return the comname
     */
    public String getComname() {
        return comname;
    }
    /**
     * @param comname the comname to set
     */
    public void setComname(String comname) {
        this.comname = comname;
    }
    /**
     * @return the comcontactman
     */
    public String getComcontactman() {
        return comcontactman;
    }
    /**
     * @param comcontactman the comcontactman to set
     */
    public void setComcontactman(String comcontactman) {
        this.comcontactman = comcontactman;
    }
    /**
     * @return the comphone
     */
    public String getComphone() {
        return comphone;
    }
    /**
     * @param comphone the comphone to set
     */
    public void setComphone(String comphone) {
        this.comphone = comphone;
    }
    /**
     * @return the comphone1
     */
    public String getComphone1() {
        return comphone1;
    }
    /**
     * @param comphone1 the comphone1 to set
     */
    public void setComphone1(String comphone1) {
        this.comphone1 = comphone1;
    }
    /**
     * @return the comphone2
     */
    public String getComphone2() {
        return comphone2;
    }
    /**
     * @param comphone2 the comphone2 to set
     */
    public void setComphone2(String comphone2) {
        this.comphone2 = comphone2;
    }
    /**
     * @return the comtype
     */
    public String getComtype() {
        return comtype;
    }
    /**
     * @param comtype the comtype to set
     */
    public void setComtype(String comtype) {
        this.comtype = comtype;
    }
    /**
     * @return the comaddr
     */
    public String getComaddr() {
        return comaddr;
    }
    /**
     * @param comaddr the comaddr to set
     */
    public void setComaddr(String comaddr) {
        this.comaddr = comaddr;
    }
    /**
     * @return the comzipcode
     */
    public String getComzipcode() {
        return comzipcode;
    }
    /**
     * @param comzipcode the comzipcode to set
     */
    public void setComzipcode(String comzipcode) {
        this.comzipcode = comzipcode;
    }
    /**
     * @return the verdatetime
     */
    public String getVerdatetime() {
        return verdatetime;
    }
    /**
     * @param verdatetime the verdatetime to set
     */
    public void setVerdatetime(String verdatetime) {
        this.verdatetime = verdatetime;
    }
    /**
     * @return the isnewcar
     */
    public String getIsnewcar() {
        return isnewcar;
    }
    /**
     * @param isnewcar the isnewcar to set
     */
    public void setIsnewcar(String isnewcar) {
        this.isnewcar = isnewcar;
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
