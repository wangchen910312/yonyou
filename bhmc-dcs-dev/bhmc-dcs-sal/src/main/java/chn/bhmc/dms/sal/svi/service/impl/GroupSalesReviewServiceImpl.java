package chn.bhmc.dms.sal.svi.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.vo.HMap;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.CommonCodeService;
import chn.bhmc.dms.cmm.sci.vo.FileItemVO;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
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

    @Autowired
    SalesCommonCamelService salesCommonCamelService;

    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesReviewVO> selectGroupSalesReviewByCondition(GroupSalesReviewSearchVO searchVO) throws Exception{

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());

        searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApporveUsrId(LoginUtil.getUserId());


        return groupSalesReviewDAO.selectGroupSalesReviewByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesReviewSearchVO
     * @return
     */
    @Override
    public int selectGroupSalesReviewByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception{

        searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApporveUsrId(LoginUtil.getUserId());

        return groupSalesReviewDAO.selectGroupSalesReviewByConditionCnt(searchVO);
    }

    /**
     * 집단판매신청된 차량을 상세조회.
     */
    @Override
    public int selectDetlVehPopByConditionCnt(GroupSalesReviewSearchVO searchVO) throws Exception {
        return groupSalesReviewDAO.selectDetlVehPopByConditionCnt(searchVO);
    }

    @Override
    public List<GroupSalesReviewVO> selectDetlVehPopByCondition(GroupSalesReviewSearchVO searchVO) throws Exception {
        return groupSalesReviewDAO.selectDetlVehPopByCondition(searchVO);
    }


    /**
     * 법인 - 집단 판매심사 저장/수정 (SA_0412T, SA_0414T)
     */
    public int saveGroupSalesReview(GroupSalesReviewSaveVO obj) throws Exception{

        String approveCd = obj.getApproveCd();
        String remark = obj.getRemark();
        String usrEvalGrade = obj.getUsrEvalGrade();

        String evalRsltYn = "";

        if(approveCd.equals("D")){
            evalRsltYn = "N";
        }else {
            evalRsltYn = "Y";
        }

        for(GroupSalesReviewVO grpVO : obj.getUpdateList()){

            GroupSalesReviewVO vo = new GroupSalesReviewVO();
            vo.setDlrCd(grpVO.getDlrCd());
            vo.setUsrId(grpVO.getUsrId());
            vo.setReqSeq(grpVO.getReqSeq());
            vo.setApproveCd(approveCd);
            vo.setEvalRsltYn(evalRsltYn);
            vo.setRemark(remark);
            vo.setUsrEvalGrade(usrEvalGrade);
            vo.setRegUsrId(LoginUtil.getUserId());
            vo.setUpdtUsrId(LoginUtil.getUserId());

            groupSalesReviewDAO.insertGroupSalesReview(vo);
            groupSalesReviewDAO.updateGroupSalesReview(vo);

            groupSalesReviewDAO.procPackageReview(vo);
       }

        /*
        GroupSalesReviewVO procVO = new GroupSalesReviewVO();
        if(StringUtils.isNotBlank(obj.getUpdateList().get(0).getDlrCd())){
            procVO.setDlrCd(obj.getUpdateList().get(0).getDlrCd());
            procVO.setUsrId(obj.getUpdateList().get(0).getUsrId());
            procVO.setReqSeq(obj.getUpdateList().get(0).getReqSeq());

            groupSalesReviewDAO.procPackageReview(procVO);

            ////Map<String, Object> message = new HashMap<String, Object>();
            //salesCommonCamelService.executeEaiService(procVO.getDlrCd(),"SAL090",message,"Y");
            //salesCommonCamelService.executeEaiService("SAL090");
            //SAL087  집단판매신청정보송신1     DMS->DCS  SA_0414IS
            //SAL088  집단판매신청정보송신2     DMS->DCS  SA_0413IS
            //SAL089  집단판매신청정보송신3     DMS->DCS  SA_0415IS
            //SAL090  집단판매신청심사결과수신        DCS->DMS  SA_0412IS
        }
        */

        return 0;
    }

    /**
    *
    * 등록된 파일 조회
    *
    * @param searchVO
    * @return
    * @throws Exception
    */
    public List<FileItemVO> selectGroupSalesFileByCondition(GroupSalesReviewSearchVO searchVO) throws Exception{

        return groupSalesReviewDAO.selectGroupSalesFileByCondition(searchVO);

    }



    @Override
    public List<GroupSalesReviewVO> selectGroupSalesReviewExcelByCondition(GroupSalesReviewSearchVO searchVO)throws Exception {


        return groupSalesReviewDAO.selectGroupSalesReviewExcelByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.core.support.excel.JxlsSupport#initContext(org.jxls.common.Context, able.com.vo.HMap)
     */
    @Override
    public void initJxlsContext(Context context, HMap params) throws Exception {
        String langCd = LocaleContextHolder.getLocale().getLanguage();
        GroupSalesReviewSearchVO searchVO = new GroupSalesReviewSearchVO();
        List<GroupSalesReviewVO> list = new ArrayList<GroupSalesReviewVO>();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");

        if(  ((String)params.get("sListType")).equals("LIST") ){

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

            searchVO.setsLangCd(langCd);
            searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
            searchVO.setsApporveUsrId(LoginUtil.getUserId());
            list = selectGroupSalesReviewExcelByCondition(searchVO);
        }else{
            list = selectDetlVehPopByCondition(searchVO);
        }

        context.putVar("items", list);
    }
}