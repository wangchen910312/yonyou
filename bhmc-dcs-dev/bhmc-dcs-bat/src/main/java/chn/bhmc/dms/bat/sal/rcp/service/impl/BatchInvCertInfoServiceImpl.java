package chn.bhmc.dms.bat.sal.rcp.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.cmm.service.BatchSalesService;
import chn.bhmc.dms.bat.sal.rcp.service.BatchInvCertInfoService;
import chn.bhmc.dms.bat.sal.rcp.service.dao.BatchInvCertInfoDAO;

/**
 *
 * @ClassName   : BatchSecondDistrictServiceImpl
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Jin Suk
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Kim Jin Suk     최초 생성
 * </pre>
 */
@Service("batchInvCertInfoService")
public class BatchInvCertInfoServiceImpl extends HService implements BatchInvCertInfoService {

    @Resource(name="batchInvCertInfoDAO")
    BatchInvCertInfoDAO batchInvCertInfoDAO;

    @Autowired
    BatchSalesService batchSalesService;

    @Override
    public void InvCertInfoRun(String serviceId) throws Exception {
        batchInvCertInfoDAO.InvCertInfoRun();

        batchSalesService.executeEaiService(serviceId, "INV");

    }

}
