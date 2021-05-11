package chn.bhmc.dms.sal.btc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.btc.service.SecondDealerService;
import chn.bhmc.dms.sal.btc.service.dao.SecondDealerDAO;
import chn.bhmc.dms.sal.btc.vo.SecondDealerSearchVO;
import chn.bhmc.dms.sal.btc.vo.SecondDealerVO;

/**
 * 딜러 관리 서비스 구현 클래스
 *
 * @author Kang Seok Han
 * @since 2016. 1. 29.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일                            수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.01.29         Kang Seok Han            최초 생성
 * </pre>
 */

@Service("secondDealerService")
public class SecondDealerServiceImpl extends HService implements SecondDealerService {

    /**
     * 딜러 관리 DAO
     */
    @Resource(name="secondDealerDAO")
    SecondDealerDAO secondDealerDAO;


    /**
     * 조회 조건에 해당하는 2급딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 SecondDealerSearchVO
     * @return 조회 목록
     */
    public int selectSecondDealersByConditionCnt(SecondDealerSearchVO searchVO) throws Exception{
        return secondDealerDAO.selectSecondDealersByConditionCnt(searchVO);
    }
    public List<SecondDealerVO> selectSecondDealersByCondition(SecondDealerSearchVO searchVO) throws Exception{
        return secondDealerDAO.selectSecondDealersByCondition(searchVO);
    }

    /**
     * Key에 해당하는 딜러 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @return 조회한 딜러 정보
     */
    public SecondDealerVO selectDealerByKey(String lv2DlrCd) throws Exception{
        return secondDealerDAO.selectDealerByKey(lv2DlrCd);
    }

    /**
     * 조회 조건에 해당하는 딜러 정보를 조회한다.
     * @param searchVO - 조회 조건을 포함하는 DealerSearchVO
     * @return 조회 목록
     */
    public List<SecondDealerVO> selectDealersByCondition(SecondDealerSearchVO searchVO) throws Exception{
        return secondDealerDAO.selectDealersByCondition(searchVO);
    }

    /**
     * 딜러 정보를 수정한다.
     * @param saveVO - 딜러정보 수정  포함하는 SaveVO
     * @param bindingResult
     * @return
     */
    public int updateDealer(SecondDealerVO saveVO) throws Exception{
        return secondDealerDAO.updateDealer(saveVO);
    }

}
