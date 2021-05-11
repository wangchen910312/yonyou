package chn.bhmc.dms.cmm.sci.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.cmm.sci.service.GridIndividualizationService;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationSearchVO;
import chn.bhmc.dms.cmm.sci.vo.GridIndividualizationVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 그리드 개인화 관리 컨트롤러
 *
 * @author Kang Seok Han
 * @since 2016. 7. 6.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.7.6         Kang Seok Han            최초 생성
 * </pre>
 */

@Controller
public class GridIndividualizationController extends HController {
    /**
     * 그리드 개인화 관리 서비스
     */
    @Resource(name="gridIndividualizationService")
    GridIndividualizationService gridIndividualizationService;

    /**
     * 그리드 개인화 목록 데이터를 조회한다.
     * @param searchVO 조회 조건을 포함하는 GridIndividualizationSearchVO
     * @return
     */
    @RequestMapping(value = "/cmm/sci/gridIndividualization/selectGridIndividualizations.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> selectGridIndividualizations(@Validated @RequestBody GridIndividualizationSearchVO searchVO) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        searchVO.setsUsrId(LoginUtil.getUserId());

        List<GridIndividualizationVO> list = gridIndividualizationService.selectGridIndividualizationsByCondition(searchVO);
        result.put("columnReorder", false);
        result.put("columnHide", false);

        for(GridIndividualizationVO obj : list) {
            //컬럼순서 정렬
            if(GridIndividualizationVO.GRID_INDV_TP_COLUMN_REORDER.equals(obj.getGridIndvTp())){
                result.put("columnReorderFields" , obj.getGridIndvCont());
                result.put("columnReorder", true);
            }else if(GridIndividualizationVO.GRID_INDV_TP_COLUMN_HIDE.equals(obj.getGridIndvTp())){
                result.put("columnHideFields", obj.getGridIndvCont());
                result.put("columnHide", true);
            }
        }

        return result;
    }

    /**
     * 그리드 개인화 정보를 등록 또는 수정한다.
     *
     * @param gridIndividualizationVO 등록 또는 수정할 그리드 개인화 정보
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/sci/gridIndividualization/insertOrUpdateGridIndividualization.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean insertOrUpdateGridIndividualization(@Validated @RequestBody GridIndividualizationVO gridIndividualizationVO) throws Exception {

        gridIndividualizationVO.setUsrId(LoginUtil.getUserId());

        gridIndividualizationService.insertOrUpdateGridIndividualization(gridIndividualizationVO);
        return true;
    }

    /**
     * 그리드 개인화 정보를 삭제 한다.
     *
     * @param gridIndividualizationVO 등록 또는 수정할 그리드 개인화 정보
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/cmm/sci/gridIndividualization/deleteGridIndividualization.do", method = RequestMethod.POST)
    @ResponseBody
    public boolean deleteGridIndividualization(@RequestBody GridIndividualizationVO gridIndividualizationVO) throws Exception {

        gridIndividualizationVO.setUsrId(LoginUtil.getUserId());

        gridIndividualizationService.deleteGridIndividualization(gridIndividualizationVO);
        return true;
    }

}
