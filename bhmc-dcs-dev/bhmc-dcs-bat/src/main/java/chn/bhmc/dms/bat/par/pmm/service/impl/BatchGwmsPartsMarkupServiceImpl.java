package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsMarkupService;
import chn.bhmc.dms.bat.par.pmm.service.dao.BatchGwmsPartsMarkupDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchGwmsPartsMarkupServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 10. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 10.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchGwmsPartsMarkupService")
public class BatchGwmsPartsMarkupServiceImpl extends HService implements BatchGwmsPartsMarkupService {

    /**
     * GWMS 부품마크업 DAO 선언
     */
    @Resource(name="batchGwmsPartsMarkupDAO")
    BatchGwmsPartsMarkupDAO batchGwmsPartsMarkupDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchGwmsPartsMarkupService#executeGwmsPartsMarkupProcedure()
     */
    @Override
    public void executeGwmsPartsMarkupProcedure() throws Exception {
        batchGwmsPartsMarkupDAO.executeGwmsPartsMarkupProcedure();
    }


}
