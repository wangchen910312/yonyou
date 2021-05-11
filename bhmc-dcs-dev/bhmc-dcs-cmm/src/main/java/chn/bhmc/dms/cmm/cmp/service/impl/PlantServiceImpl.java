package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.DealerService;
import chn.bhmc.dms.cmm.cmp.service.PlantService;
import chn.bhmc.dms.cmm.cmp.service.dao.PlantDAO;
import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSaveVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.PlantVO;
import chn.bhmc.dms.core.util.LoginUtil;

/**
 * 센터 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("plantService")
public class PlantServiceImpl extends HService implements PlantService {

    /**
     * 센터 관리 DAO
     */
    @Resource(name="plantDAO")
    PlantDAO plantDAO;

    /**
     * 딜러 관리 서비스
     */
    @Resource(name="dealerService")
    DealerService dealerService;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertPlant(PlantVO plantVO) throws Exception {

        //딜러코드 체크
        DealerVO dealerVO = dealerService.selectDealerByKey(plantVO.getDlrCd());
        if(dealerVO == null){
            throw processException("global.err.invalid", new String[]{messageSource.getMessage("global.lbl.dlrCd", null, LocaleContextHolder.getLocale())});
        }

        //플랜트 중복 체크
        PlantVO obj = selectPlantByKey(plantVO.getDlrCd(), plantVO.getPltCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return plantDAO.insertPlant(plantVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updatePlant(PlantVO plantVO) throws Exception {
        return plantDAO.updatePlant(plantVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deletePlant(PlantVO plantVO) throws Exception {
        return plantDAO.deletePlant(plantVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiPlants(PlantSaveVO obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(PlantVO plantVO : obj.getInsertList()){
            plantVO.setRegUsrId(userId);
            insertPlant(plantVO);
        }

        for(PlantVO plantVO : obj.getUpdateList()){
            plantVO.setUpdtUsrId(userId);
            updatePlant(plantVO);
        }

        for(PlantVO plantVO : obj.getDeleteList()){
            deletePlant(plantVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public PlantVO selectPlantByKey(String pltCd, String dlrCd) throws Exception {
        return plantDAO.selectPlantByKey(pltCd, dlrCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<PlantVO> selectPlantsByCondition(PlantSearchVO searchVO) throws Exception {
        return plantDAO.selectPlantsByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectPlantsByConditionCnt(PlantSearchVO searchVO) throws Exception {
        return plantDAO.selectPlantsByConditionCnt(searchVO);
    }


}
