package chn.bhmc.dms.bat.ser.svi.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.svi.service.PdiChkManageService;
import chn.bhmc.dms.bat.ser.svi.service.dao.PdiChkManageDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PdiChkManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 10.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("pdiChkManageService")
public class PdiChkManageServiceImpl extends HService implements PdiChkManageService {

    @Resource(name="pdiChkManageDAO")
    PdiChkManageDAO pdiChkManageDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    /*
     * @see chn.bhmc.dms.bat.ser.svi.service.PdiChkManageService#insertPdiChkList()
     */
    @Override
    public void insertPdiChkList() throws Exception {
        pdiChkManageDAO.insertPdiChkList();
        batServiceCmmEaiService.executeEaiService("SER059");
    }
}
