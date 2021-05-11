package chn.bhmc.dms.cmm.sci.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedDetailVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 18.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class UserDefinedDetailVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8609759951617079178L;

    private String  usrDefReqDocId;
    private String  atcNo;
    @NotBlank
    private String  atcNm;
    private String  atcTp;
    private String  atcListCont;
    @NotBlank
    private String  etcInsUseYn;
    private int     sortOrder = 0;
    /**
     * @return the usrDefReqDocId
     */
    public String getUsrDefReqDocId() {
        return usrDefReqDocId;
    }
    /**
     * @param usrDefReqDocId the usrDefReqDocId to set
     */
    public void setUsrDefReqDocId(String usrDefReqDocId) {
        this.usrDefReqDocId = usrDefReqDocId;
    }
    /**
     * @return the atcNo
     */
    public String getAtcNo() {
        return atcNo;
    }
    /**
     * @param atcNo the atcNo to set
     */
    public void setAtcNo(String atcNo) {
        this.atcNo = atcNo;
    }
    /**
     * @return the atcNm
     */
    public String getAtcNm() {
        return atcNm;
    }
    /**
     * @param atcNm the atcNm to set
     */
    public void setAtcNm(String atcNm) {
        this.atcNm = atcNm;
    }
    /**
     * @return the atcTp
     */
    public String getAtcTp() {
        return atcTp;
    }
    /**
     * @param atcTp the atcTp to set
     */
    public void setAtcTp(String atcTp) {
        this.atcTp = atcTp;
    }
    /**
     * @return the atcListCont
     */
    public String getAtcListCont() {
        return atcListCont;
    }
    /**
     * @param atcListCont the atcListCont to set
     */
    public void setAtcListCont(String atcListCont) {
        this.atcListCont = atcListCont;
    }
    /**
     * @return the etcInsUseYn
     */
    public String getEtcInsUseYn() {
        return etcInsUseYn;
    }
    /**
     * @param etcInsUseYn the etcInsUseYn to set
     */
    public void setEtcInsUseYn(String etcInsUseYn) {
        this.etcInsUseYn = etcInsUseYn;
    }
    /**
     * @return the sortOrder
     */
    public int getSortOrder() {
        return sortOrder;
    }
    /**
     * @param sortOrder the sortOrder to set
     */
    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }
}