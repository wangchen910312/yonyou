package chn.bhmc.dms.cmm.sci.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.LangCdSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LangCdDAO.java
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

@Mapper("langCdDAO")
public interface LangCdDAO {
    public int insertLangCd(LangCdVO langCdVO);

    public int updateLangCd(LangCdVO langCdVO);

    public int deleteLangCd(LangCdVO langCdVO);

    public List<LangCdVO> selectLangCdByCondition(LangCdSearchVO langCdSearchVO);

    public int selectLangCdByCnt(LangCdSearchVO langCdSearchVO);
}