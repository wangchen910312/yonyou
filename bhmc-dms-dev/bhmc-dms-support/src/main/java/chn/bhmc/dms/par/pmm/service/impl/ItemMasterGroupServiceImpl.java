package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemMasterGroupService;
import chn.bhmc.dms.par.pmm.service.dao.ItemMasterGroupDAO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupLevelVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSaveVO;



/**
 * 부품정보관리 부품유형 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 8. 05.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 8. 05.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("itemMasterGroupService")
public class ItemMasterGroupServiceImpl extends HService implements ItemMasterGroupService {

    @Resource(name="itemMasterGroupDAO")
    private ItemMasterGroupDAO itemMasterGroupDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#insertItemMasterGroup(chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO)
     */
    @Override
    public int insertItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception {
        itemMasterGroupVO.setRegUsrId(LoginUtil.getDlrCd());
        itemMasterGroupDAO.insertItemMasterGroup(itemMasterGroupVO);
        return 0;
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#updateItemMasterGroup(chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO)
     */
    @Override
    public int updateItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception {
        itemMasterGroupVO.setUpdtUsrId(LoginUtil.getDlrCd());
        return itemMasterGroupDAO.updateItemMasterGroup(itemMasterGroupVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#deleteItemMasterGroup(chn.bhmc.dms.par.pmm.vo.ItemMasterGroupVO)
     */
    @Override
    public int deleteItemMasterGroup(ItemMasterGroupVO itemMasterGroupVO) throws Exception {
        return itemMasterGroupDAO.deleteItemMasterGroup(itemMasterGroupVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#selectItemMasterGroupByKey(java.lang.String, java.lang.String)
     */
    @Override
    public ItemMasterGroupVO selectItemMasterGroupByKey(String dlrCd, String itemCd) throws Exception {
        return itemMasterGroupDAO.selectItemMasterGroupByKey(dlrCd, itemCd);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#multiItemMasterGroups(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemMasterGroups(ItemMasterSaveVO itemMasterSaveVO) throws Exception {

        //부품정보관리 부품유형 Update Data
        for(ItemGroupLevelVO itemGroupLevelVO : itemMasterSaveVO.getItemMasterGroupVOList().getUpdateList()){

            ItemMasterGroupVO itemMasterGroupVO = new ItemMasterGroupVO();
            itemMasterGroupVO.setDlrCd(LoginUtil.getDlrCd());
            itemMasterGroupVO.setItemCd(itemMasterSaveVO.getSaveVO().getItemCd());
            itemMasterGroupVO.setItemGrpCd1(itemGroupLevelVO.getItemGrpCd());
            itemMasterGroupVO.setItemGrpCd2(itemGroupLevelVO.getItemDstin1st());
            itemMasterGroupVO.setItemGrpCd3(itemGroupLevelVO.getItemDstin2nd());
            itemMasterGroupVO.setItemGrpCd4(itemGroupLevelVO.getItemDstin3rd());
            itemMasterGroupVO.setRegUsrId(LoginUtil.getDlrCd());
            itemMasterGroupVO.setUpdtUsrId(LoginUtil.getDlrCd());

            ItemMasterGroupSearchVO searchVO = new ItemMasterGroupSearchVO();

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemCd(itemMasterGroupVO.getItemCd());
            searchVO.setsItemGrpCd1(itemMasterGroupVO.getItemGrpCd1());

            //부품정보관리 부품유형 카운트 조회.
            if(itemMasterGroupDAO.selectItemMasterGroupsByConditionCnt(searchVO) == 0){
                //수정.
                itemMasterGroupDAO.insertItemMasterGroup(itemMasterGroupVO);
            }
            else{
                //수정.
                itemMasterGroupDAO.updateItemMasterGroup(itemMasterGroupVO);
            }
        }

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#selectItemMasterGroupsByCondition(chn.bhmc.dms.par.pmm.vo.ItemMasterGroupSearchVO)
     */
    @Override
    public List<ItemMasterGroupVO> selectItemMasterGroupsByCondition(ItemMasterGroupSearchVO searchVO) throws Exception {
        return itemMasterGroupDAO.selectItemMasterGroupsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterGroupService#selectItemMasterGroupsByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemMasterGroupSearchVO)
     */
    @Override
    public int selectItemMasterGroupsByConditionCnt(ItemMasterGroupSearchVO searchVO) throws Exception {
        return itemMasterGroupDAO.selectItemMasterGroupsByConditionCnt(searchVO);
    }

}
