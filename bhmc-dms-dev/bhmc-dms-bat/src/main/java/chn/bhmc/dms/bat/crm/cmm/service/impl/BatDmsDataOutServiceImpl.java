package chn.bhmc.dms.bat.crm.cmm.service.impl;

import java.io.File;
import java.io.FilenameFilter;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.crm.cmm.vo.BatDcsDataInVO;
import chn.bhmc.dms.bat.crm.mcm.service.dao.BatMarkingCampaignDAO;
import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataOutService;
import chn.bhmc.dms.bat.crm.cmm.service.dao.BatDmsDataOutDAO;

import chn.bhmc.dms.core.support.camel.Data;
import chn.bhmc.dms.core.support.camel.CamelClient;
import chn.bhmc.dms.core.support.camel.CamelClientFactory;
import chn.bhmc.dms.core.util.DateUtil;

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
@Service("batDmsDataOutService")
public class BatDmsDataOutServiceImpl extends HService implements BatDmsDataOutService {
    /**
     * DAO
     */
    @Resource(name="batDmsDataOutDAO")
    BatDmsDataOutDAO batDmsDataOutDAO;

    /**
     * 캠페인 배치 DAO
     */
    @Resource(name="batMarkingCampaignDAO")
    BatMarkingCampaignDAO batMarkingCampaignDAO;

    /**
     * camelClient
     */
    @Resource(name="camelClientFactory")
    CamelClientFactory camelClientFactory;

