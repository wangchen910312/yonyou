package chn.bhmc.dms.mob.api.crm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.crm.dao.CrmTestDriveCarDAO;
import chn.bhmc.dms.mob.api.crm.service.CrmTestDriveCarService;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarSearchVO;
import chn.bhmc.dms.mob.api.crm.vo.TestDriveCarVO;

/**
 * 시승 차량 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.02.11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.11         in moon lee            최초 생성
 * </pre>
 */

@Service("CrmtestDriveCarService")
public class CrmTestDriveCarServiceImpl extends HService implements CrmTestDriveCarService {

    /**
     * 시승 차량 관리 DAO
     */
	@Resource(name="CrmtestDriveCarDAO")
	CrmTestDriveCarDAO CrmtestDriveCarDAO;


	@Override
    public int selectTestDriveCarsByConditionCnt(TestDriveCarSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return CrmtestDriveCarDAO.selectTestDriveCarsByConditionCnt(searchVO);
    }
	
    @Override
    public List<TestDriveCarVO> selectTestDriveCarsByCondition(TestDriveCarSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}
        if (StringUtils.isEmpty(searchVO.getsPltCd())) {searchVO.setsPltCd(LoginUtil.getPltCd());}

        return CrmtestDriveCarDAO.selectTestDriveCarsByCondition(searchVO);
    }


}
