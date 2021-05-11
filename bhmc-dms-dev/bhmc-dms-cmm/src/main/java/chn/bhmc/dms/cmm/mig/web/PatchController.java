package chn.bhmc.dms.cmm.mig.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.mig.service.PatchService;
import chn.bhmc.dms.cmm.mig.service.PatchableFactory;
import chn.bhmc.dms.cmm.mig.service.PatchableService;
import chn.bhmc.dms.cmm.mig.vo.PatchInfoSearchVO;
import chn.bhmc.dms.cmm.mig.vo.PatchInfoVO;
import chn.bhmc.dms.cmm.mig.vo.PatchResultVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 7.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class PatchController extends HController {

    @Resource(name="patchService")
    PatchService patchService;

    @Resource(name="dataSource")
    DataSource dataSource;

    /**
     * 패치 메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectPatchMain.do", method = RequestMethod.GET)
    public String selectPatchMain() throws Exception {
        return "/cmm/mig/selectPatchMain";
    }

    /**
     * 패치정보를 조회한다.
     * @param patchInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectPatchInfo.do", method = RequestMethod.POST)
    @ResponseBody
    public PatchInfoVO selectPatchInfo(@RequestBody PatchInfoSearchVO patchInfoSearchVO) throws Exception {
        return patchService.selectPatchInfo(patchInfoSearchVO);
    }

    /**
     * 패치파일을 다운로드 한다.
     * @param map
     * @return
     */
    @RequestMapping(value = "/cmm/mig/selectPatchFileDownload.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean selectPatchFileDownload(@RequestBody Map<String, String> map) throws Exception {
        patchService.selectPatchFileDownload(map.get("repositoryUrl") + map.get("srcFilePath"), map.get("patchTempFolder") + map.get("destFilePath"));
        return true;
    }

    /**
     * 패치정보를 적용한다.
     * @param patchInfoSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/mig/updatePatchExecute.do", method = RequestMethod.POST)
    @ResponseBody
    public PatchResultVO updatePatchExecute(@RequestBody Map<String, String> map) throws Exception {

        PatchResultVO patchResultVO = new PatchResultVO();
        patchResultVO.setId(map.get("id"));

        try{
            PatchableService patchableService = PatchableFactory.createPatchableService(map.get("type"));
            patchableService.setDataSource(dataSource);
            patchableService.patch(map.get("id"), map.get("patchTempFolder"), map.get("destFilePath"));

            patchResultVO.setResultCode("S");
            patchResultVO.setResultMessage("Success");
        }catch(Exception e){
            patchResultVO.setResultCode("F");
            patchResultVO.setResultMessage(e.getMessage());
        }

        return patchResultVO;
    }

    /**
     * 서버를 재기동한다.
     * @param map
     * @return
     */
    @RequestMapping(value = "/cmm/mig/updatePatchDeploy.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean updatePatchDeploy(@RequestBody Map<String, String> map) throws Exception {
        patchService.updatePatchDeploy(map.get("patchScript"), map.get("patchTempFolder"), map.get("webappsFolder"));
        return true;
    }

}
