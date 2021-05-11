package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.sales.service.SalesCrmCommonService;
import chn.bhmc.dms.mob.api.sales.service.SalesRoleMappingService;
import chn.bhmc.dms.mob.api.sales.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CrmCommonServiceImpl.java
 * @Description : Crm 공통
 * @author In Moon Lee
 * @since 2016.06.02.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.06.02.     In Moon Lee     최초 생성
 * </pre>
 */
@Service("SalesCrmCommonService")
public class SalesCrmCommonServiceImpl extends HService implements SalesCrmCommonService {

    /**
     * 롤 관리 서비스
     */
    @Resource(name="SalesRoleMappingService")
    SalesRoleMappingService SalesRoleMappingService;

    @Override
    public List<UserVO> selectMngScIdListByCondition() throws Exception {
        List<UserVO> userRoleMappingList = SalesRoleMappingService.selectUsersByRoleId("D", LoginUtil.getDlrCd(), null, null, "ROLE_SALES_ADVISOR");
        return userRoleMappingList;
    }

    

}
