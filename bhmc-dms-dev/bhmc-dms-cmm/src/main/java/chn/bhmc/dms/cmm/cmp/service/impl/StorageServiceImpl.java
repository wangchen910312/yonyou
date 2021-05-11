package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.service.StorageService;
import chn.bhmc.dms.cmm.cmp.service.dao.StorageDAO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;

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

@Service("storageService")
public class StorageServiceImpl extends HService implements StorageService {

    /**
     * 창고 관리 DAO
     */
    @Resource(name="storageDAO")
    StorageDAO storageDAO;

    /**
     * {@inheritDoc}
     */
    @Override
    public int insertStorage(StorageVO storageVO) throws Exception {

        StorageVO obj = selectStorageByKey(storageVO.getDlrCd(), storageVO.getPltCd(), storageVO.getStrgeCd());

        if(obj != null) {
            throw processException("global.err.duplicate");
        }

        return storageDAO.insertStorage(storageVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int updateStorage(StorageVO storageVO) throws Exception {
        return storageDAO.updateStorage(storageVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int deleteStorage(StorageVO storageVO) throws Exception {
        return storageDAO.deleteStorage(storageVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void multiStorages(BaseSaveVO<StorageVO> obj)  throws Exception {

        String userId = LoginUtil.getUserId();

        for(StorageVO storageVO : obj.getInsertList()){
            storageVO.setRegUsrId(userId);
            insertStorage(storageVO);
        }

        for(StorageVO storageVO : obj.getUpdateList()){
            storageVO.setUpdtUsrId(userId);
            updateStorage(storageVO);
        }

        for(StorageVO storageVO : obj.getDeleteList()){
            deleteStorage(storageVO);
        }
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public StorageVO selectStorageByKey(String pltCd, String dlrCd, String strgeCd) throws Exception {
        return storageDAO.selectStorageByKey(pltCd, dlrCd, strgeCd);
    }


    /**
     * {@inheritDoc}
     */
    @Override
    public List<StorageVO> selectStoragesByCondition(StorageSearchVO searchVO) throws Exception {
        return storageDAO.selectStoragesByCondition(searchVO);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public int selectStoragesByConditionCnt(StorageSearchVO searchVO) throws Exception {
        return storageDAO.selectStoragesByConditionCnt(searchVO);
    }


}
