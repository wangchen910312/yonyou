package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.LocalOptionPriceService;
import chn.bhmc.dms.sal.veh.service.dao.LocalOptionPriceDAO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionPriceServiceImpl
 * @Description : 로컬옵션 가격정보
 * @author
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.          최초 생성
 * </pre>
 */

@Service("localOptionPriceService")
public class LocalOptionPriceServiceImpl extends HService implements LocalOptionPriceService {

    /**
     * 로컬옵션 가격정보 DAO 선언
     */
    @Resource(name="localOptionPriceDAO")
    LocalOptionPriceDAO localOptionPriceDAO;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<LocalOptionPriceVO> selectLocalOptionPricesByCondition(LocalOptionPriceSearchVO searchVO){
        return localOptionPriceDAO.selectLocalOptionPricesByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectLocalOptionPricesByConditionCnt(LocalOptionPriceSearchVO searchVO) {
        return localOptionPriceDAO.selectLocalOptionPricesByConditionCnt(searchVO);
    }

    @Override
    public void multiLocalOptionPrices(BaseSaveVO<LocalOptionPriceVO> obj) {

        for(LocalOptionPriceVO LocalVO : obj.getInsertList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            localOptionPriceDAO.insertLocalOptionPrices(LocalVO);
        }

        for(LocalOptionPriceVO LocalVO : obj.getUpdateList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            localOptionPriceDAO.updateLocalOptionPrices(LocalVO);
        }

        for(LocalOptionPriceVO LocalVO : obj.getDeleteList()){
            LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
            LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
            LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

            localOptionPriceDAO.deleteLocalOptionPrices(LocalVO);
        }
    }


    /**
     * 로컬옵션의 상품리스트 조회 [계약품의 화면] 한다.
     */
    @Override
    public int selectLocalOptionPriceListsByConditionCnt(LocalOptionPriceSearchVO searchVO){
        return localOptionPriceDAO.selectLocalOptionPriceListsByConditionCnt(searchVO);
    }
    @Override
    public List<LocalOptionPriceVO> selectLocalOptionPriceListsByCondition(LocalOptionPriceSearchVO searchVO){
        return localOptionPriceDAO.selectLocalOptionPriceListsByCondition(searchVO);
    }


}
