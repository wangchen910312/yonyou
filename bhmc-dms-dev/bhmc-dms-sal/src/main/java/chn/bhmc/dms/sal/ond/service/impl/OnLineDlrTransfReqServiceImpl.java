package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.DateUtil;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ond.service.OnLineDlrTransfReqService;
import chn.bhmc.dms.sal.ond.service.dao.OnLineDlrTransfReqDAO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSaveVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfReqVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfReqServiceImpl
 * @Description : 전상운송신청
 * @author
 * @since 2016. 03. 04.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 03. 04.    Lee Seungmin        최초 생성
 * </pre>
 */

@Service("onLineDlrTransfReqService")
public class OnLineDlrTransfReqServiceImpl extends HService implements OnLineDlrTransfReqService{

    /**
     * 전상운송신청 DAO 선언
     */
    @Resource(name="onLineDlrTransfReqDAO")
    OnLineDlrTransfReqDAO onLineDlrTransfReqDAO;

    /**
     * 조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectOnLineDlrTransfReqCnt(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        if(searchVO.getsEvalRsltCd().equals("A")){
            searchVO.setsEvalRsltCd("");
        }
        return onLineDlrTransfReqDAO.selectOnLineDlrTransfReqCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOnLineDlrTransfReq(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        if(searchVO.getsEvalRsltCd().equals("A")){
            searchVO.setsEvalRsltCd("");
        }
        return onLineDlrTransfReqDAO.selectOnLineDlrTransfReq(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndCarListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndCarListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차관정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndModelListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndModelListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndOcnListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndOcnListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndExtClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndExtClrListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 배기등급목록을 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndFscpRegGradeListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndIntClrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndIntClrListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfReqVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfReqSearchVO searchVO) throws Exception {
        return onLineDlrTransfReqDAO.selectOndRecevDlrListsByCondition(searchVO);
    }

    /**
     * 전상운송신청을 저장한다.
     */
    @Override
    public void saveOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO obj) throws Exception{

        String userId = LoginUtil.getUserId();
        String dlrCd = LoginUtil.getDlrCd();

        for(OnLineDlrTransfReqSaveVO saveVO : obj.getInsertList()){
            saveVO.setDlrCd(dlrCd);
            saveVO.setUsrId(userId);
            saveVO.setRegUsrId(userId);
            saveVO.setUpdtUsrId(userId);
            insertOnLineDlrTransfReq(saveVO);
            saveVO.setReqDt(DateUtil.getDate("yyyyMMdd"));
            procOnLineDlrTransfReq(saveVO);
        }

        for(OnLineDlrTransfReqSaveVO saveVO : obj.getUpdateList()){
            saveVO.setDlrCd(dlrCd);
            saveVO.setUpdtUsrId(userId);
            updateOnLineDlrTransfReq(saveVO);
            procOnLineDlrTransfReq(saveVO);
        }

        for(OnLineDlrTransfReqSaveVO saveVO : obj.getDeleteList()){
            deleteOnLineDlrTransfReq(saveVO);
            procOnLineDlrTransfReq(saveVO);
        }
    }

    /**
     * 전상운송신청을 신규/저장/삭제/인터페이스용저장을 한다.
     */
    @Override
    public int insertOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception {
        return onLineDlrTransfReqDAO.insertOnLineDlrTransfReq(saveVO);
    }
    @Override
    public int updateOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception {
        return onLineDlrTransfReqDAO.updateOnLineDlrTransfReq(saveVO);
    }
    @Override
    public int deleteOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception {
        return onLineDlrTransfReqDAO.deleteOnLineDlrTransfReq(saveVO);
    }
    @Override
    public int procOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception {
        return onLineDlrTransfReqDAO.procOnLineDlrTransfReq(saveVO);
    }

    /*
     * 전상운송신청을 폐기한다.
     */
    @Override
    public int deleteScrapOnLineDlrTransfReq(OnLineDlrTransfReqSaveVO saveVO) throws Exception{

        onLineDlrTransfReqDAO.deleteScrapOnLineDlrTransfReq(saveVO);
        onLineDlrTransfReqDAO.procOnLineDlrTransfReq(saveVO);

        return 1;
    }
}