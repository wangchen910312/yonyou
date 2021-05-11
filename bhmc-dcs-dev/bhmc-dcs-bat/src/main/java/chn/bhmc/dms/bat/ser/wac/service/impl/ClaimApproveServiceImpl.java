package chn.bhmc.dms.bat.ser.wac.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimApproveService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ClaimApproveDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimApproveServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 26.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("claimApproveService")
public class ClaimApproveServiceImpl extends HService implements ClaimApproveService {


    @Resource(name="claimApproveDAO")
    ClaimApproveDAO claimApproveDAO;


    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    /*
     * @see chn.bhmc.dms.bat.ser.wac.service.ClaimApproveService#insertClaimApprove(java.lang.String)
     */
    @Override
    public void insertClaimApprove(int day) throws Exception {

        /*HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("batchDt" , DateUtil.getDate("yyyyMMdd"));
*/

        claimApproveDAO.insertClaimApprove(day);

        batServiceCmmEaiService.executeEaiService("SER037");
        batServiceCmmEaiService.executeEaiService("SER038");
        batServiceCmmEaiService.executeEaiService("SER039");
        batServiceCmmEaiService.executeEaiService("SER040");

    }

    @Override
    public void insertReClaimApprove(int day, String dlrCd) throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("batDay", day);
        map.put("batDlrCd", dlrCd);
        claimApproveDAO.insertReClaimApprove(map);

        batServiceCmmEaiService.executeEaiService("SER037");
        batServiceCmmEaiService.executeEaiService("SER038");
        batServiceCmmEaiService.executeEaiService("SER039");
        batServiceCmmEaiService.executeEaiService("SER040");
    }
}
