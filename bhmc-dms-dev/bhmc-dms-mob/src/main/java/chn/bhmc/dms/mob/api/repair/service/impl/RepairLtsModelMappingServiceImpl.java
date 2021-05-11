package chn.bhmc.dms.mob.api.repair.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.repair.dao.RepairLtsModelMappingDAO;
import chn.bhmc.dms.mob.api.repair.service.RepairLtsModelMappingService;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelMappingVO;
import chn.bhmc.dms.mob.api.repair.vo.LtsModelSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LtsModelMappingServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki Hyun Kwon
 * @since 2016. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 11.     Ki Hyun Kwon     최초 생성
 * </pre>
 */

@Service("RepairLtsModelMappingService")
public class RepairLtsModelMappingServiceImpl extends HService implements RepairLtsModelMappingService{

    @Resource(name="RepairLtsModelMappingDAO")
    RepairLtsModelMappingDAO RepairLtsModelMappingDAO;
    
    @Override
    public List<LtsModelMappingVO> selectLtsModelsByCondition(LtsModelSearchVO searchVO) throws Exception {

        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairLtsModelMappingDAO.selectLtsModelsByCondition(searchVO);
    }

    @Override
    public LtsModelMappingVO selectMappingLtsModelCdByKey(LtsModelSearchVO searchVO) throws Exception {


        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
        return RepairLtsModelMappingDAO.selectMappingLtsModelCdByKey(searchVO);
    }

}
