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
 * @ClassName   : MembershipSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee In Moon
 * @since 2016. 3. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 23.     Lee In Moon     최초 생성
 * </pre>
 */

public class MembershipSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8481182928086626115L;

    /**
     * 멤버십 정책 C:고객, V:차량
     **/
    private String sMembershipStan;

    /**
    * 딜러코드
    **/
    private  String sDlrCd;

    /**
    * 고객번호
    **/
    private  String sCustNo;

    /**
    * 일련번호
    **/
    private  String sSeq;

    /**
     * 카드유형 - 01:포인트 / 02:예치금
     **/
    private  String sCardTpCd;

    /**
    * 차대번호
    **/
    private  String sVinNo;

    /**
    * 멤버십 가입 시작일
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date sStartDt;

     /**
     * 멤버십 가입 종료일
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
     private  Date sEndDt;

    //멤버십 번호조회 팝업에서 사용하는 조회 조건추가
    private String sCustNm;
    private String sMembershipNo;

    //고객,자동차 멤버십 등록시 조회조건 추가
    //private String sStan;
    //private String sCardTpCd;

    // 서비스에서 정산취소시 멤버십 상세 정보 조회하기 위한 파람
    private String sCardNo;

    private String sListTarget; // M:멤버십관리, T:멤버십양도양수팝업, 양도,양수에서는 sum데이터(금액 등) 을 볼필요가 파라미터 받아서 분기처리

    /**
     * @return the sMembershipStan
     */
    public String getsMembershipStan() {
        return sMembershipStan;
    }

    /**
     * @param sMembershipStan the sMembershipStan to set
     */
    public void setsMembershipStan(String sMembershipStan) {
        this.sMembershipStan = sMembershipStan;
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
     * @return the sSeq
     */
    public String getsSeq() {
        return sSeq;
    }

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(String sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sListTarget
     */
    public String getsListTarget() {
        return sListTarget;
    }

    /**
     * @param sListTarget the sListTarget to set
     */
    public void setsListTarget(String sListTarget) {
        this.sListTarget = sListTarget;
    }

}