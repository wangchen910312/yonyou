package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.LanguageCodeService;
import chn.bhmc.dms.cmm.sci.service.dao.LanguageCodeDAO;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LanguageCodeVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 언어코드 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("languageCodeService")
public class LanguageCodeServiceImpl extends HService implements LanguageCodeService {

    /**
     * 언어코드 관리 DAO
     */
	@Resource(name="languageCodeDAO")
	LanguageCodeDAO languageCodeDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertLanguageCode(LanguageCodeVO languageCodeVO)  throws Exception {

        LanguageCodeVO obj = selectLanguageCodeByKey(languageCodeVO.getLangCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return languageCodeDAO.insertLanguageCode(languageCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateLanguageCode(LanguageCodeVO languageCodeVO)  throws Exception {
        return languageCodeDAO.updateLanguageCode(languageCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteLanguageCode(LanguageCodeVO languageCodeVO)  throws Exception {
        return languageCodeDAO.deleteLanguageCode(languageCodeVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public LanguageCodeVO selectLanguageCodeByKey(String langCd)  throws Exception {
        return languageCodeDAO.selectLanguageCodeByKey(langCd);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiLanguageCodes(BaseSaveVO<LanguageCodeVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(LanguageCodeVO languageCodeVO : obj.getInsertList()){
            languageCodeVO.setRegUsrId(userId);
            insertLanguageCode(languageCodeVO);
        }

        for(LanguageCodeVO languageCodeVO : obj.getUpdateList()){
            languageCodeVO.setRegUsrId(userId);
            updateLanguageCode(languageCodeVO);
        }

        for(LanguageCodeVO languageCodeVO : obj.getDeleteList()){
            deleteLanguageCode(languageCodeVO);
        }
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<LanguageCodeVO> selectLanguageCodesByCondition(LanguageCodeSearchVO searchVO)  throws Exception {
        return languageCodeDAO.selectLanguageCodesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectLanguageCodesByConditionCnt(LanguageCodeSearchVO searchVO)  throws Exception {
        return languageCodeDAO.selectLanguageCodesByConditionCnt(searchVO);
    }




}
