package chn.bhmc.dms.bat.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.svi.service.BatIfLaborCodeManageService;
import chn.bhmc.dms.bat.ser.svi.service.BatLaborCodeManageService;
import chn.bhmc.dms.bat.ser.svi.service.dao.BatLaborCodeManageDAO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeSearchVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeVinVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeSearchVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatLaborCodeVinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LaborCodeManageServiceImpl.java
 * @Description : 공임관리 서비스 구현 클래스
 * @author YIN XUEYUAN
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.     YIN XUEYUAN     최초 생성
 * </pre>
 */

@Service("batLaborCodeManageService")
public class BatLaborCodeManageServiceImpl extends HService implements BatLaborCodeManageService{

    @Resource(name="batLaborCodeManageDAO")
    BatLaborCodeManageDAO batLaborCodeManageDAO;

    @Resource(name="batIfLaborCodeManageService")
    BatIfLaborCodeManageService batIfLaborCodeManageService;



    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatLaborCodeMasterVO> selectLaborCodeManages(BatLaborCodeSearchVO searchVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborCodeManages(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborCodeManageByConditionCnt(BatLaborCodeSearchVO searchVO) throws Exception {
        return batLaborCodeManageDAO.selectLaborCodeManageByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatLaborCodeDetailVO> selectLaborCodeManageByCondition(BatLaborCodeSearchVO searchVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborCodeManageByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatLaborCodeDetailVO> selectLaborCodeDetailByCondition(BatLaborCodeSearchVO searchVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborCodeDetailByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatLaborCodeVinVO> selectLaborCodeVinByCondition(BatLaborCodeSearchVO searchVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborCodeVinByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatLaborCodeModelVO> selectLaborCodeModelByCondition(BatLaborCodeSearchVO searchVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborCodeModelByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborMasterByConditionCnt(BatLaborCodeMasterVO laborVO) throws Exception {

        return batLaborCodeManageDAO.selectLaborMasterByConditionCnt(laborVO);
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception {

        batLaborCodeManageDAO.insertLaborMaster(laborVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception {

        batLaborCodeManageDAO.updateLaborMaster(laborVO);

    }
    /*
     * 공임 관련 정보 일과 처리
     */
    public void multiLabor() throws Exception{
        //공임 헤더 정보 저장
        multiLaborMaster();
        //LTS 디테일 저장
        multiLaborCodeDetail();
        //LTS VIN MAPPING 저장
        multiLaborCodeVin();
        //LTS MODEL 정장
        multiLaborCodeModel();
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiLaborMaster() throws Exception {
        //LTS 헤더 저장
        BatIfLaborCodeSearchVO batIfLaborCodeSearchVO = new BatIfLaborCodeSearchVO();
        batIfLaborCodeSearchVO.setsDstinCd("H");
        List<BatIfLaborCodeMasterVO> batIfLaborCodeMasterVOs = batIfLaborCodeManageService.selectLaborCodeManages(batIfLaborCodeSearchVO);

        for(BatIfLaborCodeMasterVO vo : batIfLaborCodeMasterVOs){
            BatLaborCodeSearchVO blcsvo = new BatLaborCodeSearchVO();
            blcsvo.setsDstinCd(vo.getDstinCd());
            blcsvo.setsDlrCd(vo.getDlrCd());
            blcsvo.setsLbrCd(vo.getLbrCd());
            List<BatLaborCodeMasterVO> batLaborCodeMasterVOs = batLaborCodeManageDAO.selectLaborCodeManages(blcsvo);

            if(batLaborCodeMasterVOs.size()>0){
                batLaborCodeManageDAO.updateLaborMaster(vo);
            }else{
                batLaborCodeManageDAO.insertLaborMaster(vo);
            }

        }

        log.debug("labor master insert====");
    }


    /*
     * 공임 디테일정보를 들록/수정
     */
    @Override
    public void multiLaborCodeDetail() throws Exception {

        BatIfLaborCodeSearchVO batIfLaborCodeSearchVO = new BatIfLaborCodeSearchVO();
        batIfLaborCodeSearchVO.setsDstinCd("H");
        List<BatIfLaborCodeDetailVO> batIfLaborCodeDetailVOs = batIfLaborCodeManageService.selectLaborCodeDetailByCondition(batIfLaborCodeSearchVO);

        for(BatIfLaborCodeDetailVO vo : batIfLaborCodeDetailVOs){
            BatLaborCodeSearchVO blcsvo = new BatLaborCodeSearchVO();
            blcsvo.setsDstinCd(vo.getDstinCd());
            blcsvo.setsDlrCd(vo.getDlrCd());
            blcsvo.setsLbrCd(vo.getLbrCd());
            blcsvo.setsLtsModelCd(vo.getLtsModelCd());
            blcsvo.setsValidStartDt(vo.getValidStartDt());
            List<BatLaborCodeDetailVO> batLaborCodeDetailVOs = batLaborCodeManageDAO.selectLaborCodeDetailByCondition(blcsvo);

            if(batLaborCodeDetailVOs.size()>0){
                batLaborCodeManageDAO.updateLaborCodeDetail(vo);
            }else{
                batLaborCodeManageDAO.insertLaborCodeDetail(vo);
            }

        }
        log.debug("labor detail insert====");
    }

    /*
     * 공임 VIN MAPPING 정보를 들록/수정
     */
    @Override
    public void multiLaborCodeVin() throws Exception {

        BatIfLaborCodeSearchVO batIfLaborCodeSearchVO = new BatIfLaborCodeSearchVO();
        List<BatIfLaborCodeVinVO> batIfLaborCodeVinVOs = batIfLaborCodeManageService.selectLaborCodeVinByCondition(batIfLaborCodeSearchVO);

        for(BatIfLaborCodeVinVO vo : batIfLaborCodeVinVOs){
            BatLaborCodeSearchVO blcsvo = new BatLaborCodeSearchVO();
            blcsvo.setsVinNo(vo.getVinNo());
            List<BatLaborCodeVinVO> batLaborCodeVinVOs = batLaborCodeManageDAO.selectLaborCodeVinByCondition(blcsvo);

            if(batLaborCodeVinVOs.size()==0){
                batLaborCodeManageDAO.insertLaborCodeVin(vo);
            }

        }
        log.debug("labor vin insert====");
    }

    /*
     * 공임 MODEL 정보를 들록/수정
     */
    @Override
    public void multiLaborCodeModel() throws Exception {

        BatIfLaborCodeSearchVO batIfLaborCodeSearchVO = new BatIfLaborCodeSearchVO();
        List<BatIfLaborCodeModelVO> batIfLaborCodeModelVOs = batIfLaborCodeManageService.selectLaborCodeModelByCondition(batIfLaborCodeSearchVO);

        for(BatIfLaborCodeModelVO vo : batIfLaborCodeModelVOs){
            BatLaborCodeSearchVO blcsvo = new BatLaborCodeSearchVO();
            blcsvo.setsLtsModelCd(vo.getLtsModelCd());
            List<BatLaborCodeModelVO> batLaborCodeModelVOs = batLaborCodeManageDAO.selectLaborCodeModelByCondition(blcsvo);

            if(batLaborCodeModelVOs.size()>0){
                batLaborCodeManageDAO.updateLaborCodeModel(vo);
            }else{
                batLaborCodeManageDAO.insertLaborCodeModel(vo);
            }

        }
        log.debug("labor vin insert====");
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.insertLaborCodeDetail(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.updateLaborCodeDetail(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborCodeVin(BatIfLaborCodeVinVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.insertLaborCodeVin(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborCodeVin(BatIfLaborCodeVinVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.updateLaborCodeVin(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborCodeModel(BatIfLaborCodeModelVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.insertLaborCodeModel(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborCodeModel(BatIfLaborCodeModelVO laborCodeVO) throws Exception {

        batLaborCodeManageDAO.updateLaborCodeModel(laborCodeVO);

    }





}
