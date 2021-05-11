package chn.bhmc.dms.par.pmm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.par.pmm.service.AbcClassService;
import chn.bhmc.dms.par.pmm.service.dao.AbcClassDAO;
import chn.bhmc.dms.par.pmm.vo.AbcClassSearchVO;
import chn.bhmc.dms.par.pmm.vo.AbcClassVO;

/**
 * ABC CLASS 관리 서비스 구현 클래스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 7.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.07         Ju Won Lee            최초 생성
 * </pre>
 */

@Service("abcClassService")
public class AbcClassServiceImpl extends HService implements AbcClassService {

    /**
     * ABC CLASS 관리 DAO
     */
	@Resource(name="abcClassDAO")
	AbcClassDAO abcClassDAO;

	/**
	 * {@inheritDoc}
	 */
    @Override
    public int insertAbcClass(AbcClassVO abcClassVO) throws Exception {

        return abcClassDAO.insertAbcClass(abcClassVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateAbcClass(AbcClassVO abcClassVO) throws Exception {
        return abcClassDAO.updateAbcClass(abcClassVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteAbcClass(AbcClassVO abcClassVO) throws Exception {
        return abcClassDAO.deleteAbcClass(abcClassVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public AbcClassVO selectAbcClassByKey(AbcClassSearchVO abcClassSearchVO) throws Exception {
        return abcClassDAO.selectAbcClassByKey(abcClassSearchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public List<AbcClassVO> selectAbcClassByCondition(AbcClassSearchVO searchVO) throws Exception {
        return abcClassDAO.selectAbcClassByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectAbcClassByConditionCnt(AbcClassSearchVO searchVO) throws Exception {
        return abcClassDAO.selectAbcClassByConditionCnt(searchVO);
    }

}
