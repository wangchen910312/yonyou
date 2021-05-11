package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ItemGroupLevelService;
import chn.bhmc.dms.par.pmm.service.ItemMasterService;
import chn.bhmc.dms.par.pmm.service.dao.ItemGroupLevelDAO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupLevelVO;
import chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;



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
@Service("itemGroupLevelService")
public class ItemGroupLevelServiceImpl extends HService implements ItemGroupLevelService {

    @Resource(name="itemGroupLevelDAO")
    private ItemGroupLevelDAO itemGroupLevelDAO;

    /**
     * 품목마스터 관리 서비스
     */
    @Resource(name="itemMasterService")
    private ItemMasterService itemMasterService;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public ItemGroupLevelVO selectItemGroupLevelByKey(String dlrCd, String itemKindCd, String itemGrp) throws Exception {
        return itemGroupLevelDAO.selectItemGroupLevelByKey(dlrCd, itemKindCd, itemGrp);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#multiItemGroupLevels(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiItemGroupLevels(BaseSaveVO<ItemGroupLevelVO> obj) throws Exception {

        /*
         * 1. 추가 시 기 품목그룹 데이타 존재유무 체크.
         * 2. 삭제 시 품목마스터 데이타 사용유무 체크.
         *
         * */

        // 품목그룹 검색 VO
        ItemGroupSearchVO searchVO = new ItemGroupSearchVO();
        String[] lblList = new String[1];

        // 품목그룹 Insert Data
        for(ItemGroupLevelVO itemGroupVO : obj.getInsertList()){

            if(itemGroupVO.getLvlVal() > 1){
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
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());

            itemGroupVO.setDlrCd(LoginUtil.getDlrCd());
            itemGroupVO.setRegUsrId(LoginUtil.getUserId());
            itemGroupVO.setUpdtUsrId(LoginUtil.getUserId());

            // 품목그룹 카운트 조회.
            if(itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(searchVO) == 0){
                itemGroupLevelDAO.insertItemGroupLevel(itemGroupVO);
            }
            else{
                lblList[0] = messageSource.getMessage("par.lbl.itemType", null, LocaleContextHolder.getLocale()); // 품목그룹코드
                // 품목그룹코드가 중복됩니다.
                throw processException("par.info.itemInsertMsg", lblList);
            }
        }

        // 품목그룹 Update Data
        for(ItemGroupLevelVO itemGroupVO : obj.getUpdateList()){

            if(itemGroupVO.getLvlVal() > 1){
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
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());

            itemGroupVO.setDlrCd(LoginUtil.getDlrCd());
            itemGroupVO.setRegUsrId(LoginUtil.getUserId());
            itemGroupVO.setUpdtUsrId(LoginUtil.getUserId());

            // 품목그룹 카운트 조회.
            if(itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(searchVO) == 0){
                // 추가.
                itemGroupLevelDAO.insertItemGroupLevel(itemGroupVO);
            }
            else if(itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(searchVO) > 0){
                if(itemGroupVO.getDbYn().equals("N")){ // DB 품목코드 없을 때
                    lblList[0] = messageSource.getMessage("par.lbl.itemType", null, LocaleContextHolder.getLocale()); // 품목그룹코드
                    // 이미 사용되고 있는 품목그룹코드 입니다.
                    throw processException("par.info.itemUseMsg", lblList);
                }
                else{
                    // 수정.
                    itemGroupLevelDAO.updateItemGroupLevel(itemGroupVO);
                }

            }
        }

        // 품목그룹 삭제 데이타
        for(ItemGroupLevelVO itemGroupVO : obj.getDeleteList()){

            if(itemGroupVO.getLvlVal() > 1){
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
            }

            searchVO.setsDlrCd(LoginUtil.getDlrCd());                   // 딜러코드
            searchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());         // 품목그룹코드

            // 품목그룹 카운트 조회.
            if(itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(searchVO) > 0){
                //부품유형 하위유형 사용유무 체크.
                ItemGroupSearchVO groupChildSearchVO = new ItemGroupSearchVO();
                groupChildSearchVO.setsDlrCd(LoginUtil.getDlrCd());
                groupChildSearchVO.setsPentItemDstinCd(itemGroupVO.getItemGrpCd());//부모품목구분코드
                //하위부품유형 있는지 체크.
                if(itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(groupChildSearchVO) > 0){
                    //itemGroupUseMsg message
                    throw processException("par.info.itemGroupUseMsg");
                }

                ItemMasterSearchVO itemMasterSearchVO = new ItemMasterSearchVO();
                itemMasterSearchVO.setsItemGrpCd(itemGroupVO.getItemGrpCd());
                itemGroupVO.setDlrCd(LoginUtil.getDlrCd());

                //품목마스터 품목그룹코드 사용중 확인.
                if(itemMasterService.selectItemMastersByConditionCnt(itemMasterSearchVO) > 0){
                    //itemGroupUseMsg message
                    throw processException("par.info.itemGroupUseMsg");
                }

                //최종 부품유형 삭제
                itemGroupLevelDAO.deleteItemGroupLevel(itemGroupVO);
            }
        }

    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelsByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupLevelVO> selectItemGroupLevelsByCondition(ItemGroupSearchVO searchVO) throws Exception {
        return itemGroupLevelDAO.selectItemGroupLevelsByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelsByConditionCnt(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public int selectItemGroupLevelsByConditionCnt(ItemGroupSearchVO searchVO) throws Exception {
        return itemGroupLevelDAO.selectItemGroupLevelsByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemGroupLevelService#selectItemGroupLevelsItemGroupByCondition(chn.bhmc.dms.par.pmm.vo.ItemGroupSearchVO)
     */
    @Override
    public List<ItemGroupLevelVO> selectItemGroupLevelsItemGroupByCondition(ItemGroupSearchVO searchVO)
            throws Exception {
        return itemGroupLevelDAO.selectItemGroupLevelsItemGroupByCondition(searchVO);
    }

}
