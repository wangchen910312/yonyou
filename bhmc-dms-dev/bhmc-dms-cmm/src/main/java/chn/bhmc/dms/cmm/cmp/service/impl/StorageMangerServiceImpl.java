package chn.bhmc.dms.cmm.cmp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;

import chn.bhmc.dms.cmm.cmp.service.StorageManagerService;
import chn.bhmc.dms.cmm.cmp.service.dao.StorageManagerDAO;
import chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO;
import chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO;
import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * 창고담당자 서비스 구현 클래스
 *
 * @author In Bo Shim
 * @since 2016. 2. 17.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.02.17         In Bo Shim            최초 생성
 * </pre>
 */

@Service("storageManagerService")
public class StorageMangerServiceImpl extends HService implements StorageManagerService {

    /**
     * 창고담당자관리 DAO
     */
    @Resource(name="storageManagerDAO")
    StorageManagerDAO storageManagerDAO;

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#insertStorageManager(chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO)
     */
    @Override
    public int insertStorageManager(StorageManagerVO storageManagerVO) throws Exception {
        return storageManagerDAO.insertStorageManager(storageManagerVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#updateStorageManager(chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO)
     */
    @Override
    public int updateStorageManager(StorageManagerVO storageManagerVO) throws Exception {
        return storageManagerDAO.updateStorageManager(storageManagerVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#deleteStorageManager(chn.bhmc.dms.cmm.cmp.vo.StorageManagerVO)
     */
    @Override
    public int deleteStorageManager(StorageManagerVO storageManagerVO) throws Exception {
        return storageManagerDAO.deleteStorageManager(storageManagerVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#multiStorageManageres(chn.bhmc.dms.core.datatype.BaseSaveVO)
     */
    @Override
    public void multiStorageManageres(BaseSaveVO<StorageManagerVO> storageManagerSaveVO) throws Exception {

        for(StorageManagerVO storageManagerVO : storageManagerSaveVO.getDeleteList()){

            StorageSearchVO searchVO = new StorageSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStrgeCd(storageManagerVO.getStrgeCd());
            searchVO.setsUsrId(storageManagerVO.getUsrId());

            if(storageManagerDAO.selectStorageManageresByConditionCnt(searchVO) > 0){
                storageManagerVO.setDlrCd(LoginUtil.getDlrCd());
                storageManagerDAO.deleteStorageManager(storageManagerVO);
            }
        }

        for(StorageManagerVO storageManagerVO : storageManagerSaveVO.getInsertList()){
            storageManagerVO.setDlrCd(LoginUtil.getDlrCd());
            storageManagerVO.setRegUsrId(LoginUtil.getUserId());
            storageManagerDAO.insertStorageManager(storageManagerVO);
        }

        for(StorageManagerVO storageManagerVO : storageManagerSaveVO.getUpdateList()){

            StorageSearchVO searchVO = new StorageSearchVO();
            searchVO.setsDlrCd(LoginUtil.getDlrCd());
            searchVO.setsStrgeCd(storageManagerVO.getStrgeCd());
            searchVO.setsUsrId(storageManagerVO.getUsrId());

            storageManagerVO.setDlrCd(LoginUtil.getDlrCd());
            storageManagerVO.setUpdtUsrId(LoginUtil.getUserId());
            storageManagerVO.setRegUsrId(LoginUtil.getUserId());

            if(storageManagerDAO.selectStorageManageresByConditionCnt(searchVO) == 0){
                storageManagerDAO.insertStorageManager(storageManagerVO);
            }else{
                storageManagerDAO.updateStorageManager(storageManagerVO);
            }
        }
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#selectStorageManagerByKey(java.lang.String, java.lang.String, java.lang.String)
     */
    @Override
    public StorageManagerVO selectStorageManagerByKey(String dlrCd, String strgeCd, String usrId) throws Exception {
        return storageManagerDAO.selectStorageManagerByKey(dlrCd, strgeCd, usrId);
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#selectStorageManageresByCondition(chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO)
     */
    @Override
    public List<StorageManagerVO> selectStorageManageresByCondition(StorageSearchVO searchVO) throws Exception {
        return storageManagerDAO.selectStorageManageresByCondition(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.cmp.service.StorageManagerService#selectStorageManageresByConditionCnt(chn.bhmc.dms.cmm.cmp.vo.StorageSearchVO)
     */
    @Override
    public int selectStorageManageresByConditionCnt(StorageSearchVO searchVO) throws Exception {
        return storageManagerDAO.selectStorageManageresByConditionCnt(searchVO);
    }

}
