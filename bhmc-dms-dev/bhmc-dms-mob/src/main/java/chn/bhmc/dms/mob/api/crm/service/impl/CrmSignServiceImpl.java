package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.crm.dao.CrmSignDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmSignService;
import chn.bhmc.dms.mob.api.crm.vo.SignLineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.SignLineVO;

/**
 * 결재문서 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Insignation) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.18         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("CrmsignService")
public class CrmSignServiceImpl extends HService implements CrmSignService {
    /**
     * 결재문서 관리 DAO
     */
	@Resource(name="CrmsignDAO")
	CrmSignDAO CrmsignDAO;

	/**
     * {@inheritDoc}
     */
    @Override
    public List<SignLineVO> selectSignLinesByCondition(SignLineSearchVO searchVO) throws Exception {
        return CrmsignDAO.selectSignLinesByCondition(searchVO);
    }
}
