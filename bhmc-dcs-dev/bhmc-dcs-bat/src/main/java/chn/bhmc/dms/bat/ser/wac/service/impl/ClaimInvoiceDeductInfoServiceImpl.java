package chn.bhmc.dms.bat.ser.wac.service.impl;

import java.util.HashMap;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmEaiService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceDeductInfoService;
import chn.bhmc.dms.bat.ser.wac.service.dao.ClaimInvoiceDeductInfoDAO;
import chn.bhmc.dms.core.util.DateUtil;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimInvoiceDeductInfoServiceImpl.java
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
@Service("claimInvoiceDeductInfoService")
public class ClaimInvoiceDeductInfoServiceImpl extends HService implements ClaimInvoiceDeductInfoService {


    @Autowired
    BatServiceCmmEaiService batServiceCmmEaiService;

    @Resource(name="claimInvoiceDeductInfoDAO")
    ClaimInvoiceDeductInfoDAO claimInvoiceDeductInfoDAO;


    /**
     * BWMS 인보이스 공제 정보
     *
     */
    @Override
    public void insertBwmsClaimInvoiceDeductInfo() throws Exception {


        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("batchDt" , DateUtil.getDate("yyyy-MM-dd"));

        claimInvoiceDeductInfoDAO.insertBwmsClaimInvoiceDeductInfo(map);

        batServiceCmmEaiService.executeEaiService("SER027");
        batServiceCmmEaiService.executeEaiService("SER028");


    }



}
