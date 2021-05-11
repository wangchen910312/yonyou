package chn.bhmc.dms.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoDAO.java
 * @Description : 세율정보
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
@Mapper("vatInfoDAO")
public interface VatInfoDAO {
    public VatInfoVO selectVatByDate(VatInfoSearchVO vatInfoVO);

    public int selectVatByDateCnt(VatInfoSearchVO vatInfoVO);
}
