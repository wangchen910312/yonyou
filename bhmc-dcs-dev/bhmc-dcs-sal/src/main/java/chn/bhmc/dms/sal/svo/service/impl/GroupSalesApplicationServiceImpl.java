package chn.bhmc.dms.sal.svo.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.dao.FileMgrDAO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.svo.service.GroupSalesApplicationService;
import chn.bhmc.dms.sal.svo.service.dao.GroupSalesApplicationDAO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationJdgVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationPopupVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSaveVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationSearchVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVO;
import chn.bhmc.dms.sal.svo.vo.GroupSalesApplicationVehVO;
import chn.bhmc.dms.sal.veh.vo.VehicleMasterVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : GroupSalesApplicationServiceImpl
 * @Description : 집단판매신청
 * @author
 * @since 2016. 3. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016.03.20          최초 생성
 * </pre>
 */

@Service("groupSalesApplicationService")
public class GroupSalesApplicationServiceImpl extends HService implements GroupSalesApplicationService {

    /**
     * 집단판매신청 DAO 선언
     */
    @Resource(name="groupSalesApplicationDAO")
    GroupSalesApplicationDAO groupSalesApplicationDAO;


    // id Gen 서비스
    @Resource(name="salHelpCarNoIdGenService")
    EgovIdGnrService salHelpCarNoIdGenService;


    @Resource(name="fileMgrDAO")
    FileMgrDAO fileMgrDAO;


