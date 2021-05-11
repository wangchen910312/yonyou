package chn.bhmc.dms.par.ism.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * SA VO
 *
 * @ClassName   : IssueReqTechManVO.java
 * @Description : IssueReqTechManVO Class
 * @author In Bo Shim
 * @since 2016. 10. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 19.     In Bo Shim     최초 생성
 * </pre>
 */

public class IssueReqTechManVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3641487887580318310L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * SA 아이디
     **/
    private String tecId;

    /**
     * SA명
     **/
    private String tecNm;

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
     * @return the tecId
     */
    public String getTecId() {
        return tecId;
    }

    /**
     * @param tecId the tecId to set
     */
    public void setTecId(String tecId) {
        this.tecId = tecId;
    }

    /**
     * @return the tecNm
     */
    public String getTecNm() {
        return tecNm;
    }

    /**
     * @param tecNm the tecNm to set
     */
    public void setTecNm(String tecNm) {
        this.tecNm = tecNm;
    }
}
