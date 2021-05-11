package chn.bhmc.dms.cmm.cmp.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import org.apache.ibatis.annotations.Param;

import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;

/**
 * 부서 관리 DAO
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
@Mapper("departmentDAO")
public interface DepartmentDAO {

    /**
     * 부서 정보를 등록한다.
     * @param departmentVO - 등록할 정보가 담긴 DepartmentVO
     * @return 등록된 목록수
     */
    public int insertDepartment(DepartmentVO departmentVO);

    /**
     * 부서 정보를 수정한다.
     * @param departmentVO - 수정할 정보가 담긴 DepartmentVO
     * @return 수정된 목록수
     */
    public int updateDepartment(DepartmentVO departmentVO);

    /**
     * 부서 정보를 삭제한다.
     * @param departmentVO - 삭제할 정보가 담긴 DepartmentVO
     * @return 삭제된 목록수
     */
    public int deleteDepartment(DepartmentVO departmentVO);

    /**
     * Key에 해당하는 부서 정보를 조회한다.
     * @param cmpTp 회사구분
     * @param deptCd 부서코드
     * @return 조회한 부서 정보
     */
    public DepartmentVO selectDepartmentByKey(@Param("cmpTp") String cmpTp, @Param("deptCd") String deptCd);

    /**
     * 조회 조건에 해당하는 부서 정보를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DepartmentSearchVO
     * @return 조회 목록
     */
    public List<DepartmentVO> selectDepartmentsByCondition(DepartmentSearchVO searchVO);

    /**
     * 조회 조건에 해당하는 부서 총 갯수를 조회한다.
     * @param searchVO 조회 조건을 포함하는 DepartmentSearchVO
     * @return
     */
    public int selectDepartmentsByConditionCnt(DepartmentSearchVO searchVO);
}
