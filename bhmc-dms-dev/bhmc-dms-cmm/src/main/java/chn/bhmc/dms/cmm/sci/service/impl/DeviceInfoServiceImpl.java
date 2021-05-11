package chn.bhmc.dms.cmm.sci.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.DeviceInfoService;
import chn.bhmc.dms.cmm.sci.service.dao.DeviceInfoDAO;
import chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DeviceInfoServiceImpl.java
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
@Service("deviceInfoService")
public class DeviceInfoServiceImpl implements DeviceInfoService {

    @Resource(name="deviceInfoDAO")
    DeviceInfoDAO deviceInfoDAO;
    /*
     * @see chn.bhmc.dms.cmm.sci.service.DeviceInfoService#insertDeviceInfo(chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO)
     */
    @Override
    public int insertDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception {
        // TODO Auto-generated method stub
        return deviceInfoDAO.insertDeviceInfo(deviceInfoVO);
    }
    /*
     * @see chn.bhmc.dms.cmm.sci.service.DeviceInfoService#updateDeviceInfo(chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO)
     */
    @Override
    public int updateDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception {
        // TODO Auto-generated method stub
        return deviceInfoDAO.updateDeviceInfo(deviceInfoVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.DeviceInfoService#selectDeviceInfo(java.lang.String)
     */
    @Override
    public int selectDeviceInfoCnt(DeviceInfoVO deviceInfoVO) throws Exception {
        // TODO Auto-generated method stub
        return deviceInfoDAO.selectDeviceInfoCnt(deviceInfoVO);
    }
    /*
     * @see chn.bhmc.dms.cmm.sci.service.DeviceInfoService#selectDeviceInfo(java.lang.String)
     */
    /*
     * @see chn.bhmc.dms.cmm.sci.service.DeviceInfoService#selectDeviceInfo(chn.bhmc.dms.cmm.sci.vo.DeviceInfoVO)
     */
    @Override
    public DeviceInfoVO selectDeviceInfo(DeviceInfoVO deviceInfoVO) throws Exception {
        // TODO Auto-generated method stub
        return deviceInfoDAO.selectDeviceInfo(deviceInfoVO);
    }


}
