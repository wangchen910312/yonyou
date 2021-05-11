package chn.bhmc.dms.crm.css.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import able.com.web.HController;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.ibm.icu.util.Calendar;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.eai.EaiClient;
import chn.bhmc.dms.core.support.eai.EaiSimpleMessage;
import chn.bhmc.dms.core.support.eai.schema.CommDMSDoc;
import chn.bhmc.dms.core.support.excel.ExcelDataBindingException;
import chn.bhmc.dms.core.support.excel.ExcelReader;
import chn.bhmc.dms.core.support.excel.ExcelUploadStatus;
import chn.bhmc.dms.crm.css.service.SatisFactionResultMgmtService;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultDtlMgmtVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtSearchVO;
import chn.bhmc.dms.crm.css.vo.SatisFactionResultMgmtVO;

/**
 * 만족도조사 결과관리 컨트롤러
 *
 * @author Kim Hyun Ho
 * @since 2016. 03. 11.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.03.11         LEE Kyo Jin            최초 생성
 * </pre>
 */


@Controller
public class SatisFactionResultMgmtController extends HController {


    /**
     * 만족도조사결과관리 서비스
     */
    @Resource(name="satisFactionResultMgmtService")
    SatisFactionResultMgmtService satisFactionResultMgmtService;

    @Resource(name="eaiClient")
    EaiClient eaiClient;

    /**
     * 만족도조사결과 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmtMain.do", method = RequestMethod.GET)
    public String selectSatisFactionResultMgmtMain(Model model) throws Exception {

        return "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmtMain";
    }

    /**
     * 만족도조사결과 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectSatisFactionResultMgmt(@RequestBody SatisFactionResultMgmtSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        /******************************************
         *** 날짜 검색 조건 시작 ( 날짜 검색 조건이 있는경우 )
         ******************************************/
        if (searchVO.getsRegDtFrom() != null || searchVO.getsRegDtTo() != null) {
            Calendar startCal = Calendar.getInstance();
            Calendar endCal = Calendar.getInstance();

            int year;
            int month;
            int day;

            // 시작일
            startCal.setTime(searchVO.getsRegDtFrom());
            year = startCal.get(Calendar.YEAR);
            month = startCal.get(Calendar.MONTH);
            day = startCal.get(Calendar.DATE);
            startCal.set(year, month, day, 00, 00, 00);
            searchVO.setsRegDtFrom(startCal.getTime());

            // 종료일
            endCal.setTime(searchVO.getsRegDtTo());
            year = endCal.get(Calendar.YEAR);
            month = endCal.get(Calendar.MONTH);
            day = endCal.get(Calendar.DATE);
            endCal.set(year, month, day, 23, 59, 59);
            searchVO.setsRegDtTo(endCal.getTime());
        }
        /******************************************
         *** 날짜 검색 조건 끝 ***********************
         ******************************************/

        result.setTotal(satisFactionResultMgmtService.selectSatisFactionResultMgmtByConditionCnt(searchVO));

        if (result.getTotal() != 0) {
            result.setData(satisFactionResultMgmtService.selectSatisFactionResultMgmtByCondition(searchVO));
        }

