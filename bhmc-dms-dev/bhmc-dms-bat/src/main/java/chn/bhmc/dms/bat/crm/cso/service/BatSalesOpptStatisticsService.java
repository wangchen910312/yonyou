package chn.bhmc.dms.bat.crm.cso.service;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfSalesOpptStatisticsService
 * @Description : SalesOppt Info. 통계 수집을 위한 서비스
 * @author LEE KYOJIN
 * @since 2017. 3. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 11.     LEE KYOJIN     최초 생성
 * </pre>
 */

public interface BatSalesOpptStatisticsService {

    /**
     * 판매기회 추적추진 전달 통계를 위한 정보 수집
     * 전달 '추적추진'신규, 전패 카운터 수집
     * @param null
     * @return Count
     */
    public int selectSalesOpptTrackingCollectMonth() throws Exception;

}