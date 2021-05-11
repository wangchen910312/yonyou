package chn.bhmc.dms.crm.cif.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustCouponInPackageInfoSearchVO
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

public class CustCouponInPackageInfoSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2875607411365481526L;

    /**
    * 딜러코드
    **/

    private  String     sDlrCd;

    /**
    * 패키지일련번호
    **/

    private  int        sPkgSeq;

    /**
    * 쿠폰일련번호
    **/

    private  int        sCupnSeq;

    /**
    * 등록자ID
    **/

    private  String     sRegUsrId;

    /**
    * 등록일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sRegDt;

    /**
    * 수정자ID
    **/

    private  String     sUpdtUsrId;

    /**
    * 수정일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date       sUpdtDt;

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
     * @return the sPkgSeq
     */
    public int getsPkgSeq() {
        return sPkgSeq;
    }

    /**
     * @param sPkgSeq the sPkgSeq to set
     */
    public void setsPkgSeq(int sPkgSeq) {
        this.sPkgSeq = sPkgSeq;
    }

    /**
     * @return the sCupnSeq
     */
    public int getsCupnSeq() {
        return sCupnSeq;
    }

    /**
     * @param sCupnSeq the sCupnSeq to set
     */
    public void setsCupnSeq(int sCupnSeq) {
        this.sCupnSeq = sCupnSeq;
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
