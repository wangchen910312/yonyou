package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 방치품관리 인터페이스 검색 VO
 *
 * @ClassName   : LeaveItemInterfaceSearchVO.java
 * @Description : LeaveItemInterfaceSearchVO Class
 * @author In Bo Shim
 * @since 2016. 8. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 27.     In Bo Shim     최초 생성
 * </pre>
 */
public class LeaveItemInterfaceSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5533086227118246040L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 구매딜러코드
     **/
    private String sBuyerDealerCd;

    /**
     * 판매딜러코드
     **/
    private String sSellerDealerCd;

    /**
     * 거래유형
     **/
    private String sSellType;

    /**
     * 거래시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFinishStartTime;

    /**
     * 거래종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sFinishEndTime;

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
     * @return the sBuyerDealerCd
     */
    public String getsBuyerDealerCd() {
        return sBuyerDealerCd;
    }

    /**
     * @param sBuyerDealerCd the sBuyerDealerCd to set
     */
    public void setsBuyerDealerCd(String sBuyerDealerCd) {
        this.sBuyerDealerCd = sBuyerDealerCd;
    }

    /**
     * @return the sSellerDealerCd
     */
    public String getsSellerDealerCd() {
        return sSellerDealerCd;
    }

    /**
     * @param sSellerDealerCd the sSellerDealerCd to set
     */
    public void setsSellerDealerCd(String sSellerDealerCd) {
        this.sSellerDealerCd = sSellerDealerCd;
    }

    /**
     * @return the sSellType
     */
    public String getsSellType() {
        return sSellType;
    }

    /**
     * @param sSellType the sSellType to set
     */
    public void setsSellType(String sSellType) {
        this.sSellType = sSellType;
    }

    /**
     * @return the sFinishStartTime
     */
    public Date getsFinishStartTime() {
        return sFinishStartTime;
    }

    /**
     * @param sFinishStartTime the sFinishStartTime to set
     */
    public void setsFinishStartTime(Date sFinishStartTime) {
        this.sFinishStartTime = sFinishStartTime;
    }

    /**
     * @return the sFinishEndTime
     */
    public Date getsFinishEndTime() {
        return sFinishEndTime;
    }

    /**
     * @param sFinishEndTime the sFinishEndTime to set
     */
    public void setsFinishEndTime(Date sFinishEndTime) {
        this.sFinishEndTime = sFinishEndTime;
    }

}
