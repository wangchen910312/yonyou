package chn.bhmc.dms.sal.acc.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * @ClassName   : AccessoryConditionSearchVO
 * @Description : 경품판매현황 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 20.    Kim Jin Suk      최초 생성
 * </pre>
 */

public class AccessoryConditionSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -5269672320273685297L;

    private String sDlrCd;                      // 딜러코드
    private String sGoodsTp;                    // 경품업무유형
    private String sGoodsContractNo;            // 경품오더번호
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartGoodsContractDt;         // 오더일자 시작
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndGoodsContractDt;           // 오더일자 종료
    private String sContractCustNo;             // 고객
    private String sContractStatCd;             // 오더상태
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sStartExpcGiEndDt;             // 예정출고일자 시작
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sEndExpcGiEndDt;               // 예정출고일자 종료
    private String sSaleContractNo;             // 판매 계약번호

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
     * @return the sGoodsTp
     */
    public String getsGoodsTp() {
        return sGoodsTp;
    }
    /**
     * @param sGoodsTp the sGoodsTp to set
     */
    public void setsGoodsTp(String sGoodsTp) {
        this.sGoodsTp = sGoodsTp;
    }
    /**
     * @return the sGoodsContractNo
     */
    public String getsGoodsContractNo() {
        return sGoodsContractNo;
    }
    /**
     * @param sGoodsContractNo the sGoodsContractNo to set
     */
    public void setsGoodsContractNo(String sGoodsContractNo) {
        this.sGoodsContractNo = sGoodsContractNo;
    }
    /**
     * @return the sStartGoodsContractDt
     */
    public Date getsStartGoodsContractDt() {
        return sStartGoodsContractDt;
    }
    /**
     * @param sStartGoodsContractDt the sStartGoodsContractDt to set
     */
    public void setsStartGoodsContractDt(Date sStartGoodsContractDt) {
        this.sStartGoodsContractDt = sStartGoodsContractDt;
    }
    /**
     * @return the sEndGoodsContractDt
     */
    public Date getsEndGoodsContractDt() {
        return sEndGoodsContractDt;
    }
    /**
     * @param sEndGoodsContractDt the sEndGoodsContractDt to set
     */
    public void setsEndGoodsContractDt(Date sEndGoodsContractDt) {
        this.sEndGoodsContractDt = sEndGoodsContractDt;
    }
    /**
     * @return the sContractCustNo
     */
    public String getsContractCustNo() {
        return sContractCustNo;
    }
    /**
     * @param sContractCustNo the sContractCustNo to set
     */
    public void setsContractCustNo(String sContractCustNo) {
        this.sContractCustNo = sContractCustNo;
    }
    /**
     * @return the sContractStatCd
     */
    public String getsContractStatCd() {
        return sContractStatCd;
    }
    /**
     * @param sContractStatCd the sContractStatCd to set
     */
    public void setsContractStatCd(String sContractStatCd) {
        this.sContractStatCd = sContractStatCd;
    }
    /**
     * @return the sStartExpcGiEndDt
     */
    public Date getsStartExpcGiEndDt() {
        return sStartExpcGiEndDt;
    }
    /**
     * @param sStartExpcGiEndDt the sStartExpcGiEndDt to set
     */
    public void setsStartExpcGiEndDt(Date sStartExpcGiEndDt) {
        this.sStartExpcGiEndDt = sStartExpcGiEndDt;
    }
    /**
     * @return the sEndExpcGiEndDt
     */
    public Date getsEndExpcGiEndDt() {
        return sEndExpcGiEndDt;
    }
    /**
     * @param sEndExpcGiEndDt the sEndExpcGiEndDt to set
     */
    public void setsEndExpcGiEndDt(Date sEndExpcGiEndDt) {
        this.sEndExpcGiEndDt = sEndExpcGiEndDt;
    }
    /**
     * @return the sSaleContractNo
     */
    public String getsSaleContractNo() {
        return sSaleContractNo;
    }
    /**
     * @param sSaleContractNo the sSaleContractNo to set
     */
    public void setsSaleContractNo(String sSaleContractNo) {
        this.sSaleContractNo = sSaleContractNo;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
