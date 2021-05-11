package chn.bhmc.dms.cmm.apr.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.apr.vo.SignLineSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignLineVO;
import chn.bhmc.dms.cmm.apr.vo.SignSearchVO;
import chn.bhmc.dms.cmm.apr.vo.SignVO;

/**
 * 결재문서 데이터처리 매퍼 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Insignation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.05         Kang Seok Han            최초 생성
 * </pre>
 */

@Mapper("signDAO")
public interface SignDAO {

    /**
     * 결재문서 정보를 등록한다.
     * @param signVO - 등록할 정보가 담긴 SignVO
     * @return 등록된 목록수
     */
    public int insertSign(SignVO signVO);

    /**
     * 결재문서 정보를 수정한다.
     * @param signVO - 수정할 정보가 담긴 SignVO
     * @return 수정된 목록수
     */
    public int updateSign(SignVO signVO);

    /**
     * 결재문서 정보를 삭제한다.
     * @param signDocNo - 결재문서번호
     * @return 삭제된 목록수
     */
    public int deleteSign(String signDocNo);

    /**
     * Key에 해당하는 결재문서 정보를 조회한다.
     * @param signDocNo - 결재문서번호
     * @return 조회한 보호자원정보
     */
    public SignVO selectSignByKey(@Param("signDocNo") String signDocNo);

    /**
     * 조회 조건에 해당하는 결재문서[결재권자] 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return 조회 목록
     */
    public List<SignVO> selectSignsByCondition(SignSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 결재문서[결재권자] 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    public int selectSignsByConditionCnt(SignSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 결재문서[상신자] 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return 조회 목록
     */
    public List<SignVO> selectSignsRequestByCondition(SignSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 결재문서[상신자] 목록수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SignSearchVO
     * @return
     */
    public int selectSignsRequestByConditionCnt(SignSearchVO searchVO);

    /**
     * 결재선 정보를 저장한다.
     *
     * @param signLineVO
     * @return
     */
    public int insertSignLine(SignLineVO signLineVO);

    /**
     * 결재선 정보를 변경한다.
     *
     * @param signLineVO
     * @return
     */
    public int updateSignLine(SignLineVO signLineVO);

    /**
     * 결재선 정보를 삭제한다.
     *
     * @param signLineVO
     * @return
     */
    public int deleteSignLine(SignLineVO signLineVO);

    /**
     * 결재문서 번호에 해당하는 결재선 목록을 삭제한다.
     *
     * @param signDocNo
     * @return
     */
    public int deleteSignLineBySignDocNo(String signDocNo);

    /**
     * Key에 해당하는 결재선 정보를 조회한다.
     *
     * @param signDocNo
     * @param signDocLineNo
     * @return
     */
    public SignLineVO selectSignLineByKey(@Param("signDocNo") String signDocNo, @Param("signDocLineNo") int signDocLineNo);

    /**
     * 결재문서 번호에 해당하는 결재문서의 결재자 ID에 해당하는 결재라인 정보를 조회한다.
     *
     * @param signDocNo
     * @param signDocLineNo
     * @return
     */
    public SignLineVO selectSignLineBySignUsrId(@Param("signDocNo") String signDocNo, @Param("signUsrId") String signUsrId);

    /**
     * 조회 조건에 해당하는 결재문서 결재선 목록을 조회한다.
     *
     * @param searchVO
     * @return
     */
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO);

    /**
     * 결재문서의 결재진행 상태를 변경 한다.
     *
     * @param signDocNo
     * @param signStatCd
     * @return
     */
    public int updateSignDocSignStatCd(@Param("signDocNo") String signDocNo, @Param("signStatCd") String signStatCd);

    /**
     * 결재선의 다음 결재자의 결재진행상태를 진행(02)로 변경한다.
     *
     * @param signDocNo
     * @param signDocLineNo
     */
    public void updateNextSignDocLineSignStatCdToProcess(@Param("signDocNo") String signDocNo, @Param("signDocLineNo") int signDocLineNo);

    /**
     * 결재선의 다음 결재라인을 조회한다.
     *
     * @param signDocNo
     * @param signDocLineNo
     */
    public SignLineVO selectNextSignLine(@Param("signDocNo") String signDocNo, @Param("signDocLineNo") int signDocLineNo);
}
