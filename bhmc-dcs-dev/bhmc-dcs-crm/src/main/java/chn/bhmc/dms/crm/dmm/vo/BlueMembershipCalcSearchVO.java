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
 * @ClassName   : BlueMembershipCalcSearchVO.java
 * @Description : 블루멤버십 정산 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipCalcSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2668796708125559022L;


    /**
    * 딜러코드
    **/
    private  String            sDlrCd;

    /**
    * 포인트이력일련번호
    **/
    private  int               sPointHisSeq;

    /**
    * 블루멤버쉽번호
    **/
    private  String            sBlueMembershipNo;

    /**
    * 고객번호
    **/
    private  String            sCustNo;

    /**
    * 포인트코드
    **/
    private  String            sPointCd;

    /**
    * 포인트유형
    **/
    private  String            sPointTp;

    /**
    * 발생포인트값
    **/
    private  int               sOccrPointVal;

    /**
    * 발생일자
    **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sOccrDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sOccrDtFrom;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sOccrDtTo;

    /**
    * 담당부서명
    **/
    private  String            sPrsnDeptNm;

    /**
    * 담당자ID
    **/
    private  String            sPrsnId;

    //조회조건 추가
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sEndDt;

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
     * @return the sBlueMembershipNo
     */
    public String getsBlueMembershipNo() {
        return sBlueMembershipNo;
    }

    /**
     * @param sBlueMembershipNo the sBlueMembershipNo to set
     */
    public void setsBlueMembershipNo(String sBlueMembershipNo) {
        this.sBlueMembershipNo = sBlueMembershipNo;
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
    public Date getsOccrDt() {
        return sOccrDt;
    }

    /**
     * @param sOccrDt the sOccrDt to set
     */
    public void setsOccrDt(Date sOccrDt) {
        this.sOccrDt = sOccrDt;
    }

    /**
     * @return the sPrsnDeptNm
     */
    public String getsPrsnDeptNm() {
        return sPrsnDeptNm;
    }

    /**
     * @param sPrsnDeptNm the sPrsnDeptNm to set
     */
    public void setsPrsnDeptNm(String sPrsnDeptNm) {
        this.sPrsnDeptNm = sPrsnDeptNm;
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
     * @return the sOccrDtFrom
     */
    public Date getsOccrDtFrom() {
        return sOccrDtFrom;
    }

    /**
     * @param sOccrDtFrom the sOccrDtFrom to set
     */
    public void setsOccrDtFrom(Date sOccrDtFrom) {
        this.sOccrDtFrom = sOccrDtFrom;
    }

    /**
     * @return the sOccrDtTo
     */
    public Date getsOccrDtTo() {
        return sOccrDtTo;
    }

    /**
     * @param sOccrDtTo the sOccrDtTo to set
     */
    public void setsOccrDtTo(Date sOccrDtTo) {
        this.sOccrDtTo = sOccrDtTo;
    }



}
