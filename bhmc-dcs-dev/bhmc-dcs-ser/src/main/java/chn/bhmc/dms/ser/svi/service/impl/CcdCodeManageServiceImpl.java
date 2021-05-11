package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.CcdCodeManageService;
import chn.bhmc.dms.ser.svi.service.dao.CcdCodeManageDAO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.CcdCodeManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CcdCodeManageServiceImpl.java
 * @Description : 원인코드 관리 서비스구현 클레스
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

@Service("ccdCodeManageService")
public class CcdCodeManageServiceImpl extends HService implements CcdCodeManageService{

    /**
     * 원인코드관리 DAO
     */
    @Resource(name="ccdCodeManageDAO")
    CcdCodeManageDAO ccdCodeManageDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectCcdCodeManageByConditionCnt(CcdCodeManageSearchVO searchVO) throws Exception {

        return ccdCodeManageDAO.selectCcdCodeManageByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CcdCodeManageVO> selectCcdCodeManageByCondition(CcdCodeManageSearchVO searchVO)throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
//        searchVO.setsLangCd("zh");

        log.debug("searchVO="+searchVO.toString());
        return ccdCodeManageDAO.selectCcdCodeManageByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateCcdCodeManages(BaseSaveVO<CcdCodeManageVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(CcdCodeManageVO ccdVO : obj.getUpdateList()){
            ccdVO.setUpdtUsrId(userId);

            ccdCodeManageDAO.updateCcdCodeManages(ccdVO);
        }

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<CcdCodeManageVO> selectCcdCodeByKey(CcdCodeManageSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        return ccdCodeManageDAO.selectCcdCodeByKey(searchVO);
    }





}
