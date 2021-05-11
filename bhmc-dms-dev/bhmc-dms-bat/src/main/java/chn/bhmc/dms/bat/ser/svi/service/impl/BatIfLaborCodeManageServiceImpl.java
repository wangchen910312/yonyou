package chn.bhmc.dms.bat.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.ser.svi.service.BatIfLaborCodeManageService;
import chn.bhmc.dms.bat.ser.svi.service.dao.BatIfLaborCodeManageDAO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeDetailVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeMasterVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeModelVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeSearchVO;
import chn.bhmc.dms.bat.ser.svi.vo.BatIfLaborCodeVinVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatIfLaborCodeManageServiceImpl.java
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

@Service("batIfLaborCodeManageService")
public class BatIfLaborCodeManageServiceImpl extends HService implements BatIfLaborCodeManageService{

    @Resource(name="batIfLaborCodeManageDAO")
    BatIfLaborCodeManageDAO batIfLaborCodeManageDAO;


    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManages(BatIfLaborCodeSearchVO searchVO) throws Exception {

        return batIfLaborCodeManageDAO.selectLaborCodeManages(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeMasterVO> selectLaborCodeManageMasterByKey(BatIfLaborCodeSearchVO searchVO) throws Exception {

        return batIfLaborCodeManageDAO.selectLaborCodeManageMasterByKey(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborCodeManageByConditionCnt(BatIfLaborCodeSearchVO searchVO) throws Exception {


        return batIfLaborCodeManageDAO.selectLaborCodeManageByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeDetailVO> selectLaborCodeManageByCondition(BatIfLaborCodeSearchVO searchVO) throws Exception {


        return batIfLaborCodeManageDAO.selectLaborCodeManageByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeDetailVO> selectLaborCodeDetailByCondition(BatIfLaborCodeSearchVO searchVO) throws Exception {


        return batIfLaborCodeManageDAO.selectLaborCodeDetailByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeVinVO> selectLaborCodeVinByCondition(BatIfLaborCodeSearchVO searchVO) throws Exception {

        return batIfLaborCodeManageDAO.selectLaborCodeVinByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<BatIfLaborCodeModelVO> selectLaborCodeModelByCondition(BatIfLaborCodeSearchVO searchVO) throws Exception {

        return batIfLaborCodeManageDAO.selectLaborCodeModelByCondition(searchVO);
    }



    /*
     * {@inheritDoc}
     */
    @Override
    public int selectLaborMasterByConditionCnt(BatIfLaborCodeMasterVO laborVO) throws Exception {

        return batIfLaborCodeManageDAO.selectLaborMasterByConditionCnt(laborVO);
    }


    /*
     * {@inheritDoc}
     */
    @Override
    public void insertCheckLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception {



        int resultCnt = selectLaborMasterByConditionCnt(laborVO);

        if(resultCnt > 0){
            Exception e = processException("global.err.duplicate");
            throw e;
        }
        insertLaborMaster(laborVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception {

        batIfLaborCodeManageDAO.insertLaborMaster(laborVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborMaster(BatIfLaborCodeMasterVO laborVO) throws Exception {

        batIfLaborCodeManageDAO.updateLaborMaster(laborVO);

    }


    /*
     * {@inheritDoc}
     */
    @Override
    public void insertLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception {

        batIfLaborCodeManageDAO.insertLaborCodeDetail(laborCodeVO);

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void updateLaborCodeDetail(BatIfLaborCodeDetailVO laborCodeVO) throws Exception {

        batIfLaborCodeManageDAO.updateLaborCodeDetail(laborCodeVO);

    }

}
