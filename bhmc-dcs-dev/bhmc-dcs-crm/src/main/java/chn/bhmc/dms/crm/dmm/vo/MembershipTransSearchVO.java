package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MembershipTransSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Hyun Ho
 * @since 2016. 5. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 2.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class MembershipTransSearchVO  extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4013647467051706378L;

    /**
    * 딜러코드
    **/
    private  String                sDlrCd;

    /**
    * 양도양수일련번호
    **/
    private  int                   sTrsfReceiveSeq;

    /**
    * 양도멤버쉽일련번호
    **/
    private  String                   sTrsfMembershipNo;

    /**
    * 양수멤버쉽일련번호
    **/
    private  String                   sReceiveMembershipNo;

    /**
    * 포인트값
    **/
    private  int                   sPointVal;

    /**
    * 양도사유코드
    **/
    private  String                sTrsfReasonCd;

    /**
    * 양도양수관계코드
    **/
    private  String                sTrsfReceiveRelCd;

    /**
    * 첨부파일문서번호
    **/
    private  String                sFileDocNo;

    /**
    * 결재문서번호
    **/
    private  String                sSignDocNo;

    /**
    * 사용여부
    **/
    private  String                sUseYn;

    //추가 검색조건
    private  String sCustNm;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sEndDt;
    private  String sSignStatCd;//심사상태
    private  String sReceive;
    private  String sCardTpCd; //01:포인트, 02:충전
    private  String sSignDocId;//결재번호



    /**
     * @return the sTrsfReceiveSeq
     */
    public int getsTrsfReceiveSeq() {
        return sTrsfReceiveSeq;
    }

    /**
     * @param sTrsfReceiveSeq the sTrsfReceiveSeq to set
     */
    public void setsTrsfReceiveSeq(int sTrsfReceiveSeq) {
        this.sTrsfReceiveSeq = sTrsfReceiveSeq;
    }

    /**
     * @return the sTrsfMembershipNo
     */
    public String getsTrsfMembershipNo() {
        return sTrsfMembershipNo;
    }

    /**
     * @param sTrsfMembershipNo the sTrsfMembershipNo to set
     */
    public void setsTrsfMembershipNo(String sTrsfMembershipNo) {
        this.sTrsfMembershipNo = sTrsfMembershipNo;
    }

    /**
     * @return the sReceiveMembershipNo
     */
    public String getsReceiveMembershipNo() {
        return sReceiveMembershipNo;
    }

    /**
     * @param sReceiveMembershipNo the sReceiveMembershipNo to set
     */
    public void setsReceiveMembershipNo(String sReceiveMembershipNo) {
        this.sReceiveMembershipNo = sReceiveMembershipNo;
    }

    /**
     * @return the sPointVal
     */
    public int getsPointVal() {
        return sPointVal;
    }

    /**
     * @param sPointVal the sPointVal to set
     */
    public void setsPointVal(int sPointVal) {
        this.sPointVal = sPointVal;
    }

    /**
     * @return the sTrsfReasonCd
     */
    public String getsTrsfReasonCd() {
        return sTrsfReasonCd;
    }

    /**
     * @param sTrsfReasonCd the sTrsfReasonCd to set
     */
    public void setsTrsfReasonCd(String sTrsfReasonCd) {
        this.sTrsfReasonCd = sTrsfReasonCd;
    }

    /**
     * @return the sTrsfReceiveRelCd
     */
    public String getsTrsfReceiveRelCd() {
        return sTrsfReceiveRelCd;
    }

    /**
     * @param sTrsfReceiveRelCd the sTrsfReceiveRelCd to set
     */
    public void setsTrsfReceiveRelCd(String sTrsfReceiveRelCd) {
        this.sTrsfReceiveRelCd = sTrsfReceiveRelCd;
    }

    /**
     * @return the sFileDocNo
     */
    public String getsFileDocNo() {
        return sFileDocNo;
    }

    /**
     * @param sFileDocNo the sFileDocNo to set
     */
    public void setsFileDocNo(String sFileDocNo) {
        this.sFileDocNo = sFileDocNo;
    }

    /**
     * @return the sSignDocNo
     */
    public String getsSignDocNo() {
        return sSignDocNo;
    }

    /**
     * @param sSignDocNo the sSignDocNo to set
     */
    public void setsSignDocNo(String sSignDocNo) {
        this.sSignDocNo = sSignDocNo;
    }

    /**
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
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
     * @return the sSignStatCd
     */
    public String getsSignStatCd() {
        return sSignStatCd;
    }

    /**
     * @param sSignStatCd the sSignStatCd to set
     */
    public void setsSignStatCd(String sSignStatCd) {
        this.sSignStatCd = sSignStatCd;
    }

    /**
     * @return the sReceive
     */
    public String getsReceive() {
        return sReceive;
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
     * @param sReceive the sReceive to set
     */
    public void setsReceive(String sReceive) {
        this.sReceive = sReceive;
    }

    /**
     * @return the sSignDocId
     */
    public String getsSignDocId() {
        return sSignDocId;
    }

    /**
     * @param sSignDocId the sSignDocId to set
     */
    public void setsSignDocId(String sSignDocId) {
        this.sSignDocId = sSignDocId;
    }



}
