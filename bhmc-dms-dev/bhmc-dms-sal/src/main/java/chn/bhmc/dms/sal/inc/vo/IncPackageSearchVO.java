package chn.bhmc.dms.sal.inc.vo;


import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * @ClassName   : IncPackageSearchVO
 * @Description : 보험패키지 조회 VO
 * @author Kim JIN SUK
 * @since 2017. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 11.    Kim JIN SUK           최초 생성
 * </pre>
 */

public class IncPackageSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 5596016583432562392L;
    
    private String sDlrCd;          //딜러코드
    private String sPackageNo;      //패키지번호
    private String sPackageNm;      //패키지명
    private String sIncTp;          //보험종류
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
     * @return the sPackageNo
     */
    public String getsPackageNo() {
        return sPackageNo;
    }
    /**
     * @param sPackageNo the sPackageNo to set
     */
    public void setsPackageNo(String sPackageNo) {
        this.sPackageNo = sPackageNo;
    }
    /**
     * @return the sPackageNm
     */
    public String getsPackageNm() {
        return sPackageNm;
    }
    /**
     * @param sPackageNm the sPackageNm to set
     */
    public void setsPackageNm(String sPackageNm) {
        this.sPackageNm = sPackageNm;
    }
    /**
     * @return the sIncTp
     */
    public String getsIncTp() {
        return sIncTp;
    }
    /**
     * @param sIncTp the sIncTp to set
     */
    public void setsIncTp(String sIncTp) {
        this.sIncTp = sIncTp;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}