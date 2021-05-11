package chn.bhmc.dms.sal.prm.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

public class PromotionUploadSaveDTO extends BaseSaveVO<PromotionVO> {

	/**
	 *
	 */
	private static final long serialVersionUID = -1210745396214803853L;

	public List<PromotionVO> promotionCustList = new ArrayList<PromotionVO>();

	private String promotionCd;
	private String dlrCd;



    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the promotionCd
     */
    public String getPromotionCd() {
        return promotionCd;
    }

    /**
     * @param promotionCd the promotionCd to set
     */
    public void setPromotionCd(String promotionCd) {
        this.promotionCd = promotionCd;
    }

    /**
     * @return the promotionCustList
     */
    public List<PromotionVO> getPromotionCustList() {
        return promotionCustList;
    }

    /**
     * @param promotionCustList the promotionCustList to set
     */
    public void setPromotionCustList(List<PromotionVO> promotionCustList) {
        this.promotionCustList = promotionCustList;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }



}
