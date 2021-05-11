package chn.bhmc.dms.mob.api.repair.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TabInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 7. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 7.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class TabInfoSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6971929691455689393L;

    /**
     * PREFIX ID
     **/
    private String sPreFixId;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 업무번호
     **/
    private String sJobNo;

    /**
     * 부품, 공임 공통 문서번호
     **/
    private String sDocNo;

    /**
     * 부품, 공임 공통 문서번호 라인번호
     **/
    private int sLineNo = 0;

    /**
     * 캠페인번호
     **/
    private String sCrNo;

    /**
     * VIN번호
     **/
    private String sVinNo;

    /**
     * 정산에서 출고수량이 0이상인 것만 가져옴
     **/
    private String sGiQtyExist;

    /**
     * 모델코드
     */
    private String sLtsModelCd;

    /**
     * 부품코드
     */
    private String sItemCd;

    /**
     * 칸반 여부
     */
    private String sKanbanYn;

    /**
     * 공임코드
     */
    private String sLbrCd;

    /**
     * RO NO
     */
    private String sRoDocNo;

    /*
     * 캠페인여부
     */
    private String sCrYn;


    /**
     * @return the sPreFixId
     */
    public String getsPreFixId() {
        return sPreFixId;
    }

    /**
     * @param sPreFixId the sPreFixId to set
     */
    public void setsPreFixId(String sPreFixId) {
        this.sPreFixId = sPreFixId;
    }

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
     * @return the sJobNo
     */
    public String getsJobNo() {
        return sJobNo;
    }

    /**
     * @param sJobNo the sJobNo to set
     */
    public void setsJobNo(String sJobNo) {
        this.sJobNo = sJobNo;
    }

    /**
     * @return the sDocNo
     */
    public String getsDocNo() {
        return sDocNo;
    }

    /**
     * @param sDocNo the sDocNo to set
     */
    public void setsDocNo(String sDocNo) {
        this.sDocNo = sDocNo;
    }

    /**
     * @return the sLineNo
     */
    public int getsLineNo() {
        return sLineNo;
    }

    /**
     * @param sLineNo the sLineNo to set
     */
    public void setsLineNo(int sLineNo) {
        this.sLineNo = sLineNo;
    }

    /**
     * @return the sCrNo
     */
    public String getsCrNo() {
        return sCrNo;
    }

    /**
     * @param sCrNo the sCrNo to set
     */
    public void setsCrNo(String sCrNo) {
        this.sCrNo = sCrNo;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sGiQtyExist
     */
    public String getsGiQtyExist() {
        return sGiQtyExist;
    }

    /**
     * @param sGiQtyExist the sGiQtyExist to set
     */
    public void setsGiQtyExist(String sGiQtyExist) {
        this.sGiQtyExist = sGiQtyExist;
    }

    /**
     * @return the sLtsModelCd
     */
    public String getsLtsModelCd() {
        return sLtsModelCd;
    }

    /**
     * @param sLtsModelCd the sLtsModelCd to set
     */
    public void setsLtsModelCd(String sLtsModelCd) {
        this.sLtsModelCd = sLtsModelCd;
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

    public String getsKanbanYn() {
        return sKanbanYn;
    }

    public void setsKanbanYn(String sKanbanYn) {
        this.sKanbanYn = sKanbanYn;
    }

    public String getsLbrCd() {
        return sLbrCd;
    }

    public void setsLbrCd(String sLbrCd) {
        this.sLbrCd = sLbrCd;
    }

    /**
     * @return the sRoDocNo
     */
    public String getsRoDocNo() {
        return sRoDocNo;
    }

    /**
     * @param sRoDocNo the sRoDocNo to set
     */
    public void setsRoDocNo(String sRoDocNo) {
        this.sRoDocNo = sRoDocNo;
    }

    /**
     * @return the sCrYn
     */
    public String getsCrYn() {
        return sCrYn;
    }

    /**
     * @param sCrYn the sCrYn to set
     */
    public void setsCrYn(String sCrYn) {
        this.sCrYn = sCrYn;
    }

}
