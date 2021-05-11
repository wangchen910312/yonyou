package chn.bhmc.dms.crm.cal.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.crm.cal.service.CallCenterSettingMgmtService;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterSettingMgmtDAO;

/**
 * 콜센터설정 관리 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.05.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.05         in moon lee            최초 생성
 * </pre>
 */

@Service("callCenterSettingMgmtService")
public class CallCenterSettingMgmtServiceImpl extends HService implements CallCenterSettingMgmtService {

    /**
     * 콜센터설정 관리 DAO
     */
	@Resource(name="callCenterSettingMgmtDAO")
	CallCenterSettingMgmtDAO callCenterSettingMgmtDAO;

}
