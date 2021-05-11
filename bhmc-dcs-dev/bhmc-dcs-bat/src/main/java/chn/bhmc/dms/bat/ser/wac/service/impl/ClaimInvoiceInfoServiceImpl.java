package chn.bhmc.dms.bat.ser.wac.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ClaimInvoiceInfoDAO;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 30.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("claimInvoiceInfoService")
public class ClaimInvoiceInfoServiceImpl extends HService implements ClaimInvoiceInfoService {


    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;


    @Resource(name="claimInvoiceInfoDAO")
    ClaimInvoiceInfoDAO claimInvoiceInfoDAO;


    /*
     * @see chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceInfoService#insertBwmsClaimInvoiceInfo()
     */
    @Override
    public void insertBwmsClaimInvoiceInfo() throws Exception {

        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("batchDt" , DateUtil.getDate("yyyy-MM-dd"));

        claimInvoiceInfoDAO.insertBwmsClaimInvoiceInfo(map);

        batServiceCmmEaiService.executeEaiService("SER025");
        batServiceCmmEaiService.executeEaiService("SER026");


    }



}
