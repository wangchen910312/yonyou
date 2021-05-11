package chn.bhmc.dms.par.pmm.vo;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 로케이션 마스터 검색 VO
 *
 * @ClassName   : BinLocationMasterSearchVO.java
 * @Description : BinLocationMasterSearchVO Class
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

public class BinLocationMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7253872056821392770L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 위치ID
     **/
    @NotEmpty
    private String sLocId;

    /**
     * 센터코드
     **/
    private String sPltCd;

    /**
     * 창고코드
     **/
    private String sStrgeCd;

    /**
     * 창고코드 리스트
     **/
    private List<String> sStrgeCdList;
    
    /**
     * 창고유형
     **/
    private String sStrgeTp;

    /**
     * 레벨ID
     **/
    private int sLvlId;

    /**
     * 레벨하위ID
     **/
    private int sMaxLvlId;

    /**
     * 제외레벨ID
     **/
    private int sNotLvlId;

    /**
     * 위치코드
     **/
    private String sLocCd;

    /**
     * 위치코드 유무
     **/
    private String sLocCdYn;

    /**
     * 위치명
     **/
    private String sLocNm;

    /**
     * 상위위치ID
     **/
    private String sUpperLocId;

    /**
     * 용적단위명
     **/
    private String sCapUnitNm;

    /**
     * 용적한계내용
     **/
    private String sCapLmtCont;

    /**
     * 한계관리여부
     **/
    private String sLmtMngYn;

    /**
     * 부품코드
     **/
    private String sItemCd;

    /**
     * 부품명
     **/
    private String sItemNm;

    /**
     * 부품유형
     **/
    private String sItemDstinCd;

    /**
     * 차종
     **/
    private String sCarlineCd;
    /**
     * 차형
     **/
    private String sCarlineCd2;

    /**
     * 메인위치여부
     **/
    private String sMainLocYn;

    /**
     * 최종레벨여부
     **/
    private String sLastLvlYn;

    /**
     * 부품코드 NULL 여부
     **/
    private String sItemCdNullYn;

    /**
     * 정렬여부
     **/
    private String sSortTp;

    /**
     * 로케이션 검색 조건
     **/
    private String sLocStatus;

    /**
     * 부품코드리스트
     **/
    private List<String> sItemCdLst;

    /**
     * 로케이션 코드 존재여부
     **/
    private String sLocCond;

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
     * @return the sLocId
     */
    public String getsLocId() {
        return sLocId;
    }

    /**
     * @param sLocId the sLocId to set
     */
    public void setsLocId(String sLocId) {
        this.sLocId = sLocId;
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
     * @return the sStrgeCdList
     */
    public List<String> getsStrgeCdList() {
        return sStrgeCdList;
    }

    /**
     * @param sStrgeCdList the sStrgeCdList to set
     */
    public void setsStrgeCdList(List<String> sStrgeCdList) {
        this.sStrgeCdList = sStrgeCdList;
    }

    /**
     * @return the sStrgeTp
     */
    public String getsStrgeTp() {
        return sStrgeTp;
    }

    /**
     * @param sStrgeTp the sStrgeTp to set
     */
    public void setsStrgeTp(String sStrgeTp) {
        this.sStrgeTp = sStrgeTp;
    }

    /**
     * @return the sLvlId
     */
    public int getsLvlId() {
        return sLvlId;
    }

    /**
     * @param sLvlId the sLvlId to set
     */
    public void setsLvlId(int sLvlId) {
        this.sLvlId = sLvlId;
    }

    /**
     * @return the sMaxLvlId
     */
    public int getsMaxLvlId() {
        return sMaxLvlId;
    }

    /**
     * @param sMaxLvlId the sMaxLvlId to set
     */
    public void setsMaxLvlId(int sMaxLvlId) {
        this.sMaxLvlId = sMaxLvlId;
    }

    /**
     * @return the sNotLvlId
     */
    public int getsNotLvlId() {
        return sNotLvlId;
    }

    /**
     * @param sNotLvlId the sNotLvlId to set
     */
    public void setsNotLvlId(int sNotLvlId) {
        this.sNotLvlId = sNotLvlId;
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
     * @return the sLocCdYn
     */
    public String getsLocCdYn() {
        return sLocCdYn;
    }

    /**
     * @param sLocCdYn the sLocCdYn to set
     */
    public void setsLocCdYn(String sLocCdYn) {
        this.sLocCdYn = sLocCdYn;
    }

    /**
     * @return the sLocNm
     */
    public String getsLocNm() {
        return sLocNm;
    }

    /**
     * @param sLocNm the sLocNm to set
     */
    public void setsLocNm(String sLocNm) {
        this.sLocNm = sLocNm;
    }

    /**
     * @return the sUpperLocId
     */
    public String getsUpperLocId() {
        return sUpperLocId;
    }

    /**
     * @param sUpperLocId the sUpperLocId to set
     */
    public void setsUpperLocId(String sUpperLocId) {
        this.sUpperLocId = sUpperLocId;
    }

    /**
     * @return the sCapUnitNm
     */
    public String getsCapUnitNm() {
        return sCapUnitNm;
    }

    /**
     * @param sCapUnitNm the sCapUnitNm to set
     */
    public void setsCapUnitNm(String sCapUnitNm) {
        this.sCapUnitNm = sCapUnitNm;
    }

    /**
     * @return the sCapLmtCont
     */
    public String getsCapLmtCont() {
        return sCapLmtCont;
    }

    /**
     * @param sCapLmtCont the sCapLmtCont to set
     */
    public void setsCapLmtCont(String sCapLmtCont) {
        this.sCapLmtCont = sCapLmtCont;
    }

    /**
     * @return the sLmtMngYn
     */
    public String getsLmtMngYn() {
        return sLmtMngYn;
    }

    /**
     * @param sLmtMngYn the sLmtMngYn to set
     */
    public void setsLmtMngYn(String sLmtMngYn) {
        this.sLmtMngYn = sLmtMngYn;
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
     * @return the sCarlineCd2
     */
    public String getsCarlineCd2() {
        return sCarlineCd2;
    }

    /**
     * @param sCarlineCd2 the sCarlineCd2 to set
     */
    public void setsCarlineCd2(String sCarlineCd2) {
        this.sCarlineCd2 = sCarlineCd2;
    }

    /**
     * @return the sMainLocYn
     */
    public String getsMainLocYn() {
        return sMainLocYn;
    }

    /**
     * @param sMainLocYn the sMainLocYn to set
     */
    public void setsMainLocYn(String sMainLocYn) {
        this.sMainLocYn = sMainLocYn;
    }

    /**
     * @return the sLastLvlYn
     */
    public String getsLastLvlYn() {
        return sLastLvlYn;
    }

    /**
     * @param sLastLvlYn the sLastLvlYn to set
     */
    public void setsLastLvlYn(String sLastLvlYn) {
        this.sLastLvlYn = sLastLvlYn;
    }

    /**
     * @return the sItemCdNullYn
     */
    public String getsItemCdNullYn() {
        return sItemCdNullYn;
    }

    /**
     * @param sItemCdNullYn the sItemCdNullYn to set
     */
    public void setsItemCdNullYn(String sItemCdNullYn) {
        this.sItemCdNullYn = sItemCdNullYn;
    }

    /**
     * @return the sSortTp
     */
    public String getsSortTp() {
        return sSortTp;
    }

    /**
     * @param sSortTp the sSortTp to set
     */
    public void setsSortTp(String sSortTp) {
        this.sSortTp = sSortTp;
    }

    /**
     * @return the sLocStatus
     */
    public String getsLocStatus() {
        return sLocStatus;
    }

    /**
     * @param sLocStatus the sLocStatus to set
     */
    public void setsLocStatus(String sLocStatus) {
        this.sLocStatus = sLocStatus;
    }

    /**
     * @return the sItemCdLst
     */
    public List<String> getsItemCdLst() {
        return sItemCdLst;
    }

    /**
     * @param sItemCdLst the sItemCdLst to set
     */
    public void setsItemCdLst(List<String> sItemCdLst) {
        this.sItemCdLst = sItemCdLst;
    }

    /**
     * @return the sLocCond
     */
    public String getsLocCond() {
        return sLocCond;
    }

    /**
     * @param sLocCond the sLocCond to set
     */
    public void setsLocCond(String sLocCond) {
        this.sLocCond = sLocCond;
    }
}
