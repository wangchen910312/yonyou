package chn.bhmc.dms.ser.ins.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.ins.service.InsRegManageService;
import chn.bhmc.dms.ser.ins.service.dao.InsRegManageDAO;
import chn.bhmc.dms.ser.ins.vo.InsRegDetailVO;
import chn.bhmc.dms.ser.ins.vo.InsRegSaveVO;
import chn.bhmc.dms.ser.ins.vo.InsRegSearchVO;
import chn.bhmc.dms.ser.ins.vo.InsRegVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsRegManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 8. 8.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 8.     Kwon ki hyun     최초 생성
 * </pre>
 */

@Service("insRegManageService")
public class InsRegManageServiceImpl extends HService implements InsRegManageService{

    @Resource(name="insRegManageDAO")
    InsRegManageDAO insRegManageDAO;


    @Resource(name="insDocNoIdGenService")
    TableIdGenService insDocNoIdGenService;

    /**
     *
     * 보험 등록 관리 등록/수정/삭제
     *
     * @throws Exception
     */
    public void multiInsRegManage(InsRegSaveVO saveVO)throws Exception{



        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        BaseSaveVO<InsRegVO> objVO = saveVO.getInsReqVO();

        for(InsRegVO insRegVO : objVO.getInsertList()){

            String incDocNo = insDocNoIdGenService.getNextStringId();

            insRegVO.setDlrCd(dlrCd);
            insRegVO.setRegUsrId(userId);
            insRegVO.setIncDocNo(incDocNo);
            insertInsRegManage(insRegVO);


        }
        for(InsRegVO insRegVO : objVO.getUpdateList()){

            insRegVO.setDlrCd(dlrCd);
            insRegVO.setRegUsrId(userId);
            insRegVO.setUpdtUsrId(userId);
            updateInsRegManage(insRegVO);

        }
        for(InsRegVO insRegVO : objVO.getDeleteList()){

            insRegVO.setDlrCd(dlrCd);
            deleteInsRegManage(insRegVO);
            //상세 보험 삭제
            InsRegDetailVO insRegDetailVO = new InsRegDetailVO();
            insRegDetailVO.setDlrCd(insRegVO.getDlrCd());
            insRegDetailVO.setIncDocNo(insRegVO.getIncDocNo());
            deleteInsRegDetailManage(insRegDetailVO);
        }



    }


    /**
     *
     * 보험 등록 관리 상세 등록/수정/삭제
     *
     * @throws Exception
     */
    public void multiInsRegDetailManage(InsRegSaveVO saveVO)throws Exception{

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        BaseSaveVO<InsRegDetailVO> objVO = saveVO.getInsDetailVO();

        for(InsRegDetailVO insRegDetailVO : objVO.getInsertList()){

            insRegDetailVO.setDlrCd(dlrCd);
            insRegDetailVO.setRegUsrId(userId);
            insertInsRegDetailManage(insRegDetailVO);


        }
        for(InsRegDetailVO insRegDetailVO : objVO.getUpdateList()){

            insRegDetailVO.setDlrCd(dlrCd);
            insRegDetailVO.setRegUsrId(userId);
            insRegDetailVO.setUpdtUsrId(userId);
            updateInsRegDetailManage(insRegDetailVO);

        }
        for(InsRegDetailVO insRegDetailVO : objVO.getDeleteList()){

            insRegDetailVO.setDlrCd(dlrCd);
            deleteInsRegDetailManage(insRegDetailVO);
        }

    }

    /**
    *
    * 보험등록 관리 등록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int insertInsRegManage(InsRegVO insRegVO) throws Exception {

        return insRegManageDAO.insertInsRegManage(insRegVO);
    }

    /**
    *
    * 보험등록 관리 수정
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    public int updateInsRegManage(InsRegVO insRegVO) throws Exception {

        return insRegManageDAO.updateInsRegManage(insRegVO);
    }

    /**
    *
    * 보험등록 관리 삭제
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int deleteInsRegManage(InsRegVO insRegVO) throws Exception {

        return insRegManageDAO.deleteInsRegManage(insRegVO);
    }

    /**
    *
    * 보험등록관리 상세 등록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int insertInsRegDetailManage(InsRegDetailVO insRegDetailVO) throws Exception {

        return insRegManageDAO.insertInsRegDetailManage(insRegDetailVO);
    }

    /**
    *
    * 보험등록관리 상세 수정
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int updateInsRegDetailManage(InsRegDetailVO insRegDetailVO) throws Exception {

        return insRegManageDAO.updateInsRegDetailManage(insRegDetailVO);
    }

    /**
    *
    * 보험등록관리 상세 삭제
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int deleteInsRegDetailManage(InsRegDetailVO insRegDetailVO) throws Exception {

        return insRegManageDAO.deleteInsRegDetailManage(insRegDetailVO);
    }

    /**
    *
    * 보험등록관리 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int selectInsRegManagesByConditionCnt(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegManagesByConditionCnt(searchVO);
    }

    /**
    *
    * 보험등록관리 목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public List<InsRegVO> selectInsRegManagesByCondition(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegManagesByCondition(searchVO);
    }

    /**
    *
    * 보험등록관리 상세 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int selectInsRegDetailManagesByConditionCnt(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegDetailManagesByConditionCnt(searchVO);
    }

    /**
    *
    * 보험등록관리 상세 목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public List<InsRegDetailVO> selectInsRegDetailManagesByCondition(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegDetailManagesByCondition(searchVO);
    }

    /**
     *
     * Excel Data 저장
     *
     * @param insRegVO
     * @throws Exception
     */
    public void insertExcelUpload( List<InsRegVO> insRegList)throws Exception{


        for(InsRegVO insRegVO : insRegList){
            String incDocNo = insDocNoIdGenService.getNextStringId();

            insRegVO.setDlrCd(LoginUtil.getDlrCd());
            insRegVO.setRegUsrId(LoginUtil.getUserId());
            insRegVO.setIncDocNo(incDocNo);
            if( !StringUtil.isNullToString(insRegVO.getVinNo()).equals("")){
                insRegManageDAO.insertInsRegManage(insRegVO);
            }
        }
    }


    /**
    *
    * 보험등록관리 현황 목록수
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public int selectInsRegListByConditionCnt(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegListByConditionCnt(searchVO);
    }


    /**
    *
    * 보험등록관리 현황
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    @Override
    public List<InsRegVO> selectInsRegListByCondition(InsRegSearchVO searchVO) throws Exception {

        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        return insRegManageDAO.selectInsRegListByCondition(searchVO);
    }

    /**
    *
    * 보험팝업  목록
    *
    * @param insRegVO
    * @return
    * @throws Exception
    */
    public int selectInsuManagesByConditionCnt(InsuranceManageSearchVO searchVO)throws Exception{
        
        
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        
        return insRegManageDAO.selectInsuManagesByConditionCnt(searchVO);
    }

    /**
     *
     * 보험팝업  목록
     *
     * @param insRegVO
     * @return
     * @throws Exception
     */
    public List<InsuranceManageVO> selectInsuManagesByCondition(InsuranceManageSearchVO searchVO)throws Exception{
        
        
        if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("")){
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
        }
        
        return insRegManageDAO.selectInsuManagesByCondition(searchVO);
    }
    

}
