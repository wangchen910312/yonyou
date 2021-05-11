package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.web.HController;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.ClaimPioItemManageService;
import chn.bhmc.dms.ser.svi.service.dao.ClaimPioItemManageDAO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSaveVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemSearchVO;
import chn.bhmc.dms.ser.svi.vo.ClaimPioItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ClaimPioItemManageServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 1.     Kwon ki hyun     최초 생성
 * </pre>
 */
@Service("claimPioItemManageService")
public class ClaimPioItemManageServiceImpl extends HController implements ClaimPioItemManageService {

    @Resource(name="claimPioItemManageDAO")
    ClaimPioItemManageDAO claimPioItemManageDAO;



    /**
     *
     * PIO 부품 정보를 저장/수정한다.
     *
     * @param saveVO
     * @return
     * @throws Exception
     */
    public boolean mulitClaimPioItemMange(ClaimPioItemSaveVO saveVO)throws Exception{


        String userId = LoginUtil.getUserId();

        for(ClaimPioItemVO claimPioItemVO : saveVO.getInsertList()){

            claimPioItemVO.setRegUsrId(userId);
            insertClaimPioItemManage(claimPioItemVO);

        }
        for(ClaimPioItemVO claimPioItemVO : saveVO.getUpdateList()){
            claimPioItemVO.setUpdtUsrId(userId);
            updateClaimPioItemManage(claimPioItemVO);
        }
        for(ClaimPioItemVO claimPioItemVO : saveVO.getDeleteList()){
            deleteClaimPioItemManage(claimPioItemVO);
        }
        return true;
    }

    /**
    *
    * PIO 부품 등록
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
    public int insertClaimPioItemManage(ClaimPioItemVO claimPioItemVO) throws Exception {

        return claimPioItemManageDAO.insertClaimPioItemManage(claimPioItemVO);
    }

    /**
    *
    * PIO 부품 수정
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
    public int updateClaimPioItemManage(ClaimPioItemVO claimPioItemVO) throws Exception {

        return claimPioItemManageDAO.updateClaimPioItemManage(claimPioItemVO);
    }

    /**
     *
     * PIO 부품 삭제
     *
     * @param claimPioItemVO
     * @return
     * @throws Exception
     */
    public int deleteClaimPioItemManage(ClaimPioItemVO claimPioItemVO) throws Exception {

        return claimPioItemManageDAO.deleteClaimPioItemManage(claimPioItemVO);
    }

    /**
    *
    * PIO 부품 목록수
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
    @Override
    public int selectClaimPioItemManageByConditionCnt(ClaimPioItemSearchVO searchVO) throws Exception {

        return claimPioItemManageDAO.selectClaimPioItemManageByConditionCnt(searchVO);
    }

    /**
    *
    * PIO 부품 목록
    *
    * @param claimPioItemVO
    * @return
    * @throws Exception
    */
    @Override
    public List<ClaimPioItemVO> selectClaimPioItemManageByCondition(ClaimPioItemSearchVO searchVO) throws Exception {

        return claimPioItemManageDAO.selectClaimPioItemManageByCondition(searchVO);
    }

}
