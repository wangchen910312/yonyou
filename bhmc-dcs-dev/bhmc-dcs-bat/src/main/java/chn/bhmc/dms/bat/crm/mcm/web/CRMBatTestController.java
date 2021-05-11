package chn.bhmc.dms.bat.crm.mcm.web;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import able.com.vo.HMap;
import able.com.web.HController;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang3.StringUtils;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.cmp.vo.DealerSearchVO;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;

import chn.bhmc.dms.core.datatype.SearchResult;

import chn.bhmc.dms.bat.crm.cmm.service.BatDmsDataInService;
import chn.bhmc.dms.bat.crm.mcm.service.BatMarkingCampaignService;
import chn.bhmc.dms.bat.crm.mcm.vo.BatMarkingCampaignVO;
import chn.bhmc.dms.core.util.DateUtil;

@Controller
public class CRMBatTestController extends HController {

    @Resource(name="batMarkingCampaignService")
    BatMarkingCampaignService batMarkingCampaignService;

    @Resource(name="batDmsDataInService")
    BatDmsDataInService batDmsDataInService;

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 캠페인 대상자 추출 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/mcm/markingCampaignBatchService.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean markingCampaignBatchService() throws Exception {
        BatMarkingCampaignVO batMarkingCampaignVO = new BatMarkingCampaignVO();
        //1. 만족도조사에서 배치를 돌 목록부터 조회한다.
        batMarkingCampaignVO.setDlrCd("A07AA");
        batMarkingCampaignService.multiTargetExtract(batMarkingCampaignVO);
        return true;
    }

    /**
     * 인터페이스 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/mcm/markingCampaignDcsIfBatchService.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean markingCampaignDcsIfBatchService() throws Exception {
        BatMarkingCampaignVO batMarkingCampaignVO = new BatMarkingCampaignVO();
        //1. 만족도조사에서 배치를 돌 목록부터 조회한다.
        batMarkingCampaignService.multiDcsIfCpoy(batMarkingCampaignVO);
        batMarkingCampaignService.multiDcsIfCpoyEAI();
        return true;
    }

    /**
     * 인터페이스 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/dmsDataIfBatchService.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean dmsDataIfBatchService(HttpServletRequest request, @RequestBody HashMap<String, String> map) throws Exception {

        try {
            FilenameFilter fileNameFilter = new FilenameFilter() {
                @Override
                public boolean accept(File dir, String name) {
                   if(name.lastIndexOf('.')>0)
                   {
                      int lastIndex = name.lastIndexOf('.');// get last index for '.' char
                      String str = name.substring(lastIndex);// get extension
                      if(str.equals(".txt") && StringUtils.startsWith(name, "DMSCRMDATA_"))
                      {
                         return true;
                      }
                   }
                   return false;
                }
            };

            String fPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");//"D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH"
            String strYYYYMMDD = map.get("day");
            String strDlrCd = map.get("dlr_cd");
            String todayYYYY = DateUtil.getDate("yyyy");
            String todayMM = DateUtil.getDate("MM");
            String todaydd = DateUtil.getDate("dd");

            if(StringUtils.isNotBlank(strYYYYMMDD) && strYYYYMMDD.length() == 8){
                todayYYYY = strYYYYMMDD.substring(0, 4);
                todayMM = strYYYYMMDD.substring(4, 6);
                todaydd = strYYYYMMDD.substring(6);
            }
            fPath = fPath + "/Data/" + todayYYYY+"/"+ todayMM+"/"+ todaydd;
            File dir = new File(fPath);
            if(dir.isDirectory() && dir.exists()){
                if(StringUtils.isNotBlank(strDlrCd)){
                    File[] paths = dir.listFiles();
                    for(File path:paths){
                        //System.out.println("fname::"+path.getName());
                        if(path.getName().startsWith("DMSCRMDATA_"+strDlrCd)){
                            batDmsDataInService.readFilesUpsert(path);
                            if(path.getName().endsWith(".txt")){
                                path.renameTo(new File(path.getPath()+".bak"));
                            }
                        }
                    }
                }else{
                    File[] paths = dir.listFiles(fileNameFilter);
                    for(File path:paths)
                    {
                        batDmsDataInService.readFilesUpsert(path);
                        path.renameTo(new File(path.getPath()+".bak"));
                    }
                }
            }else{
                throw new JobExecutionException("no File:"+fPath, null);
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }

        return true;
    }

    /**
     *
     * @return
     */
    @RequestMapping(value = "/crm/cmm/selectCrmTempMain.do", method = RequestMethod.GET)
    public String selectCrmTempMain(Model model) throws Exception {

        //배치수행상태
        //List<CommonCodeVO> batOperRsltCdList = commonCodeService.selectCommonCodesByCmmGrpCd("COM003", null, LocaleContextHolder.getLocale().getLanguage());
        //model.addAttribute("batOperRsltCdList", batOperRsltCdList);
        String sysDate = DateUtil.getDate("YYYYMMdd");
        model.addAttribute("sOpenToDt", sysDate);

        return "/crm/cmm/selectCrmTempMain";
    }

