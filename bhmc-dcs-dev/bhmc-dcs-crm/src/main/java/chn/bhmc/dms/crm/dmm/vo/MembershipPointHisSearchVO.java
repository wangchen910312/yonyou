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
 * @ClassName   : MembershipPointHisSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipPointHisSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 899421063164990439L;

    /**
    * 딜러코드
    **/

    private  String             sDlrCd;

    /**
    * 멤버쉽번호
    **/

    private  String             sMembershipNo;

    /**
    * 포인트이력일련번호
    **/

    private  int                sPointHisSeq;

    /**
    * 멤버쉽유형
    **/

    private  String             sMembershipTp;

    /**
    * 카드번호
    **/

    private  String             sCardNo;

    /**
    * 포인트코드
    **/

    private  String             sPointCd;

    /**
    * 포인트유형
    **/

    private  String             sPointTp;

    /**
    * 발생포인트값
    **/

    private  int                sOccrPointVal;

    /**
    * 발생일자
    **/

    private  String             sOccrDt;

    /**
    * 부서명
    **/

    private  String             sDeptNm;

    /**
    * 담당자ID
    **/

    private  String             sPrsnId;

    /**
    * 소멸일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               sExtcDt;

    /**
    * 소멸대상여부
    **/

    private  String             sExtcTargYn;

    /**
    * 소멸대상포인트값
    **/

    private  int                sExtcTargPointVal;

    //추가 조회조건
    private String sCustNo;
    private String sVinNo;
    private String sCardTpCd;//(01:포인트,02:충전)



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
     * @return the sPointHisSeq
     */
    public int getsPointHisSeq() {
        return sPointHisSeq;
    }



    /**
     * @param sPointHisSeq the sPointHisSeq to set
     */
    public void setsPointHisSeq(int sPointHisSeq) {
        this.sPointHisSeq = sPointHisSeq;
    }



    /**
     * @return the sMembershipTp
     */
    public String getsMembershipTp() {
        return sMembershipTp;
    }



    /**
     * @param sMembershipTp the sMembershipTp to set
     */
    public void setsMembershipTp(String sMembershipTp) {
        this.sMembershipTp = sMembershipTp;
    }



    /**
     * @return the sCardNo
     */
    public String getsCardNo() {
        return sCardNo;
    }



    /**
     * @param sCardNo the sCardNo to set
     */
    public void setsCardNo(String sCardNo) {
        this.sCardNo = sCardNo;
    }



    /**
     * @return the sPointCd
     */
    public String getsPointCd() {
        return sPointCd;
    }



    /**
     * @param sPointCd the sPointCd to set
     */
    public void setsPointCd(String sPointCd) {
        this.sPointCd = sPointCd;
    }



    /**
     * @return the sPointTp
     */
    public String getsPointTp() {
        return sPointTp;
    }



    /**
     * @param sPointTp the sPointTp to set
     */
    public void setsPointTp(String sPointTp) {
        this.sPointTp = sPointTp;
    }



    /**
     * @return the sOccrPointVal
     */
    public int getsOccrPointVal() {
        return sOccrPointVal;
    }



    /**
     * @param sOccrPointVal the sOccrPointVal to set
     */
    public void setsOccrPointVal(int sOccrPointVal) {
        this.sOccrPointVal = sOccrPointVal;
    }



    /**
     * @return the sOccrDt
     */
    public String getsOccrDt() {
        return sOccrDt;
    }



    /**
     * @param sOccrDt the sOccrDt to set
     */
    public void setsOccrDt(String sOccrDt) {
        this.sOccrDt = sOccrDt;
    }



    /**
     * @return the sDeptNm
     */
    public String getsDeptNm() {
        return sDeptNm;
    }



    /**
     * @param sDeptNm the sDeptNm to set
     */
    public void setsDeptNm(String sDeptNm) {
        this.sDeptNm = sDeptNm;
    }



    /**
     * @return the sPrsnId
     */
    public String getsPrsnId() {
        return sPrsnId;
    }



    /**
     * @param sPrsnId the sPrsnId to set
     */
    public void setsPrsnId(String sPrsnId) {
        this.sPrsnId = sPrsnId;
    }



    /**
     * @return the sExtcDt
     */
    public Date getsExtcDt() {
        return sExtcDt;
    }



    /**
     * @param sExtcDt the sExtcDt to set
     */
    public void setsExtcDt(Date sExtcDt) {
        this.sExtcDt = sExtcDt;
    }



    /**
     * @return the sExtcTargYn
     */
    public String getsExtcTargYn() {
        return sExtcTargYn;
    }



    /**
     * @param sExtcTargYn the sExtcTargYn to set
     */
    public void setsExtcTargYn(String sExtcTargYn) {
        this.sExtcTargYn = sExtcTargYn;
    }



    /**
     * @return the sExtcTargPointVal
     */
    public int getsExtcTargPointVal() {
        return sExtcTargPointVal;
    }



    /**
     * @param sExtcTargPointVal the sExtcTargPointVal to set
     */
    public void setsExtcTargPointVal(int sExtcTargPointVal) {
        this.sExtcTargPointVal = sExtcTargPointVal;
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