    /**
     * 조회 조건에 해당하는 목록 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 총 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return
     */
    @Override
    public int selectGroupSalesApplicationByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 목록 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVO> selectGroupSalesApplicationDetailByCondition(GroupSalesApplicationVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetailByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  차량 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationVehVO> selectGroupSalesApplicationDetVehByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetVehByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는  차량심사 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    @Override
    public List<GroupSalesApplicationJdgVO> selectGroupSalesApplicationDetJdgByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception{
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return groupSalesApplicationDAO.selectGroupSalesApplicationDetJdgByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 상세 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationVO
     * @return 조회 목록
     */
    public GroupSalesApplicationVO selectGroupSalesApplicationDetailByKey(GroupSalesApplicationSearchVO searchVO) throws Exception{

        searchVO.setsApporveDlrCd(LoginUtil.getDlrCd());
        searchVO.setsApporveUsrId(LoginUtil.getUserId());

        return groupSalesApplicationDAO.selectGroupSalesApplicationDetailByKey(searchVO);
    }

    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0414T, SA_0415T)
     */
    public GroupSalesApplicationVO multiGroupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception{

//        GroupSalesApplicationVehVO grpSalesAppVehVO = new GroupSalesApplicationVehVO();

        GroupSalesApplicationVO vo = new GroupSalesApplicationVO();

        vo = saveVO.getGroupSalesApplicationVO();
        vo.setRegUsrId(LoginUtil.getUserId());
        vo.setUpdtUsrId(LoginUtil.getUserId());
        vo.setDlrCd(LoginUtil.getDlrCd());


/*        //파일업로드테이블(공통) 임시저장 필드 'N'처리.
        FileDocVO fileDocVO = new FileDocVO();
        fileDocVO.setTempYn("N");
        fileDocVO.setFileDocNo(vo.getHeadFileDocId());
        synchronized(FileMgrServiceImpl.class){
            fileMgrDAO.updateFileDoc(fileDocVO);
        }

        */



        GroupSalesApplicationVO grpSaleAppVO = new GroupSalesApplicationVO();
        if(saveVO.getGroupSalesApplicationVO().getSubmitGubun().equals("save")){
        	vo.setApproveCd("A");
            if( saveVO.getGroupSalesApplicationVO().getReqSeq() > 0 ){
                groupSalesApplicationDAO.updateGroupSalesApplication(vo);
            }else{
                vo.setUsrId(LoginUtil.getUserId());
                groupSalesApplicationDAO.insertGroupSalesApplication(vo);       //INSERT SA_0414T

            }


            groupSalesApplicationDAO.deleteGroupSalesApplicationVeh(vo);
            groupSalesApplicationDAO.deleteGroupSalesApplicationVehDet(vo);

            for( GroupSalesApplicationVehVO searchVO : saveVO.getInsertGroupSalesApplicationVehList() ){

                searchVO.setDlrCd(vo.getDlrCd());
                searchVO.setReqSeq(vo.getReqSeq());
                searchVO.setRegUsrId(LoginUtil.getUserId());
                searchVO.setUpdtUsrId(LoginUtil.getUserId());
                searchVO.setUsrId(vo.getUsrId());

                groupSalesApplicationDAO.insertGroupSalesApplicationVeh(searchVO);  //INSERT SA_0415T

                groupSalesApplicationDAO.insertGroupSalesApplicationVehDet(searchVO);   //INSERT SA_0413T


            }

            grpSaleAppVO = groupSalesApplicationDAO.selectGroupSalesApplication(vo);

        }else if(saveVO.getGroupSalesApplicationVO().getSubmitGubun().equals("fix")){
        	GroupSalesApplicationVO groupSalesApplicationVO = new GroupSalesApplicationVO();
        	groupSalesApplicationVO = saveVO.getGroupSalesApplicationVO();
        	if(saveVO.getGroupSalesApplicationVO().getReqSeq() > 0){
        		groupSalesApplicationVO.setApproveCd("B");
            	groupSalesApplicationDAO.updateGroupSalesApplicationCnfrm(groupSalesApplicationVO);


            	//집단판매신청정보수신1
                groupSalesApplicationDAO.procFleetSaleFigureReq1(groupSalesApplicationVO);


        	}else {
        		groupSalesApplicationVO.setUsrId(LoginUtil.getUserId());
        		groupSalesApplicationVO.setApproveCd("B");
                groupSalesApplicationDAO.insertGroupSalesApplication(groupSalesApplicationVO);       //INSERT SA_0414T

                for( GroupSalesApplicationVehVO searchVO : saveVO.getInsertGroupSalesApplicationVehList() ){

                    searchVO.setDlrCd(groupSalesApplicationVO.getDlrCd());
                    searchVO.setReqSeq(groupSalesApplicationVO.getReqSeq());
                    searchVO.setRegUsrId(LoginUtil.getUserId());
                    searchVO.setUpdtUsrId(LoginUtil.getUserId());
                    searchVO.setUsrId(groupSalesApplicationVO.getUsrId());

                    groupSalesApplicationDAO.insertGroupSalesApplicationVeh(searchVO);  //INSERT SA_0415T

                    groupSalesApplicationDAO.insertGroupSalesApplicationVehDet(searchVO);   //INSERT SA_0413T


                }
                //집단판매신청정보수신1
                groupSalesApplicationDAO.procFleetSaleFigureReq1(groupSalesApplicationVO);

        	}



        	 grpSaleAppVO = groupSalesApplicationDAO.selectGroupSalesApplication(groupSalesApplicationVO);


        }






        //List<GroupSalesApplicationVehVO> grpList = groupSalesApplicationDAO.selectGroupSalesApplicationDetGrpByCondition(grpSalesAppVehVO);
        //groupSalesApplicationDAO.updateGroupSalesApplicationVeh(grpList.get(0));
/*
        for( GroupSalesApplicationVO searchVO : saveVO.getGroupSalesApplicationList() ){

            List<GroupSalesApplicationPopupVO> checkList = groupSalesApplicationDAO.applyGroupSalesApplicationPopup(searchVO);

            if( checkList.size() < 1 ){

                // Vin No의 차량이 존재하지 않습니다.
                throw processException("global.info.confirmMsgParam2"
                                      , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                    ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())  });
            }else if( checkList.size() > 1 ){
                // Vin No가 중복되는 차량이 존재합니다.
                throw processException("global.err.duplicate");
            }else{

                GroupSalesApplicationPopupVO checkVO = (GroupSalesApplicationPopupVO)checkList.get(0);

                if( !checkVO.getEngineNo().equals(searchVO.getEngineNo()) ){
                    // Engine No의 차량이 존재하지 않습니다.
                    throw processException("global.info.confirmMsgParam2"
                                          , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                        ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())  });
                }else{
                    rsltList.add(checkVO);
                }
            }
        }
*/
        return grpSaleAppVO;
    }


    /**
     * 법인 - 집단 판매신청 확정 (SA_0414T)
     */
    public GroupSalesApplicationVO updateGroupSalesApplicationCnfrm(GroupSalesApplicationVO saveVO) throws Exception{

    	groupSalesApplicationDAO.updateGroupSalesApplicationCnfrm(saveVO);


    	//집단판매신청정보수신1
        groupSalesApplicationDAO.procFleetSaleFigureReq1(saveVO);

    	GroupSalesApplicationVO groupSalesApplicationVO = groupSalesApplicationDAO.selectGroupSalesApplication(saveVO);


        return groupSalesApplicationVO;
    }
    /**
     * 법인 - 집단 판매신청 삭제 (SA_0413T, SA_0414T, SA_0415T)
     */
    public int deleteGroupSalesApplication(GroupSalesApplicationVO delVO) throws Exception{

        groupSalesApplicationDAO.deleteGroupSalesApplicationVehDet(delVO);
        groupSalesApplicationDAO.deleteGroupSalesApplicationVeh(delVO);
        groupSalesApplicationDAO.deleteGroupSalesApplication(delVO);

        return 0;
    }


    /**
     * 조회 조건에 해당하는 법인 - 집단판매 신청 팝업 적용 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 GroupSalesApplicationSearchVO
     * @return 조회 목록
     */
    public List<GroupSalesApplicationPopupVO> applyGroupSalesApplicationPopup(GroupSalesApplicationSaveVO searchListVO) throws Exception{

        ArrayList<GroupSalesApplicationPopupVO> rsltList = new ArrayList<GroupSalesApplicationPopupVO>();


        for( GroupSalesApplicationPopupVO searchVO : searchListVO.getApplyList() ){

            List<GroupSalesApplicationPopupVO> checkList = groupSalesApplicationDAO.applyGroupSalesApplicationPopup(searchVO);

            if( checkList.size() < 1 ){

                // Vin No의 차량이 존재하지 않습니다.
                throw processException("global.info.confirmMsgParam2"
                                      , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                    ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())
                                                    ,"(VIN NO : " + searchVO.getVinNo() + ")"});
            }else if( checkList.size() > 1 ){
                // Vin No가 중복되는 차량이 존재합니다.
                throw processException("global.err.duplicate");
            }else{

                GroupSalesApplicationPopupVO checkVO = (GroupSalesApplicationPopupVO)checkList.get(0);

                if( !checkVO.getEnginNo().equals(searchVO.getEnginNo()) ){
                    // Engine No의 차량이 존재하지 않습니다.
                    throw processException("global.info.confirmMsgParam2"
                                          , new String[]{messageSource.getMessage("global.lbl.vinNum", null, LocaleContextHolder.getLocale())
                                                        ,messageSource.getMessage("sal.lbl.engineNo", null, LocaleContextHolder.getLocale())
                                                        ,"(ENGINE NO : " + searchVO.getEnginNo() + ")"});
                }else{
                    rsltList.add(checkVO);
                }
            }
        }

