package chn.bhmc.dms.par.cpm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * 선수금 송신 VO
 *
 * @ClassName   : AdvanceReceivedInfoSendVO.java
 * @Description : AdvanceReceivedInfoSendVO Class
 * @author In Bo Shim
 * @since 2016. 7. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 1.     In Bo Shim     최초 생성
 * </pre>
 */

public class AdvanceReceivedInfoSendVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6886334004863690824L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 법인코드
     **/
    private String  corpCd;

    /**
     * 회사코드
     **/
    private String  cmpCd;

    /**
     * 딜러명
     **/
    private String  dlrNm;

    /**
     * 딜러축약명
     **/
    private String  dlrShtNm;

    /**
     * 메인딜러여부
     **/
    private String  mainDlrYn;

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
     * @return the corpCd
     */
    public String getCorpCd() {
        return corpCd;
    }

    /**
     * @param corpCd the corpCd to set
     */
    public void setCorpCd(String corpCd) {
        this.corpCd = corpCd;
    }

    /**
     * @return the cmpCd
     */
    public String getCmpCd() {
        return cmpCd;
    }

    /**
     * @param cmpCd the cmpCd to set
     */
    public void setCmpCd(String cmpCd) {
        this.cmpCd = cmpCd;
    }

    /**
     * @return the dlrNm
     */
    public String getDlrNm() {
        return dlrNm;
    }

    /**
     * @param dlrNm the dlrNm to set
     */
    public void setDlrNm(String dlrNm) {
        this.dlrNm = dlrNm;
    }

    /**
     * @return the dlrShtNm
     */
    public String getDlrShtNm() {
        return dlrShtNm;
    }

    /**
     * @param dlrShtNm the dlrShtNm to set
     */
    public void setDlrShtNm(String dlrShtNm) {
        this.dlrShtNm = dlrShtNm;
    }

    /**
     * @return the mainDlrYn
     */
    public String getMainDlrYn() {
        return mainDlrYn;
    }

    /**
     * @param mainDlrYn the mainDlrYn to set
     */
    public void setMainDlrYn(String mainDlrYn) {
        this.mainDlrYn = mainDlrYn;
    }


}
