package chn.bhmc.dms.mob.api.sales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.mob.api.sales.dao.SalesStorageDAO;
import chn.bhmc.dms.mob.api.sales.service.SalesStorageService;
import chn.bhmc.dms.mob.api.sales.vo.StorageSearchVO;
import chn.bhmc.dms.mob.api.sales.vo.StorageVO;


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

@Service("SalesStorageService")
public class SalesStorageServiceImpl extends HService implements SalesStorageService {

    /**
     * 창고 관리 DAO
     */
    @Resource(name="SalesStorageDAO")
    SalesStorageDAO SalesStorageDAO;

   

    /**
     * {@inheritDoc}
     */
    @Override
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO) throws Exception {
        return SalesStorageDAO.selectStoragesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectStoragesByConditionCnt(StorageSearchVO searchVO) throws Exception {
        return SalesStorageDAO.selectStoragesByConditionCnt(searchVO);
    }


}
