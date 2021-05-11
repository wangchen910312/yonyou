package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;
import able.com.util.fmt.StringUtil;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.BayManageService;
import chn.bhmc.dms.ser.svi.service.dao.BayManageDAO;
import chn.bhmc.dms.ser.svi.vo.BayDetailVO;
import chn.bhmc.dms.ser.svi.vo.BayManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.BayManageVO;
import chn.bhmc.dms.ser.svi.vo.BayMasterVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BayManageServiceImpl.java
 * @Description : Bay관리 ServiceImpl
 * @author KyungMok Kim
 * @since 2016. 1. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 19.   KyungMok Kim     최초 생성
 * </pre>
 */

@Service("bayManageService")
public class BayManageServiceImpl extends HService implements BayManageService {

    /**
     * CS코드 관리 DAO
     */
    @Resource(name="bayManageDAO")
    BayManageDAO bayManageDAO;

    /**
     * 조회 조건에 해당하는 Bay마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectBayMastersByConditionCnt(BayManageSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
        return bayManageDAO.selectBayMastersByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<BayMasterVO> selectBayMastersByCondition(BayManageSearchVO searchVO) throws Exception {
       if(StringUtil.nullConvert(searchVO.getsDlrCd()).equals("") ){
           searchVO.setsDlrCd(LoginUtil.getDlrCd());
       }
        return bayManageDAO.selectBayMastersByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public int selectBayMasterByKeyCnt(BayManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return bayManageDAO.selectBayMasterByKeyCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 Bay마스터 KEY 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public BayMasterVO selectBayMasterByKey(BayManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return bayManageDAO.selectBayMasterByKey(searchVO);
    }

    /**
     * Bay마스터 정보를 등록한다.
     * @param bayMasterVO - 등록할 정보가 담긴 BayMasterVO
     * @return 등록된 목록수
     */
    @Override
    public void insertBayMaster(BayMasterVO obj) throws Exception {
        bayManageDAO.insertBayMaster(obj);
    }

    /**
     * Bay마스터 정보를 수정한다.
     * @param bayMasterVO - 수정할 정보가 담긴 BayMasterVO
     * @return 수정된 목록수
     */
    @Override
    public void updateBayMaster(BayMasterVO obj) throws Exception {
        bayManageDAO.updateBayMaster(obj);
    }

    /**
     * Bay마스터 정보를 삭제한다.
     * @param searchVO - 삭제할 정보가 담긴 BayMasterVO
     * @return 삭제된 목록수
     */
    @Override
    public void deleteBayMaster(BayMasterVO obj) throws Exception {
        bayManageDAO.deleteBayMaster(obj);
    }

        /**
     * 조회 조건에 해당하는 Bay마스터 정보 갯수를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    @Override
    public int selectBayDetailsByConditionCnt(BayManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return bayManageDAO.selectBayDetailsByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    @Override
    public List<BayDetailVO> selectBayDetailsByCondition(BayManageSearchVO searchVO) throws Exception {
        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return bayManageDAO.selectBayDetailsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public void insertBayDetail(BayDetailVO obj) throws Exception {

    }

   /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public void updateBayDetail(BayDetailVO obj) throws Exception {

    }

    /**
     * 조회 조건에 해당하는 Bay마스터 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 BayManageSearchVO
     * @return 조회 목록
     */
    public void deleteBayDetail(BayDetailVO obj) throws Exception {

    }

    @Override
    public void saveBayManages(BayManageVO bayManageVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();


        BaseSaveVO<BayMasterVO> objVO = bayManageVO.getBayMasterListVO();
        for(BayMasterVO bayMasterVO : objVO.getInsertList()){
            bayMasterVO.setDlrCd(dlrCd);
            bayMasterVO.setRegUsrId(userId);

            BayManageSearchVO searchVO = new BayManageSearchVO();
            searchVO.setsBayNo(bayMasterVO.getBayNo());
            searchVO.setsDlrCd(bayMasterVO.getDlrCd());

            int masterCnt = bayManageDAO.selectBayMastersByConditionCnt(searchVO);

            if(masterCnt > 0 ){
                Exception e = processException("global.err.duplicate");
                throw e;
            }

            insertBayMaster(bayMasterVO);

        }
        for(BayMasterVO bayMasterVO : objVO.getUpdateList()){
            bayMasterVO.setDlrCd(dlrCd);
            bayMasterVO.setUpdtUsrId(userId);

            updateBayMaster(bayMasterVO);

        }
        for(BayMasterVO bayMasterVO : objVO.getDeleteList()){
            deleteBayManage(bayMasterVO);
        }

    }

    @Override
    public void multiBayManages(BayManageVO bayManageVO) throws Exception {

        String userId = LoginUtil.getUserId();

        BayManageSearchVO searchVO = new BayManageSearchVO();
        searchVO.setsBayNo(bayManageVO.getBayMasterVO().getBayNo());
        searchVO.setsDlrCd(bayManageVO.getBayMasterVO().getDlrCd());

        int masterCnt = bayManageDAO.selectBayMastersByConditionCnt(searchVO);

        if(masterCnt > 0) {
            bayManageVO.getBayMasterVO().setUpdtUsrId(userId);
            bayManageDAO.updateBayMaster(bayManageVO.getBayMasterVO());
        } else {
            bayManageVO.getBayMasterVO().setRegUsrId(userId);
            bayManageDAO.insertBayMaster(bayManageVO.getBayMasterVO());
        }

        multiBayDetails(bayManageVO.getBayManageSaveVO());

    }

    public void multiBayDetails(BaseSaveVO<BayDetailVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(BayDetailVO bayDetailVO : obj.getInsertList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayDetailVO.setRegUsrId(userId);
            bayManageDAO.insertBayDetail(bayDetailVO);
        }

        for(BayDetailVO bayDetailVO : obj.getUpdateList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayDetailVO.setUpdtUsrId(userId);
            bayManageDAO.updateBayDetail(bayDetailVO);
        }

        for(BayDetailVO bayDetailVO : obj.getDeleteList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayManageDAO.deleteBayDetail(bayDetailVO);
        }
    }

    public void saveBayDetails(BayManageVO bayManageVO) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        BaseSaveVO<BayDetailVO> obj = bayManageVO.getBayManageSaveVO();

        for(BayDetailVO bayDetailVO : obj.getInsertList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayDetailVO.setRegUsrId(userId);
            bayManageDAO.insertBayDetail(bayDetailVO);
        }

        for(BayDetailVO bayDetailVO : obj.getUpdateList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayDetailVO.setUpdtUsrId(userId);
            bayManageDAO.updateBayDetail(bayDetailVO);
        }

        for(BayDetailVO bayDetailVO : obj.getDeleteList()){
            bayDetailVO.setDlrCd(dlrCd);
            bayManageDAO.deleteBayDetail(bayDetailVO);
        }
    }

    public void deleteBayManage(BayMasterVO bayMasterVO) throws Exception {

        BayDetailVO detailVO = new BayDetailVO();
        detailVO.setDlrCd(LoginUtil.getDlrCd());
        bayMasterVO.setDlrCd(LoginUtil.getDlrCd());

        detailVO.setBayNo(bayMasterVO.getBayNo());

        bayManageDAO.deleteBayMaster(bayMasterVO);
        bayManageDAO.deleteBayDetail(detailVO);
    }
}
