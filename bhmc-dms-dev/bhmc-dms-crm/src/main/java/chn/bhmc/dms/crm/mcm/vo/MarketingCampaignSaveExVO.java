package chn.bhmc.dms.crm.mcm.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PwaSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 2. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 26.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class MarketingCampaignSaveExVO extends BaseSaveVO<Object>{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1614165271874504325L;

    private MarketingCampaignVO marketingCampaignVO;

    private BaseSaveVO<MarketingCampaignVO> marketingCampaignSaveVO;

    /**
     * 대상자 목록
     */

    private List<MarketingCampaignVO> insertTargetVO;

    /**
     * @return the marketingCampaignVO
     */
    public MarketingCampaignVO getMarketingCampaignVO() {
        return marketingCampaignVO;
    }

    /**
     * @param marketingCampaignVO the marketingCampaignVO to set
     */
    public void setMarketingCampaignVO(MarketingCampaignVO marketingCampaignVO) {
        this.marketingCampaignVO = marketingCampaignVO;
    }

    /**
     * @return the marketingCampaignSaveVO
     */
    public BaseSaveVO<MarketingCampaignVO> getMarketingCampaignSaveVO() {
        return marketingCampaignSaveVO;
    }

    /**
     * @param marketingCampaignSaveVO the marketingCampaignSaveVO to set
     */
    public void setMarketingCampaignSaveVO(BaseSaveVO<MarketingCampaignVO> marketingCampaignSaveVO) {
        this.marketingCampaignSaveVO = marketingCampaignSaveVO;
    }

    /**
     * @return the insertTargetVO
     */
    public List<MarketingCampaignVO> getInsertTargetVO() {
        return insertTargetVO;
    }

    /**
     * @param insertTargetVO the insertTargetVO to set
     */
    public void setInsertTargetVO(List<MarketingCampaignVO> insertTargetVO) {
        this.insertTargetVO = insertTargetVO;
    }





    /**
     * 딜러코드
     **/
    private  String            tDlrCd;

    /**
     * 마케팅코드
     **/
    private  String            tMakCd;

    /**
     * 추출차수
     **/
    private  int               tExtrDgreCnt;

    /**
     * 등록자ID
     **/
     //@NotEmpty

     private  String            regUsrId;

    /**
     * @return the tDlrCd
     */
    public String gettDlrCd() {
        return tDlrCd;
    }

    /**
     * @param tDlrCd the tDlrCd to set
     */
    public void settDlrCd(String tDlrCd) {
        this.tDlrCd = tDlrCd;
    }

    /**
     * @return the tMakCd
     */
    public String gettMakCd() {
        return tMakCd;
    }

    /**
     * @param tMakCd the tMakCd to set
     */
    public void settMakCd(String tMakCd) {
        this.tMakCd = tMakCd;
    }

    /**
     * @return the tExtrDgreCnt
     */
    public int gettExtrDgreCnt() {
        return tExtrDgreCnt;
    }

    /**
     * @param tExtrDgreCnt the tExtrDgreCnt to set
     */
    public void settExtrDgreCnt(int tExtrDgreCnt) {
        this.tExtrDgreCnt = tExtrDgreCnt;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }
}