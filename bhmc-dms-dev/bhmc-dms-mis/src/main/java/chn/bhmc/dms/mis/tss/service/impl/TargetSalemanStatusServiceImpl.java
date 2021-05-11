package chn.bhmc.dms.mis.tss.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.tss.service.TargetSalemanStatusService;
import chn.bhmc.dms.mis.tss.service.dao.TargetSalemanStatusDAO;
import chn.bhmc.dms.mis.tss.vo.TargetSalemanStatusSearchVO;


/**
 * <pre>
 * [딜러사] 판매고문 실적현황
 * </pre>
 *
 * @ClassName   : TargetSalemanStatusServiceImpl.java
 * @Description : [딜러사] 판매고문 실적현황
 * @author chibeom.song
 * @since 2016. 10. 23.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 23.     chibeom.song     최초 생성
 * </pre>
 */
@Service("targetSalemanStatusService")
public class TargetSalemanStatusServiceImpl extends HService implements TargetSalemanStatusService {

    /**
     * [딜러사] 판매고문 실적현황  DAO
     */
    @Resource(name="targetSalemanStatusDAO")
    TargetSalemanStatusDAO targetSalemanStatusDAO;

    /**
     * 조회 조건에 해당하는 [딜러사] 판매고문 실적현황 정보를 조회한다.
     */
    @Override
    public List<TargetSalemanStatusSearchVO> selectTargetSalemanStatusGrid(TargetSalemanStatusSearchVO searchVO) throws Exception {
        return targetSalemanStatusDAO.selectTargetSalemanStatusGrid(searchVO);
    }

    /**
     * 조회 조건에 해당하는 [딜러사] 판매고문 실적현황 총 갯수를 조회한다.
     */
    @Override
    public int selectTargetSalemanStatusGridCnt(TargetSalemanStatusSearchVO searchVO) throws Exception {
        return targetSalemanStatusDAO.selectTargetSalemanStatusGridCnt(searchVO);
    }

}
