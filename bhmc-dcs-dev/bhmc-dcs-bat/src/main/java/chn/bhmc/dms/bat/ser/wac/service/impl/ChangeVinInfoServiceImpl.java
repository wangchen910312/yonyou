package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.ser.wac.service.ChangeVinInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ChangeVinInfoDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChangeVinInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 29.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service
public class ChangeVinInfoServiceImpl extends HService implements ChangeVinInfoService {

    @Resource(name="changeVinInfoDAO")
    ChangeVinInfoDAO changeVinInfoDAO;

    /*
     * @see chn.bhmc.dms.bat.ser.wac.service.ChangeVinInfoService#insertChangeVinNoInfo()
     */
    @Override
    public void insertChangeVinNoInfo() throws Exception {
        changeVinInfoDAO.insertChangeVinNoInfo();
    }
}