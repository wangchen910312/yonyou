package chn.bhmc.dms.sal.inc.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncPackageSaveVO
 * @Description : 보험패키지 저장VO
 * @author Kang Seok Han
 * @since 2016. 1. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 11.    Kim JIN SUK           최초 생성
 * </pre>
 */

public class IncPackageSaveVO extends BaseSaveVO<IncPackageVO>  {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = -1567351867684374021L;

    private String packageNo;
    private String dlrCd;
    /**
     * @return the packageNo
     */
    public String getPackageNo() {
        return packageNo;
    }
    /**
     * @param packageNo the packageNo to set
     */
    public void setPackageNo(String packageNo) {
        this.packageNo = packageNo;
    }
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
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    
}