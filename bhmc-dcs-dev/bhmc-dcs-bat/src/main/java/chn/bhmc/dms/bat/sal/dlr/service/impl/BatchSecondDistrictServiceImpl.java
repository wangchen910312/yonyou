package chn.bhmc.dms.bat.sal.dlr.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.sal.dlr.service.BatchSecondDistrictService;
import chn.bhmc.dms.bat.sal.dlr.service.dao.BatchSecondDistrictDAO;

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
@Service("batchSecondDistrictService")
public class BatchSecondDistrictServiceImpl extends HService implements BatchSecondDistrictService {


    @Resource(name="batchSecondDistrictDAO")
    BatchSecondDistrictDAO batchSecondDistrictDAO;


    @Override
    public void secondDistrictRun() throws Exception {
        batchSecondDistrictDAO.secondDistrictRun();
    }

}
