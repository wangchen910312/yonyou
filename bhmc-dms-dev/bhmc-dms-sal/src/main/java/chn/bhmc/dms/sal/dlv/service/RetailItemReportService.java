package chn.bhmc.dms.sal.dlv.service;

import java.util.List;

import chn.bhmc.dms.sal.dlv.vo.RetailItemReportSearchVO;
import chn.bhmc.dms.sal.dlv.vo.RetailItemReportVO;

/**
 * <pre>
 * 소매 명세 레포트
 * </pre>
 *
 * @ClassName   : RetailItemReportService.java
 * @Description : 소매 명세 레포트
 * @author chibeom.song
 * @since 2016. 10. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.10.25.    chibeom.song     최초 생성
 * </pre>
 */

public interface RetailItemReportService {

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과조회 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RetailItemReportSearchVO
     * @return 조회 목록
     */
    public List<RetailItemReportVO> selectRetailItemReportByCondition(RetailItemReportSearchVO searchVO) throws Exception;

    /**
     * 조회 조건에 해당하는 소매 명세 레포트결과 조회 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 RetailItemReportSearchVO
     * @return
     */
    public int selectRetailItemReportByConditionCnt(RetailItemReportSearchVO searchVO) throws Exception;

    public int selectRetailItemLastReportByConditionCnt(RetailItemReportSearchVO searchVO) throws Exception;
    public List<RetailItemReportVO> selectRetailItemLastReportByCondition(RetailItemReportSearchVO searchVO) throws Exception;

    public int selectRetailItemReportDetailConditionCnt(RetailItemReportSearchVO searchVO) throws Exception;
    public List<RetailItemReportVO> selectRetailItemReportDetailCondition(RetailItemReportSearchVO searchVO) throws Exception;
}