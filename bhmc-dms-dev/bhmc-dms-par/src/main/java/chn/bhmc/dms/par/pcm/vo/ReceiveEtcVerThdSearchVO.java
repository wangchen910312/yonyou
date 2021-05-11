package chn.bhmc.dms.par.pcm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * 기초재고입고 검색
 * </pre>
 *
 * @ClassName   : ReceiveEtcVerThdSearchVO.java
 * @Description : ReceiveEtcVerThdSearchVO.class
 * @author In Bo Shim
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.     In Bo Shim     최초 생성
 * </pre>
 */

public class ReceiveEtcVerThdSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 696391280995978099L;

    /**
     * 딜러코드
     **/

    private String sDlrCd;

    /**
     * 기타입고문서번호
     **/
    private String sEtcGrDocNo;

    /**
     * 부품번호
     **/
    private String sItemCd;

    /**
     * 입고적용여부
     **/
    private String sApplyYn;

    /**
     * 출고적용여부
     **/
    private String sApplyGiYn;

    /**
     * 입출고수량0이상여부
     **/
    private String sGrGiScheQtyZeroYn;

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
     * @return the sEtcGrDocNo
     */
    public String getsEtcGrDocNo() {
        return sEtcGrDocNo;
    }

    /**
     * @param sEtcGrDocNo the sEtcGrDocNo to set
     */
    public void setsEtcGrDocNo(String sEtcGrDocNo) {
        this.sEtcGrDocNo = sEtcGrDocNo;
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
     * @return the sApplyYn
     */
    public String getsApplyYn() {
        return sApplyYn;
    }

    /**
     * @param sApplyYn the sApplyYn to set
     */
    public void setsApplyYn(String sApplyYn) {
        this.sApplyYn = sApplyYn;
    }

    /**
     * @return the sApplyGiYn
     */
    public String getsApplyGiYn() {
        return sApplyGiYn;
    }

    /**
     * @param sApplyGiYn the sApplyGiYn to set
     */
    public void setsApplyGiYn(String sApplyGiYn) {
        this.sApplyGiYn = sApplyGiYn;
    }

    /**
     * @return the sGrGiScheQtyZeroYn
     */
    public String getsGrGiScheQtyZeroYn() {
        return sGrGiScheQtyZeroYn;
    }

    /**
     * @param sGrGiScheQtyZeroYn the sGrGiScheQtyZeroYn to set
     */
    public void setsGrGiScheQtyZeroYn(String sGrGiScheQtyZeroYn) {
        this.sGrGiScheQtyZeroYn = sGrGiScheQtyZeroYn;
    }

}
