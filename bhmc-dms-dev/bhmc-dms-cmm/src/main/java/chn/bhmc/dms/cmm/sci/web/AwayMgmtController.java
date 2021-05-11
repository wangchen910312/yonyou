package chn.bhmc.dms.cmm.sci.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.AwayMgmtService;
import chn.bhmc.dms.cmm.sci.vo.AwayMgmtSearchVO;
import chn.bhmc.dms.cmm.sci.vo.AwayMgmtVO;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : AwayMgmtController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 29.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 29.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Controller
public class AwayMgmtController extends HController {
    /**
     * 이석/배석 현황 조회
     */
    @Resource(name="awayMgmtService")
    AwayMgmtService awayMgmtService;

    /**
     * 이석/배석 현황 조회  메인 화면을 출력한다.
     * @return
     */
    @RequestMapping(value = "/cmm/sci/awayMgmt/selectAwayMgmtMain.do", method = RequestMethod.GET)
    public String selectAwayMgmtMain(Model model) throws Exception {
        String sysDate = DateUtil.getDate("yyyy-MM-dd");

        model.addAttribute("sysDate", sysDate);

        return "/cmm/sci/awayMgmt/selectAwayMgmtMain";
    }

    @SuppressWarnings({ "rawtypes" })
    @RequestMapping(value = "/cmm/sci/awayMgmt/selectAwayMgmt.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectAwayMgmt(@RequestBody AwayMgmtSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();

        int loop = 0;
        int revStartH   = 0;
        int revEndH     = 0;
        int leftStartH  = 0;
        int leftEndH    = 0;

        String usrId = "";

        Map<String, Object> map = new HashMap<String, Object>();
        List<Map> list = new ArrayList<Map>();
        List<AwayMgmtVO> mgmt = new ArrayList<AwayMgmtVO>();

        result.setTotal(awayMgmtService.selectAwayMgmtByConditionCnt(searchVO));

        if(result.getTotal() != 0){
            mgmt = awayMgmtService.selectAwayMgmtByCondition(searchVO);

            for (AwayMgmtVO item : mgmt) {
                if ("".equals(usrId)) {
                    usrId = item.getUsrId();
                }

                if (!(usrId).equals(item.getUsrId()) ) {
                    usrId = item.getUsrId();
                    list.add(loop, map);
                    map = new HashMap<String, Object>();

                    loop++;
                }

                if (item.getLeftStartHm() != null && item.getLeftEndHm() != null) {
                    leftStartH = Integer.parseInt(item.getLeftStartHm().split(":")[0]);
                    leftEndH = Integer.parseInt(item.getLeftEndHm().split(":")[0]);

                    for (int i = leftStartH; i < leftEndH; i++) {
                        map.put(item.getLeftDt() + " M " + i, item.getLeftDt() + " " + item.getLeftStartHm() + "~" + item.getLeftEndHm());
                    }
                }

                if (item.getRevStartHm() != null && item.getRevEndHm() != null) {
                    revStartH = Integer.parseInt(item.getRevStartHm().split(":")[0]);
                    revEndH = Integer.parseInt(item.getRevEndHm().split(":")[0]);

                    for (int i = revStartH; i < revEndH; i++) {
                        map.put(item.getLeftDt() + " C " + i, item.getLeftDt() + " " + item.getRevStartHm() + "~" + item.getRevEndHm());
                    }
                }

                map.put("rnum", loop + 1);
                map.put("usrId", item.getUsrId());
                map.put("usrNm", item.getUsrNm());
                map.put("empNo", item.getEmpNo());
                map.put("leftDt", item.getLeftDt());
            }

            list.add(loop, map);

            result.setData(list);
        }

        return result;
    }
}