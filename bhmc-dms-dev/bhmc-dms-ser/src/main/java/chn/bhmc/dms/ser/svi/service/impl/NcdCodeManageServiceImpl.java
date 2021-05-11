package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.NcdCodeManageService;
import chn.bhmc.dms.ser.svi.service.dao.NcdCodeManageDAO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeManageVO;
import chn.bhmc.dms.ser.svi.vo.NcdCodeSearchVO;
import chn.bhmc.dms.ser.svi.vo.NcdLclsVO;
import chn.bhmc.dms.ser.svi.vo.NcdMclsVO;
import chn.bhmc.dms.ser.svi.vo.NcdSclsVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NcdCodeManageServiceImpl.java
 * @Description : 현상코드 관리 서비스 구현 클래스
 * @author Ki Hyun Kwon
 * @since 2016. 1. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 29.     Ki Hyun Kwon     최초 생성
 * </pre>
 */
@Service("ncdCodeManageService")
public class NcdCodeManageServiceImpl extends HService implements NcdCodeManageService {


    /**
     * 현상코드관리 DAO
     */
    @Resource(name="ncdCodeManageDAO")
    NcdCodeManageDAO ncdCodeManageDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectNcdCodeManageByConditionCnt(NcdCodeManageSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
//        searchVO.setsLangCd("zh");

        return ncdCodeManageDAO.selectNcdCodeManageByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdCodeManageVO> selectNcdCodeManageByCondition(NcdCodeManageSearchVO searchVO) throws Exception {

        return ncdCodeManageDAO.selectNcdCodeManageByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateNcdCodeManages(BaseSaveVO<NcdCodeManageVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        for(NcdCodeManageVO ncdCodeVO : obj.getUpdateList()){

            ncdCodeVO.setUpdtUsrId(userId);

            ncdCodeManageDAO.updateNcdCodeManages(ncdCodeVO);

        }
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectNcdCodeByConditionCnt(NcdCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return ncdCodeManageDAO.selectNcdCodeByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdLclsVO> selectNcdLclsMapByKey(NcdCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
//        searchVO.setsLangCd("zh");

        return ncdCodeManageDAO.selectNcdLclsMapByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdLclsVO> selectNcdLclsByKey(NcdCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return ncdCodeManageDAO.selectNcdLclsByKey(searchVO);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdMclsVO> selectNcdMCodeByKey(NcdCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        log.debug(searchVO.toString());

        if(searchVO.getsClsCd().equals("M")){
            return selectNcdMclsByKey(searchVO);
        }else{
           return selectNcdMclsMapByKey(searchVO);
        }
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdMclsVO> selectNcdMclsMapByKey(NcdCodeSearchVO searchVO) throws Exception {

         return ncdCodeManageDAO.selectNcdMclsMapByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdMclsVO> selectNcdMclsByKey(NcdCodeSearchVO searchVO) throws Exception {

        return ncdCodeManageDAO.selectNcdMclsByKey(searchVO);
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdSclsVO> selectNcdSCodeByKey(NcdCodeSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        if(searchVO.getsClsCd().equals("S")){
            return selectNcdSclsByKey(searchVO);
        }else{
            return selectNcdSclsMapByKey(searchVO);
        }
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdSclsVO> selectNcdSclsMapByKey(NcdCodeSearchVO searchVO) throws Exception {

        return ncdCodeManageDAO.selectNcdSclsMapByKey(searchVO);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public List<NcdSclsVO> selectNcdSclsByKey(NcdCodeSearchVO searchVO) throws Exception {

        return ncdCodeManageDAO.selectNcdSclsByKey(searchVO);
    }


}
