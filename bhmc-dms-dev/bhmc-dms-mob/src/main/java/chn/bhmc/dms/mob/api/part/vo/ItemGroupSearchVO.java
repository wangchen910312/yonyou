package chn.bhmc.dms.mob.api.part.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 품목그룹 검색 VO
 *
 * @ClassName   : ItemGroupSearchVO.java
 * @Description : ItemGroupSearchVO Class
 * @author In Bo Shim
 * @since 2016. 1. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 7.     In Bo Shim     최초 생성
 * </pre>
 */
public class ItemGroupSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 1342870240474803023L;

    /**
     * 조회조건 - 딜러코드
     */
    private String sDlrCd;

    /**
     * 조회조건 - 부품코드
     */
    private String sItemCd;

    /**
     * 조회조건 - 품목구분코드
     */
    private String sItemDstinCd;

    /**
     * 조회조건 - 품목그룹
     */
    private String sItemGrpCd;

    /**
     * 조회조건 - 품목그룹명
     */
    private String sItemGrpNm;

    /**
     * 조회조건 - 사용여부
     */
    private String sUseYn;

    /**
     * 조회조건 - 사용여부
     */
    private int sLvlVal = 0;

    /**
     * 조회조건 - 부모품목구분코드
     */
    private String sPentItemDstinCd;

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
     * @return the sItemGrpCd
     */
    public String getsItemGrpCd() {
        return sItemGrpCd;
    }

    /**
     * @param sItemGrpCd the sItemGrpCd to set
     */
    public void setsItemGrpCd(String sItemGrpCd) {
        this.sItemGrpCd = sItemGrpCd;
    }

    /**
     * @return the sItemGrpNm
     */
    public String getsItemGrpNm() {
        return sItemGrpNm;
    }

    /**
     * @param sItemGrpNm the sItemGrpNm to set
     */
    public void setsItemGrpNm(String sItemGrpNm) {
        this.sItemGrpNm = sItemGrpNm;
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
     * @return the sLvlVal
     */
    public int getsLvlVal() {
        return sLvlVal;
    }

    /**
     * @param sLvlVal the sLvlVal to set
     */
    public void setsLvlVal(int sLvlVal) {
        this.sLvlVal = sLvlVal;
    }

    /**
     * @return the sPentItemDstinCd
     */
    public String getsPentItemDstinCd() {
        return sPentItemDstinCd;
    }

    /**
     * @param sPentItemDstinCd the sPentItemDstinCd to set
     */
    public void setsPentItemDstinCd(String sPentItemDstinCd) {
        this.sPentItemDstinCd = sPentItemDstinCd;
    }
}
