package chn.bhmc.dms.sal.cer.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.cer.service.DealerRegistrationReceiptService;
import chn.bhmc.dms.sal.cer.service.dao.DealerRegistrationReceiptDAO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSaveVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptSearchVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerRegistrationReceiptServiceImpl
 * @Description : 딜러 영수증 등록
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

@Service("dealerRegistrationReceiptService")
public class DealerRegistrationReceiptServiceImpl extends HService implements DealerRegistrationReceiptService {

    /**
     * 로컬옵션 DAO 선언
     */
    @Resource(name="dealerRegistrationReceiptDAO")
    DealerRegistrationReceiptDAO dealerRegistrationReceiptDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<DealerReceiptVO> selectDealerRegistrationReceiptByCondition(DealerReceiptSearchVO searchVO) throws Exception {
        return dealerRegistrationReceiptDAO.selectDealerRegistrationReceiptByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectDealerRegistrationReceiptByConditionCnt(DealerReceiptSearchVO searchVO)  throws Exception {
        return dealerRegistrationReceiptDAO.selectDealerRegistrationReceiptByConditionCnt(searchVO);
    }



    @Override
    public void updateDealerRegistrationReceipt(DealerReceiptSaveVO obj) throws Exception {


        for(DealerReceiptVO saveVO : obj.getUpdateList()){
            saveVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            saveVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            saveVO.setDdlnDt(obj.getDdlnDt());

            dealerRegistrationReceiptDAO.updateDealerRegistrationReceipt(saveVO);
        }


    }

    @Override
    public void deleteDealerRegistrationReceipt(DealerReceiptSaveVO obj) throws Exception {

        for(DealerReceiptVO saveVO : obj.getUpdateList()){

            dealerRegistrationReceiptDAO.deleteDealerRegistrationReceipt(saveVO);
        }


    }

}
