package chn.bhmc.dms.crm.cmm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarLineInfoSearchVO.java.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin Lee
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Kyo Jin Lee     최초 생성
 * </pre>
 */


public class CarLineInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4847577534977112750L;

    /**
     * SEQ
     **/
    private  int         sSeq;

    /**
     * 딜러코드
     **/

    private  String      sDlrCd;

    /**
     * 사업장코드
     **/

    private  String      sPltCd;

    /**
     * 참조테이블명
     **/

    private  String      sRefTableNm;

    /**
     * 참조키명
     **/

    private  String      sRefKeyNm;

    /**
     * 관심차종코드
     **/

    private  String      sCarlineCd;

    /**
     * 관심모델코드
     **/

    private  String      sModelCd;

    /**
     * 관심플래그여부
     **/

    private  String      sFlagYn;

    /**
     * 등록자ID
     **/

    private  String      sRegUsrId;

    /**
     * 등록일자
     **/
    private  Date        sRegDt;

    /**
     * 수정자ID
     **/

    private  String      sUpdtUsrId;

    /**
     * 수정일자
     **/
    private  Date        sUpdtDt;

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
     * @return the sRefTableNm
     */
    public String getsRefTableNm() {
        return sRefTableNm;
    }

    /**
     * @param sRefTableNm the sRefTableNm to set
     */
    public void setsRefTableNm(String sRefTableNm) {
        this.sRefTableNm = sRefTableNm;
    }

    /**
     * @return the sRefKeyNm
     */
    public String getsRefKeyNm() {
        return sRefKeyNm;
    }

    /**
     * @param sRefKeyNm the sRefKeyNm to set
     */
    public void setsRefKeyNm(String sRefKeyNm) {
        this.sRefKeyNm = sRefKeyNm;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sModelCd
     */
    public String getsModelCd() {
        return sModelCd;
    }

    /**
     * @param sModelCd the sModelCd to set
     */
    public void setsModelCd(String sModelCd) {
        this.sModelCd = sModelCd;
    }

    /**
     * @return the sFlagYn
     */
    public String getsFlagYn() {
        return sFlagYn;
    }

    /**
     * @param sFlagYn the sFlagYn to set
     */
    public void setsFlagYn(String sFlagYn) {
        this.sFlagYn = sFlagYn;
    }

    /**
     * @return the sRegUsrId
     */
    public String getsRegUsrId() {
        return sRegUsrId;
    }

    /**
     * @param sRegUsrId the sRegUsrId to set
     */
    public void setsRegUsrId(String sRegUsrId) {
        this.sRegUsrId = sRegUsrId;
    }

    /**
     * @return the sRegDt
     */
    public Date getsRegDt() {
        return sRegDt;
    }

    /**
     * @param sRegDt the sRegDt to set
     */
    public void setsRegDt(Date sRegDt) {
        this.sRegDt = sRegDt;
    }

    /**
     * @return the sUpdtUsrId
     */
    public String getsUpdtUsrId() {
        return sUpdtUsrId;
    }

    /**
     * @param sUpdtUsrId the sUpdtUsrId to set
     */
    public void setsUpdtUsrId(String sUpdtUsrId) {
        this.sUpdtUsrId = sUpdtUsrId;
    }

    /**
     * @return the sUpdtDt
     */
    public Date getsUpdtDt() {
        return sUpdtDt;
    }

    /**
     * @param sUpdtDt the sUpdtDt to set
     */
    public void setsUpdtDt(Date sUpdtDt) {
        this.sUpdtDt = sUpdtDt;
    }


}
