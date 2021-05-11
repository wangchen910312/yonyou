package chn.bhmc.dms.cmm.apr.service;

import java.util.List;

import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSaveVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;

/**
 * 결재양식 관리 서비스
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

public interface DocService {

    /**
     * 결재양식 정보를 등록한다.
     * @param DocVO - 등록할 정보가 담긴 DocVO
     * @return 등록된 목록수
     */
    public int insertDoc(DocVO docVO) throws Exception;

    /**
     * 결재양식 정보를 수정한다.
     * @param DocVO - 수정할 정보가 담긴 DocVO
     * @return 수정된 목록수
     */
    public int updateDoc(DocVO docVO) throws Exception;

    /**
     * 결재양식 정보를 삭제한다.
     * @param DocVO - 삭제할 정보가 담긴 DocVO
     * @return 삭제된 목록수
     */
    public int deleteDoc(DocVO docVO) throws Exception;

    /**
     * 결재양식 정보를 등록/수정/삭제 처리한다.
     * @param docSaveVO
     */
    public void multiDocs(DocSaveVO docSaveVO) throws Exception;

    /**
     * Key에 해당하는 결재양식 정보를 조회한다.
     * @param signDocId - 결재양식 ID
     * @return 조회한 결재양식 정보
     */
    public DocVO selectDocByKey(String signDocId) throws Exception;

	/**
     * 조회 조건에 해당하는 결재양식 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return 조회 목록
     */
	public List<DocVO> selectDocsByCondition(DocSearchVO searchVO) throws Exception;

	/**
     * 조회 조건에 해당하는 결재양식 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return
     */
	public int selectDocsByConditionCnt(DocSearchVO searchVO) throws Exception;

	/**
	 * 결재양식 결재선 정보를 등록한다.
	 * @param docLineVO
	 * @return
	 * @throws Exception
	 */
	int insertDocLine(DocLineVO docLineVO) throws Exception;

    /**
     * 결재양식 결재선 정보를 저장한다.
     * @param dlrCd 딜러코드
     * @param signDocId 결재양식 ID
     * @param signLines 결재양식 결재라인 목록
     * @throws Exception
     */
    void deleteAndInsertDocLines(String dlrCd, String signDocId, List<DocLineVO> signLines) throws Exception;

    /**
     * Key에 해당하는 결재양식 결재선 정보를 조회한다.
     * @param dlrCd 딜러코드
     * @param signDocId 결재양식 ID
     * @param signDocLineNo 결재양식 결재라인 번호
     * @return
     * @throws Exception
     */
    DocLineVO selectDocLineByKey(String dlrCd, String signDocId, int signDocLineNo) throws Exception;

    /**
     * 조회 조건에 해당하는 결재양식 결재선 목록을 조회한다.
     * @param searchVO
     * @return
     */
    public int selectDocLinesByConditionCnt(DocLineSearchVO searchVO)  throws Exception;

    /**
     * 조회 조건에 해당하는 결재양식 결재선 총 목록수를 조회한다.
     * @param searchVO
     * @return
     */
    public List<DocLineVO> selectDocLinesByCondition(DocLineSearchVO searchVO)  throws Exception;
}
