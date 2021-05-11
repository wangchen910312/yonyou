package chn.bhmc.dms.bat.crm.cmm.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;
import able.com.vo.HMap;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatDmsDataOutDAO
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

@Mapper("batDmsDataInDAO")
public interface BatDmsDataInDAO {

    /**
     * DMS CRM 전체 데이터 수집 DCS 에 반영
     * @param null
     * @return Count
     */
    public void exceMerge(HashMap<String, Object> map ) throws Exception;

    public void exceMergeList(HashMap<String, Object> map) throws Exception;

    public void exceInsert(HashMap<String, Object> map ) throws Exception;

    public List<HashMap<String, String>> selectDmsDataTableColumn(String tableNm) throws Exception;

    public void deleteData(HashMap<String, Object> deleteMap) throws Exception;

    public void procedureBM(String dlrCd) throws Exception;

    public void insertDataInHistory(HashMap<String, Object> map ) throws Exception;

    public void updateDataInLastData(HashMap<String, Object> map ) throws Exception;

    public int selectDmsIFByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsIFByCondition(HashMap<String, Object> map) throws Exception;

    public int selectDmsBatByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsBatByCondition(HashMap<String, Object> map) throws Exception;

    public List<String> selectDealersByCondition(DealerSearchVO searchVO) throws Exception;

    public List<HMap> selectDmsIFCountByCondition(HashMap<String, Object> map) throws Exception;

    public int selectDmsListByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsListByCondition(HashMap<String, Object> map) throws Exception;
}
