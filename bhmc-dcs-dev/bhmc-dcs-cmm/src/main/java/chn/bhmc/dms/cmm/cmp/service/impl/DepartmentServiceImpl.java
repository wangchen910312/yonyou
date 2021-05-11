package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.DepartmentService;
import chn.bhmc.dms.cmm.cmp.service.dao.DepartmentDAO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.DepartmentVO;

/**
 * 부서 관리 서비스 구현 클래스
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

@Service("departmentService")
public class DepartmentServiceImpl extends HService implements DepartmentService {

    /**
     * 부서 관리 DAO
     */
    @Resource(name="departmentDAO")
    DepartmentDAO departmentDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertDepartment(DepartmentVO departmentVO) throws Exception {

        DepartmentVO obj = selectDepartmentByKey(departmentVO.getCmpTp(), departmentVO.getDeptCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return departmentDAO.insertDepartment(departmentVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateDepartment(DepartmentVO departmentVO) throws Exception {
        return departmentDAO.updateDepartment(departmentVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteDepartment(DepartmentVO departmentVO) throws Exception {
        return departmentDAO.deleteDepartment(departmentVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiDepartments(DepartmentSaveVO departmentSaveVO)  throws Exception {

        for(DepartmentVO departmentVO : departmentSaveVO.getInsertList()){
            insertDepartment(departmentVO);
        }

        for(DepartmentVO departmentVO : departmentSaveVO.getUpdateList()){
            updateDepartment(departmentVO);
        }

        for(DepartmentVO departmentVO : departmentSaveVO.getDeleteList()){
            deleteDepartment(departmentVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public DepartmentVO selectDepartmentByKey(String cmpTp, String deptCd) throws Exception {
        return departmentDAO.selectDepartmentByKey(cmpTp, deptCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<DepartmentVO> selectDepartmentsByCondition(DepartmentSearchVO searchVO) throws Exception {
        return departmentDAO.selectDepartmentsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectDepartmentsByConditionCnt(DepartmentSearchVO searchVO) throws Exception {
        return departmentDAO.selectDepartmentsByConditionCnt(searchVO);
    }


}
