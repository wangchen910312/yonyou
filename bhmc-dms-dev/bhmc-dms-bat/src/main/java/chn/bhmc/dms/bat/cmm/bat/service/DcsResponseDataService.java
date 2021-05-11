package chn.bhmc.dms.bat.cmm.bat.service;

/**
 * <pre>
 * DCS 응답메세지 전송 Service
 * </pre>
 *
 * @ClassName   : DcsResponseDataService.java
 * @Description : DCS 응답메세지 전송 Service
 * @author Kyung Mok Kim
 * @since 2018. 2. 13.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 13.   Kyung Mok Kim     최초 생성
 * </pre>
 */
public interface DcsResponseDataService {
    /**
     * 배치결과 테이블 데이터중 기준일자 이후 데이터를 배치결과 히스토리 테이블로 이관하고 배치결과 테이블 데이터중 기준일자 이전 데이터를 삭제한다.
     * @param day 기준일수(최근)
     */
    public int insertDcsResponseData() throws Exception;
}