        return result;
    }

    /**
     * 만족도조사결과 목록을 수정한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/multiSatisFactionResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean multiSatisFactionResultMgmt(@Validated @RequestBody BaseSaveVO<SatisFactionResultMgmtVO> saveVO) throws Exception {

        satisFactionResultMgmtService.multiSatisFactionResultMgmt(saveVO);
        return true;
    }

    /**
     * 만족도조사결과 목록을 수정한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/updateSatisFactionResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateSatisFactionResultMgmt(@Validated @RequestBody SatisFactionResultMgmtVO saveVO) throws Exception {

        return satisFactionResultMgmtService.updateSatisFactionResultMgmt(saveVO);
    }

    /**
     * 만족도조사결과 배포한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultMgmtVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/updateDistSatisFactionResultMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public int updateDistSatisFactionResultMgmt(@Validated @RequestBody SatisFactionResultMgmtVO saveVO) throws Exception {

        //프로시저 호출
        satisFactionResultMgmtService.selectSatisFactionDcsIfCopy(saveVO);

        //EAI 호출
        CommDMSDoc reqCommDMSDoc1 = new EaiSimpleMessage.Builder()
                                    .ifId("CRM418")
                                    .company("H")
                                    .sender("CRM")
                                    .build()
                                    .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc1);

        CommDMSDoc reqCommDMSDoc2 = new EaiSimpleMessage.Builder()
                                    .ifId("CRM419")
                                    .company("H")
                                    .sender("CRM")
                                    .build()
                                    .buildCommDMSDoc();
        eaiClient.sendRequest(reqCommDMSDoc2);

        saveVO.setDistDt(new java.util.Date());
        return satisFactionResultMgmtService.updateSatisFactionResultMgmt(saveVO);
    }

    /**
     * 만족도조사결과 상세 목록을 조회 한다.
     *
     * @param searchVO
     *            - 조회 조건을 포함하는 SatisFactionResultDtlMgmtSearchVO
     * @param model
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultDtlMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SatisFactionResultDtlMgmtVO selectSatisFactionResultDtlMgmt(@RequestBody SatisFactionResultDtlMgmtSearchVO searchVO) throws Exception {

        /**
         * columnList : 헤더 조회
         * dataSet    : 데이터 조회
         */
        SatisFactionResultDtlMgmtVO result = new SatisFactionResultDtlMgmtVO();
        result.setTotal(satisFactionResultMgmtService.selectSatisFactionResultDtlMgmtByConditionCnt(searchVO) );

        if (result.getTotal() != 0) {
            Map<String, List> map = satisFactionResultMgmtService.selectSatisFactionResultDtlDataSetMgmtByCondition(searchVO);

            result.setData( map.get("dataSet") );
            result.setColumnList( map.get("columnList") );
        }
