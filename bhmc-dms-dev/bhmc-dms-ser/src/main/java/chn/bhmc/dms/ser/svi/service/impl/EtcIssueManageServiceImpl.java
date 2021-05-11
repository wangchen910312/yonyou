package chn.bhmc.dms.ser.svi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.ser.svi.service.EtcIssueManageService;
import chn.bhmc.dms.ser.svi.service.dao.EtcIssueManageDAO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageSearchVO;
import chn.bhmc.dms.ser.svi.vo.EtcIssueManageVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : EtcIssueManageServiceImpl.java
 * @Description : 기타사항 관리 서비스 구현 클래스
 * @author Kyung Mok Kim
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.   Kyung Mok Kim     최초 생성
 * </pre>
 */

@Service("etcIssueManageService")
public class EtcIssueManageServiceImpl extends HService implements EtcIssueManageService {


    /**
     * 기타사항관리 DAO
     */
    @Resource(name="etcIssueManageDAO")
    EtcIssueManageDAO EtcIssueManageDAO;

    /*
     * {@inheritDoc}
     */
    @Override
    public int selectEtcIssueManagesByConditionCnt(EtcIssueManageSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return EtcIssueManageDAO.selectEtcIssueManagesByConditionCnt(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public List<EtcIssueManageVO> selectEtcIssueManagesByCondition(EtcIssueManageSearchVO searchVO) throws Exception {

        searchVO.setsDlrCd(LoginUtil.getDlrCd());
        return EtcIssueManageDAO.selectEtcIssueManagesByCondition(searchVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public void multiEtcIssueMangages(BaseSaveVO<EtcIssueManageVO> obj) throws Exception {

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(EtcIssueManageVO insuMgtVO : obj.getInsertList() ){
            //String etcCd =

            //insuMgtVO.setEtcCd(etcCd);
            insuMgtVO.setRegUsrId(userId);
            insuMgtVO.setDlrCd(dlrCd);
            insertEtcIssueManage(insuMgtVO);
        }
        for(EtcIssueManageVO insuMgtVO : obj.getUpdateList()){

            insuMgtVO.setRegUsrId(userId);
            insuMgtVO.setDlrCd(dlrCd);
            updateEtcIssueManage(insuMgtVO);
        }
        for(EtcIssueManageVO insuMgtVO : obj.getDeleteList()){

            insuMgtVO.setRegUsrId(userId);
            insuMgtVO.setDlrCd(dlrCd);
            deleteEtcIssueManage(insuMgtVO);
        }

    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int insertEtcIssueManage(EtcIssueManageVO insuMgtVO) throws Exception {

        return EtcIssueManageDAO.insertEtcIssueManage(insuMgtVO);
    }

    /*
     * {@inheritDoc}
     */
    @Override
    public int updateEtcIssueManage(EtcIssueManageVO insuMgtVO) throws Exception {

        return EtcIssueManageDAO.updateEtcIssueManage(insuMgtVO);
    }

    /*
     * @see chn.bhmc.dms.ser.svi.service.EtcIssueManageService#deleteEtcIssueManage(chn.bhmc.dms.ser.svi.vo.EtcIssueManageVO)
     */
    @Override
    public int deleteEtcIssueManage(EtcIssueManageVO insuMgtVO) throws Exception {

        return EtcIssueManageDAO.deleteEtcIssueManage(insuMgtVO);
    }





}
