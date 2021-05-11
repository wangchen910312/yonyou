package chn.bhmc.dms.sample.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.web.HController;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chn.bhmc.dms.ws.sal.bdw.service.SalBasicDataService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SalBasicDataController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 8. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 8. 16.     Ki hyun Kwon     최초 생성
 * </pre>
 */
@Controller
public class SalBasicDataController extends HController {

    Logger log = LoggerFactory.getLogger(SalBasicDataController.class);

    @Resource(name="salCarlineBasicDataService")
    SalBasicDataService salCarlineBasicDataService;

    @Resource(name="salExtColorBasicDataService")
    SalBasicDataService salExtColorBasicDataService;

    @Resource(name="salFscBasicDataService")
    SalBasicDataService salFscBasicDataService;

    @Resource(name="salIntColorBasicDataService")
    SalBasicDataService salIntColorBasicDataService;

    ApplicationContext applicationContext;

    //private FilterConfig config;


    @RequestMapping(value = "/selectDcsWebServiceTest.do", method = RequestMethod.GET)
    public List<Map<String, Object>>  selectDcsWebServiceTest(@Param("id") String id) throws Exception{

        this.applicationContext = getContext();
        log.debug("id="+id);
        SalBasicDataService salBasicDataService = null;

        Map<String, Object> params = new HashMap<String, Object>();
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

        Map<String, SalBasicDataService> beansMap = applicationContext.getBeansOfType(SalBasicDataService.class);

        if(beansMap.size() != 0 ){
            for(SalBasicDataService service : beansMap.values()){
                if(service.isSupport(id)){
                    salBasicDataService = service;
                    break;
                }
            }
            log.debug("salBasicDataService=========="+salBasicDataService);
            if(salBasicDataService != null){
                list = salBasicDataService.selectList(params);
            }
        }

        log.debug("list ======= "+list);

        /*

        if(id.equals("SAL001")){
            list =  salCarlineBasicDataService.selectList(params);
        }else if(id.equals("SAL002")){
            list =  salFscBasicDataService.selectList(params);
        }else if(id.equals("SAL003")){
            list =  salExtColorBasicDataService.selectList(params);
        }else if(id.equals("SAL004")){
            list =  salIntColorBasicDataService.selectList(params);
        }
        log.debug(""+list);
        log.debug("config=========="+getContext());
        log.debug("applicationContext=========="+applicationContext);
        log.debug("getBeansOfType=========="+applicationContext.getBeansOfType(AccessoryMngService.class));
        log.debug("getBeansOfType=========="+applicationContext.getBeansOfType(SalBasicDataService.class));
*/

        return list;
    }


  /*  public static void main(String[] args)throws Exception{
        SalBasicDataController t = new SalBasicDataController();
        t.selectDcsWebServiceTest("SAL001");
    }*/






}
