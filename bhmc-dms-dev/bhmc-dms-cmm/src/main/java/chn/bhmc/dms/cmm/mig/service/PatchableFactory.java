package chn.bhmc.dms.cmm.mig.service;

import chn.bhmc.dms.cmm.mig.service.impl.SourcePatchableServiceImpl;
import chn.bhmc.dms.cmm.mig.service.impl.SqlPatchableServiceImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchableFactory.java
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

public class PatchableFactory {
    public static PatchableService createPatchableService(String type) throws Exception {
        if("sql".equals(type)){
            return new SqlPatchableServiceImpl();
        }else if("source".equals(type)){
            return new SourcePatchableServiceImpl();
        }

        throw new Exception("Unsupported type");
    }
}
