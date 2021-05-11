package chn.bhmc.dms.cmm.apr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.apr.vo.DocLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocLineVO;
import chn.bhmc.dms.cmm.apr.vo.DocSearchVO;
import chn.bhmc.dms.cmm.apr.vo.DocVO;

/**
 * 결재양식 정보에 관한 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Indocation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("docDAO")
public interface DocDAO {

    /**
     * 결재양식 정보를 등록한다.
     * @param docVO - 등록할 정보가 담긴 DocVO
     * @return 등록된 목록수
     */
    public int insertDoc(DocVO docVO);

    /**
     * 결재양식 정보를 수정한다.
     * @param docVO - 수정할 정보가 담긴 DocVO
     * @return 수정된 목록수
     */
    public int updateDoc(DocVO docVO);

    /**
     * 결재양식 정보를 삭제한다.
     * @param docVO - 삭제할 정보가 담긴 DocVO
     * @return 삭제된 목록수
     */
    public int deleteDoc(DocVO docVO);

    /**
     * Key에 해당하는 결재양식 정보를 조회한다.
     * @param mesgKey - 메세지키
     * @return 조회한 결재양식정보
     */
    public DocVO selectDocByKey(@Param("signDocId") String signDocId);

    /**
     * 조회 조건에 해당하는 결재양식 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return 조회 목록
     */
    public List<DocVO> selectDocsByCondition(DocSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 결재양식 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DocSearchVO
     * @return
     */
    public int selectDocsByConditionCnt(DocSearchVO searchVO);

    /**
     * 결재양식 결재라인 정보를 등록한다.
     * @param docLineVO
     * @return
     */
    public int insertDocLine(DocLineVO docLineVO);

    /**
     * 결재양식에 해당하는 결재라인 정보를 삭제한다.
     * @param dlrCd 딜러코드
     * @param signDocId 결재양식 ID
     * @return
     */
    public int deleteDocLinesBySignDocId(@Param("dlrCd") String dlrCd, @Param("signDocId") String signDocId);

    /**
     * 결재양식 결재라인 정보를 조회한다.
     * @param dlrCd 딜러코드
     * @param signDocId 결재양식 ID
     * @param signdocLineNo 결재양식 결재라인 번호
     * @return
     */
    public DocLineVO selectDocLineByKey(@Param("dlrCd") String dlrcd, @Param("signDocId") String signDocId, @Param("signDocLineNo") int signDocLineNo);

    /**
     * 조회 조건에 해당하는 결재양식 결재라인 목록을 조회한다.
     * @param searchVO
     * @return
     */
    public List<DocLineVO> selectDocLinesByCondition(DocLineSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 결재양식 결재라인 목록수를 조회한다.
     * @param searchVO
     * @return
     */
    public int selectDocLinesByConditionCnt(DocLineSearchVO searchVO);

}
