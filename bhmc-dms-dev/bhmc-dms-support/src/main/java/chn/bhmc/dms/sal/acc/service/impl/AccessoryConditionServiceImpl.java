package chn.bhmc.dms.sal.acc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.sal.acc.service.AccessoryConditionService;
import chn.bhmc.dms.sal.acc.service.dao.AccessoryConditionDAO;
import chn.bhmc.dms.sal.acc.vo.AccessoryConditionSearchVO;
import chn.bhmc.dms.sal.acc.vo.AccessoryConditionVO;

/**
 * 경품판매현황 서비스
 *
 * @ClassName   : AccessoryMngServiceImpl
 * @Description : 경품판매관리
 * @author
 * @since 2016. 6. 09.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 6. 30.    Kim Jin Suk            최초 생성
 * </pre>
 */

@Service("accessoryConditionService")
public class AccessoryConditionServiceImpl extends HService implements AccessoryConditionService {

    /**
     * 경품판매관리 DAO 선언
     */
    @Resource(name="accessoryConditionDAO")
    AccessoryConditionDAO accessoryConditionDAO;


    /**
     * 경품판매관리 내역을 조회한다.
     */
    @Override
    public int selectAccessoryConditionsByConditionCnt(AccessoryConditionSearchVO searchVO) throws Exception{
        return accessoryConditionDAO.selectAccessoryConditionsByConditionCnt(searchVO);
    }
    @Override
    public List<AccessoryConditionVO> selectAccessoryConditionsByCondition(AccessoryConditionSearchVO searchVO) throws Exception{
        return accessoryConditionDAO.selectAccessoryConditionsByCondition(searchVO);
    }

}
