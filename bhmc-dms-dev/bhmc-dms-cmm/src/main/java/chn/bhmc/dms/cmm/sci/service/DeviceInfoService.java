package chn.bhmc.dms.cmm.sci.service;
import chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeviceInfoService.java
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

public interface DeviceInfoService {

    public int insertDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception;
    public int updateDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception;
    public int selectDeviceInfoCnt(DeviceInfoVO deviceInfoVO) throws Exception;
    public DeviceInfoVO selectDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception;
}
