package chn.bhmc.dms.sal.veh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.veh.service.LocalOptionMappingService;
import chn.bhmc.dms.sal.veh.service.LocalOptionPriceService;
import chn.bhmc.dms.sal.veh.service.dao.LocalOptionMappingDAO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingSearchVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionMappingVO;
import chn.bhmc.dms.sal.veh.vo.LocalOptionPriceSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : LocalOptionMappingServiceImpl
 * @Description : 로컬옵션 모델 맵핑
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

@Service("localOptionMappingService")
public class LocalOptionMappingServiceImpl extends HService implements LocalOptionMappingService {

    /**
     * 로컬옵션 가격정보 DAO 선언
     */
    @Resource(name="localOptionMappingDAO")
    LocalOptionMappingDAO localOptionMappingDAO;


    @Resource(name="localOptionPriceService")
    LocalOptionPriceService localOptionPriceService;

    /**
     * 조회 조건에 해당하는  정보를 조회한다.
     */
    @Override
    public List<LocalOptionMappingVO> selectLocalOptionMappingsByCondition(LocalOptionMappingSearchVO searchVO) throws Exception{
        return localOptionMappingDAO.selectLocalOptionMappingsByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 총 갯수를 조회한다.
     */
    @Override
    public int selectLocalOptionMappingsByConditionCnt(LocalOptionMappingSearchVO searchVO) {
        return localOptionMappingDAO.selectLocalOptionMappingsByConditionCnt(searchVO);
    }

    @Override
    public void multiLocalOptionMappings(BaseSaveVO<LocalOptionMappingVO> obj) throws Exception{

            for(LocalOptionMappingVO LocalVO : obj.getInsertList()){
                LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
                LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

                localOptionMappingDAO.insertLocalOptionMappings(LocalVO);
            }

            for(LocalOptionMappingVO LocalVO : obj.getUpdateList()){
                LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
                LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자

                localOptionMappingDAO.updateLocalOptionMappings(LocalVO);
            }

            for(LocalOptionMappingVO LocalVO : obj.getDeleteList()){
                LocalVO.setDlrCd(LoginUtil.getDlrCd());         // 딜러코드
                LocalVO.setRegUsrId(LoginUtil.getUserId());     // 사용자
                LocalVO.setUpdtUsrId(LoginUtil.getUserId());    // 사용자


                // Local Option Price (0112) 에 데이터가 있을 경우 삭제 불가. (유무 체크 후 Exception 처리)
                LocalOptionPriceSearchVO priceVO = new LocalOptionPriceSearchVO();
                priceVO.setDlrCd(LocalVO.getDlrCd());
                priceVO.setModelCd(LocalVO.getModelCd());
                priceVO.setOptionCd(LocalVO.getOptionCd());

                // 0112 에 데이터가 있을 경우 ProcessException 발생.
                if(localOptionPriceService.selectLocalOptionPricesByConditionCnt(priceVO) > 0){
                    throw processException("sal.err.validation");   // msg : 해당내역은 사용중입니다.

                }

                localOptionMappingDAO.deleteLocalOptionMappings(LocalVO);
            }

    }

}
