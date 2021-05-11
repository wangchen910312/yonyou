package chn.bhmc.dms.sal.ctl.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.ctl.service.OneShotCtrlMngService;
import chn.bhmc.dms.sal.ctl.service.dao.OneShotCtrlMngDAO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSaveVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngSearchVO;
import chn.bhmc.dms.sal.ctl.vo.OneShotCtrlMngVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : OneShotCtrlMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2016. 11. 10.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 10.     Lee Seungmin     최초 생성
 * </pre>
 */


@Service("oneShotCtrlMngService")
public class OneShotCtrlMngServiceImpl extends HService implements OneShotCtrlMngService{

    /**
     * 웟샷통제 DAO 선언
     */
    @Resource(name="oneShotCtrlMngDAO")
    OneShotCtrlMngDAO oneShotCtrlMngDAO;

    /**
     * 조회 조건에 해당하는 좌측 전략출고를 조회한다.
     */
    @Override
    public List<OneShotCtrlMngVO> selectOneShotLeftByCondition(OneShotCtrlMngSearchVO searchVO) throws Exception {
        return oneShotCtrlMngDAO.selectOneShotLeftByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 좌측 전략출고 갯수를 조회한다.
     */
    @Override
    public int selectOneShotLeftByConditionCnt(OneShotCtrlMngSearchVO searchVO) throws Exception {
        return oneShotCtrlMngDAO.selectOneShotLeftByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 우측 소매출고, 소매출고취소, 전략출고취소를 조회한다.
     */
    @Override
    public List<OneShotCtrlMngVO> selectOneShotRightByCondition(OneShotCtrlMngSearchVO searchVO) throws Exception {
        return oneShotCtrlMngDAO.selectOneShotRightByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 우측 소매출고, 소매출고취소, 전략출고취소 갯수를 조회한다.
     */
    @Override
    public int selectOneShotRightByConditionCnt(OneShotCtrlMngSearchVO searchVO) throws Exception {
        return oneShotCtrlMngDAO.selectOneShotRightByConditionCnt(searchVO);
    }


    /**
     * 마감시간통제 저장
     * @throws Exception
     */
    @Override
    public void saveOneShotCtrlMng(OneShotCtrlMngSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        for(OneShotCtrlMngVO vo : obj.getUpdateList()){
            vo.setRegUsrId(userId);

            vo.setStartDtTm(obj.getStartDtTm());
            vo.setEndDtTm(obj.getEndDtTm());
            vo.setCourseTp(obj.getCourseTp());
            vo.setCtrlYn(obj.getCtrlYn());
            vo.setCourseTp(obj.getCourseTp());

            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDt(vo);
            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDtIf(vo);

            oneShotCtrlMngDAO.insertDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.insertDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.insertTargetDealerDt(vo);
            oneShotCtrlMngDAO.insertTargetDealerDtIf(vo);
            //procDeadlineHeader(vo);
        }
    }

    /**
     * 좌측 마감통제 일괄저장
     * @throws Exception
     */
    @Override
    public void saveOneShotCtrlMngAll(OneShotCtrlMngSaveVO obj) throws Exception {

        String userId = LoginUtil.getUserId();

        OneShotCtrlMngSearchVO searchVO = new OneShotCtrlMngSearchVO();

        List<OneShotCtrlMngVO> dealerList = oneShotCtrlMngDAO.selectOneShotLeftByCondition(searchVO);

        for(OneShotCtrlMngVO vo : dealerList){

            vo.setDlrCd(vo.getDlrCd());
            vo.setRegUsrId(userId);
            vo.setCourseTp("L");
            vo.setCtrlYn(obj.getCtrlYn());

            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDt(vo);
            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDtIf(vo);

            oneShotCtrlMngDAO.insertDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.insertDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.insertTargetDealerDt(vo);
            oneShotCtrlMngDAO.insertTargetDealerDtIf(vo);
        }
    }

    /**
     * 우측 마감통제 일괄저장
     * @throws Exception
     */
    @Override
    public void saveOneShotCtrlMngRightAll(OneShotCtrlMngSaveVO obj) throws Exception {
        
        String userId = LoginUtil.getUserId();

        OneShotCtrlMngSearchVO searchVO = new OneShotCtrlMngSearchVO();

        List<OneShotCtrlMngVO> dealerList = oneShotCtrlMngDAO.selectOneShotRightByCondition(searchVO);

        for(OneShotCtrlMngVO vo : dealerList){

            vo.setDlrCd(vo.getDlrCd());
            vo.setRegUsrId(userId);
            vo.setCourseTp("R");
            vo.setCtrlYn(obj.getCtrlYn());

            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDt(vo);
            oneShotCtrlMngDAO.deleteDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.deleteTargetDealerDtIf(vo);

            oneShotCtrlMngDAO.insertDeadlineCtrlMngHd(vo);
            oneShotCtrlMngDAO.insertDeadlineCtrlMngHdIf(vo);
            oneShotCtrlMngDAO.insertTargetDealerDt(vo);
            oneShotCtrlMngDAO.insertTargetDealerDtIf(vo);
        }
    }

    
    /**
     * 엑셀업로드한 data로 모델, 지도가격, 배기등급을 불러온다.
     */
    @Override
    public List<OneShotCtrlMngVO> selectSungCityCondition(List<OneShotCtrlMngVO> list) throws Exception{
        for(OneShotCtrlMngVO vo : list){

            if(vo.getCtrlYn() != null && vo.getDlrCd() != null){
                OneShotCtrlMngVO oneVO = oneShotCtrlMngDAO.selectSungCityCondition(vo).get(0);
                vo.setCtrlYn(oneVO.getCtrlYn());
                vo.setDlrCd(oneVO.getDlrCd());
                vo.setDlrNm(oneVO.getDlrNm());
                vo.setCtrlStartYyMmDt(oneVO.getCtrlStartYyMmDt());
                vo.setCtrlEndYyMmDt(oneVO.getCtrlEndYyMmDt());
            }
        }
        return list;
    }
}
