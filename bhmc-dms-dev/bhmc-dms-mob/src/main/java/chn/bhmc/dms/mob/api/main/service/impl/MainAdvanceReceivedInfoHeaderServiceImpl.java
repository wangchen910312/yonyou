package chn.bhmc.dms.mob.api.main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.main.dao.MainAdvanceReceivedInfoHeaderDAO;
import chn.bhmc.dms.mob.api.main.service.MainAdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.mob.api.main.vo.AdvanceReceivedInfoHeaderVO;

/**
 * 선수금 헤더 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 23.     In Bo Shim      최초 생성
 * </pre>
 */
@Service("MainAdvanceReceivedInfoHeaderService")
public class MainAdvanceReceivedInfoHeaderServiceImpl extends HService implements MainAdvanceReceivedInfoHeaderService {

    @Resource(name="MainAdvanceReceivedInfoHeaderDAO")
    private MainAdvanceReceivedInfoHeaderDAO MainAdvanceReceivedInfoHeaderDAO;

    @Override
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception {
        return MainAdvanceReceivedInfoHeaderDAO.selectAdvanceReceivedInfoHeaderByKey(dlrCd);
    }
}
