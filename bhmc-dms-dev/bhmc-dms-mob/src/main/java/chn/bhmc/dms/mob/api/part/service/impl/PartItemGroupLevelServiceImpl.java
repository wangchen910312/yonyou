package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartItemGroupLevelDAO;
import chn.bhmc.dms.mob.api.part.service.PartItemGroupLevelService;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupLevelVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;




/**
 * 품목그룹레벨 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 6. 16.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 6. 16.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartItemGroupLevelService")
public class PartItemGroupLevelServiceImpl extends HService implements PartItemGroupLevelService {

    @Resource(name="PartItemGroupLevelDAO")
    private PartItemGroupLevelDAO PartItemGroupLevelDAO;

//    /**
//     * 품목마스터 관리 서비스
//     */
//    @Resource(name="itemMasterService")
//    private ItemMasterService itemMasterService;
//
//    

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelsItemGroupByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupLevelVO> selectItemGroupLevelsItemGroupByCondition(ItemGroupSearchVO searchVO)
            throws Exception {
        return PartItemGroupLevelDAO.selectItemGroupLevelsItemGroupByCondition(searchVO);
    }


    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelsByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupLevelVO> selectItemGroupLevelsByCondition(ItemGroupSearchVO searchVO) throws Exception {
        return PartItemGroupLevelDAO.selectItemGroupLevelsByCondition(searchVO);
    }

}
