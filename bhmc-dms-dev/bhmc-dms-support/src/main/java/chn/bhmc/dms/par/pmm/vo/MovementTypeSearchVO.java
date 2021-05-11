package chn.bhmc.dms.par.pmm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 수불유형 검색 VO
 *
 * @ClassName   : MovementTypeSearchVO.java
 * @Description : MovementTypeSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 8.     In Bo Shim     최초 생성
 * </pre>
 */

public class MovementTypeSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2986116251690187907L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 센터코드
     **/
    @NotEmpty
    private  String sPltCd;

    /**
     * 품목코드
     **/

    private  String sItemCd;

    /**
     * 품목명
     **/

    private  String sItemNm;

    /**
     * 품목구분코드
     */

    private String sItemDstinCd;

   /**
    * 수불문서년월일자
    */
    @NotEmpty
    private String sMvtDocYyMm;

    /**
     * 수불문서 생성일(시작)
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMvtDocYyMmFr;

    /**
     * 수불문서 생성일(종료)
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sMvtDocYyMmTo;

    /**
     * 수불문서번호
     **/
    @NotEmpty

    private  String sMvtDocNo;

    /**
     * 수불문서라인번호
     **/
    @NotEmpty

    private  int sMvtDocLineNo;

    /**
     * 수불유형
     */
    @NotEmpty
    private String sMvtTp;

    /**
     * 수불유형명
     */
    private String sMvtTpNm;

    /**
     * 거래처
     */
    private String sBpCd;

    /**
     * 고객번호
     */
    private String sCustNo;

    /**
     * 창고코드
     **/

    private  String sStrgeCd;

    /**
     * 위치코드
     **/

    private  String sLocCd;

    /**
     * 사용유무
     */
    private String sUseYn;

    /**
     * ABC CLASS
     */
    private  String sAbcInd;

    /***
     * 차종코드
     */
    private  String sCarlineCd;

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
     * @return the sMvtTp
     */
    public String getsMvtTp() {
        return sMvtTp;
    }

    /**
     * @param sMvtTp the sMvtTp to set
     */
    public void setsMvtTp(String sMvtTp) {
        this.sMvtTp = sMvtTp;
    }

    /**
     * @return the sMvtTpNm
     */
    public String getsMvtTpNm() {
        return sMvtTpNm;
    }

    /**
     * @param sMvtTpNm the sMvtTpNm to set
     */
    public void setsMvtTpNm(String sMvtTpNm) {
        this.sMvtTpNm = sMvtTpNm;
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
     * @return the sMvtDocYyMm
     */
    public String getsMvtDocYyMm() {
        return sMvtDocYyMm;
    }

    /**
     * @param sMvtDocYyMm the sMvtDocYyMm to set
     */
    public void setsMvtDocYyMm(String sMvtDocYyMm) {
        this.sMvtDocYyMm = sMvtDocYyMm;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    /**
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sMvtDocNo
     */
    public String getsMvtDocNo() {
        return sMvtDocNo;
    }

    /**
     * @param sMvtDocNo the sMvtDocNo to set
     */
    public void setsMvtDocNo(String sMvtDocNo) {
        this.sMvtDocNo = sMvtDocNo;
    }

    /**
     * @return the sMvtDocLineNo
     */
    public int getsMvtDocLineNo() {
        return sMvtDocLineNo;
    }

    /**
     * @param sMvtDocLineNo the sMvtDocLineNo to set
     */
    public void setsMvtDocLineNo(int sMvtDocLineNo) {
        this.sMvtDocLineNo = sMvtDocLineNo;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
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
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }

    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
    }


    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
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
     * @return the sMvtDocYyMmFr
     */
    public Date getsMvtDocYyMmFr() {
        return sMvtDocYyMmFr;
    }

    /**
     * @param sMvtDocYyMmFr the sMvtDocYyMmFr to set
     */
    public void setsMvtDocYyMmFr(Date sMvtDocYyMmFr) {
        this.sMvtDocYyMmFr = sMvtDocYyMmFr;
    }

    /**
     * @return the sMvtDocYyMmTo
     */
    public Date getsMvtDocYyMmTo() {
        return sMvtDocYyMmTo;
    }

    /**
     * @param sMvtDocYyMmTo the sMvtDocYyMmTo to set
     */
    public void setsMvtDocYyMmTo(Date sMvtDocYyMmTo) {
        this.sMvtDocYyMmTo = sMvtDocYyMmTo;
    }
}
