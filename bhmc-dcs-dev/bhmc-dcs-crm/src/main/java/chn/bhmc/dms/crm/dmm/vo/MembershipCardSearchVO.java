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
 * @ClassName   : MembershipCardSearchVO.java
 * @Description : 멤버십 카드관리 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 4. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 6.     Kim Hyun Ho     최초 생성
 * </pre>
 */


public class MembershipCardSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3581176036147915933L;

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
    * 멤버십일련번호
    **/
    private  int sMembershipSeq;

    /**
    * 카드종류코드
    **/
    private  String sCardTpCd;

    /**
    * 카드번호
    **/
    private  String sCardNo;

    /**
    * 카드사용기한
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sCardUseDt;

    //조회조건 추가
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date sStartDt;
     @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date sEndDt;

    /**
    * 카드형태코드
    **/
    private  String sCardFormCd;

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
     * @return the sMembershipSeq
     */
    public int getsMembershipSeq() {
        return sMembershipSeq;
    }

    /**
     * @param sMembershipSeq the sMembershipSeq to set
     */
    public void setsMembershipSeq(int sMembershipSeq) {
        this.sMembershipSeq = sMembershipSeq;
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
     * @return the sCardUseDt
     */
    public Date getsCardUseDt() {
        return sCardUseDt;
    }

    /**
     * @param sCardUseDt the sCardUseDt to set
     */
    public void setsCardUseDt(Date sCardUseDt) {
        this.sCardUseDt = sCardUseDt;
    }

    /**
     * @return the sCardFormCd
     */
    public String getsCardFormCd() {
        return sCardFormCd;
    }

    /**
     * @param sCardFormCd the sCardFormCd to set
     */
    public void setsCardFormCd(String sCardFormCd) {
        this.sCardFormCd = sCardFormCd;
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

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}
