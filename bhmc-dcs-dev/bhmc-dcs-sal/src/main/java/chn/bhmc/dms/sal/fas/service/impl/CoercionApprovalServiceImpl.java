package chn.bhmc.dms.sal.fas.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.fas.service.CoercionApprovalService;
import chn.bhmc.dms.sal.fas.service.dao.CoercionApprovalDAO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSaveVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalSearchVO;
import chn.bhmc.dms.sal.fas.vo.CoercionApprovalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CoercionApprovalServiceImpl
 * @Description : 강제판매승인
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.16          최초 생성
 * </pre>
 */

@Service("coercionApprovalService")
public class CoercionApprovalServiceImpl extends HService implements CoercionApprovalService,JxlsSupport {

    /**
     * 강제판매승인 DAO 선언
     */
    @Resource(name="coercionApprovalDAO")
    CoercionApprovalDAO coercionApprovalDAO;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CoercionApprovalSearchVO
     * @return 조회 목록
     */
    @Override
    public List<CoercionApprovalVO> selectCoercionApprovalsByCondition(CoercionApprovalSearchVO searchVO) throws Exception{
        return coercionApprovalDAO.selectCoercionApprovalsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 CoercionApprovalSearchVO
     * @return
     */
    @Override
    public int selectCoercionApprovalsByConditionCnt(CoercionApprovalSearchVO searchVO) throws Exception{
        return coercionApprovalDAO.selectCoercionApprovalsByConditionCnt(searchVO);
    }

    /**
     * 강제판매 승인처리
     */
    @Override
    public boolean confirms(CoercionApprovalSaveVO saveVO)throws Exception{

        CoercionApprovalSearchVO searchVO = null;

        for(CoercionApprovalVO vo : saveVO.getList()){
            searchVO = new CoercionApprovalSearchVO();
            searchVO.setsDlrCd( vo.getDlrCd() );
            searchVO.setsVinNo1( vo.getVinNo1() );
            searchVO.setsVinNo2( vo.getVinNo2() );
            searchVO.setsSeq( vo.getSeq() );

            vo.setUpdtUsrId(LoginUtil.getUserId());
            vo.setApproveId(LoginUtil.getUserId());
            vo.setReqStatCd("Y");   // 승인

            coercionApprovalDAO.updateCoercionAppr(vo);

            //프로시저 추가 : 강제판매처리결과송신
            coercionApprovalDAO.procCoercionAppr(vo);

/*
            // 차량 마스터(SA_0121T)의 RFID 번호와 비교
            if(coercionApprovalDAO.selectIsRfidnoCnt(searchVO) > 0){
                vo.setUpdtUsrId(LoginUtil.getUserId());
                vo.setApproveId(LoginUtil.getUserId());
                vo.setReqStatCd("Y");   // 승인

                coercionApprovalDAO.updateCoercionAppr(vo);

                //프로시저 추가 : 강제판매처리결과송신
                coercionApprovalDAO.procCoercionAppr(vo);

            }else{
                // 요청한 RFID 번호는 차량정보 RFID 번호와 상이합니다.
                throw processException("sal.err.chkRfiNoVin");
            }
*/
        }


        return true;
    }

    /**
     * 강제판매 불승인 처리
     */
    @Override
    public boolean nonConfirms(CoercionApprovalSaveVO saveVO)throws Exception{
        for(CoercionApprovalVO vo : saveVO.getList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());
            vo.setApproveId(LoginUtil.getUserId());
            vo.setReqStatCd("N");       // 불승인

            coercionApprovalDAO.updateCoercionAppr(vo);

            //프로시저 추가 : 강제판매처리결과송신
            coercionApprovalDAO.procCoercionAppr(vo);
        }
        return true;
    }
    
    //20201224 update by tjx 异常申请审批下载excel start
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

    	CoercionApprovalSearchVO searchVO = new CoercionApprovalSearchVO();
    	//申请日期	
        searchVO.setsRegStartDt(DateUtil.convertToDate((String)params.get("sRegStartDt")));
        searchVO.setsRegEndDt(DateUtil.convertToDate((String)params.get("sRegEndDt")));
        //审批日期	
        searchVO.setsApproveStratDt(DateUtil.convertToDate((String)params.get("sApproveStratDt")));
        searchVO.setsApproveEndDt(DateUtil.convertToDate((String)params.get("sApproveEndDt")));

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        List<CoercionApprovalVO> list = new ArrayList<CoercionApprovalVO>();
       
        int cnt = selectCoercionApprovalsByConditionCnt(searchVO);
        
        if(cnt != 0) {
        	list = selectCoercionApprovalsByCondition(searchVO);
        	for(CoercionApprovalVO coercionApprovalVO: list) {
        		//是否存在机动车统一发票
        		if(null != coercionApprovalVO.getCarTaxReceiptIssDt()) {
        			coercionApprovalVO.setCarTaxReceiptYn("有");
        		}else {
        			coercionApprovalVO.setCarTaxReceiptYn("无");
        		}
        		//是否存在增值税发票
        		if(null != coercionApprovalVO.getEtcTaxReceiptIssDt()) {
        			coercionApprovalVO.setEtcTaxReceiptYn("有");
        		}else {
        			coercionApprovalVO.setEtcTaxReceiptYn("无");
        		}
        	}
        }

        context.putVar("items", list);

    };
    //20201225 update by tjx 异常申请审批下载excel end
}