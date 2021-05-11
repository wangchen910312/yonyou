package chn.bhmc.dms.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeviceInfoDAO.java
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
@Mapper("deviceInfoDAO")
public interface DeviceInfoDAO {
    public int selectDeviceInfoCnt(DeviceInfoVO deviceInfoVO);
    public int insertDeviceInfo(DeviceInfoVO deviceInfoVO);
    public int updateDeviceInfo(DeviceInfoVO deviceInfoVO);
    public DeviceInfoVO selectDeviceInfo(DeviceInfoVO deviceInfoVO);
}
