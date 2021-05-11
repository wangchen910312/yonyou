package chn.bhmc.dms.crm.cal.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cal.service.CallCenterDeviceService;
import chn.bhmc.dms.crm.cal.service.dao.CallCenterDeviceDAO;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceSearchVO;
import chn.bhmc.dms.crm.cal.vo.CallCenterDeviceVO;

/**
 * 콜센터실행 서비스 구현 클래스
 *
 * @author in moon lee
 * @since 2016.05.17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.17         in moon lee            최초 생성
 * </pre>
 */

@Service("callCenterDeviceService")
public class CallCenterDeviceServiceImpl extends HService implements CallCenterDeviceService {

	/**
	 * 콜센터설정 히스토리 DAO
	 */
	@Resource(name="callCenterDeviceDAO")
	CallCenterDeviceDAO callCenterDeviceDAO;

    /**
     * 콜센터실행 히스토리 를 등록한다.
     * @param CallCenterActionVO
     * @return 등록수량
     */
    public int insertCallCenterHistory(CallCenterDeviceVO saveVO) throws Exception {

        saveVO.setRegUsrId("system");

        if ( saveVO.getCallTelNo().length() >= 20 || saveVO.getCallFileNm().length() >= 200 ) {
            return 0;
        }

        return callCenterDeviceDAO.insertCallCenterHistory(saveVO);
    }

    /**
     * 콜센터실행 히스토리 정보를 조회한다.
     * @param CallCenterDeviceSearchVO - DLR_CD, CALL_HIS_SEQ
     * @return
     */
    @Override
    public CallCenterDeviceVO selectCallCenterDeviceByKey(CallCenterDeviceSearchVO searchVO) throws Exception {

        if (StringUtils.isEmpty(searchVO.getsDlrCd())){searchVO.setsDlrCd(LoginUtil.getDlrCd());}

        return callCenterDeviceDAO.selectCallCenterDeviceByKey(searchVO);
    }

}
