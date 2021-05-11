package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialPointSearchVO.java
 * @Description : 특별포인트 조회 VO
 * @author Kim Hyun Ho
 * @since 2016. 8. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 1.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class SpecialPointSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -9061699378257935338L;

    /**
    * 딜러코드
    **/

    private  String             sDlrCd;

    /**
    * 일련번호
    **/

    private  int                sSeq;

    /**
    * 멤버쉽번호
    **/

    private  String             sMembershipNo;

    /**
    * 부여포인트값
    **/

    private  int                sProvidePointVal;

    /**
    * 부여사유내용
    **/

    private  String             sProvideReasonCont;

    /**
    * 결제문서번호
    **/
    private  String             sSignDocNo;

    /**
     * 멤버십 카드 사용여부
     **/
    private  String             sUseYn;

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
     * @return the sProvidePointVal
     */
    public int getsProvidePointVal() {
        return sProvidePointVal;
    }

    /**
     * @param sProvidePointVal the sProvidePointVal to set
     */
    public void setsProvidePointVal(int sProvidePointVal) {
        this.sProvidePointVal = sProvidePointVal;
    }

    /**
     * @return the sProvideReasonCont
     */
    public String getsProvideReasonCont() {
        return sProvideReasonCont;
    }

    /**
     * @param sProvideReasonCont the sProvideReasonCont to set
     */
    public void setsProvideReasonCont(String sProvideReasonCont) {
        this.sProvideReasonCont = sProvideReasonCont;
    }

    /**
     * @return the sSignDocNo
     */
    public String getsSignDocNo() {
        return sSignDocNo;
    }

    /**
     * @param sSignDocNo the sSignDocNo to set
     */
    public void setsSignDocNo(String sSignDocNo) {
        this.sSignDocNo = sSignDocNo;
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





}
