package chn.bhmc.dms.sal.orm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.MaintainOrderInquiryService;
import chn.bhmc.dms.sal.orm.service.dao.MaintainOrderInquiryDAO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySaveVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquiryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : MaintainOrderInquiryServiceImpl
 * @Description : 오더유지 및 조회
 * @author Bong
 * @since 2016. 4. 18.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.04.18         Bong            최초 생성
 * </pre>
 */

@Service("maintainOrderInquiryService")
public class MaintainOrderInquiryServiceImpl extends HService implements MaintainOrderInquiryService {

    /**
     * 오더유지 및 조회 DAO 선언
     */
    @Resource(name="maintainOrderInquiryDAO")
    MaintainOrderInquiryDAO maintainOrderInquiryDAO;


    /**
     * 년월의 초기값을 조회한다.
     */
    public String selectSysDt() throws Exception {
        return maintainOrderInquiryDAO.selectSysDt();
    }


    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<MaintainOrderInquiryVO> selectMaintainOrderInquiryByCondition(MaintainOrderInquirySearchVO searchVO) throws Exception {

        return maintainOrderInquiryDAO.selectMaintainOrderInquiryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectMaintainOrderInquiryByConditionCnt(MaintainOrderInquirySearchVO searchVO)  throws Exception {

        return maintainOrderInquiryDAO.selectMaintainOrderInquiryByConditionCnt(searchVO);
    }


    /**
     * BTO 주문을 삭제한다.(실제 데이터 업데이트)
     */
    @Override
    public void updateMaintainOrderInquiry(MaintainOrderInquirySaveVO saveVO) throws Exception {

        String cancelDtOrdNo = "";
        String cancelYnOrdNo = "";

        for(MaintainOrderInquiryVO vo : saveVO.getUpdateList()){

            List<MaintainOrderInquiryVO> chkCancelDtList = maintainOrderInquiryDAO.selectCheckCancelDt(vo);
            if( chkCancelDtList.size() < 1 ){
                if( cancelDtOrdNo != "" ){
                    cancelDtOrdNo = cancelDtOrdNo + "," + vo.getOrdNo();
                }else{
                    cancelDtOrdNo = vo.getOrdNo();
                }
            }

            List<MaintainOrderInquiryVO> chkCancelYnList = maintainOrderInquiryDAO.selectCheckCancelYn(vo);
            if( chkCancelYnList.size() > 0 ){
                if( cancelYnOrdNo != "" ){
                    cancelYnOrdNo = cancelYnOrdNo + "," + vo.getOrdNo();
                }else{
                    cancelYnOrdNo = vo.getOrdNo();
                }
            }
        }

        if( cancelDtOrdNo != "" ){
//            String strCreateOrder = messageSource.getMessage("global.lbl.createOrder", null, LocaleContextHolder.getLocale());
            throw processException("sal.err.chkCancelDt", new String[]{cancelDtOrdNo});
        }
        if( cancelYnOrdNo != "" ){
//            String strCreateOrder = messageSource.getMessage("global.lbl.createOrder", null, LocaleContextHolder.getLocale());
            throw processException("sal.err.chkCancelYn", new String[]{cancelYnOrdNo});
        }

        for(MaintainOrderInquiryVO vo : saveVO.getUpdateList()){

            vo.setUpdtUsrId(LoginUtil.getUserId());
            maintainOrderInquiryDAO.updateMaintainOrderInquiry(vo);
        }
    }


}
