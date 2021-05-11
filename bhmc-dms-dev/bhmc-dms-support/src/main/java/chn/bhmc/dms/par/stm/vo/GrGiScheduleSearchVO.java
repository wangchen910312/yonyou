package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 수불유형 검색 VO
 *
 * @ClassName   : StockInOutSearchVO.java
 * @Description : StockInOutSearchVO.Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class GrGiScheduleSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1834090772541143238L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 입출고문서번호
     **/
    private String sGrGiDocNo;

    /**
     * 입출고문서라인번호
     **/
    private int sGrGiDocLineNo;

    /**
     * 일련번호
     **/
    private int sSeq;

    /**
     * 입출고유형
     **/
    private String sGrGiTp;

    /**
     * 처리수량
     **/
    private Double sProcQty;

    /**
     * 입출고수량
     **/
    private Double sGrGiQty;

    /**
     * 입출고예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sGrGiScheDt;

    /**
     * 거래처코드
     **/
    private String sBpCd;

    /**
     * 고객코드
     **/

    private String sCustCd;

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
     * @return the sGrGiDocNo
     */
    public String getsGrGiDocNo() {
        return sGrGiDocNo;
    }

    /**
     * @param sGrGiDocNo the sGrGiDocNo to set
     */
    public void setsGrGiDocNo(String sGrGiDocNo) {
        this.sGrGiDocNo = sGrGiDocNo;
    }

    /**
     * @return the sGrGiDocLineNo
     */
    public int getsGrGiDocLineNo() {
        return sGrGiDocLineNo;
    }

    /**
     * @param sGrGiDocLineNo the sGrGiDocLineNo to set
     */
    public void setsGrGiDocLineNo(int sGrGiDocLineNo) {
        this.sGrGiDocLineNo = sGrGiDocLineNo;
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
     * @return the sGrGiTp
     */
    public String getsGrGiTp() {
        return sGrGiTp;
    }

    /**
     * @param sGrGiTp the sGrGiTp to set
     */
    public void setsGrGiTp(String sGrGiTp) {
        this.sGrGiTp = sGrGiTp;
    }

    /**
     * @return the sProcQty
     */
    public Double getsProcQty() {
        return sProcQty;
    }

    /**
     * @param sProcQty the sProcQty to set
     */
    public void setsProcQty(Double sProcQty) {
        this.sProcQty = sProcQty;
    }

    /**
     * @return the sGrGiQty
     */
    public Double getsGrGiQty() {
        return sGrGiQty;
    }

    /**
     * @param sGrGiQty the sGrGiQty to set
     */
    public void setsGrGiQty(Double sGrGiQty) {
        this.sGrGiQty = sGrGiQty;
    }

    /**
     * @return the sGrGiScheDt
     */
    public Date getsGrGiScheDt() {
        return sGrGiScheDt;
    }

    /**
     * @param sGrGiScheDt the sGrGiScheDt to set
     */
    public void setsGrGiScheDt(Date sGrGiScheDt) {
        this.sGrGiScheDt = sGrGiScheDt;
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
     * @return the sCustCd
     */
    public String getsCustCd() {
        return sCustCd;
    }

    /**
     * @param sCustCd the sCustCd to set
     */
    public void setsCustCd(String sCustCd) {
        this.sCustCd = sCustCd;
    }
}
