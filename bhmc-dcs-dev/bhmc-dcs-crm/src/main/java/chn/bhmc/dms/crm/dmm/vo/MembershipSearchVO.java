package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8481182928086626115L;

    /**
    * 딜러코드
    **/
    private  String sDlrCd;

    /**
    * 사업장코드
    **/
    private  String sPltCd;

    /**
    * 일련번호
    **/
    private  int sSeq;

    /**
    * 고객번호
    **/
    private  String sCustNo;

    /**
    * 차량ID
    **/
    private  String sCarId;

    /**
    * 차대번호
    **/
    private  String sVinNo;

    /**
    * 멤버십 회원등급
    **/
    private  String sGradeCd;

    /**
    * 첨부문서번호
    **/
    private  int sFileDocNo;

    /**
    * 포인트식 가입여부
    **/
    private  String sPointYn;

    /**
    * 충전식 가입여부
    **/
    private  String sRechargeYn;

    /**
    * 상품선택코드
    **/
    private  String sRechargeCd;

    /**
    * 상품선택코드
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;

     /**
     * 상품선택코드
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date sEndDt;

    //멤버십 번호조회 팝업에서 사용하는 조회 조건추가
    private String sCustNm;
    private String sMembershipNo;

    //고객,자동차 멤버십 등록시 조회조건 추가
    private String sStan;
    private String sCardTpCd;


    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPltCd
     */
    public String getsPltCd() {
        return sPltCd;
    }

    /**
     * @param sPltCd the sPltCd to set
     */
    public void setsPltCd(String sPltCd) {
        this.sPltCd = sPltCd;
    }

    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sCustNo
     */
    public String getsCustNo() {
        return sCustNo;
    }

    /**
     * @param sCustNo the sCustNo to set
     */
    public void setsCustNo(String sCustNo) {
        this.sCustNo = sCustNo;
    }

    /**
     * @return the sCarId
     */
    public String getsCarId() {
        return sCarId;
    }

    /**
     * @param sCarId the sCarId to set
     */
    public void setsCarId(String sCarId) {
        this.sCarId = sCarId;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sGradeCd
     */
    public String getsGradeCd() {
        return sGradeCd;
    }

    /**
     * @param sGradeCd the sGradeCd to set
     */
    public void setsGradeCd(String sGradeCd) {
        this.sGradeCd = sGradeCd;
    }

    /**
     * @return the sFileDocNo
     */
    public int getsFileDocNo() {
        return sFileDocNo;
    }

    /**
     * @param sFileDocNo the sFileDocNo to set
     */
    public void setsFileDocNo(int sFileDocNo) {
        this.sFileDocNo = sFileDocNo;
    }

    /**
     * @return the sPointYn
     */
    public String getsPointYn() {
        return sPointYn;
    }

    /**
     * @param sPointYn the sPointYn to set
     */
    public void setsPointYn(String sPointYn) {
        this.sPointYn = sPointYn;
    }

    /**
     * @return the sRechargeYn
     */
    public String getsRechargeYn() {
        return sRechargeYn;
    }

    /**
     * @param sRechargeYn the sRechargeYn to set
     */
    public void setsRechargeYn(String sRechargeYn) {
        this.sRechargeYn = sRechargeYn;
    }

    /**
     * @return the sRechargeCd
     */
    public String getsRechargeCd() {
        return sRechargeCd;
    }



    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

    /**
     * @param sRechargeCd the sRechargeCd to set
     */
    public void setsRechargeCd(String sRechargeCd) {
        this.sRechargeCd = sRechargeCd;
    }



    /**
     * @return the sCustNm
     */
    public String getsCustNm() {
        return sCustNm;
    }

    /**
     * @param sCustNm the sCustNm to set
     */
    public void setsCustNm(String sCustNm) {
        this.sCustNm = sCustNm;
    }



    /**
     * @return the sStan
     */
    public String getsStan() {
        return sStan;
    }

    /**
     * @param sStan the sStan to set
     */
    public void setsStan(String sStan) {
        this.sStan = sStan;
    }



    /**
     * @return the sMembershipNo
     */
    public String getsMembershipNo() {
        return sMembershipNo;
    }

    /**
     * @param sMembershipNo the sMembershipNo to set
     */
    public void setsMembershipNo(String sMembershipNo) {
        this.sMembershipNo = sMembershipNo;
    }



    /**
     * @return the sCardTpCd
     */
    public String getsCardTpCd() {
        return sCardTpCd;
    }

    /**
     * @param sCardTpCd the sCardTpCd to set
     */
    public void setsCardTpCd(String sCardTpCd) {
        this.sCardTpCd = sCardTpCd;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
