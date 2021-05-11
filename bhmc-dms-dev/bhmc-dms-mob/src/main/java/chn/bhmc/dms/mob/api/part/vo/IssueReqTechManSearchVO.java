package chn.bhmc.dms.mob.api.part.vo;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * SA 검색 VO
 *
 * @ClassName   : IssueReqTechManSearchVO.java
 * @Description : IssueReqTechManSearchVO Class
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

public class IssueReqTechManSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -4638106573986145307L;

    /**
     * 딜러코드
     **/
    @NotEmpty
    private String sDlrCd;

    /**
     * SA 아이디
     **/
    private String sTecId;

    /**
     * SA명
     **/
    private String sTecNm;

    /**
     * SA명 MFN
     **/
    private String sTecMfnNm;

    /**
     * SA명 SFN
     **/
    private String sTecSfnNm1;

    /**
     * SA명 SFN1
     **/
    private String sTecSfnNm2;

    /**
     * SA명 SFN2
     **/
    private String sTecSfnNm3;

    /**
     * 작업유형
     **/
    private String sWrkTp;

    /**
     * 작업그룹유형
     **/
    private String sWrkGroupTp;

    /**
     * ROLL ID 리스트
     **/
    private List<String> sRoleIdList;

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
     * @return the sTecId
     */
    public String getsTecId() {
        return sTecId;
    }

    /**
     * @param sTecId the sTecId to set
     */
    public void setsTecId(String sTecId) {
        this.sTecId = sTecId;
    }

    /**
     * @return the sTecNm
     */
    public String getsTecNm() {
        return sTecNm;
    }

    /**
     * @param sTecNm the sTecNm to set
     */
    public void setsTecNm(String sTecNm) {
        this.sTecNm = sTecNm;
    }

    /**
     * @return the sTecMfnNm
     */
    public String getsTecMfnNm() {
        return sTecMfnNm;
    }

    /**
     * @param sTecMfnNm the sTecMfnNm to set
     */
    public void setsTecMfnNm(String sTecMfnNm) {
        this.sTecMfnNm = sTecMfnNm;
    }

    /**
     * @return the sTecSfnNm1
     */
    public String getsTecSfnNm1() {
        return sTecSfnNm1;
    }

    /**
     * @param sTecSfnNm1 the sTecSfnNm1 to set
     */
    public void setsTecSfnNm1(String sTecSfnNm1) {
        this.sTecSfnNm1 = sTecSfnNm1;
    }

    /**
     * @return the sTecSfnNm2
     */
    public String getsTecSfnNm2() {
        return sTecSfnNm2;
    }

    /**
     * @param sTecSfnNm2 the sTecSfnNm2 to set
     */
    public void setsTecSfnNm2(String sTecSfnNm2) {
        this.sTecSfnNm2 = sTecSfnNm2;
    }

    /**
     * @return the sTecSfnNm3
     */
    public String getsTecSfnNm3() {
        return sTecSfnNm3;
    }

    /**
     * @param sTecSfnNm3 the sTecSfnNm3 to set
     */
    public void setsTecSfnNm3(String sTecSfnNm3) {
        this.sTecSfnNm3 = sTecSfnNm3;
    }

    /**
     * @return the sWrkTp
     */
    public String getsWrkTp() {
        return sWrkTp;
    }

    /**
     * @param sWrkTp the sWrkTp to set
     */
    public void setsWrkTp(String sWrkTp) {
        this.sWrkTp = sWrkTp;
    }

    /**
     * @return the sWrkGroupTp
     */
    public String getsWrkGroupTp() {
        return sWrkGroupTp;
    }

    /**
     * @param sWrkGroupTp the sWrkGroupTp to set
     */
    public void setsWrkGroupTp(String sWrkGroupTp) {
        this.sWrkGroupTp = sWrkGroupTp;
    }

    /**
     * @return the sRoleIdList
     */
    public List<String> getsRoleIdList() {
        return sRoleIdList;
    }

    /**
     * @param sRoleIdList the sRoleIdList to set
     */
    public void setsRoleIdList(List<String> sRoleIdList) {
        this.sRoleIdList = sRoleIdList;
    }
}
