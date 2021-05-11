package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemClassService;
import chn.bhmc.dms.bat.par.pmm.service.dao.BatchPartsItemClassDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemClassServiceImpl.java
 * @Description : 배치 부품가격 프로시져 호출 구현체.
 * @author In Bo Shim
 * @since 2017. 06. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 06. 17.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchPartsItemClassService")
public class BatchPartsItemClassServiceImpl extends HService implements BatchPartsItemClassService {

    /**
     * 부품등급 DAO 선언
     */
    @Resource(name="batchPartsItemClassDAO")
    BatchPartsItemClassDAO batchPartsItemClassDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemClassService#executeItemClassProcedure()
     */
    @Override
    public void executeItemClassProcedure(String ifId) throws Exception {
        batchPartsItemClassDAO.executeItemClassProcedure(ifId);
    }


}
