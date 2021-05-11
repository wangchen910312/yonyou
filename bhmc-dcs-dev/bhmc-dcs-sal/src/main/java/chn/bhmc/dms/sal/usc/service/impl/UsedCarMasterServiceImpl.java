package chn.bhmc.dms.sal.usc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.usc.service.UsedCarMasterService;
import chn.bhmc.dms.sal.usc.service.dao.UsedCarMasterDAO;
import chn.bhmc.dms.sal.usc.vo.TopSelectionUsedCarVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSaveVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterSearchVO;
import chn.bhmc.dms.sal.usc.vo.UsedCarMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarMasterServiceImpl
 * @Description : 중고차량마스터관리
 * @author
 * @since 2016. 6. 2.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 2.      Kim yewon              최초 생성
 * </pre>
 */

@Service("usedCarMasterService")
public class UsedCarMasterServiceImpl extends HService implements UsedCarMasterService {

    /**
     * 중고 DAO 선언
     */
    @Resource(name="usedCarMasterDAO")
    UsedCarMasterDAO usedCarMasterDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<UsedCarMasterVO> selectUsedCarMasterByCondition(UsedCarMasterSearchVO searchVO){
        return usedCarMasterDAO.selectUsedCarMasterByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectUsedCarMasterByConditionCnt(UsedCarMasterSearchVO searchVO) {
        return usedCarMasterDAO.selectUsedCarMasterByConditionCnt(searchVO);
    }


    /**
     * 중고차량정보(단건) 조회
     */
    @Override
    public UsedCarMasterVO selectUsedCar(String carId) throws Exception {
        return usedCarMasterDAO.selectUsedCar(carId);
    }


    /**
     * 수선차량정보(단건) 조회
     */
    @Override
    public TopSelectionUsedCarVO selectTopSelectionCar(String carId) throws Exception {
        return usedCarMasterDAO.selectTopSelectionCar(carId);
    }





    /**
     * 중고차량 정보를 멀티저장..
     */
    @Override
    public void multiSaveUsedCar(UsedCarMasterSaveVO saveVO) throws Exception{

        saveVO.getUsedCarMasterVO().setUpdtUsrId(LoginUtil.getUserId());

        //차량상세정보
        usedCarMasterDAO.updateUsedCar(saveVO.getUsedCarMasterVO());


        //차량소유자 정보
        if(saveVO.getOwnerGridVO() != null){
            saveUsedCarOwner(saveVO.getOwnerGridVO(),saveVO.getUsedCarMasterVO());
        }

        //차량운전자 정보
        if(saveVO.getDriverGridVO() != null){
            saveUsedCarDriver(saveVO.getDriverGridVO(),saveVO.getUsedCarMasterVO());
        }


    }


    /**
     * 조회 조건에 해당하는 차량소유자 정보를 조회한다.
     */
    @Override
    public int selectUsedCarOwnerByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception {
        return usedCarMasterDAO.selectUsedCarOwnerByConditionCnt(searchVO);
    }
    @Override
    public List<UsedCarMasterVO> selectUsedCarOwnerByCondition(UsedCarMasterSearchVO searchVO) throws Exception {
        return usedCarMasterDAO.selectUsedCarOwnerByCondition(searchVO);
    }


    /**
     * 차량소유자 저장한다.
     */
    @Override
    public void saveUsedCarOwner(BaseSaveVO<UsedCarMasterVO> obj,UsedCarMasterVO usedCarMasterVO) throws Exception{

        // 저장
        for(UsedCarMasterVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            usedCarMasterDAO.updateUsedCarOwnerNonUsed(vo);    // 차량소유자의 사용여부 N으로 변경.
            usedCarMasterDAO.insertUsedCarOwner(vo);
        }

        // 수정
        for(UsedCarMasterVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            if(vo.getSeq() < 1){
                usedCarMasterDAO.updateUsedCarOwnerNonUsed(vo);    // 차량소유자의 사용여부 N으로 변경.
                usedCarMasterDAO.insertUsedCarOwner(vo);
            }else{
                usedCarMasterDAO.updateUsedCarOwner(vo);
            }
        }

    }


    /**
     * 조회 조건에 해당하는 차량운전자 정보를 조회한다.
     */
    @Override
    public int selectUsedCarDriverByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception {
        return usedCarMasterDAO.selectUsedCarDriverByConditionCnt(searchVO);
    }
    @Override
    public List<UsedCarMasterVO> selectUsedCarDriverByCondition(UsedCarMasterSearchVO searchVO) throws Exception {
        return usedCarMasterDAO.selectUsedCarDriverByCondition(searchVO);
    }



    /**
     * 차량운전자 저장한다.
     */
    @Override
    public void saveUsedCarDriver(BaseSaveVO<UsedCarMasterVO> obj,UsedCarMasterVO usedCarMasterVO) throws Exception{

        // 저장
        for(UsedCarMasterVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            usedCarMasterDAO.insertUsedCarDriver(vo);
        }

        // 수정
        for(UsedCarMasterVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());


            if(vo.getSeq() < 1){
                usedCarMasterDAO.insertUsedCarDriver(vo);
            }else{
                usedCarMasterDAO.updateUsedCarDriver(vo);
            }
        }

    }


    /**
     * 중고차 - 계약 차량목록 조회
     */
    @Override
    public int selectUsedCarContsByConditionCnt(UsedCarMasterSearchVO searchVO) throws Exception{
        return usedCarMasterDAO.selectUsedCarContsByConditionCnt(searchVO);
    }
    @Override
    public List<UsedCarMasterVO> selectUsedCarContsByCondition(UsedCarMasterSearchVO searchVO) throws Exception{
        return usedCarMasterDAO.selectUsedCarContsByCondition(searchVO);
    }

}
