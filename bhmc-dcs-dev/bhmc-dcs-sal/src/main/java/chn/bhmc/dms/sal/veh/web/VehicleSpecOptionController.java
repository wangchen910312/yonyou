package chn.bhmc.dms.sal.veh.web;


import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import able.com.web.HController;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.sal.veh.service.VehicleSpecOptionService;
import chn.bhmc.dms.sal.veh.vo.VehicleImageVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSearchVO;



/**
 * VehicleSpec 옵션 관리(조회)
 *
 * @author Kim yewon
 * @since 2016. 1. 18
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                 수정자                                 수정내용
 *  ---------------- ------------    ---------------------------
 *   2016.01.18       Kim yewon            최초 생성
 * </pre>
 */

@Controller
@RequestMapping(value = "/sal/veh/vehicleSpec")
public class VehicleSpecOptionController extends HController {
    /**
     * 옵션 서비스
     */
    @Resource(name="vehicleSpecOptionService")
    VehicleSpecOptionService vehicleSpecOptionService;

    /**
     * VehicleSpec Option Main View 을 출력한다.
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecOptionMain.do", method = RequestMethod.GET)
    public String selectVehicleSpecOptionMain(Model model) throws Exception {
        return "/sal/veh/vehicleSpec/selectVehicleSpecOptionMain";
    }
    
    /**
     * 차량ID에 해당하는 차량의 이미지 목록을 조회한다. 
     * 차량등록증 등 차량에 관한 모든 이미지 목록을 반환한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleImagesWithDocument.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleImagesWithDocument(@RequestBody VehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        
        Locale locale = LocaleContextHolder.getLocale();
        List<VehicleImageVO> list = vehicleSpecOptionService.selectVehicleImagesWithDocument(searchVO.getCarId());
        
        for(VehicleImageVO vehicleImageVO : list){
        	vehicleImageVO.setImgNm(messageSource.getMessage("sal.lbl."+vehicleImageVO.getImgNm().toLowerCase(), null, locale));
        }
        
        result.setData(list);
        result.setTotal(list.size());

        return result;
    }

    /**
     * 차량ID에 해당하는 차량의 이미지 목록을 조회한다.
     * @param searchVO - 조회 조건을 포함하는 VehicleSearchVO
     * @return
     */
    @RequestMapping(value = "/selectVehicleSpecImages.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectVehicleSpecImages(@RequestBody VehicleSearchVO searchVO) throws Exception {
        SearchResult result = new SearchResult();
        
        Locale locale = LocaleContextHolder.getLocale();
        List<VehicleImageVO> list = vehicleSpecOptionService.selectVehicleImages(searchVO.getCarId());
        
        for(VehicleImageVO vehicleImageVO : list){
        	vehicleImageVO.setImgNm(messageSource.getMessage("sal.lbl."+vehicleImageVO.getImgNm().toLowerCase(), null, locale));
        }
        
        result.setData(list);
        result.setTotal(list.size());

        return result;
    }
}