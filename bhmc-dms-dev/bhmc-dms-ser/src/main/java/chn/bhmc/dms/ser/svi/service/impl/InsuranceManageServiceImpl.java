package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.InsuranceManageService;
import chn.bhmc.dms.ser.svi.service.dao.InsuranceManageDAO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.InsuranceManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InsuranceManageServiceImpl.java
 * @Description : 보험 관리 서비스 구현 클래스
 * @author Ki Hyun Kwon
 * @since 2016. 1. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 27.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Service("insuranceManageService")
public class InsuranceManageServiceImpl extends HService implements InsuranceManageService {


    /**
     * 보험관리 DAO
     */
    @Resource(name="insuranceManageDAO")
    InsuranceManageDAO insuranceManageDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectInsuranceManagesByConditionCnt(InsuranceManageSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return insuranceManageDAO.selectInsuranceManagesByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<InsuranceManageVO> selectInsuranceManagesByCondition(InsuranceManageSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return insuranceManageDAO.selectInsuranceManagesByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiInsuranceMangages(BaseSaveVO<InsuranceManageVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(InsuranceManageVO insuMgtVO : obj.getInsertList() ){
            insuMgtVO.setRegUsrId(userId);
            insertInsuranceManage(insuMgtVO);
        }
        for(InsuranceManageVO insuMgtVO : obj.getUpdateList()){

            insuMgtVO.setRegUsrId(userId);
            updateInsuranceManage(insuMgtVO);
        }
        for(InsuranceManageVO insuMgtVO : obj.getDeleteList()){

            insuMgtVO.setRegUsrId(userId);
            deleteInsuranceManage(insuMgtVO);
        }

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int insertInsuranceManage(InsuranceManageVO insuMgtVO) throws Exception {


        InsuranceManageVO objVO = selectInsuranceManageByKey(insuMgtVO);

        if(objVO != null){
            Exception e = processException("global.err.duplicate");
            throw e;
        }

        return insuranceManageDAO.insertInsuranceManage(insuMgtVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public InsuranceManageVO selectInsuranceManageByKey(InsuranceManageVO insuVO) throws Exception {

        return insuranceManageDAO.selectInsuranceManageByKey(insuVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updateInsuranceManage(InsuranceManageVO insuMgtVO) throws Exception {

        /*if(obj != null) {
            //TODO [한강석] 메세지소스 적용 필요
            throw processException("global.lbl.no");
        }*/

        return insuranceManageDAO.updateInsuranceManage(insuMgtVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.InsuranceManageService#deleteInsuranceManage(chn.bhmc.dms.ser.svi.vo.InsuranceManageVO)
     */
    @Override
    public int deleteInsuranceManage(InsuranceManageVO insuMgtVO) throws Exception {

        return insuranceManageDAO.deleteInsuranceManage(insuMgtVO);
    }





}
