package chn.bhmc.dms.inf.sal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.inf.sal.service.VinCheckInfService;
import chn.bhmc.dms.inf.sal.service.dao.VinCheckInfDAO;
import chn.bhmc.dms.inf.sal.vo.VinCheckResultVO;
import chn.bhmc.dms.inf.sal.vo.VinCheckSearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CvaCommonServiceImpl
 * @Description : 공통
 * @author
 * @since 2016. 11. 28.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 11. 28.    Yoon SE Ran            최초 생성
 * </pre>
 */

@Service("vinCheckInfService")
public class VinCheckInfServiceImpl extends HService implements VinCheckInfService {

    /**
     * Vin No Check DAO 선언
     */
    @Resource(name="vinCheckInfDAO")
    VinCheckInfDAO vinCheckInfDAO;

    /**
     * 딜러마스터에서 딜러를 그룹핑하여 조회.
     */
    @Override
    public List<VinCheckResultVO> selectVinCheckInf(VinCheckSearchVO vinCheckSearchVO) throws Exception {
        return vinCheckInfDAO.selectVinCheckInf(vinCheckSearchVO);
    }
}
