package chn.bhmc.dms.cmm.apr.service;

import java.util.List;

import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;

/**
 * 결재문서 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *  수정일                                  수정자                                 수정내용
 *  (Modification Date)   Developer            Contents
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

public interface SignService {

    /**
     * 결재문서 정보를 등록한다.
     * @param SignVO - 등록할 정보가 담긴 SignVO
     * @return 등록된 목록수
     */
    public int insertSign(SignVO signVO) throws Exception;

    /**
     * 결재문서 정보를 수정한다.
     * @param SignVO - 수정할 정보가 담긴 SignVO
     * @return 수정된 목록수
     */
    public int updateSign(SignVO signVO) throws Exception;

    /**
     * 결재문서 정보를 삭제한다.
     * @param signDocNo - 결재문서 번호
     * @return 삭제된 목록수
     */
    public int deleteSign(String signDocNo) throws Exception;

    /**
     * Key에 해당하는 결재문서 정보를 조회한다.
     * @param signDocNo - 결재문서번호
     * @return 조회한 결재문서 정보
     */
    public SignVO selectSignByKey(String signDocNo) throws Exception;

	/**
     * 조회 조건에 해당하는 결재문서[상신자] 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return 조회 목록
     */
	public List<SignVO> selectSignsRequestByCondition(SignSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 결재문서[상신자] 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
	public int selectSignsRequestByConditionCnt(SignSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 결재승인[결재권자] 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return 조회 목록
     */
    public List<SignVO> selectSignsByCondition(SignSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 결재승인[결재권자] 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    public int selectSignsByConditionCnt(SignSearchVO searchVO) throws Exception;

    /**
     * 결재문서 결재선 정보를 등록한다.
     * @param signLineVO
     * @return
     * @throws Exception
     */
    int insertSignLine(SignLineVO signLineVO) throws Exception;

    /**
     * 결재문서 결재선 정보를 수정한다.
     * @param signLineVO
     * @return
     * @throws Exception
     */
    int updateSignLine(SignLineVO signLineVO) throws Exception;

    /**
     * 결재문서 결재선 정보를 삭제한다.
     * @param signLineVO
     * @return
     * @throws Exception
     */
    int deleteSignLine(SignLineVO signLineVO) throws Exception;

    /**
     * 결재문서번호에 해당하는 결재선 목록을 삭제한다.
     * @param signDocNo
     * @return
     * @throws Exception
     */
    int deleteSignLineBySignDocNo(String signDocNo) throws Exception;

    /**
     * Key에 해당하는 결재문서 결재선 정보를 조회한다.
     * @param signDocNo
     * @param signDocLineNo
     * @return
     * @throws Exception
     */
    SignLineVO selectSignLineByKey(String signDocNo, int signDocLineNo) throws Exception;

    /**
     * 결재문서 번호에 해당하는 결재문서의 결재자 ID에 해당하는 결재라인 정보를 조회한다.
     * @param signDocNo 결재문서 번호
     * @param signUsrId 결재자 ID
     * @return
     * @throws Exception
     */
    SignLineVO selectSignLineBySignUsrId(String signDocNo, String signUsrId) throws Exception;

    /**
     * 조회 조건에 해당하는 결재문서 결재선 목록을 조회한다.
     * @param searchVO
     * @return
     */
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO)  throws Exception;
}
