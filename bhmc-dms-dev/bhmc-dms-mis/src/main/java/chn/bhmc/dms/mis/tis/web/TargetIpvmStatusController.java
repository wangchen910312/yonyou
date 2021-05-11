package chn.bhmc.dms.mis.tis.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.FileMgrService;
import chn.bhmc.dms.cmm.sci.service.SystemConfigInfoService;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.mis.tis.service.TargetIpvmStatusService;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusSearchVO;
import chn.bhmc.dms.mis.tis.vo.TargetIpvmStatusVO;

/**
 * <pre>
 * [딜러사] 목표 개선 현황
 * </pre>
 *
 * @ClassName   : TargetIpvmStatusController.java
 * @Description : [딜러사] 목표 개선 현황
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Controller
public class TargetIpvmStatusController extends HController {

    /**
     * [딜러사] 목표 개선 현황 서비스
     */
    @Resource(name="targetIpvmStatusService")
    TargetIpvmStatusService targetIpvmStatusService;

    /**
     * 파일관리 서비스
     */
    @Resource(name="fileMgrService")
    FileMgrService fileMgrService;

    @Resource(name="systemConfigInfoService")
    SystemConfigInfoService systemConfigInfoService;

    /**
     * [딜러사] 목표 개선 현황  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/mis/tis/selectTargetIpvmStatusMain.do", method = RequestMethod.GET)
    public String selectTargetIpvmStatusMain(Model model) throws Exception {

        return "/mis/tis/selectTargetIpvmStatusMain";
    }

    /**
     * [딜러사] 목표 개선 현황  정보 목록 데이터를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 IssueBoardSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tis/selectTargetIpvmStatusSearch.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectTargetIpvmStatusSearch(@RequestBody TargetIpvmStatusSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();

        result.setTotal(targetIpvmStatusService.selectTargetIpvmStatusByConditionCnt(searchVO));

        if(result.getTotal() > 0){
            result.setData(targetIpvmStatusService.selectTargetIpvmStatusByCondition(searchVO));
        }

        return result;
    }

    /**
     * [딜러사] 목표 개선 현황  정보 목록 데이터를 등록한다.
     * @param searchVO - 조회 조건을 포함하는 TargetIpvmStatusSearchVO
     * @return
     */
    @RequestMapping(value = "/mis/tis/insertTargetIpvmStatus.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertTargetIpvmStatus(@Validated @RequestBody TargetIpvmStatusVO saveVO) throws Exception {
        targetIpvmStatusService.insertTargetIpvmStatus(saveVO);
        return true;
    }

    @RequestMapping(value = "/mis/tis/selectTargetIpvmStatusByKey.do", method = RequestMethod.POST)
    @ResponseBody
    public TargetIpvmStatusVO selectTargetIpvmStatusByKey(@RequestBody TargetIpvmStatusSearchVO searchVO) throws Exception {
        TargetIpvmStatusVO result = new TargetIpvmStatusVO();

        result = targetIpvmStatusService.selectTargetIpvmStatusByKey(searchVO);

        return result;
    }


}
