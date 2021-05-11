package chn.bhmc.dms.ser.rcv.web;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.ser.rcv.service.ServiceReceiveService;
import chn.bhmc.dms.ser.rcv.vo.ServiceReceiveSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceReceiveController.java
 * @Description : 수납 컨트롤러
 * @author YIN XUEYUAN
 * @since 2016. 4. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 20.    YIN XUEYUAN     최초 생성
 * </pre>
 */

@Controller
public class ServiceReceiveController extends HController {

    @Resource(name="serviceReceiveService")
    ServiceReceiveService serviceReceiveService;

    /**
     * 수납 리스트
     * @param
     * @return SearchResult
     */
    @RequestMapping(value = "/ser/rcv/serviceReceive/selectServiceReceives.do", method = RequestMethod.POST)
    @ResponseBody
    public SearchResult selectServiceReceives(@RequestBody ServiceReceiveSearchVO searchVO) throws Exception {

        SearchResult result = new SearchResult();
        result.setTotal(serviceReceiveService.selectServiceReceiveByConditionCnt(searchVO));
         if(result.getTotal() != 0){
            result.setData(serviceReceiveService.selectServiceReceiveByCondition(searchVO));
        }

        return result;

    }


}
