package chn.bhmc.dms.cmm.sci.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.LangCdService;
import chn.bhmc.dms.cmm.sci.service.dao.LangCdDAO;
import chn.bhmc.dms.cmm.sci.vo.LangCdSaveVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LangCdServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("langCdService")
public class LangCdServiceImpl extends HService implements LangCdService {
    /**
     * 달력 정보 (Lang Cd) DAO
     */
    @Resource(name = "langCdDAO")
    LangCdDAO langCdDAO;

    @Override
    public int insertLangCd(LangCdVO langCdVO) throws Exception {
        return langCdDAO.insertLangCd(langCdVO);
    }

    @Override
    public int updateLangCd(LangCdVO langCdVO) throws Exception {
        return langCdDAO.updateLangCd(langCdVO);
    }

    @Override
    public int deleteLangCd(LangCdVO langCdVO) throws Exception {
        return langCdDAO.deleteLangCd(langCdVO);
    }

    @Override
    public List<LangCdVO> selectLangCdByCondition(LangCdSearchVO langCdSearchVO) throws Exception {
        return langCdDAO.selectLangCdByCondition(langCdSearchVO);
    }

    @Override
    public int selectLangCdByCnt(LangCdSearchVO langCdSearchVO) throws Exception  {
        return langCdDAO.selectLangCdByCnt(langCdSearchVO);
    }

    /**
     * 달력 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    @Override
    public void multiLangCd(LangCdSaveVO langCdSaveVO) throws Exception {
        String userId = LoginUtil.getUserId();

        for(LangCdVO langCdVO : langCdSaveVO.getInsertList()){
            langCdVO.setRegUsrId(userId);
            langCdVO.setUpdtUsrId(userId);

            this.insertLangCd(langCdVO);
        }

        for(LangCdVO langCdVO : langCdSaveVO.getUpdateList()){
            langCdVO.setUpdtUsrId(userId);

            this.updateLangCd(langCdVO);
        }

        for(LangCdVO langCdVO : langCdSaveVO.getDeleteList()){
            this.deleteLangCd(langCdVO);
        }
    }
}