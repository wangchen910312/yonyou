package chn.bhmc.dms.bat.crm.crq.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 마케팅 캠패인 조회 SearchVO
 *
 * @ClassName   : VocMgmtSearchVO.java
 * @Description : VocMgmtSearchVO Class
 * @author hyoung jun an
 * @since 2016.03.04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.04     hyoung jun an    최초 생성
 * </pre>
 */

public class BatVocMgmtSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6891084794312677186L;

    private String sVocStatCd;      // VOC 상태
    private String sVocSubCd;       // VOC 유형
    /**
     * @return the sVocStatCd
     */
    public String getsVocStatCd() {
        return sVocStatCd;
    }
    /**
     * @param sVocStatCd the sVocStatCd to set
     */
    public void setsVocStatCd(String sVocStatCd) {
        this.sVocStatCd = sVocStatCd;
    }
    /**
     * @return the sVocSubCd
     */
    public String getsVocSubCd() {
        return sVocSubCd;
    }
    /**
     * @param sVocSubCd the sVocSubCd to set
     */
    public void setsVocSubCd(String sVocSubCd) {
        this.sVocSubCd = sVocSubCd;
    }




}