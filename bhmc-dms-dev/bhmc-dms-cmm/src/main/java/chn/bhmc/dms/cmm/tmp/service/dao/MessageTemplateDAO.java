package chn.bhmc.dms.cmm.tmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateGroupVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateSearchVO;
import chn.bhmc.dms.cmm.tmp.vo.MessageTemplateVO;

/**
 * 메세지 템플릿에 관한 데이터처리 매퍼 클래스
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

@Mapper("messageTemplateDAO")
public interface MessageTemplateDAO {

    /**
     * 메세지 템플릿 그룹을 등록한다.
     *
     * @param messageTemploateGrpupVO 등록될 정보가 담긴 MessageTemplateGroupVO
     * @return 등록된 목록수
     */
    public int insertMessageTemplateGroup(MessageTemplateGroupVO messageTemploateGrpupVO) throws Exception;

    /**
     * 메세지 템플릿 그룹을 수정한다.
     *
     * @param messageTemploateGrpupVO 수정될 정보가 담긴 MessageTemplateGroupVO
     * @return 수정된 목록수
     */
    public int updateMessageTemplateGroup(MessageTemplateGroupVO messageTemploateGrpupVO) throws Exception;

    /**
     * 메세지 템플릿 그룹을 삭제한다.
     *
     * @param messageTemploateGrpupVO 삭제할 정보가 담긴 MessageTemplateGroupVO
     * @return 삭제된 목록수
     */
    public int deleteMessageTemplateGroup(MessageTemplateGroupVO messageTemploateGrpupVO) throws Exception;

    /**
     * 메세지 템플릿 그룹 정보 를 주키로 검색한다.
     *
     * @param mesgTmplGrpId 메세지 템플릿 그룹 ID
     * @return 검색된 목록수
     */
    public MessageTemplateGroupVO selectMessageTemplateGroupByKey(String mesgTmplGrpId) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지 템플릿 그룹 정보를 조회한다.
     *
     * @param searchVO 조회 조건을 포함하는 MessageTemplateGroupSearchVO
     * @return 조회목록
     */
    public List<MessageTemplateGroupVO> selectMessageTemplateGroupsByCondition(MessageTemplateGroupSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지 템플릿 그룹 카운트를 조회한다.
     *
     * @param searchVO 조회 조건을 포함하는 MessageTemplateGroupSearchVO
     * @return 조회 카운트
     */
    public int selectMessageTemplateGroupsByConditionCnt(MessageTemplateGroupSearchVO searchVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 등록한다.
     * @param messageTemplateVO 등록할 정보가 담긴 MessageTemplateVO
     * @return 등록된 목록수
     */
    public int insertMessageTemplate(MessageTemplateVO messageTemplateVO) throws Exception;

    /**
     * 메세지 템플릿 정보를 수정한다.
     * @param messageTemplateVO 등록할 정보가 담긴 MessageTemplateVO
     * @return 수정된 목록수
     */
    public int updateMessageTemplate(MessageTemplateVO messageTemplateVO) throws Exception;

    /**
     * 주어진 메세지 템플릿 그룹 ID, 메세지 템플릿 유형에 해당하는 목록의 기본여부를  주어진 기본여부 값으로 변경한다.
     * @param mesgTmplGrpId 메세지템플릿 그룹 ID
     * @param mesgTmplTp 메세지템플릿 유형
     * @param defaultYn 변경할 기본여부 값
     * @return
     * @throws Exception
     */
    public int updateMessageTemplateDefaultYn(@Param("mesgTmplGrpId") String mesgTmplGrpId, @Param("mesgTmplTp") String mesgTmplTp, @Param("defaultYn") String defaultYn) throws Exception;

    /**
     * 메세지 템플릿 정보를 삭제한다.
     * @param mesgTmplNo 메세지 템플릿 번호
     * @return 삭제된 목록수
     */
    public int deleteMessageTemplate(int mesgTmplNo) throws Exception;

    /**
     * 메세지템플릿 그룹 ID에 해당하는 메세지 템플릿 정보를 삭제한다.
     * @param mesgTmplGrpId 메세지 템플릿 그룹 ID
     * @return 삭제된 목록수
     */
    public int deleteMessageTemplateByGrpId(String mesgTmplGrpId) throws Exception;

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
     * 조회 조건에 해당하는 메세지 템플릿 카운트  정보를 조회한다.
     *
     * @param searchVO 조회 조건을 포함하는 MessageTemplateSearchVO
     * @return 조회 카운트
     */
    public int selectMessageTemplatesByConditionCnt(MessageTemplateSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 메세지 템플릿   정보를 조회한다.
     *
     * @param searchVO 조회 조건을 포함하는 MessageTemplateSearchVO
     * @return 조회목록
     */
    public List<MessageTemplateVO> selectMessageTemplatesByCondition(MessageTemplateSearchVO searchVO) throws Exception;

}
