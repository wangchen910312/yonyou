package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.dao.ItemGroupDAO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;



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
@Service("itemGroupService")
public class ItemGroupServiceImpl extends HService implements ItemGroupService {

    @Resource(name="itemGroupDAO")
    private ItemGroupDAO itemGroupDAO;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    private ItemMasterService itemMasterService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#selectItemGroupByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public ItemGroupVO selectItemGroupByKey(String dlrCd, String itemKindCd, String itemGrp) throws Exception {
        return itemGroupDAO.selectItemGroupByKey(dlrCd, itemKindCd, itemGrp);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#selectItemGroupsByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupVO> selectItemGroupsByCondition(ItemGroupSearchVO searchVO) throws Exception {
        return itemGroupDAO.selectItemGroupsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#selectItemGroupsByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public int selectItemGroupsByConditionCnt(ItemGroupSearchVO searchVO) throws Exception {
        return itemGroupDAO.selectItemGroupsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#selectItemGroupCodesByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupVO> selectItemGroupCodesByCondition(ItemGroupSearchVO searchVO) throws Exception {
        return itemGroupDAO.selectItemGroupCodesByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupService#multiItemGroups(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemGroups(BaseSaveVO<ItemGroupVO> obj) throws Exception {

        /*
         * 1. 추가 시 기 품목그룹 데이타 존재유무 체크.
         * 2. 삭제 시 품목마스터 데이타 사용유무 체크.
         *
         * */

        // 품목그룹 검색 VO
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        String[] lblList = new String[1];

        // 품목그룹 Insert Data
        for(ItemGroupVO itemGroupVO : obj.getInsertList()){

            // 품목그룹 유효성 체크.
            if(StringUtils.isEmpty(itemGroupVO.getItemDstinCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemDstinCd", null, LocaleContextHolder.getLocale());  // 품목구분코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpCd", null, LocaleContextHolder.getLocale());  // 품목그룹코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpNm", null, LocaleContextHolder.getLocale());  // 품목그룹명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                 // 딜러코드
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());         // 품목그룹코드

            itemGroupVO.setDlrCd(LoginUtil.getDlrCd());
            itemGroupVO.setRegUsrId(LoginUtil.getUserId());

            // 품목그룹 카운트 조회.
            if(itemGroupDAO.selectItemGroupsByConditionCnt(searchVO) == 0){
                itemGroupDAO.insertItemGroup(itemGroupVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpCd", null, LocaleContextHolder.getLocale()); // 품목그룹코드
                // 품목그룹코드가 중복됩니다.
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 품목그룹 Update Data
        for(ItemGroupVO itemGroupVO : obj.getUpdateList()){

            // 품목그룹 유효성 체크.
            if(StringUtils.isEmpty(itemGroupVO.getItemDstinCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemDstinCd", null, LocaleContextHolder.getLocale());  // 품목구분코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpCd", null, LocaleContextHolder.getLocale());  // 품목그룹코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpNm", null, LocaleContextHolder.getLocale());  // 품목그룹명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());         // 품목그룹코드

            itemGroupVO.setDlrCd(LoginUtil.getDlrCd());
            itemGroupVO.setRegUsrId(LoginUtil.getUserId());
            itemGroupVO.setUpdtUsrId(LoginUtil.getUserId());

            // 품목그룹 카운트 조회.
            if(itemGroupDAO.selectItemGroupsByConditionCnt(searchVO) == 0){
                // 추가.
                itemGroupDAO.insertItemGroup(itemGroupVO);
            }
            else if(itemGroupDAO.selectItemGroupsByConditionCnt(searchVO) > 0){
                if(itemGroupVO.getDbYn().equals("N")){// DB 품목코드 없을 때
                    lblList[0] = messageSource.getMessage("par.lbl.itemGrpCd", null, LocaleContextHolder.getLocale()); // 품목그룹코드
                    // 이미 사용되고 있는 품목그룹코드 입니다.
                    throw processException("par.info.itemUseMsg", lblList);
                }
                else{// 수정.
                    itemGroupDAO.updateItemGroup(itemGroupVO);
                }
            }
        }

        // 품목그룹 삭제 데이타
        for(ItemGroupVO itemGroupVO : obj.getDeleteList()){

            // 품목그룹 유효성 체크.
            if(StringUtils.isEmpty(itemGroupVO.getItemDstinCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemDstinCd", null, LocaleContextHolder.getLocale());  // 품목구분코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpCd())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpCd", null, LocaleContextHolder.getLocale());  // 품목그룹코드
                throw processException("par.info.issueCheckMsg", lblList);
            }

            if(StringUtils.isEmpty(itemGroupVO.getItemGrpNm())){
                lblList[0] = messageSource.getMessage("par.lbl.itemGrpNm", null, LocaleContextHolder.getLocale());  // 품목그룹명
                throw processException("par.info.issueCheckMsg", lblList);
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());         // 품목그룹코드

            // 품목그룹 카운트 조회.
            if(itemGroupDAO.selectItemGroupsByConditionCnt(searchVO) > 0){
                ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
                itemMasterSearchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());

                itemGroupVO.setDlrCd(LoginUtil.getDlrCd());

                //품목마스터 품목그룹코드 사용중 확인.
                if(itemMasterService.selectItemMastersByConditionCnt(itemMasterSearchVO) > 0){
                    //itemGroupUseMsg message
                    throw processException("par.info.itemGroupUseMsg");
                }
                else{
                    itemGroupDAO.deleteItemGroup(itemGroupVO);
                }
            }
        }
    }

}
