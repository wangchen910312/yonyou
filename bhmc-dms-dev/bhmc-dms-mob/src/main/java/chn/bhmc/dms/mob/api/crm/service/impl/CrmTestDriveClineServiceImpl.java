package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmTestDriveClineDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveClineService;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveClineVO;

/**
 * 시승노선관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.12.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.12         in moon lee            최초 생성
 * </pre>
 */

@Service("CrmTestDriveClineService")
public class CrmTestDriveClineServiceImpl extends HService implements CrmTestDriveClineService {

    /**
     * 시승노선관리 DAO
     */
	@Resource(name="CrmTestDriveClineDAO")
	CrmTestDriveClineDAO CrmTestDriveClineDAO;

    @Override
    public List<TestDriveClineVO> selectTestDriveClinesByCondition(TestDriveClineSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return CrmTestDriveClineDAO.selectTestDriveClinesByCondition(searchVO);
    }

}
