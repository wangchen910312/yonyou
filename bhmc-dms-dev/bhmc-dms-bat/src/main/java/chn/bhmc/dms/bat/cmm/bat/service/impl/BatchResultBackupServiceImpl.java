package chn.bhmc.dms.bat.cmm.bat.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.bat.service.BatchResultBackupService;
import chn.bhmc.dms.bat.cmm.bat.service.dao.BatchResultBackupDAO;

/**
 * <pre>
 * 배치결과정보 이관 및 데이터 삭제 ServiceImpl
 * </pre>
 *
 * @ClassName   : BatchResultBackupServiceImpl.java
 * @Description : 배치결과정보 이관 및 데이터 삭제 ServiceImpl
 * @author Kang Seok Han
 * @since 2017. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 8.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("batchResultBackupService")
public class BatchResultBackupServiceImpl extends HService implements BatchResultBackupService {
    @Resource(name="batchResultBackupDAO")
    BatchResultBackupDAO batchResultBackupDAO;

    @Override
    public void insertBatchResultHistory(int day) throws Exception {
        batchResultBackupDAO.insertBatchResultHistory(day);
    }
}
