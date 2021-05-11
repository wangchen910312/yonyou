package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterDAO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;

/**
 * 품목마스터 관리 서비스 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Service("itemMasterService")
public class ItemMasterServiceImpl extends HService implements ItemMasterService {

    /**
     * 품목마스터 관리 DAO
     */
	@Resource(name="itemMasterDAO")
	ItemMasterDAO itemMasterDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public ItemMasterVO selectItemMasterByKey(ItemMasterSearchVO itemMasterSearchVO) throws Exception {
        return itemMasterDAO.selectItemMasterByKey(itemMasterSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<ItemMasterVO> selectItemMastersByCondition(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemMastersByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectItemMastersByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {
        return itemMasterDAO.selectItemMastersByConditionCnt(searchVO);
    }
}