    /*
     * @see chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataOutServiceImpl#selectDmsData
     * strDay : ALL - 해당테이이블 모든 데이터 , 숫자 - 예)2 - 2틀전부터 현재까지 수정된 데이터
     * strTable : 테이블번호 - 특정테이블만,  null - CRM 모든 테이블
     */
    @Override
    public void selectDmsData(String fPath, String strDay, String strTable) throws Exception{
        //서버의 Dealer 목록
        List<HashMap<String,Object>> dlrCdList = null;
        HashMap<String, String> sDlrMap = new HashMap<String, String>();
        if(batMarkingCampaignDAO.selectSysOwnerDlrCdCnt() == 1){
            sDlrMap.put("sysOwnDlrYn", "Y");
            dlrCdList = batDmsDataOutDAO.selectDlrCd(sDlrMap);
        }else{
            sDlrMap.put("sysOwnDlrYn", "N");
            dlrCdList = batDmsDataOutDAO.selectDlrCd(sDlrMap);
        }

        FilenameFilter fileNameFilter = new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
               if(name.lastIndexOf('.')>0)
               {
                  //int lastIndex = name.lastIndexOf('.');// get last index for '.' char
                  //String str = name.substring(lastIndex);// get extension
                  if(StringUtils.startsWith(name, "DMSCRMDATA_"))
                  {
                     return true;
                  }
               }
               return false;
            }
        };

        for(int z=0; z < ((dlrCdList == null)?0:dlrCdList.size()); z++){
            String dlrCd = (String)dlrCdList.get(z).get("DLR_CD");

            //1. 금일 파일이 생성됐는지 확인
            File dir = new File(fPath + "/Data/" + DateUtil.getDate("yyyy")+"/"+ DateUtil.getDate("MM")+"/"+ DateUtil.getDate("dd"));
            if(!dir.exists()){
                dir.mkdirs();
            }
            File[] paths = dir.listFiles(fileNameFilter);
            boolean isFile = false;

            for(File path:paths)
            {
                if(dlrCd.equals(path.getName().substring(11, 16))){
                    isFile = true;
                }
            }
            if(!isFile){
                //2. 파일이 없다면 dcs와 i/f 로 확인
                //   i/f 가 실패한다면 파일생성이 되지 않음.
                BatDcsDataInVO dcsDataInVo = selectDCSFileReadDate(dlrCd);//dcs와 인터페이스

                if("N".equals(dcsDataInVo.getoAllYn())){ // DCS에 ALL데이터가 안올라간 경우
                    strDay = "ALL";
                    strTable = null;
                }else{ // DCS에 입력된 날짜 - 현재일
                    strDay = String.valueOf(DateUtil.daysBetween(DateUtil.convertToDate(dcsDataInVo.getoDmsDataUpDt(), "yyyyMMdd")
                                                                , DateUtil.convertToDate(DateUtil.getDate("yyyyMMdd"), "yyyyMMdd")));
                }
                if("ALL".equals(strDay) && StringUtils.isBlank(strTable)){
                    HashMap<String, String> map = new HashMap<String, String>();
                    map.put("dlrCd", (String)dlrCdList.get(z).get("DLR_CD"));
                    batDmsDataOutDAO.updateCrmDataUpDt(map);
                }
                strDay = StringUtils.defaultIfEmpty(strDay, "1");
                makeFile(dlrCd, (Date)dlrCdList.get(z).get("CRM_DATA_UP_DT"), strDay, strTable, fPath);
            }
        }
    }

    @SuppressWarnings("unchecked")
    private void makeFile(String dlrCd, Date dataUpDt, String strDay, String strTable, String fPath) throws Exception{
        ArrayList<String> tableArr = new ArrayList<String>();
        tableArr.add("CR_0101T");
        tableArr.add("CR_0103T");
        tableArr.add("CR_0111T");
        tableArr.add("CR_0114T");
        tableArr.add("CR_0115T");
        tableArr.add("CR_0116T");
        tableArr.add("CR_0211T");
        tableArr.add("CR_0213T");
        tableArr.add("CR_0214T");
        tableArr.add("CR_0215T");
        tableArr.add("CR_0216T");
        tableArr.add("CR_0217T");
        tableArr.add("CR_0218T");
        tableArr.add("CR_0221T");
        tableArr.add("CR_0222T");
        tableArr.add("CR_0223T");
        tableArr.add("CR_0306T");
        tableArr.add("CR_0401T");
        tableArr.add("CR_0402T");
        tableArr.add("CR_0403T");
        tableArr.add("CR_0501T");
        tableArr.add("CR_0502T");
        tableArr.add("CR_0601T");
        tableArr.add("CR_0602T");
        tableArr.add("CR_0606T");
        tableArr.add("CR_0607T");
        tableArr.add("CR_0701T");
        tableArr.add("CR_0703T");
        tableArr.add("CR_0705T");
        tableArr.add("CR_0710T");
        tableArr.add("CR_0711T");
        tableArr.add("CR_0712T");
        tableArr.add("CR_0801T");
        tableArr.add("CR_0803T");
        tableArr.add("CR_0804T");
        tableArr.add("CR_0805T");
        tableArr.add("CR_0806T");
        tableArr.add("CR_0807T");
        tableArr.add("CR_0808T");
        tableArr.add("CR_0812T");
        tableArr.add("CR_0813T");
        tableArr.add("CR_0817T");
        tableArr.add("CR_0819T");
        tableArr.add("CR_0820T");
        tableArr.add("CR_0821T");
        tableArr.add("CR_0822T");
        tableArr.add("CR_0823T");
        tableArr.add("CR_0824T");
        tableArr.add("CR_0825T");
        tableArr.add("CR_0826T");
        tableArr.add("CR_0902T");
        tableArr.add("CR_0903T");
        tableArr.add("CR_0904T");
        tableArr.add("CR_0905T");
        tableArr.add("CR_0827T");
        tableArr.add("CR_0828T");
        tableArr.add("CR_0901T");
        tableArr.add("CR_0906T");
        tableArr.add("CR_1001T");
        tableArr.add("CR_1002T");
        if(StringUtils.isNotBlank(strTable) && tableArr.contains(strTable)){
            tableArr.clear();
            tableArr.add(strTable);
        }else if(StringUtils.isNotBlank(strTable) && !tableArr.contains(strTable)){//테이블명이 잘못써진 경우. 이런경우 에러 발생.
            throw processException("global.info.check.input");
        }
        //"CR_0101HT","CR_0211HT","CR_0606HT"
        File outFile = null;
        File fileD = new File(fPath+"/Data");
        HashMap<String, List<HashMap<String, String>>> tableColumnListMap = new HashMap<String, List<HashMap<String, String>>>();
        String fileNm = "DMSCRMDATA_"+dlrCd+"_"+DateUtil.getDate("HHmmss")+"_"+strDay+"_"+strTable+".txt";//"DMSCRMDATA_"+dlrCd+"_"+DateUtil.getDate("HHmmss")+"_"+RandomStringUtils.randomAlphanumeric(4)+".txt";
        String todayYYYY = DateUtil.getDate("yyyy");
        String todayMM = DateUtil.getDate("MM");
        String todaydd = DateUtil.getDate("dd");

        if(!fileD.exists()){
            fileD.mkdirs();
        }
        if(fileD.exists()){
            File todayDir = new File(fileD.getPath() + "/" + todayYYYY+"/"+ todayMM+"/"+ todaydd);
            if(!todayDir.exists()){
                todayDir.mkdirs();
            }
            if(!StringUtil.isEmpty(fileNm)){
                outFile = new File(todayDir.getPath() + "/" + fileNm);
            }
            if(outFile.exists()){
                outFile.delete();
            }
            //Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8"));
            RandomAccessFile out = new RandomAccessFile(outFile, "rw");
            JSONObject json = new JSONObject();

            String strDATE = DateUtil.convertToString(DateUtils.addDays(DateUtil.convertToDate(DateUtil.getDate("yyyyMMdd"), "yyyyMMdd"), -1), "yyyyMMdd");

            String strInfo = "{\"INFO\":{\"DLR_CD\":\""+dlrCd+"\",\"TYPE\":\"\",\"DATE\":\""+strDATE+"\"}}";
            if("ALL".equals(strDay)){
                strInfo = "{\"INFO\":{\"DLR_CD\":\""+dlrCd+"\",\"TYPE\":\"ALL\",\"DATE\":\""+strDATE+"\",\"TABLE_LIST\":"+JSONArray.toJSONString(tableArr)+"}}";
            }
            out.write(strInfo.getBytes());
            out.write(("\r\n").getBytes());

            try{
                for(int i=0; i<tableArr.size(); i++){
                    List<HashMap<String, String>> columnList = null;
                    if(tableColumnListMap.containsKey(tableArr.get(i))){
                        columnList = tableColumnListMap.get(tableArr.get(i));
                    }else{
                        columnList = batDmsDataOutDAO.selectDmsDataTableColumn(tableArr.get(i));
                        tableColumnListMap.put(tableArr.get(i), columnList);
                    }
                    if(columnList != null && columnList.size() > 0){
                        HashMap<String, Object> tables = new HashMap<String, Object>();
                        tables.put("tableNm", tableArr.get(i));
                        tables.put("columnList", columnList);
                        tables.put("dlrCd", dlrCd);
                        tables.put("openDt", dataUpDt);
                        tables.put("sDay", strDay);

                        int allCnt = batDmsDataOutDAO.selectDmsDataTableCnt(tables);
                        int rowCnt = 1000; //5천개 이상일 경우 나눠서 가져올것.
                        if(allCnt > rowCnt){
                            int cnt = allCnt / rowCnt;
                            for(int j=0; j<cnt; j++){
                                tables.put("firstIndex", j*rowCnt);
                                tables.put("lastIndex", (j+1)*rowCnt);
                                setData(tables, out, json);
                            }
                            if(allCnt % rowCnt > 0){
                                tables.put("firstIndex", cnt*rowCnt);
                                tables.put("lastIndex", allCnt+1);
                                setData(tables, out, json);
                            }
                        }else if(allCnt != 0 && allCnt < rowCnt){
                            tables.put("firstIndex", 0);
                            tables.put("lastIndex", allCnt);
                            setData(tables, out, json);
                        }
                    }
                }
            } finally {
                out.close();
            }

            File fileQD = new File(fPath+"/Queue");
            if(!fileQD.exists()){
                fileQD.mkdirs();
            }

            File fileQ = new File(fPath+"/Queue"+ "/" + todayYYYY+todayMM+todaydd+ "_" + fileNm);
            fileQ.createNewFile();
        }
    }

    //private void setData(HashMap<String, Object> tables, Writer out, JSONObject json) throws Exception{
    @SuppressWarnings("unchecked")
    private void setData(HashMap<String, Object> tables, RandomAccessFile out, JSONObject json) throws Exception{
        List<HashMap<String, Object>> tData = batDmsDataOutDAO.selectDmsDataTable(tables);
        json.put(tables.get("tableNm"), tData);
        out.write((json.toJSONString()).getBytes());
        out.write(("\r\n").getBytes());
        json.clear();
        //printOutMemoryUsage();
    }

    /*
    @SuppressWarnings("unused")
    private void printOutMemoryUsage() {
        Runtime runtime = Runtime.getRuntime();

        NumberFormat format = NumberFormat.getInstance();

        StringBuilder sb = new StringBuilder();
        long maxMemory = runtime.maxMemory();
        long allocatedMemory = runtime.totalMemory();
        long freeMemory = runtime.freeMemory();

        sb.append("free memory: " + format.format(freeMemory / 1024) + " ");
        sb.append("allocated memory: " + format.format(allocatedMemory / 1024) + " ");
        sb.append("max memory: " + format.format(maxMemory / 1024) + " ");
        sb.append("total free memory: "
                + format.format((freeMemory + (maxMemory - allocatedMemory)) / 1024)
                + "<br/>");
        System.out.println(sb);
    }*/

    @Override
    public void selectIF() throws Exception{
        HashMap<String,String> param = new HashMap<String,String>();
        batDmsDataOutDAO.selecIF(param);
    }

    private BatDcsDataInVO selectDCSFileReadDate(String dlrCd) throws Exception{
        HashMap<String, Object> message = new HashMap<String, Object>();
        message.put("I_DLR_CD", dlrCd);

        CamelClient camelClient = camelClientFactory.createCamelClient();
        camelClient.setIfId("CRM");           // service id
        camelClient.setSender(dlrCd);
        camelClient.addSendMessage(message);
        camelClient.setIfId("CRM120");
        Data receiveData = camelClient.sendRequest();
        BatDcsDataInVO result = new BatDcsDataInVO();

        if("E".equals(receiveData.getFooter().getIfResult())){
            throw processException("global.err.dcsIfErrMsg", new String[] { receiveData.getFooter().getIfResult(), receiveData.getFooter().getIfFailMsg() });
        }else{
            result = receiveData.readMessage(BatDcsDataInVO.class);
            /** imsi
            result.setoAllYn("Y");
            result.setoDmsDataUpDt("20180520");
            result.setoStatCd("S");**/
            if("F".equals(result.getoStatCd())){
                throw processException("global.err.dcsIfErrMsg", new String[] { result.getoStatCd(), result.getoMesgCont() });
            }
        }
        return result;
    }
}
