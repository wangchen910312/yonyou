package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SyncCommandBundleVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 3.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 3.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SyncCommandBundleVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6419489368290666162L;


    private String symbolicName;

    private String version;

    private String bundleGrpId;

    private String bundleAtftId;

    /**
     * @param symbolicName the symbolicName to set
     */
    public void setSymbolicName(String symbolicName) {
        this.symbolicName = symbolicName;
    }

    /**
     * @return the symbolicName
     */
    public String getSymbolicName() {
        return symbolicName;
    }

    /**
     * @param version the version to set
     */
    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * @return the version
     */
    public String getVersion() {
        return version;
    }

    /**
     * @param bundleGrpId the bundleGrpId to set
     */
    public void setBundleGrpId(String bundleGrpId) {
        this.bundleGrpId = bundleGrpId;
    }

    /**
     * @return the bundleGrpId
     */
    public String getBundleGrpId() {
        return bundleGrpId;
    }

    /**
     * @param bundleAtftId the bundleAtftId to set
     */
    public void setBundleAtftId(String bundleAtftId) {
        this.bundleAtftId = bundleAtftId;
    }

    /**
     * @return the bundleAtftId
     */
    public String getBundleAtftId() {
        return bundleAtftId;
    }

}
