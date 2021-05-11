package chn.bhmc.dms.bat.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemPriceService;
import chn.bhmc.dms.bat.par.pmm.service.dao.BatchPartsItemPriceDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchPartsItemPriceServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author In Bo Shim
 * @since 2016. 12. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 1.     In Bo Shim     최초 생성
 * </pre>
 */
@Service("batchPartsItemPriceService")
public class BatchPartsItemPriceServiceImpl extends HService implements BatchPartsItemPriceService {

    /**
     * 부품가격 DAO 선언
     */
    @Resource(name="batchPartsItemPriceDAO")
    BatchPartsItemPriceDAO batchPartsItemPriceDAO;

    /*
     * @see chn.bhmc.dms.bat.par.pmm.service.BatchPartsItemPriceService#executeItemPriceProcedure(java.lang.String)
     */
    @Override
    public void executeItemPriceProcedure(String ifId) throws Exception {
        batchPartsItemPriceDAO.executeItemPriceProcedure("PTS407");

    }




}
