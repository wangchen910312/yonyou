package chn.bhmc.dms.bat.crm.cso.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtSearchVO;
import chn.bhmc.dms.bat.crm.cso.vo.BatSalesOpptProcessMgmtVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatSalesOpptDAO
 * @Description : 클래스 설명을 기술합니다.
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE     최초 생성
 * </pre>
 */

@Mapper("batSalesOpptDAO")
public interface BatSalesOpptDAO {

    /**
     * DMS - DCS로 전송하기위한 SalesOppt 정보 수집
     * @param null
     * @return Count
     */
    public void selectSalesOpptDmsDcs(HashMap<String, Object> map) throws Exception;

    /**
     * DMS IR to DMS T로 데이터 처리
     * @param null
     * @return Count
     */
    public void selectSalesOpptDmsOri(HashMap<String, Object> map) throws Exception;

    /**
     * DMS - DCS로 전송하기위한 SalesOppt 정보 수집
     * @param null
     * @return Count
     */
    public void selectShowRoomDmsDcs(HashMap<String, Object> map) throws Exception;

    public int selectSalesOpptProcessDmsOriginalByConditionCnt(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public List<BatSalesOpptProcessMgmtVO> selectSalesOpptProcessDmsOriginalByCondition(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 판매기회 정보에 있는지 확인
     *
     * @param 고객번호로 확인 (sCustNo)
     * @return Count
     */
    public int selectSalesOpptProcessByConditionCnt(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    public int updateSalesOpptProcessMgmt(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;

    public int insertSalesOpptProcessMgmt(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;

    public String selectSalesOpptProcessMgmtsByCondition(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;

    /**
     * 판매기회중복이력 업데이트
     * Statements
     *
     * @param batSalesOpptProcessMgmtVO
     * @return
     * @throws Exception
     */
    public int updateSalesOpptProcessDupMgmt(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;


    /**
     * 판매기회 중복처리를 위한 서비스
     * Statements
     *
     * @param batSalesOpptProcessMgmtVO
     * @return
     * @throws Exception
     */
    public int selectSalesOpptIfReceiveByConditionCnt(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;
    public List<BatSalesOpptProcessMgmtVO> selectSalesOpptIfReceiveByCondition(BatSalesOpptProcessMgmtSearchVO searchVO) throws Exception;
    public int updateSalesOpptIfReceive(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;
    public int deleteSalesOpptIfReceive(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;
    public int insertSalesOpptDup(BatSalesOpptProcessMgmtVO batSalesOpptProcessMgmtVO) throws Exception;

    /**
     * 판매기회 추적추진 전달 통계를 위한 정보 수집
     * 전달 '추적추진'신규, 전패 카운터 수집
     * @param null
     */
    public void selectSalesOpptTrackingCollectMonth(HashMap<String, Object> map) throws Exception;

}