    /**
     * 인터페이스 배치
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/selectDmsDataFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsDataFile(HttpServletRequest request, @RequestBody HashMap<String, String> map) throws Exception {
        List<HashMap<String, Object>> fileList = new ArrayList<HashMap<String, Object>>();
        SearchResult result = new SearchResult();
        try {
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

            String fPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");//"D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH"
            String strYYYYMMDD = map.get("day");
            String todayYYYY = DateUtil.getDate("yyyy");
            String todayMM = DateUtil.getDate("MM");
            String todaydd = DateUtil.getDate("dd");


            String strReadFileYn = StringUtils.defaultString(map.get("readFileYn"), "");
            String strAllYn = StringUtils.defaultString(map.get("allYn"), "");
            if(StringUtils.isNotBlank(strYYYYMMDD) && strYYYYMMDD.length() == 8){
                todayYYYY = strYYYYMMDD.substring(0, 4);
                todayMM = strYYYYMMDD.substring(4, 6);
                todaydd = strYYYYMMDD.substring(6);
            }

            fPath = fPath + "/Data/" + todayYYYY+"/"+ todayMM+"/"+ todaydd;
            File dir = new File(fPath);
            if(dir.isDirectory() && dir.exists()){
                File[] paths = dir.listFiles(fileNameFilter);
                for(File path:paths)
                {
                    //DMSCRMDATA_D0103_093150_ALL_CR_0116T.txt
                    HashMap<String, Object> fInfoMap = new HashMap<String, Object>();
                    fInfoMap.put("dlrCd", path.getName().substring(11, 16));
                    fInfoMap.put("regTime", path.getName().substring(17, 23));
                    fInfoMap.put("fName", path.getName());
                    fInfoMap.put("fSize", path.length());
                    fInfoMap.put("fExt", path.getName().substring(path.getName().indexOf(".", -1)+1));

                    boolean isIn = false;

                    if("Y".equals(strReadFileYn) && "txt.bak".equals(fInfoMap.get("fExt"))){
                        isIn = true;
                    }
                    if("N".equals(strReadFileYn) && "txt".equals(fInfoMap.get("fExt"))){
                        isIn = true;
                    }
                    if("Y".equals(strAllYn) && path.getName().indexOf("ALL_null") != -1){
                        isIn = true;
                    }
                    if("N".equals(strAllYn) && path.getName().indexOf("ALL_null") == -1){
                        isIn = true;
                    }
                    if(StringUtils.isBlank(strReadFileYn)&&StringUtils.isBlank(strAllYn)){
                        isIn = true;
                    }

                    if(isIn){
                        fileList.add(fInfoMap);
                    }
                }
            }
            result.setTotal(fileList.size());
            if (result.getTotal() != 0) {
                Collections.sort(fileList, new Comparator<HashMap<String, Object>>() {
                    @Override
                    public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
                        int dlrCd1 = NumberUtils.toInt(((String)o1.get("dlrCd")).substring(1));
                        int dlrCd2 = NumberUtils.toInt(((String)o2.get("dlrCd")).substring(1));

                        return (dlrCd1 == dlrCd1)?0:((dlrCd1 > dlrCd2)?1:-1);
                    }
                });

                result.setData(fileList);
            }
        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
        return result;
    }

    @RequestMapping(value = "/bat/crm/cmm/selectDmsDataFileDealer.do", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, List<String>> selectDmsDataFileDealer(HttpServletRequest request, @RequestBody HashMap<String, String> map) throws Exception {
        HashMap<String, List<String>> result = new HashMap<String, List<String>>();
        List<String> noReadFileDlrCd = new ArrayList<String>();
        List<String> allDataFileDlrCd = new ArrayList<String>();
        List<String> fileDlrCd = new ArrayList<String>();

        try {
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

            String fPath = request.getServletContext().getInitParameter("FILE_UPLOAD_PATH");//"D:/data/webapps/BHMC-DMS-WEB/FILE_UPLOAD_PATH"
            String strYYYYMMDD = map.get("day");
            String todayYYYY = DateUtil.getDate("yyyy");
            String todayMM = DateUtil.getDate("MM");
            String todaydd = DateUtil.getDate("dd");

            if(StringUtils.isNotBlank(strYYYYMMDD) && strYYYYMMDD.length() == 8){
                todayYYYY = strYYYYMMDD.substring(0, 4);
                todayMM = strYYYYMMDD.substring(4, 6);
                todaydd = strYYYYMMDD.substring(6);
            }

            fPath = fPath + "/Data/" + todayYYYY+"/"+ todayMM+"/"+ todaydd;
            File dir = new File(fPath);
            if(dir.isDirectory() && dir.exists()){
                File[] paths = dir.listFiles(fileNameFilter);
                for(File path:paths)
                {
                    String fDlrCd = path.getName().substring(11, 16);
                    fileDlrCd.add(fDlrCd);
                    String fExt = path.getName().substring(path.getName().indexOf(".", -1)+1);
                    if("txt".equals(fExt)){
                        noReadFileDlrCd.add(fDlrCd);
                    }
                    if(path.getName().indexOf("ALL_null") > 0){
                        allDataFileDlrCd.add(fDlrCd);
                    }
                }
            }

            DealerSearchVO searchVO = new DealerSearchVO();
            searchVO.setsOpenDt(todayYYYY+todayMM+todaydd);
            searchVO.setsDlrCdList(fileDlrCd);
            result.put("noFileDlrCd", batDmsDataInService.selectDealersByCondition(searchVO));
            result.put("noReadFileDlrCd", noReadFileDlrCd);
            result.put("allDataFileDlrCd", allDataFileDlrCd);

        } catch (Exception e){
            throw new JobExecutionException(e.getMessage(), e);
        }
        return result;
    }

    /**
     * DMS 인터페이스 현황
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/selectDmsIF.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsIF(HttpServletRequest request, @RequestBody HashMap<String, Object> map) throws Exception {
        if(map.get("pageIndex") == null ){
            map.put("pageIndex", 1);
        }
        if(map.get("pageSize") == null ){
            map.put("pageSize", 10);
        }
        if(map.get("firstIndex") == null ){
            map.put("firstIndex", -1);
        }
        if(map.get("lastIndex") == null ){
            map.put("lastIndex", -1);
        };
        if(map.get("recordCountPerPage") == null ){
            map.put("recordCountPerPage", 10);
        };

        if(StringUtils.isNotBlank((String)map.get("sDlrCdIn"))){
            String arrDlrCdListIn[] = ((String)map.get("sDlrCdIn")).split(",");
            List<String> sDlrCdListIn = new ArrayList<String>();
            for(int i=0; i<arrDlrCdListIn.length; i++){
                if(StringUtils.isNotBlank(arrDlrCdListIn[i])){
                    sDlrCdListIn.add(arrDlrCdListIn[i]);
                }
            }
            if(sDlrCdListIn != null && sDlrCdListIn.size() > 0){
                map.put("sDlrCdListIn", sDlrCdListIn);
            }
        }
        if(StringUtils.isNotBlank((String)map.get("sDlrCdNotIn"))){
            String arrDlrCdListNotIn[] = ((String)map.get("sDlrCdNotIn")).split(",");
            List<String> sDlrCdListNotIn = new ArrayList<String>();
            for(int i=0; i<arrDlrCdListNotIn.length; i++){
                if(StringUtils.isNotBlank(arrDlrCdListNotIn[i])){
                    sDlrCdListNotIn.add(arrDlrCdListNotIn[i]);
                }
            }
            if(sDlrCdListNotIn != null && sDlrCdListNotIn.size() > 0){
                map.put("sDlrCdListNotIn", sDlrCdListNotIn);
            }
        }

        SearchResult result = new SearchResult();
        result.setTotal(batDmsDataInService.selectDmsIFByConditionCnt(map));
        if (result.getTotal() != 0) {
            result.setData(batDmsDataInService.selectDmsIFByCondition(map));
        }
        return result;
    }

    /**
     * DMS 인터페이스 현황
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/selectDmsIFCount.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsIFCount(HttpServletRequest request, @RequestBody HashMap<String, Object> map) throws Exception {
        if(map.get("pageIndex") == null ){
            map.put("pageIndex", 1);
        }
        if(map.get("pageSize") == null ){
            map.put("pageSize", 10);
        }
        if(map.get("firstIndex") == null ){
            map.put("firstIndex", -1);
        }
        if(map.get("lastIndex") == null ){
            map.put("lastIndex", -1);
        };
        if(map.get("recordCountPerPage") == null ){
            map.put("recordCountPerPage", 10);
        };

        if(StringUtils.isNotBlank((String)map.get("sDlrCdIn"))){
            String arrDlrCdListIn[] = ((String)map.get("sDlrCdIn")).split(",");
            List<String> sDlrCdListIn = new ArrayList<String>();
            for(int i=0; i<arrDlrCdListIn.length; i++){
                if(StringUtils.isNotBlank(arrDlrCdListIn[i])){
                    sDlrCdListIn.add(arrDlrCdListIn[i]);
                }
            }
            if(sDlrCdListIn != null && sDlrCdListIn.size() > 0){
                map.put("sDlrCdListIn", sDlrCdListIn);
            }
        }
        if(StringUtils.isNotBlank((String)map.get("sDlrCdNotIn"))){
            String arrDlrCdListNotIn[] = ((String)map.get("sDlrCdNotIn")).split(",");
            List<String> sDlrCdListNotIn = new ArrayList<String>();
            for(int i=0; i<arrDlrCdListNotIn.length; i++){
                if(StringUtils.isNotBlank(arrDlrCdListNotIn[i])){
                    sDlrCdListNotIn.add(arrDlrCdListNotIn[i]);
                }
            }
            if(sDlrCdListNotIn != null && sDlrCdListNotIn.size() > 0){
                map.put("sDlrCdListNotIn", sDlrCdListNotIn);
            }
        }
        SearchResult result = new SearchResult();
        List<HMap> list = batDmsDataInService.selectDmsIFCountByCondition(map);
        result.setTotal((list == null)?0:list.size());
        if (result.getTotal() != 0) {
            result.setData(list);
        }
        return result;
    }

    /**
     * DMS 배치 현황
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/selectDmsBat.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsBat(HttpServletRequest request, @RequestBody HashMap<String, Object> map) throws Exception {
        if(map.get("pageIndex") == null ){
            map.put("pageIndex", 1);
        }
        if(map.get("pageSize") == null ){
            map.put("pageSize", 10);
        }
        if(map.get("firstIndex") == null ){
            map.put("firstIndex", -1);
        }
        if(map.get("lastIndex") == null ){
            map.put("lastIndex", -1);
        };
        if(map.get("recordCountPerPage") == null ){
            map.put("recordCountPerPage", 10);
        };

        SearchResult result = new SearchResult();
        result.setTotal(batDmsDataInService.selectDmsBatByConditionCnt(map));
        if (result.getTotal() != 0) {
            result.setData(batDmsDataInService.selectDmsBatByCondition(map));
        }
        return result;
    }

    /**
     * DMS 목록
     * @return
     */
    @RequestMapping(value = "/bat/crm/cmm/selectDmsList.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectDmsList(HttpServletRequest request, @RequestBody HashMap<String, Object> map) throws Exception {
        SearchResult result = new SearchResult();
        result.setTotal(batDmsDataInService.selectDmsListByConditionCnt(map));
        if (result.getTotal() != 0) {
            result.setData(batDmsDataInService.selectDmsListByCondition(map));
        }
        return result;
    }
}