package chn.bhmc.dms.sal.dlv.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.sal.dlv.service.CancDeliveryService;
import chn.bhmc.dms.sal.dlv.service.dao.CancDeliveryDAO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliverySearchVO;
import chn.bhmc.dms.sal.dlv.vo.CancDeliveryVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CancDeliveryServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author
 * @since 2016. 5. 20.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 20.      Kim yewon              최초 생성
 * </pre>
 */

@Service("cancDeliveryService")
public class CancDeliveryServiceImpl extends HService implements CancDeliveryService {

    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="cancDeliveryDAO")
    CancDeliveryDAO cancDeliveryDAO;

    /**
     * 조회 조건에 해당하는 이월판매취소결과를 조회한다.
     */
    @Override
    public List<CancDeliveryVO> selectCancDeliveryByCondition(CancDeliverySearchVO searchVO) throws Exception {
        return cancDeliveryDAO.selectCancDeliveryByCondition(searchVO);
    }

    /**
     * 조회 조건에 해당하는 이월판매취소결과 총 갯수를 조회한다.
     */
    @Override
    public int selectCancDeliveryByConditionCnt(CancDeliverySearchVO searchVO) throws Exception {
        return cancDeliveryDAO.selectCancDeliveryByConditionCnt(searchVO);
    }


    /**
     * 이월판매취소 승인
     */
    @Override
    public boolean updateApproveCancDelivery(CancDeliveryVO cancDeliveryVO) throws Exception {

        cancDeliveryVO.setUpdtUsrId(LoginUtil.getUserId());

        cancDeliveryDAO.updateApproveCancDelivery(cancDeliveryVO);

        return true;
    }


}
