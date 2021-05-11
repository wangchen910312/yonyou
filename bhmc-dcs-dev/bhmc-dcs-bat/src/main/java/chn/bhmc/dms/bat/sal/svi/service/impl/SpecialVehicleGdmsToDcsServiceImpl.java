package chn.bhmc.dms.bat.sal.svi.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.svi.service.dao.PdiChkManageDAO;

import chn.bhmc.dms.bat.sal.svi.service.SpecialVehicleGdmsToDcsService;
import chn.bhmc.dms.bat.sal.svi.service.dao.SpecialVehicleGdmsToDcsDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecialVehicleGdmsToDcsServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 28.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Service("specialVehicleGdmsToDcsService")
public class SpecialVehicleGdmsToDcsServiceImpl extends HService implements SpecialVehicleGdmsToDcsService{

    @Resource(name="specialVehicleGdmsToDcsDAO")
    SpecialVehicleGdmsToDcsDAO specialVehicleGdmsToDcsDAO;

    /*
     * @see chn.bhmc.dms.bat.sal.svi.service.SpecialVehicleGdmsToDcsService#migSaSpecialVehicle()
     */
    @Override
    public void migSalSpecialVehicle() throws Exception {

        specialVehicleGdmsToDcsDAO.migSalSpecialVehicle();

    }




}
