package chn.bhmc.dms.cmm.sci.service;

import java.util.List;

import chn.bhmc.dms.cmm.sci.vo.LangCdSaveVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdSearchVO;
import chn.bhmc.dms.cmm.sci.vo.LangCdVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LangCdService.java
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

public interface LangCdService {
    int insertLangCd(LangCdVO langCdVO) throws Exception;

    int updateLangCd(LangCdVO langCdVO) throws Exception;

    int deleteLangCd(LangCdVO langCdVO) throws Exception;

    List<LangCdVO> selectLangCdByCondition(LangCdSearchVO langCdSearchVO) throws Exception;

    int selectLangCdByCnt(LangCdSearchVO langCdSearchVO) throws Exception;

    /**
     * 달력 정보를 등록/수정/삭제 처리한다.
     * @param calendarInfoSaveVO
     */
    public void multiLangCd(LangCdSaveVO langCdSaveVO) throws Exception;
}