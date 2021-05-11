package chn.bhmc.dms.sal.orm.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.orm.service.MaintainOrderInquiryService;
import chn.bhmc.dms.sal.orm.service.dao.MaintainOrderInquiryDAO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySaveVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquirySearchVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderInquiryVO;
import chn.bhmc.dms.sal.orm.vo.MaintainOrderQueryResultsSearchVO;
import chn.bhmc.dms.ser.cmm.service.ServiceCommonService;

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
     * 정비 공통 서비스
     */
    @Resource(name="serviceCommonService")
    ServiceCommonService serviceCommonService;


    /**
     * 년월의 초기값을 조회한다.
     */
    public Date selectSysDt() throws Exception {
        MaintainOrderQueryResultsSearchVO searchVO = new MaintainOrderQueryResultsSearchVO();
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return maintainOrderInquiryDAO.selectSysDt(searchVO);
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

            if( chkCancelYnList.size() < 1 ){
                if( cancelYnOrdNo != "" ){
                    cancelYnOrdNo = cancelYnOrdNo + "," + vo.getOrdNo();
                }else{
                    cancelYnOrdNo = vo.getOrdNo();
                }
            }
        }

        if( cancelDtOrdNo != "" ){
            throw processException("sal.err.chkCancelDt", new String[]{cancelDtOrdNo});
        }
        if( cancelYnOrdNo != "" ){
            throw processException("sal.err.chkCancelYn", new String[]{cancelYnOrdNo});
        }

        for(MaintainOrderInquiryVO vo : saveVO.getUpdateList()){

            if(vo.getChgErpSendYn().equals("Y")){
                vo.setUpdtUsrId(LoginUtil.getUserId());
                maintainOrderInquiryDAO.updateMaintainOrderInquiry(vo);
                //프로시저추가
                maintainOrderInquiryDAO.procMaintainOrder(vo);
            }
        }

        //Carmel InterFace Header Info
        Map<String, Object> message = new HashMap<String, Object>();
        serviceCommonService.executeCamelClent(message,"SAL061");
    }
}
