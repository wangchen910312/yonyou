package chn.bhmc.dms.cmm.bbs.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.bbs.service.FaultLdgrService;
import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrSearchVO;
import chn.bhmc.dms.cmm.bbs.vo.FaultLdgrVO;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 결함대장 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class FaultLdgrController extends HController {

    /**
     * 결함대장 관리 서비스
     */
    @Resource(name="faultLdgrService")
    FaultLdgrService faultLdgrService;

    /**
     * 시스템설정 관리 서비스
     */
    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService SystemConfigInfoService;


    /**
     * 결함대장 관리 메인 화면을 출력한다.
     * @param faultLdgrTp '01':이슈 관리, '02':변경요청사항관리
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/selectFaultLdgrMain.do", method = RequestMethod.GET)
    public String selectFaultLdgrMain(Model model) throws Exception {

        //식별일자
        model.addAttribute("faultRegDt", DateUtil.getDate(SystemConfigInfoService.selectStrValueByKey("dateFormat")));

        if("zh".equals(LocaleContextHolder.getLocale().getLanguage())){
            //시스템구분
            List<CommonCodeVO> sysTpList = new ArrayList<CommonCodeVO>();
            sysTpList.add(new CommonCodeVO("01", "销售", "Y"));
            sysTpList.add(new CommonCodeVO("02", "维护", "Y"));
            sysTpList.add(new CommonCodeVO("03", "配件", "Y"));
            sysTpList.add(new CommonCodeVO("04", "CRM", "Y"));
            sysTpList.add(new CommonCodeVO("05", "共同", "Y"));
            sysTpList.add(new CommonCodeVO("06", "经营管理", "Y"));
            sysTpList.add(new CommonCodeVO("07", "手机", "Y"));
            model.addAttribute("sysTpList", sysTpList);

            //식별방법
            List<CommonCodeVO> targetAreaList = new ArrayList<CommonCodeVO>();
            targetAreaList.add(new CommonCodeVO("01", "公开测试", "Y"));
            targetAreaList.add(new CommonCodeVO("02", "同事测试", "Y"));
            targetAreaList.add(new CommonCodeVO("03", "部分测试", "Y"));
            targetAreaList.add(new CommonCodeVO("04", "综合测试", "Y"));
            targetAreaList.add(new CommonCodeVO("05", "系统测试", "Y"));
            targetAreaList.add(new CommonCodeVO("06", "品质测试", "Y"));
            targetAreaList.add(new CommonCodeVO("07", "验收测试", "Y"));
            targetAreaList.add(new CommonCodeVO("08", "单独测试", "Y"));
            model.addAttribute("targetAreaList", targetAreaList);

            //대상유형
            List<CommonCodeVO> targetTpList = new ArrayList<CommonCodeVO>();
            targetTpList.add(new CommonCodeVO("01", "一次", "Y"));
            targetTpList.add(new CommonCodeVO("02", "二次", "Y"));
            targetTpList.add(new CommonCodeVO("03", "三次", "Y"));
            model.addAttribute("targetTpList", targetTpList);

            //결함유형
            List<CommonCodeVO> faultTpList = new ArrayList<CommonCodeVO>();
            faultTpList.add(new CommonCodeVO("01", "结算/计算", "Y"));
            faultTpList.add(new CommonCodeVO("02", "控制/逻辑", "Y"));
            faultTpList.add(new CommonCodeVO("03", "标准/流程/管理", "Y"));
            faultTpList.add(new CommonCodeVO("04", "I/F", "Y"));
            faultTpList.add(new CommonCodeVO("05", "用户 I/F", "Y"));
            faultTpList.add(new CommonCodeVO("06", "需求项", "Y"));
            faultTpList.add(new CommonCodeVO("07", "性能(HW)", "Y"));
            faultTpList.add(new CommonCodeVO("08", "数据(DB)", "Y"));
            faultTpList.add(new CommonCodeVO("09", "其他", "Y"));
            model.addAttribute("faultTpList", faultTpList);

            //결함상세유형
            Map<String, List<CommonCodeVO>> faultSubTpMap = new HashMap<String, List<CommonCodeVO>>();
            //계산/연산
            List<CommonCodeVO> list01 = new ArrayList<CommonCodeVO>();
            list01.add(new CommonCodeVO("01", "常数错误", "Y"));
            list01.add(new CommonCodeVO("02", "计算错误", "Y"));
            list01.add(new CommonCodeVO("03", "括号错误", "Y"));
            list01.add(new CommonCodeVO("04", "操作人顺序变更", "Y"));
            list01.add(new CommonCodeVO("05", "溢出", "Y"));
            list01.add(new CommonCodeVO("06", "进位错误", "Y"));
            list01.add(new CommonCodeVO("07", "数据表示错误", "Y"));
            list01.add(new CommonCodeVO("08", "数据表示变形错误", "Y"));
            faultSubTpMap.put("01", list01);
            //제어/로직
            List<CommonCodeVO> list02 = new ArrayList<CommonCodeVO>();
            list02.add(new CommonCodeVO("01", "程序运行异常", "Y"));
            list02.add(new CommonCodeVO("02", "程序终止", "Y"));
            list02.add(new CommonCodeVO("03", "循环", "Y"));
            list02.add(new CommonCodeVO("04", "条件语句", "Y"));
            list02.add(new CommonCodeVO("05", "实例文", "Y"));
            faultSubTpMap.put("02", list02);
            //표준/절차/관리
            List<CommonCodeVO> list03 = new ArrayList<CommonCodeVO>();
            list03.add(new CommonCodeVO("01", "未建立", "Y"));
            list03.add(new CommonCodeVO("02", "前标准", "Y"));
            list03.add(new CommonCodeVO("03", "开发标准", "Y"));
            list03.add(new CommonCodeVO("04", "明细", "Y"));
            list03.add(new CommonCodeVO("05", "文档化", "Y"));
            list03.add(new CommonCodeVO("06", "症状管理", "Y"));
            faultSubTpMap.put("03", list03);
            //I/F
            List<CommonCodeVO> list04 = new ArrayList<CommonCodeVO>();
            list04.add(new CommonCodeVO("01", "接口", "Y"));
            faultSubTpMap.put("04", list04);
            //사용자 I/F
            List<CommonCodeVO> list05 = new ArrayList<CommonCodeVO>();
            list05.add(new CommonCodeVO("01", "页面标识", "Y"));
            list05.add(new CommonCodeVO("02", "便利性", "Y"));
            list05.add(new CommonCodeVO("03", "沟通", "Y"));
            list05.add(new CommonCodeVO("04", "普遍性", "Y"));
            faultSubTpMap.put("05", list05);
            //요구사항
            List<CommonCodeVO> list06 = new ArrayList<CommonCodeVO>();
            list06.add(new CommonCodeVO("01", "不明确", "Y"));
            list06.add(new CommonCodeVO("02", "不完整", "Y"));
            list06.add(new CommonCodeVO("03", "不一致", "Y"));
            list06.add(new CommonCodeVO("04", "不可能", "Y"));
            faultSubTpMap.put("06", list06);
            //성능(HW)
            List<CommonCodeVO> list07 = new ArrayList<CommonCodeVO>();
            list07.add(new CommonCodeVO("01", "应答时间", "Y"));
            list07.add(new CommonCodeVO("02", "容量/负载", "Y"));
            list07.add(new CommonCodeVO("03", "障碍", "Y"));
            faultSubTpMap.put("07", list07);
            //데이터(DB)
            List<CommonCodeVO> list08 = new ArrayList<CommonCodeVO>();
            list08.add(new CommonCodeVO("01", "Query", "Y"));
            list08.add(new CommonCodeVO("02", "履行", "Y"));
            list08.add(new CommonCodeVO("03", "I/O 数据", "Y"));
            list08.add(new CommonCodeVO("04", "建模", "Y"));
            list08.add(new CommonCodeVO("05", "整合性", "Y"));
            list08.add(new CommonCodeVO("06", "基准信息", "Y"));
            faultSubTpMap.put("08", list08);
            //기타
            List<CommonCodeVO> list09 = new ArrayList<CommonCodeVO>();
            list09.add(new CommonCodeVO("01", "其他", "Y"));
            faultSubTpMap.put("09", list09);
            model.addAttribute("faultSubTpMap", faultSubTpMap);

            //판단
            List<CommonCodeVO> faultDecisionTpList = new ArrayList<CommonCodeVO>();
            faultDecisionTpList.add(new CommonCodeVO("01", "接受修改", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("02", "接受缺陷", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("03", "未接受", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("04", "使用不熟练", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("05", "追加评估", "Y"));
            model.addAttribute("faultDecisionTpList", faultDecisionTpList);

            //심각도
            List<CommonCodeVO> severityList = new ArrayList<CommonCodeVO>();
            severityList.add(new CommonCodeVO("01", "非常高", "Y"));
            severityList.add(new CommonCodeVO("02", "高", "Y"));
            severityList.add(new CommonCodeVO("03", "一般", "Y"));
            severityList.add(new CommonCodeVO("04", "低", "Y"));
            severityList.add(new CommonCodeVO("05", "非常低", "Y"));
            model.addAttribute("severityList", severityList);

            //우선순위
            List<CommonCodeVO> priorityList = new ArrayList<CommonCodeVO>();
            priorityList.add(new CommonCodeVO("1", "1", "Y"));
            priorityList.add(new CommonCodeVO("2", "2", "Y"));
            priorityList.add(new CommonCodeVO("3", "3", "Y"));
            priorityList.add(new CommonCodeVO("4", "4", "Y"));
            priorityList.add(new CommonCodeVO("5", "5", "Y"));
            model.addAttribute("priorityList", priorityList);

            //확인결과
            List<CommonCodeVO> checkRsltCdList = new ArrayList<CommonCodeVO>();
            checkRsltCdList.add(new CommonCodeVO("01", "Pass", "Y"));
            checkRsltCdList.add(new CommonCodeVO("02", "Fail", "Y"));
            model.addAttribute("checkRsltCdList", checkRsltCdList);
        }else{
          //시스템구분
            List<CommonCodeVO> sysTpList = new ArrayList<CommonCodeVO>();
            sysTpList.add(new CommonCodeVO("01", "판매", "Y"));
            sysTpList.add(new CommonCodeVO("02", "정비", "Y"));
            sysTpList.add(new CommonCodeVO("03", "부품", "Y"));
            sysTpList.add(new CommonCodeVO("04", "CRM", "Y"));
            sysTpList.add(new CommonCodeVO("05", "공통", "Y"));
            sysTpList.add(new CommonCodeVO("06", "경영관리", "Y"));
            sysTpList.add(new CommonCodeVO("07", "모바일", "Y"));
            model.addAttribute("sysTpList", sysTpList);

            //식별방법
            List<CommonCodeVO> targetAreaList = new ArrayList<CommonCodeVO>();
            targetAreaList.add(new CommonCodeVO("01", "공식검토", "Y"));
            targetAreaList.add(new CommonCodeVO("02", "동료검토", "Y"));
            targetAreaList.add(new CommonCodeVO("03", "단위테스트", "Y"));
            targetAreaList.add(new CommonCodeVO("04", "통합테스트", "Y"));
            targetAreaList.add(new CommonCodeVO("05", "시스템테스트", "Y"));
            targetAreaList.add(new CommonCodeVO("06", "품확테스트", "Y"));
            targetAreaList.add(new CommonCodeVO("07", "인수테스트", "Y"));
            targetAreaList.add(new CommonCodeVO("08", "개별검토", "Y"));
            model.addAttribute("targetAreaList", targetAreaList);

            //대상유형
            List<CommonCodeVO> targetTpList = new ArrayList<CommonCodeVO>();
            targetTpList.add(new CommonCodeVO("01", "1차", "Y"));
            targetTpList.add(new CommonCodeVO("02", "2차", "Y"));
            targetTpList.add(new CommonCodeVO("03", "3차", "Y"));
            model.addAttribute("targetTpList", targetTpList);

            //결함유형
            List<CommonCodeVO> faultTpList = new ArrayList<CommonCodeVO>();
            faultTpList.add(new CommonCodeVO("01", "계산/연산", "Y"));
            faultTpList.add(new CommonCodeVO("02", "제어/로직", "Y"));
            faultTpList.add(new CommonCodeVO("03", "표준/절차/관리", "Y"));
            faultTpList.add(new CommonCodeVO("04", "I/F", "Y"));
            faultTpList.add(new CommonCodeVO("05", "사용자 I/F", "Y"));
            faultTpList.add(new CommonCodeVO("06", "요구사항", "Y"));
            faultTpList.add(new CommonCodeVO("07", "성능(HW)", "Y"));
            faultTpList.add(new CommonCodeVO("08", "데이터(DB)", "Y"));
            faultTpList.add(new CommonCodeVO("09", "기타", "Y"));
            model.addAttribute("faultTpList", faultTpList);

            //결함상세유형
            Map<String, List<CommonCodeVO>> faultSubTpMap = new HashMap<String, List<CommonCodeVO>>();
            //계산/연산
            List<CommonCodeVO> list01 = new ArrayList<CommonCodeVO>();
            list01.add(new CommonCodeVO("01", "상수 오류", "Y"));
            list01.add(new CommonCodeVO("02", "계산 오류", "Y"));
            list01.add(new CommonCodeVO("03", "괄호 오류", "Y"));
            list01.add(new CommonCodeVO("04", "오퍼레이터 순서 바뀜", "Y"));
            list01.add(new CommonCodeVO("05", "오버플로우", "Y"));
            list01.add(new CommonCodeVO("06", "짤림, 라운드 오프 오류", "Y"));
            list01.add(new CommonCodeVO("07", "데이터 표현 오류", "Y"));
            list01.add(new CommonCodeVO("08", "데이터 표현 변환 오류", "Y"));
            faultSubTpMap.put("01", list01);
            //제어/로직
            List<CommonCodeVO> list02 = new ArrayList<CommonCodeVO>();
            list02.add(new CommonCodeVO("01", "프로그램 이상 수행", "Y"));
            list02.add(new CommonCodeVO("02", "프로그램 중지", "Y"));
            list02.add(new CommonCodeVO("03", "루프", "Y"));
            list02.add(new CommonCodeVO("04", "조건문", "Y"));
            list02.add(new CommonCodeVO("05", "케이스 문장", "Y"));
            faultSubTpMap.put("02", list02);
            //표준/절차/관리
            List<CommonCodeVO> list03 = new ArrayList<CommonCodeVO>();
            list03.add(new CommonCodeVO("01", "미수립", "Y"));
            list03.add(new CommonCodeVO("02", "전사 표준", "Y"));
            list03.add(new CommonCodeVO("03", "개발 표준", "Y"));
            list03.add(new CommonCodeVO("04", "명세서", "Y"));
            list03.add(new CommonCodeVO("05", "문서화", "Y"));
            list03.add(new CommonCodeVO("06", "형상관리", "Y"));
            faultSubTpMap.put("03", list03);
            //I/F
            List<CommonCodeVO> list04 = new ArrayList<CommonCodeVO>();
            list04.add(new CommonCodeVO("01", "인터페이스", "Y"));
            faultSubTpMap.put("04", list04);
            //사용자 I/F
            List<CommonCodeVO> list05 = new ArrayList<CommonCodeVO>();
            list05.add(new CommonCodeVO("01", "화면표시", "Y"));
            list05.add(new CommonCodeVO("02", "편의성", "Y"));
            list05.add(new CommonCodeVO("03", "커뮤니케이션", "Y"));
            list05.add(new CommonCodeVO("04", "보편성", "Y"));
            faultSubTpMap.put("05", list05);
            //요구사항
            List<CommonCodeVO> list06 = new ArrayList<CommonCodeVO>();
            list06.add(new CommonCodeVO("01", "불명확", "Y"));
            list06.add(new CommonCodeVO("02", "불완전", "Y"));
            list06.add(new CommonCodeVO("03", "불일치", "Y"));
            list06.add(new CommonCodeVO("04", "불가능", "Y"));
            faultSubTpMap.put("06", list06);
            //성능(HW)
            List<CommonCodeVO> list07 = new ArrayList<CommonCodeVO>();
            list07.add(new CommonCodeVO("01", "응답시간", "Y"));
            list07.add(new CommonCodeVO("02", "용량/부하", "Y"));
            list07.add(new CommonCodeVO("03", "장애 ", "Y"));
            faultSubTpMap.put("07", list07);
            //데이터(DB)
            List<CommonCodeVO> list08 = new ArrayList<CommonCodeVO>();
            list08.add(new CommonCodeVO("01", "Query", "Y"));
            list08.add(new CommonCodeVO("02", "이행", "Y"));
            list08.add(new CommonCodeVO("03", "I/O 데이", "Y"));
            list08.add(new CommonCodeVO("04", "모델링", "Y"));
            list08.add(new CommonCodeVO("05", "정합성", "Y"));
            list08.add(new CommonCodeVO("06", "기준정보", "Y"));
            faultSubTpMap.put("08", list08);
            //기타
            List<CommonCodeVO> list09 = new ArrayList<CommonCodeVO>();
            list09.add(new CommonCodeVO("01", "기타", "Y"));
            faultSubTpMap.put("09", list09);
            model.addAttribute("faultSubTpMap", faultSubTpMap);

            //판단
            List<CommonCodeVO> faultDecisionTpList = new ArrayList<CommonCodeVO>();
            faultDecisionTpList.add(new CommonCodeVO("01", "변경수용", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("02", "결함수용", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("03", "미수용", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("04", "사용미숙", "Y"));
            faultDecisionTpList.add(new CommonCodeVO("05", "추가검토", "Y"));
            model.addAttribute("faultDecisionTpList", faultDecisionTpList);

            //심각도
            List<CommonCodeVO> severityList = new ArrayList<CommonCodeVO>();
            severityList.add(new CommonCodeVO("01", "Very High", "Y"));
            severityList.add(new CommonCodeVO("02", "High", "Y"));
            severityList.add(new CommonCodeVO("03", "Mid", "Y"));
            severityList.add(new CommonCodeVO("04", "Low", "Y"));
            severityList.add(new CommonCodeVO("05", "Very Low", "Y"));
            model.addAttribute("severityList", severityList);

            //우선순위
            List<CommonCodeVO> priorityList = new ArrayList<CommonCodeVO>();
            priorityList.add(new CommonCodeVO("1", "1", "Y"));
            priorityList.add(new CommonCodeVO("2", "2", "Y"));
            priorityList.add(new CommonCodeVO("3", "3", "Y"));
            priorityList.add(new CommonCodeVO("4", "4", "Y"));
            priorityList.add(new CommonCodeVO("5", "5", "Y"));
            model.addAttribute("priorityList", priorityList);

            //확인결과
            List<CommonCodeVO> checkRsltCdList = new ArrayList<CommonCodeVO>();
            checkRsltCdList.add(new CommonCodeVO("01", "Pass", "Y"));
            checkRsltCdList.add(new CommonCodeVO("02", "Fail", "Y"));
            model.addAttribute("checkRsltCdList", checkRsltCdList);
        }


        return "/cmm/bbs/faultLdgr/selectFaultLdgrMain";
    }
    /*
    @RequestMapping(value = "/cmm/bbs/faultLdgr/selectFaultLdgrMain.do", method = RequestMethod.GET)
    public String selectFaultLdgrMain(Model model) throws Exception {

        //식별일자
        model.addAttribute("faultRegDt", DateUtil.getDate(SystemConfigInfoService.selectStrValueByKey("dateFormat")));

        //시스템구분
        List<CommonCodeVO> sysTpList = new ArrayList<CommonCodeVO>();
        sysTpList.add(new CommonCodeVO("01", "웹", "Y"));
        sysTpList.add(new CommonCodeVO("02", "모바일", "Y"));
        model.addAttribute("sysTpList", sysTpList);

        //식별방법
        List<CommonCodeVO> targetAreaList = new ArrayList<CommonCodeVO>();
        targetAreaList.add(new CommonCodeVO("01", "공식검토", "Y"));
        targetAreaList.add(new CommonCodeVO("02", "동료검토", "Y"));
        targetAreaList.add(new CommonCodeVO("03", "단위테스트", "Y"));
        targetAreaList.add(new CommonCodeVO("04", "통합테스트", "Y"));
        targetAreaList.add(new CommonCodeVO("05", "시스템테스트", "Y"));
        targetAreaList.add(new CommonCodeVO("06", "품확테스트", "Y"));
        targetAreaList.add(new CommonCodeVO("07", "인수테스트", "Y"));
        targetAreaList.add(new CommonCodeVO("08", "개별검토", "Y"));
        model.addAttribute("targetAreaList", targetAreaList);

        //대상유형
        List<CommonCodeVO> targetTpList = new ArrayList<CommonCodeVO>();
        targetTpList.add(new CommonCodeVO("01", "테스트케이스", "Y"));
        model.addAttribute("targetTpList", targetTpList);

        //결함유형
        List<CommonCodeVO> faultTpList = new ArrayList<CommonCodeVO>();
        faultTpList.add(new CommonCodeVO("01", "계산/연산", "Y"));
        faultTpList.add(new CommonCodeVO("02", "제어/로직", "Y"));
        faultTpList.add(new CommonCodeVO("03", "표준/절차/관리", "Y"));
        faultTpList.add(new CommonCodeVO("04", "I/F", "Y"));
        faultTpList.add(new CommonCodeVO("05", "사용자 I/F", "Y"));
        faultTpList.add(new CommonCodeVO("06", "요구사항", "Y"));
        faultTpList.add(new CommonCodeVO("07", "성능(HW)", "Y"));
        faultTpList.add(new CommonCodeVO("08", "데이터(DB)", "Y"));
        faultTpList.add(new CommonCodeVO("09", "기타", "Y"));
        model.addAttribute("faultTpList", faultTpList);

        //결함상세유형
        Map<String, List<CommonCodeVO>> faultSubTpMap = new HashMap<String, List<CommonCodeVO>>();
        //계산/연산
        List<CommonCodeVO> list01 = new ArrayList<CommonCodeVO>();
        list01.add(new CommonCodeVO("01", "상수 오류", "Y"));
        list01.add(new CommonCodeVO("02", "계산 오류", "Y"));
        list01.add(new CommonCodeVO("03", "괄호 오류", "Y"));
        list01.add(new CommonCodeVO("04", "오퍼레이터 순서 바뀜", "Y"));
        list01.add(new CommonCodeVO("05", "오버플로우", "Y"));
        list01.add(new CommonCodeVO("06", "짤림, 라운드 오프 오류", "Y"));
        list01.add(new CommonCodeVO("07", "데이터 표현 오류", "Y"));
        list01.add(new CommonCodeVO("08", "데이터 표현 변환 오류", "Y"));
        faultSubTpMap.put("01", list01);
        //제어/로직
        List<CommonCodeVO> list02 = new ArrayList<CommonCodeVO>();
        list02.add(new CommonCodeVO("01", "프로그램 이상 수행", "Y"));
        list02.add(new CommonCodeVO("02", "프로그램 중지", "Y"));
        list02.add(new CommonCodeVO("03", "루프", "Y"));
        list02.add(new CommonCodeVO("04", "조건문", "Y"));
        list02.add(new CommonCodeVO("05", "케이스 문장", "Y"));
        faultSubTpMap.put("02", list02);
        //표준/절차/관리
        List<CommonCodeVO> list03 = new ArrayList<CommonCodeVO>();
        list03.add(new CommonCodeVO("01", "미수립", "Y"));
        list03.add(new CommonCodeVO("02", "전사 표준", "Y"));
        list03.add(new CommonCodeVO("03", "개발 표준", "Y"));
        list03.add(new CommonCodeVO("04", "명세서", "Y"));
        list03.add(new CommonCodeVO("05", "문서화", "Y"));
        list03.add(new CommonCodeVO("06", "형상관리", "Y"));
        faultSubTpMap.put("03", list03);
        //I/F
        List<CommonCodeVO> list04 = new ArrayList<CommonCodeVO>();
        list04.add(new CommonCodeVO("01", "인터페이스", "Y"));
        faultSubTpMap.put("04", list04);
        //사용자 I/F
        List<CommonCodeVO> list05 = new ArrayList<CommonCodeVO>();
        list05.add(new CommonCodeVO("01", "화면표시", "Y"));
        list05.add(new CommonCodeVO("02", "편의성", "Y"));
        list05.add(new CommonCodeVO("03", "커뮤니케이션", "Y"));
        list05.add(new CommonCodeVO("04", "보편성", "Y"));
        faultSubTpMap.put("05", list05);
        //요구사항
        List<CommonCodeVO> list06 = new ArrayList<CommonCodeVO>();
        list06.add(new CommonCodeVO("01", "불명확", "Y"));
        list06.add(new CommonCodeVO("02", "불완전", "Y"));
        list06.add(new CommonCodeVO("03", "불일치", "Y"));
        list06.add(new CommonCodeVO("04", "불가능", "Y"));
        faultSubTpMap.put("06", list06);
        //성능(HW)
        List<CommonCodeVO> list07 = new ArrayList<CommonCodeVO>();
        list07.add(new CommonCodeVO("01", "응답시간", "Y"));
        list07.add(new CommonCodeVO("02", "용량/부하", "Y"));
        list07.add(new CommonCodeVO("03", "장애 ", "Y"));
        faultSubTpMap.put("07", list07);
        //데이터(DB)
        List<CommonCodeVO> list08 = new ArrayList<CommonCodeVO>();
        list08.add(new CommonCodeVO("01", "Query", "Y"));
        list08.add(new CommonCodeVO("02", "이행", "Y"));
        list08.add(new CommonCodeVO("03", "I/O 데이", "Y"));
        list08.add(new CommonCodeVO("04", "모델링", "Y"));
        list08.add(new CommonCodeVO("05", "정합성", "Y"));
        list08.add(new CommonCodeVO("06", "기준정보", "Y"));
        faultSubTpMap.put("08", list08);
        //기타
        List<CommonCodeVO> list09 = new ArrayList<CommonCodeVO>();
        list09.add(new CommonCodeVO("01", "기타", "Y"));
        faultSubTpMap.put("09", list09);
        model.addAttribute("faultSubTpMap", faultSubTpMap);

        //판단
        List<CommonCodeVO> faultDecisionTpList = new ArrayList<CommonCodeVO>();
        faultDecisionTpList.add(new CommonCodeVO("01", "변경수용", "Y"));
        faultDecisionTpList.add(new CommonCodeVO("02", "결함수용", "Y"));
        faultDecisionTpList.add(new CommonCodeVO("03", "미수용", "Y"));
        faultDecisionTpList.add(new CommonCodeVO("04", "사용미숙", "Y"));
        faultDecisionTpList.add(new CommonCodeVO("05", "추가검토", "Y"));
        model.addAttribute("faultDecisionTpList", faultDecisionTpList);

        //심각도
        List<CommonCodeVO> severityList = new ArrayList<CommonCodeVO>();
        severityList.add(new CommonCodeVO("01", "Very High", "Y"));
        severityList.add(new CommonCodeVO("02", "High", "Y"));
        severityList.add(new CommonCodeVO("03", "Med", "Y"));
        severityList.add(new CommonCodeVO("04", "Low", "Y"));
        severityList.add(new CommonCodeVO("05", "Very Low", "Y"));
        model.addAttribute("severityList", severityList);

        //우선순위
        List<CommonCodeVO> priorityList = new ArrayList<CommonCodeVO>();
        priorityList.add(new CommonCodeVO("1", "1", "Y"));
        priorityList.add(new CommonCodeVO("2", "2", "Y"));
        priorityList.add(new CommonCodeVO("3", "3", "Y"));
        priorityList.add(new CommonCodeVO("4", "4", "Y"));
        priorityList.add(new CommonCodeVO("5", "5", "Y"));
        model.addAttribute("priorityList", priorityList);

        //확인결과
        List<CommonCodeVO> checkRsltCdList = new ArrayList<CommonCodeVO>();
        checkRsltCdList.add(new CommonCodeVO("01", "Pass", "Y"));
        checkRsltCdList.add(new CommonCodeVO("02", "Fail", "Y"));
        model.addAttribute("checkRsltCdList", checkRsltCdList);

        return "/cmm/bbs/faultLdgr/selectFaultLdgrMain";
    }
    */

    /**
     * 결함대장 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 FaultLdgrSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/selectFaultLdgrs.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectFaultLdgrs(@RequestBody FaultLdgrSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        result.setTotal(faultLdgrService.selectFaultLdgrsByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(faultLdgrService.selectFaultLdgrsByCondition(searchVO));
        }

        return result;
    }

    /**
     * 결함대장를 조회한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/selectFaultLdgr.do", method = RequestMethod.GET)
    @ResponseBody
    public FaultLdgrVO selectFaultLdgr(@RequestParam("faultNo") int faultNo) throws Exception {
        return faultLdgrService.selectFaultLdgrByKey(faultNo);
    }

    /**
     * 결함대장를 등록한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/insertFaultLdgr.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertFaultLdgr(@Validated @RequestBody FaultLdgrVO faultLdgrVO) throws Exception {

        faultLdgrVO.setRegUsrId(LoginUtil.getUserId());
        faultLdgrService.insertFaultLdgr(faultLdgrVO);

        return true;
    }

    /**
     * 결함대장를 수정한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/updateFaultLdgr.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updateFaultLdgr(@Validated @RequestBody FaultLdgrVO faultLdgrVO) throws Exception {

        faultLdgrVO.setUpdtUsrId(LoginUtil.getUserId());
        faultLdgrService.updateFaultLdgr(faultLdgrVO);

        return true;
    }

    /**
     * 결함대장를 수정한다.
     * @return
     */
    @RequestMapping(value = "/cmm/bbs/faultLdgr/deleteFaultLdgr.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteFaultLdgr(@RequestParam("faultNo") int faultNo) throws Exception {
        faultLdgrService.deleteFaultLdgr(faultNo);
        return true;
    }

}