        return rsltList;
    }



    /**
     * 법인 - 집단 판매신청 저장/수정 (SA_0413T, SA_0414T, SA_0415T)
     */
    public List<GroupSalesApplicationVehVO> groupSalesApplication(GroupSalesApplicationSaveVO saveVO) throws Exception{
    	List<GroupSalesApplicationVehVO> groupSalesApplicationVehVO = null;

        for( GroupSalesApplicationVehVO searchVO : saveVO.getInsertGroupSalesApplicationVehList() ){

            searchVO.setDlrCd(saveVO.getDlrCd());
            searchVO.setReqSeq(saveVO.getReqSeq());
            searchVO.setRegUsrId(LoginUtil.getUserId());
            searchVO.setUpdtUsrId(LoginUtil.getUserId());
            searchVO.setUsrId(saveVO.getUsrId());


            groupSalesApplicationDAO.insertGroupSalesApplicationVeh(searchVO);  //INSERT SA_0415T

            //집단판매신청정보수신3
            groupSalesApplicationDAO.procFleetSaleFigureReq3(searchVO);

            groupSalesApplicationDAO.insertGroupSalesApplicationVehDet(searchVO);   //INSERT SA_0413T

            //집단판매신청정보수신2
            groupSalesApplicationDAO.procFleetSaleFigureReq2(searchVO);

        }

        GroupSalesApplicationSearchVO searchVO = new GroupSalesApplicationSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsUsrId(saveVO.getUsrId());
        searchVO.setsReqSeq(Integer.toString(saveVO.getReqSeq()));
        groupSalesApplicationVehVO = groupSalesApplicationDAO.selectGroupSalesApplicationDetVehByCondition(searchVO);


        return groupSalesApplicationVehVO;
    }



    /**
     * 집단판매신청시 조회할 차량(팝업)
     */
    @Override
    public int selectVehicleInfoByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectVehicleInfoByConditionCnt(searchVO);
    }
    @Override
    public List<VehicleMasterVO> selectVehicleInfoByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectVehicleInfoByCondition(searchVO);
    }



    /**
     * 집단판매신청된 차량을 상세조회.
     */
    @Override
    public int selectDetlVehPopByConditionCnt(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectDetlVehPopByConditionCnt(searchVO);
    }
    @Override
    public List<GroupSalesApplicationVehVO> selectDetlVehPopByCondition(GroupSalesApplicationSearchVO searchVO) throws Exception {
        return groupSalesApplicationDAO.selectDetlVehPopByCondition(searchVO);
    }

    /**
     * 프로모션 수정.
     */
    @Override
    public void deleteGroupSalesVeh(GroupSalesApplicationSaveVO vo) throws Exception {

        for(GroupSalesApplicationVehVO veh : vo.getDeleteGroupSalesApplicationVehList()){
            groupSalesApplicationDAO.deleteGroupSalesVehDetl(veh);
            groupSalesApplicationDAO.deleteGroupSalesVehSubHead(veh);
        }
    }

    /**
     * 법인 - 집단 판매신청 확정 (SA_0414T)
     */
    public void updateGroupSalesFile(GroupSalesApplicationVehVO vehVO) throws Exception{

        vehVO.setUpdtUsrId(LoginUtil.getUserId());
        groupSalesApplicationDAO.updateGroupSalesFile(vehVO);

    }

    public void updateSaveAddFile(GroupSalesApplicationVehVO vehVO) throws Exception{

        vehVO.setUpdtUsrId(LoginUtil.getUserId());

        groupSalesApplicationDAO.deleteSaveAddFile(vehVO);
        groupSalesApplicationDAO.updateSaveAddFile(vehVO);
        groupSalesApplicationDAO.updateSaveAddFileForInterface(vehVO);
    }
}
