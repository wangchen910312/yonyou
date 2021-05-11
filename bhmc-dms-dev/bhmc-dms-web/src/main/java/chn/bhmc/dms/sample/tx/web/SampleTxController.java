package chn.bhmc.dms.sample.tx.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import able.com.web.HController;
import chn.bhmc.dms.sample.tx.service.SampleService;
import chn.bhmc.dms.sample.tx.service.SampleUpdateService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SampleController.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 4.     Kang Seok Han     최초 생성
 * </pre>
 */
@Controller
public class SampleTxController extends HController {

    @SuppressWarnings("unused")
	private final static Logger logger = LoggerFactory.getLogger(SampleTxController.class);
    
    @Resource(name="sampleService")
    SampleService sampleService;
    
    @Resource(name="sampleUpdateService")
    SampleUpdateService sampleUpdateService;
    
    @RequestMapping(value = "/samples/tx/updateInsertSample.do", method = RequestMethod.GET)
    public String updateInsertSample() throws Exception {
    	sampleService.updateInsertSample();
    	return null;
    }
    
    @RequestMapping(value = "/samples/tx/deleteInsertSample.do", method = RequestMethod.GET)
    public String deleteInsertSample() throws Exception {
    	sampleUpdateService.deleteInsertSample("aaa2",3);
    	return null;
    }
}
