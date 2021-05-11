package chn.bhmc.dms.crm.dmm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BlueMembershipBhmcCalcSearchVO.java
 * @Description : 블루멤버십 정산 검색 VO
 * @author Kim Hyun Ho
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.     Kim Hyun Ho     최초 생성
 * </pre>
 */

public class BlueMembershipBhmcCalcSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2668796708125559022L;


    /**
    * 딜러코드
    **/
    private  String            sDlrCd;

    private  int               sCalcSeq;

    //조회조건 추가
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sStartDt;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private  Date              sEndDt;

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
     * @return the sCalcSeq
     */
    public int getsCalcSeq() {
        return sCalcSeq;
    }

    /**
     * @param sCalcSeq the sCalcSeq to set
     */
    public void setsCalcSeq(int sCalcSeq) {
        this.sCalcSeq = sCalcSeq;
    }

    /**
     * @return the sStartDt
     */
    public Date getsStartDt() {
        return sStartDt;
    }

    /**
     * @param sStartDt the sStartDt to set
     */
    public void setsStartDt(Date sStartDt) {
        this.sStartDt = sStartDt;
    }

    /**
     * @return the sEndDt
     */
    public Date getsEndDt() {
        return sEndDt;
    }

    /**
     * @param sEndDt the sEndDt to set
     */
    public void setsEndDt(Date sEndDt) {
        this.sEndDt = sEndDt;
    }

}
