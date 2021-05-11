package chn.bhmc.dms.cmm.mig.service;

import chn.bhmc.dms.cmm.mig.vo.PatchInfoSearchVO;
import chn.bhmc.dms.cmm.mig.vo.PatchInfoVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public interface PatchService {

    /**
     * 패치정보 데이터 조회
     *
     * @param patchInfoSearchVO
     * @return
     * @throws Exception
     */
    public PatchInfoVO selectPatchInfo(PatchInfoSearchVO patchInfoSearchVO) throws Exception;

    /**
     * 패치파일을 다운로드 한다.
     *
     * @param url
     * @return
     * @throws Exception
     */
    public void selectPatchFileDownload(String sourceUrl, String destPath) throws Exception;

    /**
     * 패치파일을 배포한다.
     *
     * @param patchScript 패치스크립트 파일
     * @param patchTempFolder 패치 임시폴더
     * @param webappsFolder 웹 어플리케이션 폴더
     * @throws Exception
     */
    public void updatePatchDeploy(String patchScript, String patchTempFolder, String webappsFolder) throws Exception;

}
