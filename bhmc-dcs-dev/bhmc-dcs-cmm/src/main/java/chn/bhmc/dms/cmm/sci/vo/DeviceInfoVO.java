package chn.bhmc.dms.cmm.sci.vo;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeviceInfoVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 27.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class DeviceInfoVO{


    private static final long serialVersionUID = -1216456140753286246L;

    private String dlrCd;
    private String userId;
    private String userNm;
    private String hpNo;

    private String appVersion;
    private String deviceId;
    private String os;
    private String deviceModel;
    private String osVersion;
    private String updateDate;

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
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }
    /**
     * @return the userNm
     */
    public String getUserNm() {
        return userNm;
    }
    /**
     * @param userNm the userNm to set
     */
    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }
    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    /**
     * @return the appVersion
     */
    public String getAppVersion() {
        return appVersion;
    }
    /**
     * @param appVersion the appVersion to set
     */
    public void setAppVersion(String appVersion) {
        this.appVersion = appVersion;
    }
    /**
     * @return the deviceId
     */
    public String getDeviceId() {
        return deviceId;
    }
    /**
     * @param deviceId the deviceId to set
     */
    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
    }
    /**
     * @return the os
     */
    public String getOs() {
        return os;
    }
    /**
     * @param os the os to set
     */
    public void setOs(String os) {
        this.os = os;
    }
    /**
     * @return the deviceModel
     */
    public String getDeviceModel() {
        return deviceModel;
    }
    /**
     * @param deviceModel the deviceModel to set
     */
    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }
    /**
     * @return the osVersion
     */
    public String getOsVersion() {
        return osVersion;
    }
    /**
     * @param osVersion the osVersion to set
     */
    public void setOsVersion(String osVersion) {
        this.osVersion = osVersion;
    }
    /**
     * @return the updateDate
     */
    public String getUpdateDate() {
        return updateDate;
    }
    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }
    /**
     * @param hpNo the hpNo to set
     */
    public void setHpNo(String hpNo) {
        this.hpNo = hpNo;
    }
    /**
     * @return the hpNo
     */
    public String getHpNo() {
        return hpNo;
    }
}
