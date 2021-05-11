package chn.bhmc.dms.bat.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SystemConfigInfoIfBatchDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 10. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 6.     Kang Seok Han     최초 생성
 * </pre>
 */

@Mapper("systemConfigInfoIfBatchDAO")
public interface SystemConfigInfoIfBatchDAO {
    public int insertSystemConfigInfoIf();
}
