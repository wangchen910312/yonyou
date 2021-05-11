package chn.bhmc.dms.sal.cer.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cer.service.DealerReceiptSearchEditService;
import chn.bhmc.dms.sal.cer.service.dao.DealerReceiptSearchEditDAO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSaveVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerReceiptSearchEditServiceImpl
 * @Description : 딜러 영수증 조회 및 수정
 * @author Bong
 * @since 2016. 5. 23.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.23         Bong            최초 생성
 * </pre>
 */

@Service("dealerReceiptSearchEditService")
public class DealerReceiptSearchEditServiceImpl extends HService implements DealerReceiptSearchEditService {


    /**
     * 딜러 영수증 조회 및 수정 DAO 선언
     */
    @Resource(name="dealerReceiptSearchEditDAO")
    DealerReceiptSearchEditDAO dealerReceiptSearchEditDAO;




    @Override
    public void updateDealerReceiptSearchEdit(DealerReceiptSaveVO obj) throws Exception {

        for(DealerReceiptVO saveVO : obj.getUpdateList()){
            saveVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            dealerReceiptSearchEditDAO.updateDealerReceiptSearchEdit(saveVO);
        }
    }

}
