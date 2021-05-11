package chn.bhmc.dms.bat.cmm.bat.service;

/**
 * <pre>
 * 배치결과정보 이관 및 데이터 삭제 Service
 * </pre>
 *
 * @ClassName   : BatchResultBackupService.java
 * @Description : 배치결과정보 이관 및 데이터 삭제 Service
 * @author Kang Seok Han
 * @since 2017. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 8.     Kang Seok Han     최초 생성
 * </pre>
 */
public interface BatchResultBackupService {
    /**
     * 배치결과 테이블 데이터중 기준일자 이후 데이터를 배치결과 히스토리 테이블로 이관하고 배치결과 테이블 데이터중 기준일자 이전 데이터를 삭제한다.
     * @param day 기준일수(최근)
     */
    public void insertBatchResultHistory(int day) throws Exception;
}
