package chn.bhmc.dms.bat.ser.mig.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.mig.service.GdmsDataMigService;
import chn.bhmc.dms.bat.ser.mig.service.dao.GdmsDataMigDAO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GdmsDataMigServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kim Yunseung
 * @since 2017. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 7. 22.   Kin Yunseung     최초 생성
 * </pre>
 */

@Service("GdmsDataMigService")
public class GdmsDataMigServiceImpl extends HService implements GdmsDataMigService {


    @Resource(name="gdmsDataMigDAO")
    GdmsDataMigDAO gdmsDataMigDAO;

    @Override
    public void insertGdmsToDcs(int pDay) throws Exception {

        // 기초정보
        gdmsDataMigDAO.insertBaseInfoGdmsToDcs(pDay);
        // PWA정보
        gdmsDataMigDAO.insertPwaGdmsToDcs(pDay);
        // 클레임정보
        gdmsDataMigDAO.insertClaimGdmsToDcs(pDay);
        // RO정보
        gdmsDataMigDAO.insertRoGdmsToDcs(pDay);

    }

}
