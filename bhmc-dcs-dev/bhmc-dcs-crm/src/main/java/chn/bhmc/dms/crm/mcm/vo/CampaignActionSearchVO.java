package chn.bhmc.dms.crm.mcm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 마케팅 캠패인 조회 SearchVO
 *
 * @ClassName   : CampaignActionSearchVO.java
 * @Description : CampaignActionSearchVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

public class CampaignActionSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1754927684529970526L;

    private  String          sDlrCd;        // 딜러코드
    private  String          sPltCd;        // 사업장코드
    private  String          cmmCd;         // 유형코드
    private  String          langCd;        // 언어코드
    private  String          sMakCd;        // 마케팅코드
    private  String          sMakNm;        // 마케팅명
    private  String          sHostCd;       // 주최코드
    private  String          sHostTeamCd;   // 주최팀코드
    private  String          sMakTpCd;      // 마케팅유형코드
    private  String          sMakSubTpCd;   // 마케팅유형코드 makSubTpCd
    private  String          sStatCd;       // 상태코드
    private  int             sTargCustSeq;       // 대상고객일련번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartDt;                  // 마케팅 시작일자
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndDt;                    // 마케팅 종료일자


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
     * @return the sMakNm
     */
    public String getsMakNm() {
        return sMakNm;
    }
    /**
     * @param sMakNm the sMakNm to set
     */
    public void setsMakNm(String sMakNm) {
        this.sMakNm = sMakNm;
    }
    /**
     * @return the sMakCd
     */
    public String getsMakCd() {
        return sMakCd;
    }
    /**
     * @param sMakCd the sMakCd to set
     */
    public void setsMakCd(String sMakCd) {
        this.sMakCd = sMakCd;
    }
    /**
     * @return the sHostCd
     */
    public String getsHostCd() {
        return sHostCd;
    }
    /**
     * @param sHostCd the sHostCd to set
     */
    public void setsHostCd(String sHostCd) {
        this.sHostCd = sHostCd;
    }
    /**
     * @return the sHostTeamCd
     */
    public String getsHostTeamCd() {
        return sHostTeamCd;
    }
    /**
     * @param sHostTeamCd the sHostTeamCd to set
     */
    public void setsHostTeamCd(String sHostTeamCd) {
        this.sHostTeamCd = sHostTeamCd;
    }
    /**
     * @return the sMakTpCd
     */
    public String getsMakTpCd() {
        return sMakTpCd;
    }
    /**
     * @param sMakTpCd the sMakTpCd to set
     */
    public void setsMakTpCd(String sMakTpCd) {
        this.sMakTpCd = sMakTpCd;
    }
    /**
     * @return the sMakSubTpCd
     */
    public String getsMakSubTpCd() {
        return sMakSubTpCd;
    }
    /**
     * @param sMakSubTpCd the sMakSubTpCd to set
     */
    public void setsMakSubTpCd(String sMakSubTpCd) {
        this.sMakSubTpCd = sMakSubTpCd;
    }
    /**
     * @return the sStatCd
     */
    public String getsStatCd() {
        return sStatCd;
    }
    /**
     * @param sStatCd the sStatCd to set
     */
    public void setsStatCd(String sStatCd) {
        this.sStatCd = sStatCd;
    }
    /**
     * @return the cmmCd
     */
    public String getCmmCd() {
        return cmmCd;
    }
    /**
     * @param cmmCd the cmmCd to set
     */
    public void setCmmCd(String cmmCd) {
        this.cmmCd = cmmCd;
    }
    /**
     * @return the langCd
     */
    public String getLangCd() {
        return langCd;
    }
    /**
     * @param langCd the langCd to set
     */
    public void setLangCd(String langCd) {
        this.langCd = langCd;
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
    * 추출차수
    **/
    private  int               sExtrDgreCnt;

    /**
    * 고객추출조건번호
    **/
    private  String            sCustExtrTermNo;


    /**
     * @return the sExtrDgreCnt
     */
    public int getsExtrDgreCnt() {
        return sExtrDgreCnt;
    }
    /**
     * @param sExtrDgreCnt the sExtrDgreCnt to set
     */
    public void setsExtrDgreCnt(int sExtrDgreCnt) {
        this.sExtrDgreCnt = sExtrDgreCnt;
    }
    /**
     * @return the sCustExtrTermNo
     */
    public String getsCustExtrTermNo() {
        return sCustExtrTermNo;
    }
    /**
     * @param sCustExtrTermNo the sCustExtrTermNo to set
     */
    public void setsCustExtrTermNo(String sCustExtrTermNo) {
        this.sCustExtrTermNo = sCustExtrTermNo;
    }
    /**
     * @return the sTargCustSeq
     */
    public int getsTargCustSeq() {
        return sTargCustSeq;
    }
    /**
     * @param sTargCustSeq the sTargCustSeq to set
     */
    public void setsTargCustSeq(int sTargCustSeq) {
        this.sTargCustSeq = sTargCustSeq;
    }
    
    
}