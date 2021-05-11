package chn.bhmc.dms.mob.api.part.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.part.dao.PartStorageDAO;
import chn.bhmc.dms.mob.api.part.service.PartStorageService;
import chn.bhmc.dms.mob.api.part.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.part.vo.StorageVO;

/**
 * 창고 관리 서비스 구현 클래스
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

@Service("PartStorageService")
public class PartStorageServiceImpl extends HService implements PartStorageService {

    /**
     * 창고 관리 DAO
     */
    @Resource(name="PartStorageDAO")
    PartStorageDAO PartStorageDAO;

   

    /**
     * {@inheritDoc}
     */
    @Override
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO) throws Exception {
        return PartStorageDAO.selectStoragesByCondition(searchVO);
    }

   
}
