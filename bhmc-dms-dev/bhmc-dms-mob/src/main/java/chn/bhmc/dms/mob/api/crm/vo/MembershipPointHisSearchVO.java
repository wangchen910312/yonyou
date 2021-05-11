package chn.bhmc.dms.mob.api.crm.vo;

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
 * @author Lee In Moon
 * @since 2016. 4. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 5.     Lee In Moon     최초 생성
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
    * 소멸일자(시작일)
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               sExtcDt;


    /**
     * 소멸일자(종료일)
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date               sExtcEndDt;

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
    private String sRoDocNo;        //RO번호(서비스)

    private String sUseTp;        //사용 코드
    private String sUseNum;        //사용 번호 (정산번호)

    private String sContractNo;     //판매(주문번호)
    private String sSrcSub1;//RO 하위번호 ( 정산 or 수납번호 )
    private String sSrcSub2;//정산 or 수납 line 번호
    private String sSrcSub3;//사용금액 출처 ( 포인트 적립 및 취소를 위함 )


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
     * @return the sExtcEndDt
     */
    public Date getsExtcEndDt() {
        return sExtcEndDt;
    }



    /**
     * @param sExtcEndDt the sExtcEndDt to set
     */
    public void setsExtcEndDt(Date sExtcEndDt) {
        this.sExtcEndDt = sExtcEndDt;
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





    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }



    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sSrcSub1
     */
    public String getsSrcSub1() {
        return sSrcSub1;
    }



    /**
     * @param sSrcSub1 the sSrcSub1 to set
     */
    public void setsSrcSub1(String sSrcSub1) {
        this.sSrcSub1 = sSrcSub1;
    }



    /**
     * @return the sSrcSub2
     */
    public String getsSrcSub2() {
        return sSrcSub2;
    }



    /**
     * @param sSrcSub2 the sSrcSub2 to set
     */
    public void setsSrcSub2(String sSrcSub2) {
        this.sSrcSub2 = sSrcSub2;
    }

    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }



    /**
     * @return the sSrcSub3
     */
    public String getsSrcSub3() {
        return sSrcSub3;
    }



    /**
     * @param sSrcSub3 the sSrcSub3 to set
     */
    public void setsSrcSub3(String sSrcSub3) {
        this.sSrcSub3 = sSrcSub3;
    }



    /**
     * @return the sContractNo
     */
    public String getsContractNo() {
        return sContractNo;
    }



    /**
     * @param sContractNo the sContractNo to set
     */
    public void setsContractNo(String sContractNo) {
        this.sContractNo = sContractNo;
    }



    /**
     * @return the sUseTp
     */
    public String getsUseTp() {
        return sUseTp;
    }



    /**
     * @param sUseTp the sUseTp to set
     */
    public void setsUseTp(String sUseTp) {
        this.sUseTp = sUseTp;
    }



    /**
     * @return the sUseNum
     */
    public String getsUseNum() {
        return sUseNum;
    }



    /**
     * @param sUseNum the sUseNum to set
     */
    public void setsUseNum(String sUseNum) {
        this.sUseNum = sUseNum;
    }





}
