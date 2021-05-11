package chn.bhmc.dms.bat.sal.orc.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.orc.service.BatchOrcMngService;
import chn.bhmc.dms.bat.sal.orc.service.dao.BatchOrcMngDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSockDailyServiceImpl
 * @Description : 미배정오더배치
 * @author Lee Seungmin
 * @since 2017. 2. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 25.     Lee Seungmin           최초 생성
 * </pre>
 */

@Service("batchOrcMngService")
public class BatchOrcMngServiceImpl extends HService implements BatchOrcMngService {

    @Resource(name="batchOrcMngDAO")
    BatchOrcMngDAO batchOrcMngDAO;

    @Override
    public void callOrcUpdateProcess() throws Exception{

        batchOrcMngDAO.updateOrcMng();

    }
}
