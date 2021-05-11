package chn.bhmc.dms.sal.dlr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dlr.service.DistDealerMngService;
import chn.bhmc.dms.sal.dlr.service.dao.DistDealerMngDAO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerSearchVO;
import chn.bhmc.dms.sal.dlr.vo.DistDealerVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DistDealerMngServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 25.      Kim yewon              최초 생성
 * </pre>
 */

@Service("distDealerMngService")
public class DistDealerMngServiceImpl extends HService implements DistDealerMngService {

    /**
     * 지역딜러(사무소)관리 DAO 선언
     */
    @Resource(name="distDealerMngDAO")
    DistDealerMngDAO distDealerMngDAO;




    /**
     * 조회 조건에 해당하는 지역딜러(사무소) - 사무소 조회한다.
     */
    @Override
    public List<DistDealerVO> selectDistDealerMngByCondition(DistDealerSearchVO searchVO) throws Exception {
        return distDealerMngDAO.selectDistDealerMngByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 지역딜러(사무소) - 사무소 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectDistDealerMngByConditionCnt(DistDealerSearchVO searchVO) throws Exception {
        return distDealerMngDAO.selectDistDealerMngByConditionCnt(searchVO);
    }

    /**
     * 조회 조건에 해당하는 지역딜러(사무소) - 딜러 조회한다.
     */
    @Override
    public List<DistDealerVO> selectDealerByCondition(DistDealerSearchVO searchVO) throws Exception {
        return distDealerMngDAO.selectDealerByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 지역딜러(사무소) - 딜러 목록 총 갯수를 조회한다.
     */
    @Override
    public int selectDealerByConditionCnt(DistDealerSearchVO searchVO) throws Exception {
        return distDealerMngDAO.selectDealerByConditionCnt(searchVO);
    }


    /**
     * 프로모션 등록.
     */
    @Override
    public void saveDistDealer(DistDealerVO vo) throws Exception {

        vo.setDlrCd(LoginUtil.getDlrCd());               //딜러
        vo.setRegUsrId(LoginUtil.getUserId());

        String mmngDlrCdArrayList = vo.getMngDlrCd();
        String [] mngDlrCd = mmngDlrCdArrayList.split(",");

        if (mngDlrCd.length > 0) {
            distDealerMngDAO.deleteDealer(vo);
            for(int i = 0 ; i < mngDlrCd.length ; i++){
                vo.setMngDlrCd(mngDlrCd[i]);
                distDealerMngDAO.insertDealer(vo);
            }
        }

    }



}
