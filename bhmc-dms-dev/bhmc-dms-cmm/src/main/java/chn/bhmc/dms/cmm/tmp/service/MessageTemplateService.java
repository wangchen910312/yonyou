package chn.bhmc.dms.cmm.tmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSaveVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;

/**
 * 메세지소스 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface MessageTemplateService {

    /**
     * 메세지 템플릿 그룹 정보를 등록한다.
     * @param MessageTemplateGroupVO - 등록할 정보가 담긴 MessageTemplateGroupVO
     * @return 등록된 목록수
     */
    int insertMessageTemplateGroup(MessageTemplateGroupVO codeVO) throws Exception;

    /**
     * 메세지 템플릿 그룹 정보를 수정한다.
     * @param MessageTemplateGroupVO - 수정할 정보가 담긴 MessageTemplateGroupVO
     * @return 수정된 목록수
     */
    int updateMessageTemplateGroup(MessageTemplateGroupVO codeVO) throws Exception;

    /**
     * 메세지 템플릿 그룹 정보를 삭제한다.
     * @param MessageTemplateGroupVO - 삭제할 정보가 담긴 MessageTemplateGroupVO
     * @return 삭제된 목록수
     */
    int deleteMessageTemplateGroup(MessageTemplateGroupVO codeVO) throws Exception;

    /**
     * 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 MessageTemplateGroupSaveVO
     * @return
     */
    public void multiMessageTemplateGroups(MessageTemplateGroupSaveVO saveVO) throws Exception;

    /**
     * Key에 해당하는  메세지 템플릿 그룹 정보를 조회한다.
     * @param tmplGrpId - 메세지 템플릿그룹코드
     * @return 조회한 메세지 템플릿 정보
     */
    public MessageTemplateGroupVO selectMessageTemplateGroupByKey(String tmplGrpId) throws Exception;

    /**
     * 메세지 템플릿 그룹을 조회조건으로 검색한다.
     *
     * @param MessageTemplateGroupSearchVO - 조회조건이 포함된 MessageTemplateGroupSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectMessageTemplateGroupsByConditionCnt(MessageTemplateGroupSearchVO searchVO) throws Exception;

    /**
     * 메세지 템플릿 그룹을 조회조건으로 검색한다.
     *
     * @param MessageTemplateGroupSearchVO - 조회조건이 포함된 MessageTemplateGroupSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<MessageTemplateGroupVO> selectMessageTemplateGroupsByCondition(MessageTemplateGroupSearchVO searchVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 등록한다.
     * @param MessageTemplateVO - 등록할 정보가 담긴 MessageTemplateVO
     * @return 등록된 목록수
     */
    public int insertMessageTemplate(MessageTemplateVO codeVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 수정한다.
     * @param MessageTemplateVO - 수정할 정보가 담긴 MessageTemplateVO
     * @return 수정된 목록수
     */
    public int updateMessageTemplate(MessageTemplateVO codeVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 삭제한다.
     * 단 디폴트로 설정된 메세지 템플릿을 삭제 할 수 없다.
     * @param mesgTmplNo 메세지 템플릿 번호
     * @return 삭제된 목록수
     */
    public int deleteMessageTemplate(int mesgTmplNo) throws Exception;

    /**
     * 메세지 템플릿 그룹 ID에 해당하는 메세지 템플릿 정보를 삭제한다.
     * @param mesgTmplGrpId 메세지 템플릿 그룹 ID
     * @return 삭제된 목록수
     */
    public int deleteMessageTemplateByGrpId(String mesgTmplGrpId) throws Exception;

    /**
     * 입력, 수정, 삭제를 한꺼번에 수행한다.
     *
     * @param saveVO - 입력, 수정, 삭제 데이터가 포함된 MessageTemplateSaveVO
     * @return
     */
    public void multiMessageTemplates(MessageTemplateSaveVO saveVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 주키로 검색한다.
     * @param mesgTmplNo 메세지 템플릿 번호
     * @return 검색된 목록수
     */
    public MessageTemplateVO selectMessageTemplateByKey(int mesgTmplNo) throws Exception;

    /**
     * 메세지 템플릿 정보를 주키로 검색한다.
     * @param mesgTmplGrpId 메세지 템플릿 그룹 ID
     * @param mesgTmplTp 메세지 템플릿 유형
     * @return 검색된 목록수
     */
    public MessageTemplateVO selectDefaultMessageTemplateByGrpIdAndTmplTp(String mesgTmplGrpId, String mesgTmplTp) throws Exception;

    /**
     * 메세지 템플릿를 조회조건으로 검색한다.
     *
     * @param MessageTemplateGroupSearchVO - 조회조건이 포함된 MessageTemplateGroupSearchVO
     * @return 조회 조건으로 검색된 목록수
     */
    public int selectMessageTemplatesByConditionCnt(MessageTemplateSearchVO searchVO) throws Exception;


    /**
     * 메세지 템플릿를 조회조건으로 검색한다.
     *
     * @param MessageTemplateGroupSearchVO - 조회조건이 포함된 MessageTemplateGroupSearchVO
     * @return 조회 조건으로 검색된 목록
     */
    public List<MessageTemplateVO> selectMessageTemplatesByCondition(MessageTemplateSearchVO searchVO) throws Exception;

}