/*
        Map<String, List<SatisFactionResultDtlMgmtVO>> map = satisFactionResultMgmtService.selectSatisFactionResultDtlDataSetMgmtByCondition(searchVO);

        SatisFactionResultDtlMgmtVO result = new SatisFactionResultDtlMgmtVO();

        result.setTotal(satisFactionResultMgmtService.selectSatisFactionResultDtlMgmtByConditionCnt(searchVO));
        result.setData( map.get("dataSet") );
        result.setColumnList( map.get("columnList") );
*/

        return result;
    }

    /**
     * 만족도조사결과 업로드 팝업
     *
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/selectSatisFactionResultExcelUploadPopup.do", method = RequestMethod.GET)
    public String selectSatisFactionResultExcelUploadPopup(Model model) throws Exception {

        return "/crm/css/satisFactionResultManage/selectSatisFactionResultExcelUploadPopup";
    }

    @RequestMapping(value = "/crm/css/satisFactionResultManage/insertSatisFactionResultUploadFile.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult insertSatisFactionResultUploadFile(
            @RequestParam("uploadFile") MultipartFile uploadFile,
            @RequestParam("progressId") String progressId,
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        SearchResult result = new SearchResult();
        List<SatisFactionResultDtlMgmtVO> list = new ArrayList<SatisFactionResultDtlMgmtVO>();
        ExcelUploadStatus status = new ExcelUploadStatus();

        //업로드상태 정보를 세션에 저장한다.
        WebUtils.setSessionAttribute(request, progressId, status);

        if(uploadFile.getSize() > 0){

            try{
                ExcelReader<SatisFactionResultDtlMgmtVO> excelReader = new ExcelReader<SatisFactionResultDtlMgmtVO>(SatisFactionResultDtlMgmtVO.class, uploadFile.getInputStream(), 0);
                excelReader.setMessageSource(messageSource);
                //excelReader.setSkipRows(0);
                list = excelReader.readExcelData(status);

                String title = uploadFile.getOriginalFilename();//list.get(0).getCol0();
                //String columnCnt = list.get(0).getCol1();

                ArrayList<String> colNmArray = new ArrayList<String>();
                ArrayList<String> dataArray = new ArrayList<String>();
                String prevColNm = "";
                String nextColNm = "";
                int colCnt = 0;
                int i = 0;
                int v = 0;

                List<SatisFactionResultDtlMgmtVO> resultList = new ArrayList<SatisFactionResultDtlMgmtVO>();
                SatisFactionResultDtlMgmtVO vo = new SatisFactionResultDtlMgmtVO();

                vo.setHeaderCont("title");
                vo.setVal(title);
                resultList.add(vo);

                for (int j=0 ; j < list.size() ; j++) {

                    if (j==0) {
                        colNmArray.add(list.get(j).getCol0());
                        colNmArray.add(list.get(j).getCol1());
                        colNmArray.add(list.get(j).getCol2());
                        colNmArray.add(list.get(j).getCol3());
                        colNmArray.add(list.get(j).getCol4());
                        colNmArray.add(list.get(j).getCol5());
                        colNmArray.add(list.get(j).getCol6());
                        colNmArray.add(list.get(j).getCol7());
                        colNmArray.add(list.get(j).getCol8());
                        colNmArray.add(list.get(j).getCol9());
                        colNmArray.add(list.get(j).getCol10());
                        colNmArray.add(list.get(j).getCol11());
                        colNmArray.add(list.get(j).getCol12());
                        colNmArray.add(list.get(j).getCol13());
                        colNmArray.add(list.get(j).getCol14());
                        colNmArray.add(list.get(j).getCol15());
                        colNmArray.add(list.get(j).getCol16());
                        colNmArray.add(list.get(j).getCol17());
                        colNmArray.add(list.get(j).getCol18());
                        colNmArray.add(list.get(j).getCol19());
                        colNmArray.add(list.get(j).getCol20());
                        colNmArray.add(list.get(j).getCol21());
                        colNmArray.add(list.get(j).getCol22());
                        colNmArray.add(list.get(j).getCol23());
                        colNmArray.add(list.get(j).getCol24());
                        colNmArray.add(list.get(j).getCol25());
                        colNmArray.add(list.get(j).getCol26());
                        colNmArray.add(list.get(j).getCol27());
                        colNmArray.add(list.get(j).getCol28());
                        colNmArray.add(list.get(j).getCol29());
                        colNmArray.add(list.get(j).getCol30());
                        colNmArray.add(list.get(j).getCol31());
                        colNmArray.add(list.get(j).getCol32());
                        colNmArray.add(list.get(j).getCol33());
                        colNmArray.add(list.get(j).getCol34());
                        colNmArray.add(list.get(j).getCol35());
                        colNmArray.add(list.get(j).getCol36());
                        colNmArray.add(list.get(j).getCol37());
                        colNmArray.add(list.get(j).getCol38());
                        colNmArray.add(list.get(j).getCol39());
                        colNmArray.add(list.get(j).getCol40());
                        colNmArray.add(list.get(j).getCol41());
                        colNmArray.add(list.get(j).getCol42());
                        colNmArray.add(list.get(j).getCol43());
                        colNmArray.add(list.get(j).getCol44());
                        colNmArray.add(list.get(j).getCol45());
                        colNmArray.add(list.get(j).getCol46());
                        colNmArray.add(list.get(j).getCol47());
                        colNmArray.add(list.get(j).getCol48());
                        colNmArray.add(list.get(j).getCol49());
                        colNmArray.add(list.get(j).getCol50());

                        for(i = 0 ; i <= colNmArray.size() ; i++) {
                            nextColNm = colNmArray.get(i);

                            if (nextColNm.equals(prevColNm) || StringUtils.isEmpty(nextColNm)) {
                                break;
                            } else {
                                colCnt++;
                            }
                            prevColNm = nextColNm;
                        }

                        i = 0;
                    } else {
                        dataArray = new ArrayList<String>();

                        dataArray.add(list.get(j).getCol0());
                        dataArray.add(list.get(j).getCol1());
                        dataArray.add(list.get(j).getCol2());
                        dataArray.add(list.get(j).getCol3());
                        dataArray.add(list.get(j).getCol4());
                        dataArray.add(list.get(j).getCol5());
                        dataArray.add(list.get(j).getCol6());
                        dataArray.add(list.get(j).getCol7());
                        dataArray.add(list.get(j).getCol8());
                        dataArray.add(list.get(j).getCol9());
                        dataArray.add(list.get(j).getCol10());
                        dataArray.add(list.get(j).getCol11());
                        dataArray.add(list.get(j).getCol12());
                        dataArray.add(list.get(j).getCol13());
                        dataArray.add(list.get(j).getCol14());
                        dataArray.add(list.get(j).getCol15());
                        dataArray.add(list.get(j).getCol16());
                        dataArray.add(list.get(j).getCol17());
                        dataArray.add(list.get(j).getCol18());
                        dataArray.add(list.get(j).getCol19());
                        dataArray.add(list.get(j).getCol20());
                        dataArray.add(list.get(j).getCol21());
                        dataArray.add(list.get(j).getCol22());
                        dataArray.add(list.get(j).getCol23());
                        dataArray.add(list.get(j).getCol24());
                        dataArray.add(list.get(j).getCol25());
                        dataArray.add(list.get(j).getCol26());
                        dataArray.add(list.get(j).getCol27());
                        dataArray.add(list.get(j).getCol28());
                        dataArray.add(list.get(j).getCol29());
                        dataArray.add(list.get(j).getCol30());
                        dataArray.add(list.get(j).getCol31());
                        dataArray.add(list.get(j).getCol32());
                        dataArray.add(list.get(j).getCol33());
                        dataArray.add(list.get(j).getCol34());
                        dataArray.add(list.get(j).getCol35());
                        dataArray.add(list.get(j).getCol36());
                        dataArray.add(list.get(j).getCol37());
                        dataArray.add(list.get(j).getCol38());
                        dataArray.add(list.get(j).getCol39());
                        dataArray.add(list.get(j).getCol40());
                        dataArray.add(list.get(j).getCol41());
                        dataArray.add(list.get(j).getCol42());
                        dataArray.add(list.get(j).getCol43());
                        dataArray.add(list.get(j).getCol44());
                        dataArray.add(list.get(j).getCol45());
                        dataArray.add(list.get(j).getCol46());
                        dataArray.add(list.get(j).getCol47());
                        dataArray.add(list.get(j).getCol48());
                        dataArray.add(list.get(j).getCol49());
                        dataArray.add(list.get(j).getCol50());

                        for (int z = 1 ; z < colCnt ; z++){
                            vo = new SatisFactionResultDtlMgmtVO();
                            vo.setDlrCd(dataArray.get(0));
                            //vo.setHeaderCont(colNmArray.get(i));
                            vo.setHeaderCont(colNmArray.get(z));
                            vo.setVal(dataArray.get(z));

                            resultList.add(vo);

                        }
                        i++;
                    }

                }

                result.setTotal(list.size());
                //result.setData(resultList);

                satisFactionResultMgmtService.multiSatisFactionResultExcelImport(resultList);

                status.setStep(ExcelUploadStatus.COMPLETED);
            }catch(ExcelDataBindingException e){
                log.error(e.getMessage(), e);
                status.addError(e.getRowNo(), e.getColNo(), e.getFieldValue(), e.getMessage());
            }catch(Exception e){
                log.error(e.getMessage(), e);
                status.addError(e.getMessage());
            }
        }

        return result;

    }

    /**
     * 만족도조사결과 일괄등록 데이터를 저장 한다.
     * @return
     */
    @RequestMapping(value = "/crm/css/satisFactionResultManage/insertSatisFactionResultBatchUpload.do", method = RequestMethod.POST)
    @ResponseBody
    public String insertSatisFactionResultBatchUpload(@Validated @RequestBody SatisFactionResultDtlMgmtVO batchUploadList) throws Exception {

        // salesOpptProcessMgmtService.insertSalesOpptPorcessBatchUpload(batchUploadList.getBatchUploadList());
        return "";

    }




}
