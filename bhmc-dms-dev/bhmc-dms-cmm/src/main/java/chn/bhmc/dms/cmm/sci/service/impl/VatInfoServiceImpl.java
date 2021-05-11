package chn.bhmc.dms.cmm.sci.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.VatInfoService;
import chn.bhmc.dms.cmm.sci.service.dao.VatInfoDAO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Juwon Lee
 * @since 2018. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 4. 26.     Juwon Lee     최초 생성
 * </pre>
 */
@Service("vatInfoService")
public class VatInfoServiceImpl implements VatInfoService {

    @Resource(name="vatInfoDAO")
    VatInfoDAO vatInfoDAO;

    /*
     * @see chn.bhmc.dms.cmm.sci.service.VatInfoService#selectVatByDate(chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO)
     */
    @Override
    public VatInfoVO selectVatByDate(VatInfoSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return vatInfoDAO.selectVatByDate(searchVO);
    }

    /*
     * @see chn.bhmc.dms.cmm.sci.service.VatInfoService#selectVatByDateCnt(chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO)
     */
    @Override
    public int selectVatByDateCnt(VatInfoSearchVO searchVO) throws Exception {
        // TODO Auto-generated method stub
        return vatInfoDAO.selectVatByDateCnt(searchVO);
    }

}
