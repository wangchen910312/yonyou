package chn.bhmc.dms.sal.usc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.usc.service.PurcEvalService;
import chn.bhmc.dms.sal.usc.service.dao.PurcEvalDAO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalImageVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSaveVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalSearchVO;
import chn.bhmc.dms.sal.usc.vo.PurcEvalVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PurcEvalServiceImpl
 * @Description : 중고차 - 매입평가관리
 * @author
 * @since 2016. 6. 9.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 9.      Kim yewon              최초 생성
 * </pre>
 */

@Service("purcEvalService")
public class PurcEvalServiceImpl extends HService implements PurcEvalService {

    /**
     * 중고차 - 매입평가관리 DAO 선언
     */
    @Resource(name="purcEvalDAO")
    PurcEvalDAO purcEvalDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<PurcEvalVO> selectPurcByCondition(PurcEvalSearchVO searchVO){
        return purcEvalDAO.selectPurcByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectPurcByConditionCnt(PurcEvalSearchVO searchVO) {
        return purcEvalDAO.selectPurcByConditionCnt(searchVO);
    }



    /**
     * 중고차평가매입정보(단건) 조회
     */
    @Override
    public PurcEvalVO selectPurcEvalInfo(String purcNo) throws Exception {
        return purcEvalDAO.selectPurcEvalInfo(purcNo);
    }
    /**
     * 중고차평가매입 - 경매(위탁)정보(단건) 조회
     */
    @Override
    public PurcEvalVO selectAuctInfo(String purcNo) throws Exception {
        return purcEvalDAO.selectAuctInfo(purcNo);
    }


    /**
     * 중고매입관리 - 경매(위탁)목록 조회
     */
    @Override
    public List<PurcEvalVO> selectAuctInfoByCondition(PurcEvalSearchVO searchVO){
        return purcEvalDAO.selectAuctInfoByCondition(searchVO);
    }

    /**
     * 중고매입관리 - 경매(위탁)목록 총 갯수 조회
     */
    @Override
    public int selectAuctInfoByConditionCnt(PurcEvalSearchVO searchVO) {
        return purcEvalDAO.selectAuctInfoByConditionCnt(searchVO);
    }


    /**
     * 중고차평가매입 정보를 저장한다.
     */
    @Override
    public String savePurcEvalMng(PurcEvalVO saveVO) throws Exception{
        String result = null;

        if(saveVO.getManufactYyMmDt() != null){saveVO.setManufactYyMmDt(saveVO.getManufactYyMmDt().replaceAll("-", ""));}
        if(saveVO.getFceIncPrid() != null){saveVO.setFceIncPrid(saveVO.getFceIncPrid().replaceAll("-", ""));}
        if(saveVO.getCarTaxPrid() != null){saveVO.setCarTaxPrid(saveVO.getCarTaxPrid().replaceAll("-", ""));}
        if(saveVO.getYyTestPrid() != null){saveVO.setYyTestPrid(saveVO.getYyTestPrid().replaceAll("-", ""));}
        if(saveVO.getCmcIncPrid() != null){saveVO.setCmcIncPrid(saveVO.getCmcIncPrid().replaceAll("-", ""));}

        if(saveVO.getGubun().equals("I")){
            saveVO.setRegUsrId(LoginUtil.getUserId());          // 등록자
            saveVO.setDlrCd(LoginUtil.getDlrCd());              // 딜러
            purcEvalDAO.insertPurcEvalMng(saveVO);
        }else {
            saveVO.setUpdtUsrId(LoginUtil.getUserId());         // 수정자
            purcEvalDAO.updatePurcEvalMng(saveVO);
        }


        return result;
    }


    /**
     * {@inheritDoc}
     * @throws Exception
     */
    @Override
    public void multiSaveAuctInfo(PurcEvalSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(PurcEvalVO vo : obj.getInsertList()){
            vo.setRegUsrId(userId);
            insertAuctInfo(vo);
        }

        for(PurcEvalVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(userId);
            updateAuctInfo(vo);
        }

        for(PurcEvalVO vo : obj.getDeleteList()){
            deleteAuctInfo(vo);
        }

    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PurcEvalVO selectAuctInfoByKey(PurcEvalVO vo) throws Exception {
        return purcEvalDAO.selectAuctInfoByKey(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int insertAuctInfo(PurcEvalVO vo) throws Exception {

        PurcEvalVO obj = selectAuctInfoByKey(vo);

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return purcEvalDAO.insertAuctInfo(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int updateAuctInfo(PurcEvalVO vo) throws Exception {
        return purcEvalDAO.updateAuctInfo(vo);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteAuctInfo(PurcEvalVO vo) throws Exception {
        return purcEvalDAO.deleteAuctInfo(vo);
    }


    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    @Override
    public PurcEvalImageVO selectImageEvalVal(PurcEvalSearchVO searchVO){
        return purcEvalDAO.selectImageEvalVal(searchVO);
    }

    //중고차매입/평가관리 - 평가용 이미지 데이터 조회.
    @Override
    public int selectImageEvalValCnt(PurcEvalSearchVO searchVO) {
        return purcEvalDAO.selectImageEvalValCnt(searchVO);
    }



    //중고차매입/평가관리 - 평가용 이미지의 평가데이터를 저장.
    @Override
    public String saveImageEval(PurcEvalImageVO saveVO) throws Exception{
        String result = null;

        PurcEvalSearchVO searchVO = new PurcEvalSearchVO();
        searchVO.setsDlrCd(saveVO.getDlrCd());
        searchVO.setsPurcNo(saveVO.getPurcNo());
        int getByKey = purcEvalDAO.selectImageEvalValCnt(searchVO);




        saveVO.setRegUsrId(LoginUtil.getUserId());
        saveVO.setUpdtUsrId(LoginUtil.getUserId());
        if(getByKey == 0){
            purcEvalDAO.insertImageEval(saveVO);
        }else {
            purcEvalDAO.updateImageEval(saveVO);
        }

        return result;
    }



}
