package chn.bhmc.dms.cmm.mig.service.impl;

import java.io.File;

import javax.sql.DataSource;

import able.com.service.HService;

import chn.bhmc.dms.cmm.mig.service.PatchableService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SourcePatchableServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SourcePatchableServiceImpl extends HService implements PatchableService {

    @Override
    public void patch(String id, String patchTempFolder, String destFilePath) throws Exception {
        File file = new File(patchTempFolder + destFilePath);
        if(!file.exists()){
            throw processException("File not found");
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.mig.service.PatchableService#setDataSource(javax.sql.DataSource)
     */
    @Override
    public void setDataSource(DataSource dataSource) {
    }

}
