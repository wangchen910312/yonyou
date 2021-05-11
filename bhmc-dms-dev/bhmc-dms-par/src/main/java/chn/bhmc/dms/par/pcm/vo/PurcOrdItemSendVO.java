package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcOrdItemSendVO.java
 * @Description : 구매발주통신 VO.
 * @author In Bo Shim
 * @since 2016. 5. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 26.     In Bo Shim     최초 생성
 * </pre>
 */

public class PurcOrdItemSendVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1806833964940150990L;

    /**
     * Dealer Code
     **/
    private String posDlr = " ";

    /**
     * Order Number(Dealer)
     **/
    private String posDlrOrd = " ";

    /**
     * Line
     **/
    private String posOrdLn = " ";

    /**
     * HMC / KIA
     **/
    private String posCmpKnd = " ";

    /**
     * Order Type
     **/
    private String posOrdTyp = " ";

    /**
     * Order Date
     **/
    private String posOrdDt = " ";

    /**
     * Order Time
     **/
    private String posOrdTm = " ";

    /**
     * transtortation
     **/
    private String posTrnTyp = " ";

    /**
     * Remark
     **/
    private String posRmk = " ";

    /**
     * Part Number
     **/
    private String posOrdPno = " ";

    /**
     * Ordered Quantity
     **/
    private int posOrdQt = 0;

    /**
     * 인터페이스결과코드
     **/
    private String ifresult = "N";

    /**
     * 인터페이스실패메세지
     **/
    private String iffailmsg = " ";

    /**
     * 생성일자
     **/
    private String createdate = " ";

    /**
     * 수정일자
     **/
    private String updatedate = " ";

    /**
     * 인터페이스등록일자
     **/
    private Date ifRegDt;

    /**
     * @return the posDlr
     */
    public String getPosDlr() {
        return posDlr;
    }

    /**
     * @param posDlr the posDlr to set
     */
    public void setPosDlr(String posDlr) {
        this.posDlr = posDlr;
    }

    /**
     * @return the posDlrOrd
     */
    public String getPosDlrOrd() {
        return posDlrOrd;
    }

    /**
     * @param posDlrOrd the posDlrOrd to set
     */
    public void setPosDlrOrd(String posDlrOrd) {
        this.posDlrOrd = posDlrOrd;
    }

    /**
     * @return the posOrdLn
     */
    public String getPosOrdLn() {
        return posOrdLn;
    }

    /**
     * @param posOrdLn the posOrdLn to set
     */
    public void setPosOrdLn(String posOrdLn) {
        this.posOrdLn = posOrdLn;
    }

    /**
     * @return the posCmpKnd
     */
    public String getPosCmpKnd() {
        return posCmpKnd;
    }

    /**
     * @param posCmpKnd the posCmpKnd to set
     */
    public void setPosCmpKnd(String posCmpKnd) {
        this.posCmpKnd = posCmpKnd;
    }

    /**
     * @return the posOrdTyp
     */
    public String getPosOrdTyp() {
        return posOrdTyp;
    }

    /**
     * @param posOrdTyp the posOrdTyp to set
     */
    public void setPosOrdTyp(String posOrdTyp) {
        this.posOrdTyp = posOrdTyp;
    }

    /**
     * @return the posOrdDt
     */
    public String getPosOrdDt() {
        return posOrdDt;
    }

    /**
     * @param posOrdDt the posOrdDt to set
     */
    public void setPosOrdDt(String posOrdDt) {
        this.posOrdDt = posOrdDt;
    }

    /**
     * @return the posOrdTm
     */
    public String getPosOrdTm() {
        return posOrdTm;
    }

    /**
     * @param posOrdTm the posOrdTm to set
     */
    public void setPosOrdTm(String posOrdTm) {
        this.posOrdTm = posOrdTm;
    }

    /**
     * @return the posTrnTyp
     */
    public String getPosTrnTyp() {
        return posTrnTyp;
    }

    /**
     * @param posTrnTyp the posTrnTyp to set
     */
    public void setPosTrnTyp(String posTrnTyp) {
        this.posTrnTyp = posTrnTyp;
    }

    /**
     * @return the posRmk
     */
    public String getPosRmk() {
        return posRmk;
    }

    /**
     * @param posRmk the posRmk to set
     */
    public void setPosRmk(String posRmk) {
        this.posRmk = posRmk;
    }

    /**
     * @return the posOrdPno
     */
    public String getPosOrdPno() {
        return posOrdPno;
    }

    /**
     * @param posOrdPno the posOrdPno to set
     */
    public void setPosOrdPno(String posOrdPno) {
        this.posOrdPno = posOrdPno;
    }

    /**
     * @return the posOrdQt
     */
    public int getPosOrdQt() {
        return posOrdQt;
    }

    /**
     * @param posOrdQt the posOrdQt to set
     */
    public void setPosOrdQt(int posOrdQt) {
        this.posOrdQt = posOrdQt;
    }

    /**
     * @return the ifresult
     */
    public String getIfresult() {
        return ifresult;
    }

    /**
     * @param ifresult the ifresult to set
     */
    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }

    /**
     * @return the iffailmsg
     */
    public String getIffailmsg() {
        return iffailmsg;
    }

    /**
     * @param iffailmsg the iffailmsg to set
     */
    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }

    /**
     * @return the createdate
     */
    public String getCreatedate() {
        return createdate;
    }

    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    /**
     * @return the updatedate
     */
    public String getUpdatedate() {
        return updatedate;
    }

    /**
     * @param updatedate the updatedate to set
     */
    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    /**
     * @return the ifRegDt
     */
    public Date getIfRegDt() {
        return ifRegDt;
    }

    /**
     * @param ifRegDt the ifRegDt to set
     */
    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }
}
