package chn.bhmc.dms.sal.dlr.vo;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistDealerSearchVO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim yewon
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.  5. 25.    Kim yewon              최초 생성
 * </pre>
 */

public class DistDealerSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;
    private String sUsrId;                  //관리딜러코드



    /**
     * @return the sUsrId
     */
    public String getsUsrId() {
        return sUsrId;
    }
    /**
     * @param sUsrId the sUsrId to set
     */
    public void setsUsrId(String sUsrId) {
        this.sUsrId = sUsrId;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }




}
