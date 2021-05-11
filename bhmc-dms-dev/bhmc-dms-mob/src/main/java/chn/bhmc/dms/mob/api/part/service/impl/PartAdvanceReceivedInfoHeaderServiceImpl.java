package chn.bhmc.dms.mob.api.part.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartAdvanceReceivedInfoHeaderDAO;
import chn.bhmc.dms.mob.api.part.service.PartAdvanceReceivedInfoHeaderService;
import chn.bhmc.dms.mob.api.part.vo.AdvanceReceivedInfoHeaderVO;


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
@Service("PartAdvanceReceivedInfoHeaderService")
public class PartAdvanceReceivedInfoHeaderServiceImpl extends HService implements PartAdvanceReceivedInfoHeaderService {

    @Resource(name="PartAdvanceReceivedInfoHeaderDAO")
    private PartAdvanceReceivedInfoHeaderDAO PartAdvanceReceivedInfoHeaderDAO;

    /*
     * @see chn.bhmc.dms.par.cpm.service.AdvanceReceivedInfoHeaderService#selectAdvanceReceivedInfoHeaderByKey(java.lang.String)
     */
    @Override
    public AdvanceReceivedInfoHeaderVO selectAdvanceReceivedInfoHeaderByKey(String dlrCd) throws Exception {
        return PartAdvanceReceivedInfoHeaderDAO.selectAdvanceReceivedInfoHeaderByKey(dlrCd);
    }

    

}
