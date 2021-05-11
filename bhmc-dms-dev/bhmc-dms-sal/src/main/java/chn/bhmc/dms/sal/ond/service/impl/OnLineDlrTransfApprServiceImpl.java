package chn.bhmc.dms.sal.ond.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.ond.service.OnLineDlrTransfApprService;
import chn.bhmc.dms.sal.ond.service.dao.OnLineDlrTransfApprDAO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprSearchVO;
import chn.bhmc.dms.sal.ond.vo.OnLineDlrTransfApprVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OnLineDlrTransfApprServiceImpl
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

@Service("onLineDlrTransfApprService")
public class OnLineDlrTransfApprServiceImpl extends HService implements OnLineDlrTransfApprService{

    /**
     * 전상운송신청 DAO 선언
     */
    @Resource(name="onLineDlrTransfApprDAO")
    OnLineDlrTransfApprDAO onLineDlrTransfApprDAO;

    /**
     * 조회 조건에 해당하는 전상운송신청 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectOnLineDlrTransfApprCnt(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        if(searchVO.getsEvalRsltCd().equals("A")){
            searchVO.setsEvalRsltCd("");
        }
        return onLineDlrTransfApprDAO.selectOnLineDlrTransfApprCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOnLineDlrTransfAppr(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        if(searchVO.getsEvalRsltCd().equals("A")){
            searchVO.setsEvalRsltCd("");
        }
        return onLineDlrTransfApprDAO.selectOnLineDlrTransfAppr(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차종정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndCarListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndCarListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 차관정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndModelListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndModelListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 OCN정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndOcnListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndOcnListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 외색정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndExtClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndExtClrListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 배기등급목록을 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndFscpRegGradeListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndFscpRegGradeListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송신청 가능 내색정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndIntClrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndIntClrListsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 전상운송가능지 정보를 조회한다.
     */
    @Override
    public List<OnLineDlrTransfApprVO> selectOndRecevDlrListsByCondition(OnLineDlrTransfApprSearchVO searchVO) throws Exception {
        return onLineDlrTransfApprDAO.selectOndRecevDlrListsByCondition(searchVO);
    }


}