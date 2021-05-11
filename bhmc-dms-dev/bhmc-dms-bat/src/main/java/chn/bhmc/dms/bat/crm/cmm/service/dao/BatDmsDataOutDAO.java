package chn.bhmc.dms.bat.crm.cmm.service.dao;

import java.util.HashMap;
import java.util.List;

import able.com.mybatis.Mapper;

//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcSearchVO;
//import chn.bhmc.dms.bat.par.pcm.vo.BatInvcVO;

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

@Mapper("batDmsDataOutDAO")
public interface BatDmsDataOutDAO {

    /**
     * DMS - DCS로 전송하기위한 CRM 전체 데이터 수집
     * @param null
     * @return Count
     */
    public void selectDmsData(HashMap<String, Object> map ) throws Exception;

    public List<HashMap<String, String>> selectDmsDataTableColumn(String tableNm) throws Exception;

    public int selectDmsDataTableCnt(HashMap<String, Object> map) throws Exception;

    public List<HashMap<String, Object>> selectDmsDataTable(HashMap<String, Object> map) throws Exception;

    public List<HashMap<String, Object>> selectDlrCd(HashMap<String, String> map) throws Exception;

    public int updateCrmDataUpDt(HashMap<String, String> map) throws Exception;

    public void selecIF(HashMap<String, String> map) throws Exception;
}
