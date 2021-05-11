package chn.bhmc.dms.par.pmm.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.ItemClassService;
import chn.bhmc.dms.par.pmm.service.dao.ItemClassDAO;
import chn.bhmc.dms.par.pmm.vo.ItemClassSearchVO;


/**
 * <pre>
 * 부품등급 관리 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ItemClassServiceImpl
 * @author In Bo Shim
 * @since 2016. 12. 01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 01.     In Bo Shim     최초 생성
 * </pre>
 */

@Service("itemClassService")
public class ItemClassServiceImpl extends HService implements ItemClassService  {

    /**
     * 부품등급 관리 DAO
     */
    @Resource(name="itemClassDAO")
    ItemClassDAO itemClassDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemClassService#updateItemClassProcedure(chn.bhmc.dms.par.pmm.vo.ItemClassSearchVO)
     */
    @Override
    public void updateItemClassProcedure(ItemClassSearchVO seachVO) throws Exception {
        itemClassDAO.updateItemClassProcedure(seachVO);
    }
}
