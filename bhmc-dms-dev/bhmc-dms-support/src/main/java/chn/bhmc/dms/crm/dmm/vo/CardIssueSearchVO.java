package chn.bhmc.dms.crm.dmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CardIssueSearchVO.java
 * @Description : 카드발급이력 조회 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 12.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class CardIssueSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -207552152298648990L;

    /**
    * 딜러코드
    **/

    private  String       sDlrCd;

    /**
    * 멤버쉽번호
    **/

    private  String       sMembershipNo;

    /**
    * 카드유형코드
    **/

    private  String       sCardTpCd;

    /**
    * 카드번호
    **/

    private  String       sCardNo;

    /**
    * 사용여부
    **/

    private  String       sUseYn;

    private  int sTrsfReceiveSeq;

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
     * @return the sUseYn
     */
    public String getsUseYn() {
        return sUseYn;
    }



    /**
     * @return the sTrsfReceiveSeq
     */
    public int getsTrsfReceiveSeq() {
        return sTrsfReceiveSeq;
    }

    /**
     * @param sTrsfReceiveSeq the sTrsfReceiveSeq to set
     */
    public void setsTrsfReceiveSeq(int sTrsfReceiveSeq) {
        this.sTrsfReceiveSeq = sTrsfReceiveSeq;
    }

    /**
     * @param sUseYn the sUseYn to set
     */
    public void setsUseYn(String sUseYn) {
        this.sUseYn = sUseYn;
    }

}
