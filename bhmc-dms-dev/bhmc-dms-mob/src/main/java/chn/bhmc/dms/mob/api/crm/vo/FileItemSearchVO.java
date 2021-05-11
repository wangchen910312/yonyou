package chn.bhmc.dms.mob.api.crm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileItemSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class FileItemSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7707424931380007887L;

    private String sFileDocNo;
    private String sFileNm;
    /**
     * @return the sFileDocNo
     */
    public String getsFileDocNo() {
        return sFileDocNo;
    }
    /**
     * @param sFileDocNo the sFileDocNo to set
     */
    public void setsFileDocNo(String sFileDocNo) {
        this.sFileDocNo = sFileDocNo;
    }
    /**
     * @return the sFileNm
     */
    public String getsFileNm() {
        return sFileNm;
    }
    /**
     * @param sFileNm the sFileNm to set
     */
    public void setsFileNm(String sFileNm) {
        this.sFileNm = sFileNm;
    }



}
