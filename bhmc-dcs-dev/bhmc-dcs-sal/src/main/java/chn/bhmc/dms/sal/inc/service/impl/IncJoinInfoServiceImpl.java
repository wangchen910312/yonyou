package chn.bhmc.dms.sal.inc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.inc.service.IncJoinInfoService;
import chn.bhmc.dms.sal.inc.service.dao.IncJoinInfoDAO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSaveVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoSearchVO;
import chn.bhmc.dms.sal.inc.vo.IncJoinInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : IncJoinInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 03.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 03.      Kim yewon              최초 생성
 * </pre>
 */

@Service("incJoinInfoService")
public class IncJoinInfoServiceImpl extends HService implements IncJoinInfoService{

    /**
     * 마감시간통제 DAO 선언
     */
    @Resource(name="incJoinInfoDAO")
    IncJoinInfoDAO incJoinInfoDAO;

    /**
     * 조회 조건에 해당하는 보험가입정보를 조회한다.
     */
    @Override
    public List<IncJoinInfoVO> selectIncJoinInfoByCondition(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncJoinInfoByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 보험가입정보 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectIncJoinInfoByConditionCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncJoinInfoByConditionCnt(searchVO);
    }

    //성코드
    @Override
    public List<IncJoinInfoVO> selectSungCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectSungCd(vo);
    }


    //도시코드
    @Override
    public List<IncJoinInfoVO> selectCityCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectCityCd(vo);
    }


    //성코드
    @Override
    public List<IncJoinInfoVO> selectDistCd(IncJoinInfoVO vo) throws Exception{
        return incJoinInfoDAO.selectDistCd(vo);
    }


    /**
     * 보험가입정보
     */
    @Override
    public void multiSaveIncJoinInfo(IncJoinInfoSaveVO saveVO) throws Exception{


        if(saveVO.getIncJoinInfoVO().getIncNo() == null || saveVO.getIncJoinInfoVO().getIncNo().equals("")){
            saveVO.getIncJoinInfoVO().setRegUsrId(LoginUtil.getUserId());          // 등록자
            saveVO.getIncJoinInfoVO().setDlrCd(LoginUtil.getDlrCd());
            incJoinInfoDAO.insertIncJoinInfo(saveVO.getIncJoinInfoVO());
        }else {
            saveVO.getIncJoinInfoVO().setUpdtUsrId(LoginUtil.getUserId());         // 수정자
            saveVO.getIncJoinInfoVO().setDlrCd(LoginUtil.getDlrCd());
            incJoinInfoDAO.updateIncJoinInfo(saveVO.getIncJoinInfoVO());
        }

        //saveVO.getIncJoinInfoVO().getIncNo();
        saveIncDetailItem(saveVO.getIncDtlVO(),saveVO.getIncJoinInfoVO());

    }



    //선택한 고객이 인도한 차량 VIN NO 조회.
    @Override
    public List<IncJoinInfoVO> selectCustContractNo(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectCustContractNo(searchVO);
    }
    @Override
    public int selectCustContractNoCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectCustContractNoCnt(searchVO);
    }



    //보험신청명세(ITEM)목록 데이터를 조회한다.
    @Override
    public List<IncJoinInfoVO> selectIncDetailItem(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncDetailItem(searchVO);
    }
    @Override
    public int selectIncDetailItemCnt(IncJoinInfoSearchVO searchVO) throws Exception {
        return incJoinInfoDAO.selectIncDetailItemCnt(searchVO);
    }



    /**
     * 보험신청명세 내용 저장.
     */
    public void saveIncDetailItem(BaseSaveVO<IncJoinInfoVO> obj,IncJoinInfoVO incJoinInfoVO) throws Exception{

        // 등록
        for(IncJoinInfoVO vo : obj.getInsertList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());
            incJoinInfoDAO.insertIncDetailItem(vo);
        }

        // 수정
        for(IncJoinInfoVO vo : obj.getUpdateList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());
            incJoinInfoDAO.updateIncDetailItem(vo);

        }


        // 삭제
        for(IncJoinInfoVO vo : obj.getDeleteList()){
            vo.setUpdtUsrId(LoginUtil.getUserId());     // 사용자
            vo.setRegUsrId(LoginUtil.getUserId());

            vo.setDlrCd(incJoinInfoVO.getDlrCd());
            vo.setIncNo(incJoinInfoVO.getIncNo());
            incJoinInfoDAO.deleteIncDetailItem(vo);

        }

    }


    /**
     * 보험가입정보관리 상세 POP-UP
     */
    @Override
    public IncJoinInfoVO selectIncDetail(IncJoinInfoSearchVO searchVO) throws Exception {
        IncJoinInfoVO a = incJoinInfoDAO.selectIncDetail(searchVO);
        return a;
    }

}
