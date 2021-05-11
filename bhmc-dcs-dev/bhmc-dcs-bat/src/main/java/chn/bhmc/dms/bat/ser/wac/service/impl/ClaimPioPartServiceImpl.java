package chn.bhmc.dms.bat.ser.wac.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimPioPartService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ClaimPioPartDAO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioPartServiceImpl.java
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
@Service("claimPioPartService")
public class ClaimPioPartServiceImpl extends HService implements ClaimPioPartService {

    @Resource(name="claimPioPartDAO")
    ClaimPioPartDAO claimPioPartDAO;

    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    /**
    *
    * PIO 부품 인테페이스 테이블에 저잗
    *
    * @throws Exception
    */
    public void insertClaimPioPart() throws Exception {
        claimPioPartDAO.insertClaimPioPart();
        batServiceCmmEaiService.executeEaiService("SER058");
    }
}
