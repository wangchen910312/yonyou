package chn.bhmc.dms.bat.crm.cmm.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataInService;
import chn.bhmc.dms.bat.crm.cmm.service.dao.BatDmsDataInDAO;

/**
 * BatDmsDataOutServiceImpl
 *
 * @author Kyo Jin LEE
 * @since 2016. 5. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 5. 17.     Kyo Jin LEE      최초 생성
 * </pre>
 */
@Service("batDmsDataInService")
public class BatDmsDataInServiceImpl extends HService implements BatDmsDataInService {
    /**
     * DAO
     */
    @Resource(name="batDmsDataInDAO")
    BatDmsDataInDAO batDmsDataInDAO;

    /*
     * @see chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataInServiceImpl#readFilesUpsert
     */
    @Override
    public void readFilesUpsert(File file) throws Exception{
        BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(file), "UTF-8"));
        String str;
        String sType = "";
        String sDlrCd = "";
        String sDate = "";
        boolean isRunBM = false;//CR_0101T 테이블의 정보가 전체로 올라왔을 경우 BM 프로시저 실행.
        HashMap<String, Object> dataMap = new HashMap<String, Object>();
        try{
            while ((str = in.readLine()) != null) {//Table
                JSONParser parser = new JSONParser();
                JSONObject json = (JSONObject)parser.parse(str);
                for (Object tableNm : json.keySet()) {
                    if("INFO".equals((String)tableNm)){
                        Object value = (HashMap)json.get((String)tableNm);
                        if(value instanceof JSONObject){
                            sDlrCd = (String)((JSONObject) value).get("DLR_CD");
                            sType = (String)((JSONObject) value).get("TYPE");//전체 데이터 여부
                            sDate = (String)((JSONObject) value).get("DATE");//날짜
                            if("ALL".equals(sType)){
                                JSONArray tableArr = (JSONArray)((JSONObject) value).get("TABLE_LIST");
                                for(int i=0; i<tableArr.size(); i++){
                                    HashMap<String, Object> deleteMap = new HashMap<String, Object>();
                                    deleteMap.put("dlrCd", sDlrCd);
                                    deleteMap.put("tableNm", (String)tableArr.get(i));
                                    batDmsDataInDAO.deleteData(deleteMap);//딜러정보 삭제
                                    if(tableArr.contains("CR_0101T")){
                                        isRunBM = true;
                                    }
                                }
                            }
                        }
                    }else{
                        Object value = json.get((String)tableNm);
                        if(value instanceof JSONArray) {
                            JSONArray array = (JSONArray)value;
                            for(int i=0; i<array.size(); i++){//Table Rows
                                Object rows = array.get(i);
                                if(rows instanceof JSONObject){
                                    //rows 가 HashMap 으로.
                                    ((JSONObject) rows).remove("RNUM");
                                    dataMap.put("tableNm", tableNm);
                                    dataMap.put("columnMap", rows);
                                    if(tableNm.equals("CR_0101HT") || tableNm.equals("CR_0211HT") || tableNm.equals("CR_0606HT") ){
                                        batDmsDataInDAO.exceInsert(dataMap);
                                    }else{
                                        batDmsDataInDAO.exceMerge(dataMap);
                                    }
                                    dataMap.clear();
                                }
                            }
                        }
                    }
                    /* Batch
                     *
                     *
                    HashMap<String, Object> tableMap = new HashMap<String, Object>();
                    tableMap.put("tableNm", tableNm);
                    tableMap.put("columnList", batDmsDataInDAO.selectDmsDataTableColumn((String)tableNm));
                    if(value instanceof JSONArray) {
                        JSONArray array = (JSONArray)value;
                        ObjectMapper mapper = new ObjectMapper();
                        List<HashMap<String, Object>> list = mapper.readValue(array.toString(), new TypeReference<List<HashMap<String, Object>>>(){});
                        tableMap.put("dataList", list);
                        if(tableNm.equals("CR_0101HT") || tableNm.equals("CR_0211HT") || tableNm.equals("CR_0606HT") ){
                            //batDmsDataInDAO.exceInsert(dataMap);
                        }else{
                            batDmsDataInDAO.exceMergeList(tableMap);
                        }
                    }
                    */
                }
            }
            HashMap<String, Object> historyDataMap = new HashMap<String, Object>();
            historyDataMap.put("dlrCd", sDlrCd);
            historyDataMap.put("fileNm", file.getName());
            historyDataMap.put("allYn", ("ALL".equals(sType))?"Y":"N");
            historyDataMap.put("dmsDataUpDt", sDate);

            batDmsDataInDAO.insertDataInHistory(historyDataMap);
            batDmsDataInDAO.updateDataInLastData(historyDataMap);

            if(isRunBM){//BM 정보 맵핑. I/F 로 전송.
                batDmsDataInDAO.procedureBM(sDlrCd);
            }
        } finally {
            in.close();
        }
    }

    public int selectDmsIFByConditionCnt(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsIFByConditionCnt(map);
    }

    public List<HMap> selectDmsIFByCondition(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsIFByCondition(map);
    }

    public int selectDmsBatByConditionCnt(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsBatByConditionCnt(map);
    }

    public List<HMap> selectDmsBatByCondition(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsBatByCondition(map);
    }

    public List<String> selectDealersByCondition(DealerSearchVO searchVO) throws Exception{
        return batDmsDataInDAO.selectDealersByCondition(searchVO);
    }

    public List<HMap> selectDmsIFCountByCondition(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsIFCountByCondition(map);
    }

    public int selectDmsListByConditionCnt(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsListByConditionCnt(map);
    }

    public List<HMap> selectDmsListByCondition(HashMap<String, Object> map) throws Exception{
        return batDmsDataInDAO.selectDmsListByCondition(map);
    }
}
