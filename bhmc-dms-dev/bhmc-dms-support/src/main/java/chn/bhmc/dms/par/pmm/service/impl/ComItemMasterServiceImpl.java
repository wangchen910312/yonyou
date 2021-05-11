package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.par.pmm.service.ComItemMasterService;
import chn.bhmc.dms.par.pmm.service.dao.ComItemMasterDAO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ComItemMasterVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterSearchVO;
import chn.bhmc.dms.par.pmm.vo.ItemMasterVO;


/**
 * <pre>
 * 공용품목마스터 관리 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ComItemMasterServiceImpl.java
 * @author Eun Jung Jang
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Service("comItemMasterService")
public class ComItemMasterServiceImpl extends HService implements ComItemMasterService  {


    /**
     * 공용품목마스터 관리 DAO
     */
    @Resource(name="comItemMasterDAO")
    ComItemMasterDAO comItemMasterDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#comItemMasterByKey(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public List<ComItemMasterVO> comItemMasterByKey(ComItemMasterSearchVO searchVO) throws Exception {
        return comItemMasterDAO.comItemMasterByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#comItemMasterByKeyCnt(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public int comItemMasterByKeyCnt(ComItemMasterSearchVO searchVO) throws Exception {
        return comItemMasterDAO.comItemMasterByKeyCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterService#comItemMasterByConditionCnt(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public int comItemMasterByConditionCnt(ComItemMasterSearchVO searchVO) throws Exception {

        return comItemMasterDAO.comItemMasterByConditionCnt(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterService#comItemMasterByCondition(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public List<ComItemMasterVO> comItemMasterByCondition(ComItemMasterSearchVO searchVO) throws Exception {

        return comItemMasterDAO.comItemMasterByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterService#comItemMasterStockByCondition(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public List<ItemMasterVO> comItemMasterStockByCondition(ItemMasterSearchVO searchVO) throws Exception {

        return comItemMasterDAO.comItemMasterStockByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ComItemMasterService#comItemMasterStockByConditionCnt(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public int comItemMasterStockByConditionCnt(ItemMasterSearchVO searchVO) throws Exception {

        return comItemMasterDAO.comItemMasterStockByConditionCnt(searchVO);
    }

    /**
    /* 공용부품 마스터 등록/수정/삭제 목록을 처리한다.
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#multiUpdateComItemCd(chn.bhmc.dms.par.pmm.vo.ComItemMasterSaveVO)
     */
    @Override
    public void multiUpdateComItemCd(BaseSaveVO<ComItemMasterVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();


        for(ComItemMasterVO comItemMasterVO : obj.getInsertList()){
            comItemMasterVO.setRegUsrId(userId);
            comItemMasterVO.setDlrCd(LoginUtil.getDlrCd());

            insertComItemCd(comItemMasterVO);
        }

        for(ComItemMasterVO comItemMasterVO : obj.getUpdateList()){
            comItemMasterVO.setRegUsrId(LoginUtil.getDlrCd());
            comItemMasterVO.setUpdtUsrId(userId);
            comItemMasterVO.setDlrCd(LoginUtil.getDlrCd());

            ComItemMasterSearchVO searchVO = new ComItemMasterSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsItemCd(comItemMasterVO.getItemCd());
            searchVO.setsComItemCd(comItemMasterVO.getComItemCd());

            if(comItemMasterByKeyCnt(searchVO) > 0){
                updateComItemCd(comItemMasterVO);
            }else{
                insertComItemCd(comItemMasterVO);
            }
        }

        for(ComItemMasterVO comItemMasterVO : obj.getDeleteList()){
            comItemMasterVO.setUpdtUsrId(userId);
            comItemMasterVO.setDlrCd(LoginUtil.getDlrCd());

            deleteComItemCd(comItemMasterVO);
        }

    }

    /**
     *  공용부품 마스터 등록을 처리한다.
     *
     * @param comItemMasterVO
     * @return
     */
    private int insertComItemCd(ComItemMasterVO comItemMasterVO)throws Exception  {

        String[] lblList = new String[1];

        //값 체크(딜러,부품코드,공용부품코드)
        if(StringUtils.isEmpty(comItemMasterVO.getDlrCd())){
            lblList[0] = messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale());  // 딜러코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());    // 부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getComItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.comItemCd", null, LocaleContextHolder.getLocale());    // 공용부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        return comItemMasterDAO.insertComItemCd(comItemMasterVO);
    }

    /**
     * 공용부품 마스터 삭제 목록을 처리한다.
     *
     * @param comItemMasterVO
     * @return
     */
    private int deleteComItemCd(ComItemMasterVO comItemMasterVO)throws Exception {

        String[] lblList = new String[1];

        //값 체크(딜러,부품코드,공용부품코드)
        if(StringUtils.isEmpty(comItemMasterVO.getDlrCd())){
            lblList[0] = messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale());  // 딜러코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());    // 부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getComItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.comItemCd", null, LocaleContextHolder.getLocale());    // 공용부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        return comItemMasterDAO.deleteComItemCd(comItemMasterVO);
    }

    /**
     * 공용부품 마스터 수정 목록을 처리한다.
     *
     * @param comItemMasterVO
     * @return
     */
    private int updateComItemCd(ComItemMasterVO comItemMasterVO)throws Exception {

        String[] lblList = new String[1];

        //값 체크(딜러,부품코드,공용부품코드)
        if(StringUtils.isEmpty(comItemMasterVO.getDlrCd())){
            lblList[0] = messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale());  // 딜러코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.itemCd", null, LocaleContextHolder.getLocale());    // 부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        if(StringUtils.isEmpty(comItemMasterVO.getComItemCd())){
            lblList[0] = messageSource.getMessage("par.lbl.comItemCd", null, LocaleContextHolder.getLocale());    // 공용부품코드
            throw processException("par.info.issueCheckMsg", lblList);
        }

        return comItemMasterDAO.updateComItemCd(comItemMasterVO);
    }

}
