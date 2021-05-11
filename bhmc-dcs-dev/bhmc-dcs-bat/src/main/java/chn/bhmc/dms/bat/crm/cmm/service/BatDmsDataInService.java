package chn.bhmc.dms.bat.crm.cmm.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import able.com.vo.HMap;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;



/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatDataOutBatIfService
 * @Description : Customer Info. Interfacd Batch Service
 * @author LEE KYOJIN
 * @since 2016. 5. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     LEE KYOJIN     최초 생성
 * </pre>
 */

public interface BatDmsDataInService {

    /**
     * DMS - DCS로 전송하기위한 CRM 전체 데이터 아웃
     * @param null
     * @return Count
     */
    public void readFilesUpsert(File file) throws Exception;

    public int selectDmsIFByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsIFByCondition(HashMap<String, Object> map) throws Exception;

    public int selectDmsBatByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsBatByCondition(HashMap<String, Object> map) throws Exception;

    public List<String> selectDealersByCondition(DealerSearchVO searchVO) throws Exception;

    public List<HMap> selectDmsIFCountByCondition(HashMap<String, Object> map) throws Exception;

    public int selectDmsListByConditionCnt(HashMap<String, Object> map) throws Exception;

    public List<HMap> selectDmsListByCondition(HashMap<String, Object> map) throws Exception;

}