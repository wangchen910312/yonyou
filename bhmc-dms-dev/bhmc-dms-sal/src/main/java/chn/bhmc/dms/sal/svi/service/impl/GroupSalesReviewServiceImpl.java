package chn.bhmc.dms.sal.svi.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.CommonCodeVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.svi.service.GroupSalesReviewService;
import chn.bhmc.dms.sal.svi.service.dao.GroupSalesReviewDAO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSaveVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewSearchVO;
import chn.bhmc.dms.sal.svi.vo.GroupSalesReviewVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesReviewServiceImpl
 * @Description : 집단판매심사
 * @author
 * @since 2016. 4. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.04.08          최초 생성
 * </pre>
 */

@Service("groupSalesReviewService")
public class GroupSalesReviewServiceImpl extends HService implements GroupSalesReviewService, JxlsSupport {

    /**
     * 공통코드 관리 서비스
     */
    @Resource(name="commonCodeService")
    CommonCodeService commonCodeService;

    /**
     * 집단판매신청 DAO 선언
     */
    @Resource(name="groupSalesReviewDAO")
    GroupSalesReviewDAO groupSalesReviewDAO;

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesReviewVO> selectGroupSalesReviewByCondition(GroupSalesReviewSearchVO searchVO) throws Exception{

        return groupSalesReviewDAO.selectGroupSalesReviewByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return
     */
    @Override
    public int selectGroupSalesReviewByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception{

        return groupSalesReviewDAO.selectGroupSalesReviewByConditionCnt(searchVO);
    }


    /**
     * 법인 - 집단 판매심사 저장/수정 (SA_0412T, SA_0414T)
     */
    public int saveGroupSalesReview(GroupSalesReviewSaveVO obj) throws Exception{

        String approveCd = obj.getApproveCd();
        String remark = obj.getRemark();
        String evalRsltYn = "";
        if(approveCd.equals("C")){
            evalRsltYn = "Y";
        }else {
            evalRsltYn = "N";
        }

        for(GroupSalesReviewVO grpVO : obj.getUpdateList()){

            GroupSalesReviewVO vo = new GroupSalesReviewVO();
            vo.setDlrCd(grpVO.getDlrCd());
            vo.setUsrId(grpVO.getUsrId());
            vo.setReqSeq(grpVO.getReqSeq());
            vo.setApproveCd(approveCd);
            vo.setEvalRsltYn(evalRsltYn);
            vo.setRemark(remark);
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());
            groupSalesReviewDAO.insertGroupSalesReview(vo);
            groupSalesReviewDAO.updateGroupSalesReview(vo);
            groupSalesReviewDAO.procPackageReview(vo);
       }

        return 0;
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

        String langCd = LocaleContextHolder.getLocale().getLanguage();
        GroupSalesReviewSearchVO searchVO = new GroupSalesReviewSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");


        if (StringUtils.isNotEmpty((String)params.get("sApplyDtS"))) {
            searchVO.setsApplyDtS(DateUtil.convertToDate((String)params.get("sApplyDtS")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sApplyDtE"))) {
            searchVO.setsApplyDtE(DateUtil.convertToDate((String)params.get("sApplyDtE")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sLastStartUpdt"))) {
            searchVO.setsLastStartUpdt(DateUtil.convertToDate((String)params.get("sLastStartUpdt")));
        }
        if (StringUtils.isNotEmpty((String)params.get("sLastEndUpdt"))) {
            searchVO.setsLastEndUpdt(DateUtil.convertToDate((String)params.get("sLastEndUpdt")));
        }
        
        // 상태 SAL141
        List<CommonCodeVO> approveCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL141", null, langCd);
        HashMap<String, CommonCodeVO> approveCdMap = new HashMap<String, CommonCodeVO>();
        for( CommonCodeVO cmmVO : approveCdList ){
            approveCdMap.put("SAL141" + cmmVO.getCmmCd(), cmmVO);
        }

        // 항목 SAL151
        List<CommonCodeVO> atcDstinCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL151", null, langCd);
        HashMap<String, CommonCodeVO> atcDstinCdMap = new HashMap<String, CommonCodeVO>();
        for( CommonCodeVO cmmVO : atcDstinCdList ){
            atcDstinCdMap.put("SAL151" + cmmVO.getCmmCd(), cmmVO);
        }

        // 딜러지역 (SAL146)
        List<CommonCodeVO> distCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL146", null, langCd);
        HashMap<String, CommonCodeVO> distCdMap = new HashMap<String, CommonCodeVO>();
        for( CommonCodeVO cmmVO : distCdList ){
            distCdMap.put("SAL146" + cmmVO.getCmmCd(), cmmVO);
        }

        // 심사여부 SAL148
        List<CommonCodeVO> evalRsltYnCdList = commonCodeService.selectCommonCodesByCmmGrpCd("SAL148", null, langCd);
        HashMap<String, CommonCodeVO> evalRsltYnCdMap = new HashMap<String, CommonCodeVO>();
        for( CommonCodeVO cmmVO : evalRsltYnCdList ){
            evalRsltYnCdMap.put("SAL148" + cmmVO.getCmmCd(), cmmVO);
        }

        List<GroupSalesReviewVO> list = selectGroupSalesReviewByCondition(searchVO);

        ArrayList<GroupSalesReviewVO> rsltList = new ArrayList<GroupSalesReviewVO>();

        for( GroupSalesReviewVO sResultVO : list ){

            //sResultVO.setApproveNm( approveCdMap.get("SAL141"+sResultVO.getApproveCd()).getCmmCdNm() );
            //sResultVO.setAtcDstinNm( atcDstinCdMap.get("SAL151"+sResultVO.getAtcDstinCd()).getCmmCdNm() );
            //sResultVO.setDistNm( distCdMap.get("SAL146"+sResultVO.getDistCd()).getCmmCdNm() );
            //sResultVO.setEvalRsltYnNm( evalRsltYnCdMap.get("SAL148"+sResultVO.getEvalRsltYn()).getCmmCdNm() );

            rsltList.add(sResultVO);
        }

        context.putVar("items", rsltList);
    }
}
