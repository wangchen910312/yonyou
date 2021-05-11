package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartItemGroupDAO;
import chn.bhmc.dms.mob.api.part.service.PartItemGroupService;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ItemGroupVO;




/**
 * 품목그룹 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 1. 5.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 6.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("PartItemGroupService")
public class PartItemGroupServiceImpl extends HService implements PartItemGroupService {

    @Resource(name="PartItemGroupDAO")
    private PartItemGroupDAO PartItemGroupDAO;


    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#selectItemGroupCodesByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupVO> selectItemGroupCodesByCondition(ItemGroupSearchVO searchVO) throws Exception {
        return PartItemGroupDAO.selectItemGroupCodesByCondition(searchVO);
    }


}
