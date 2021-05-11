package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesRoleMappingDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesRoleMappingService;
import chn.bhmc.dms.mob.api.sales.vo.UserVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RoleMappingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 8. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 9.     Kang Seok Han     최초 생성
 * </pre>
 */
@Service("SalesRoleMappingService")
public class SalesRoleMappingServiceImpl extends HService implements SalesRoleMappingService {

    @Resource(name="SalesRoleMappingDAO")
    SalesRoleMappingDAO SalesRoleMappingDAO;

   

    /**
     * {@inheritDoc}
     */
    @Override
    public List<UserVO> selectUsersByRoleId(String sysCd, String dlrCd, String empNo, String usrNm, String... roleIdList) throws Exception {
    	List<String> roles = new ArrayList<String>();

    	for(String roleId: roleIdList){
    		roles.add(roleId);
    	}

        return SalesRoleMappingDAO.selectUsersByRoleId(sysCd, dlrCd, empNo, usrNm, roles);
    }
}
