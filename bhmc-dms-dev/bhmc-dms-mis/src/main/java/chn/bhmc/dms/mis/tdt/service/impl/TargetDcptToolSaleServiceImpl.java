package chn.bhmc.dms.mis.tdt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.mis.tdt.service.TargetDcptToolSaleService;
import chn.bhmc.dms.mis.tdt.service.dao.TargetDcptToolSaleDAO;
import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolSaleVO;
/**
 * <pre>
 * [딜러사] 목표분해도구(판매고문)
 * </pre>
 *
 * @ClassName   : TargetDcptToolSaleServiceImpl.java
 * @Description : [딜러사] 목표분해도구(판매고문)
 * @author chibeom.song
 * @since 2016. 7. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 22.   chibeom.song     최초 생성
 * </pre>
 */
@Service("targetDcptToolSaleService")
public class TargetDcptToolSaleServiceImpl extends HService implements TargetDcptToolSaleService {

    /** TargetDcptMgmt DAO */
    @Resource(name = "targetDcptToolSaleDAO")
    private TargetDcptToolSaleDAO targetDcptToolSaleDAO;

    /**
     * 시장현황자료를 조회한다.
     */
    @Override
    public List<TargetDcptToolSaleVO> selectTargetDcptToolSaleAll(TargetDcptToolSaleVO targetDcptToolSaleVO) throws Exception {

        return targetDcptToolSaleDAO.selectTargetDcptToolSaleAll(targetDcptToolSaleVO);
    }

}
