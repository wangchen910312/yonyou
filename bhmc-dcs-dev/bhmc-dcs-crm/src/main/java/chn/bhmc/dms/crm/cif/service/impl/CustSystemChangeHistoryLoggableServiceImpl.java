package chn.bhmc.dms.crm.cif.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.SystemHistoryLoggableService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.crm.cif.service.dao.CustomerInfoDAO;
import chn.bhmc.dms.crm.cif.vo.CustomerInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CustSystemChangeHistoryLoggableServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 6. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 1.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@Service("custSystemHistoryLoggableService")
public class CustSystemChangeHistoryLoggableServiceImpl implements SystemHistoryLoggableService {
    /*
     * 고객정보 관리 DAO
     */
    @Resource(name="customerInfoDAO")
    CustomerInfoDAO customerInfoDAO;

    @Override
    public Object selectSystemHistoryLoggable(Map<String, Object> context) throws Exception {
        Object result = new Object();

        CustomerInfoSearchVO searchVO = new CustomerInfoSearchVO();

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsCustNm(context.get("custNm").toString());
        searchVO.setsCustTp(context.get("custTp").toString());
        searchVO.setsHpNo(context.get("hpNo").toString());
        searchVO.setsOfficeTelNo(context.get("officeTelNo").toString());

        result = (Object)customerInfoDAO.selectCustDupByKey(searchVO);;

        return result;
    }
}