package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.mob.api.repair.dao.RepairServiceLaborDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.api.repair.service.RepairServiceLaborService;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelMappingVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;
import chn.bhmc.dms.mob.api.repair.vo.ServiceLaborVO;
import chn.bhmc.dms.mob.api.repair.vo.TabInfoSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ServiceLaborServiceImpl.java
 * @Description : 공통 공임 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 8. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 23.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("RepairServiceLaborService")
public class RepairServiceLaborServiceImpl extends HService implements RepairServiceLaborService {

    @Resource(name="RepairServiceLaborDAO")
    RepairServiceLaborDAO RepairServiceLaborDAO;

    @Autowired
    RepairLtsModelMappingService RepairLtsModelMappingService;


    public int selectServiceLaborsByConditionCnt(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairServiceLaborDAO.selectServiceLaborsByConditionCnt(searchVO);
    }

    public List<ServiceLaborVO> selectServiceLaborsByCondition(TabInfoSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());

        if(StringUtil.nullConvert(searchVO.getsLtsModelCd()).equals("") &&
                !StringUtil.nullConvert(searchVO.getsVinNo()).equals("")
                ){
            LtsModelSearchVO ltsModelsearchVO = new LtsModelSearchVO();
            ltsModelsearchVO.setsVinNo(searchVO.getsVinNo());
            LtsModelMappingVO ltsMappingVO =  RepairLtsModelMappingService.selectMappingLtsModelCdByKey(ltsModelsearchVO);
            searchVO.setsLtsModelCd(ltsMappingVO.getLtsModelCd());
        }

        return RepairServiceLaborDAO.selectServiceLaborsByCondition(searchVO);
    }

   
}