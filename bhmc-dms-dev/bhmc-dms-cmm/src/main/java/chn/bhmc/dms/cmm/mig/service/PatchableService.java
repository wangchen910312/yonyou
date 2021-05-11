package chn.bhmc.dms.cmm.mig.service;

import javax.sql.DataSource;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchableService.java
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

public interface PatchableService {

    /**
     * 패치를 실행한다.
     * @param id 패치ID
     * @param patchTempFolder 패치적용 임시 폴더
     * @param destFilePath 패치파일 경로
     * @throws Exception
     */
    public void patch(String id, String patchTempFolder, String destFilePath) throws Exception;

    /**
     * 데이터소스를 설정한다.
     * @param dataSource 데이터 소스
     */
    public void setDataSource(DataSource dataSource);
}
