package chn.bhmc.dms.mis.tot.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * [딜러사] 종합 경영 현황
 * </pre>
 *
 * @ClassName   : TotalMisStatusVO.java
 * @Description : [딜러사] 종합 경영 현황
 * @author chibeom.song
 * @since 2016. 8. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 15.   chibeom.song     최초 생성
 * </pre>
 */

public class TotalMisStatusVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    // [딜러사] 종합 경영 현황 - 종합현황

    // [딜러사] 종합 경영 현황 - 판매현황
    private String sMisSaleDate;


    // [딜러사] 종합 경영 현황 - 고객현황
    private String sMisCustDate;


    /**
     * @return the sMisSaleDate
     */
    public String getsMisSaleDate() {
        return sMisSaleDate;
    }


    /**
     * @param sMisSaleDate the sMisSaleDate to set
     */
    public void setsMisSaleDate(String sMisSaleDate) {
        this.sMisSaleDate = sMisSaleDate;
    }


    /**
     * @return the sMisCustDate
     */
    public String getsMisCustDate() {
        return sMisCustDate;
    }


    /**
     * @param sMisCustDate the sMisCustDate to set
     */
    public void setsMisCustDate(String sMisCustDate) {
        this.sMisCustDate = sMisCustDate;
    }



}
