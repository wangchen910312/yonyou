package chn.bhmc.dms.cmm.cmp.service;

import java.util.List;

import chn.bhmc.dms.cmm.cmp.vo.DepartmentSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;

/**
 * 부서 관리 서비스
 *
 * @author Kang Seok Han
 * @since 2016. 11. 28.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.11.28         Kang Seok Han            최초 생성
 * </pre>
 */

public interface DepartmentService {

    /**
     * 부서 정보를 등록한다.
     * @param departmentVO - 등록할 정보가 담긴 DepartmentVO
     * @return 등록된 목록수
     */
    public int insertDepartment(DepartmentVO departmentVO) throws Exception;

    /**
     * 부서 정보를 수정한다.
     * @param departmentVO - 수정할 정보가 담긴 DepartmentVO
     * @return 수정된 목록수
     */
    public int updateDepartment(DepartmentVO departmentVO) throws Exception;

    /**
     * 부서 정보를 삭제한다.
     * @param departmentVO - 삭제할 정보가 담긴 DepartmentVO
     * @return 삭제된 목록수
     */
    public int deleteDepartment(DepartmentVO departmentVO) throws Exception;

    /**
     * 부서 정보를 등록/수정/삭제 처리한다.
     * @param departmentSaveVO
     */
    public void multiDepartments(DepartmentSaveVO departmentSaveVO) throws Exception;

    /**
     * Key에 해당하는 부서 정보를 조회한다.
     * @param cmpTp 회사구분
     * @param deptCd 부서코드
     * @return 조회한 부서 정보
     */
    public DepartmentVO selectDepartmentByKey(String cmpTp, String deptCd) throws Exception;

    /**
     * 조회 조건에 해당하는 부서 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DepartmentSearchVO
     * @return 조회 목록
     */
    public List<DepartmentVO> selectDepartmentsByCondition(DepartmentSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 부서 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DepartmentSearchVO
     * @return
     */
    public int selectDepartmentsByConditionCnt(DepartmentSearchVO searchVO) throws Exception;
}
