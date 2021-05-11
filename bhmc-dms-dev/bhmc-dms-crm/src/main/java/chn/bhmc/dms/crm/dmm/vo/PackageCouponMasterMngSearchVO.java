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
 * @ClassName   : PackageCouponMasterMngSearchVO.java
 * @Description : 패키지쿠폰 Master 관리 SearchVO
 * @author Kim Hyun Ho
 * @since 2016. 6. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 8.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class PackageCouponMasterMngSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7994131071093623335L;

    /**
    * 딜러코드
    **/

    private  String     sDlrCd;

    /**
    * 패키지일련번호
    **/

    private  int        sPkgSeq;

    /**
    * 패키지명
    **/

    private  String     sPkgNm;

    /**
    * 패키지금액
    **/

    private  int        sPkgAmt;

    /**
    * 패키지내용
    **/

    private  String     sPkgCont;

    /*
     * [TODO] 검색조건 추가
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;

    private String sPkgUse;

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
     * @return the sPkgNm
     */
    public String getsPkgNm() {
        return sPkgNm;
    }

    /**
     * @param sPkgNm the sPkgNm to set
     */
    public void setsPkgNm(String sPkgNm) {
        this.sPkgNm = sPkgNm;
    }

    /**
     * @return the sPkgAmt
     */
    public int getsPkgAmt() {
        return sPkgAmt;
    }

    /**
     * @param sPkgAmt the sPkgAmt to set
     */
    public void setsPkgAmt(int sPkgAmt) {
        this.sPkgAmt = sPkgAmt;
    }

    /**
     * @return the sPkgCont
     */
    public String getsPkgCont() {
        return sPkgCont;
    }

    /**
     * @param sPkgCont the sPkgCont to set
     */
    public void setsPkgCont(String sPkgCont) {
        this.sPkgCont = sPkgCont;
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
     * @return the sPkgUse
     */
    public String getsPkgUse() {
        return sPkgUse;
    }

    /**
     * @param sPkgUse the sPkgUse to set
     */
    public void setsPkgUse(String sPkgUse) {
        this.sPkgUse = sPkgUse;
    }








}
