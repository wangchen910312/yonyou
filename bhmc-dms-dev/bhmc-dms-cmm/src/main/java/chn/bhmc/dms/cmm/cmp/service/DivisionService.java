package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.DivisionSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.DivisionSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DivisionVO;

/**
 * 사업부 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

public interface DivisionService {

    /**
     * 사업부 정보를 등록한다.
     * @param divisionVO - 등록할 정보가 담긴 DivisionVO
     * @return 등록된 목록수
     */
    public int insertDivision(DivisionVO divisionVO) throws Exception;

    /**
     * 사업부 정보를 수정한다.
     * @param divisionVO - 수정할 정보가 담긴 DivisionVO
     * @return 수정된 목록수
     */
    public int updateDivision(DivisionVO divisionVO) throws Exception;

    /**
     * 사업부 정보를 삭제한다.
     * @param divisionVO - 삭제할 정보가 담긴 DivisionVO
     * @return 삭제된 목록수
     */
    public int deleteDivision(DivisionVO divisionVO) throws Exception;

    /**
     * 사업부 정보를 등록/수정/삭제 처리한다.
     * @param divisionSaveVO
     */
    public void multiDivisions(DivisionSaveVO divisionSaveVO) throws Exception;

    /**
     * Key에 해당하는 사업부 정보를 조회한다.
     * @param diviCd 사업부코드
     * @return 조회한 사업부 정보
     */
    public DivisionVO selectDivisionByKey(String diviCd) throws Exception;

    /**
     * 조회 조건에 해당하는 사업부 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DivisionSearchVO
     * @return 조회 목록
     */
    public List<DivisionVO> selectDivisionsByCondition(DivisionSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 사업부 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DivisionSearchVO
     * @return
     */
    public int selectDivisionsByConditionCnt(DivisionSearchVO searchVO) throws Exception;
}
