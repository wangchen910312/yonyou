package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartComItemMasterDAO;
import chn.bhmc.dms.mob.api.part.service.PartComItemMasterService;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterSearchVO;
import chn.bhmc.dms.mob.api.part.vo.ComItemMasterVO;


/**
 * <pre>
 * 공용품목마스터 관리 서비스 구현 클래스
 * </pre>
 *
 * @ClassName   : ComItemMasterServiceImpl.java
 * @author Eun Jung Jang
 * @since 2016. 5. 16.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 16.     Eun Jung Jang     최초 생성
 * </pre>
 */

@Service("PartComItemMasterService")
public class PartComItemMasterServiceImpl extends HService implements PartComItemMasterService  {


    /**
     * 공용품목마스터 관리 DAO
     */
    @Resource(name="PartComItemMasterDAO")
    PartComItemMasterDAO PartComItemMasterDAO;

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#comItemMasterByKey(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public List<ComItemMasterVO> comItemMasterByKey(ComItemMasterSearchVO searchVO) throws Exception {
        return PartComItemMasterDAO.comItemMasterByKey(searchVO);
    }

    /*
     * @see chn.bhmc.dms.par.pmm.service.ItemMasterService#comItemMasterByKeyCnt(chn.bhmc.dms.par.pmm.vo.ComItemMasterSearchVO)
     */
    @Override
    public int comItemMasterByKeyCnt(ComItemMasterSearchVO searchVO) throws Exception {
        return PartComItemMasterDAO.comItemMasterByKeyCnt(searchVO);
    }

 
}
