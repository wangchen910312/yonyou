package chn.bhmc.dms.sal.uva.service;

import java.util.List;

import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSaveVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementSearchVO;
import chn.bhmc.dms.sal.uva.vo.UsedCarPriceManagementVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UsedCarPriceManagementService
 * @Description : 중고차 가격 관리 서비스
 * @author Bong
 * @since 2016. 5. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 24.       Bong                최초 생성
 * </pre>
 */

public interface UsedCarPriceManagementService {

    public List<UsedCarPriceManagementVO> selectUsedCarPriceManagementCondition(UsedCarPriceManagementSearchVO searchVO) throws Exception;

    public int selectUsedCarPriceManagementConditionCnt(UsedCarPriceManagementSearchVO searchVO)  throws Exception;

    public void multiUsedCarPriceManagement(UsedCarPriceManagementSaveVO obj) throws Exception;

}
