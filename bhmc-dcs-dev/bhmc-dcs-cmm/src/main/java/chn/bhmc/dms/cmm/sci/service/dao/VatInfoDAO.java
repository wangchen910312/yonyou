package chn.bhmc.dms.cmm.sci.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoDAO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Mid Eum Park
 * @since 2018. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 4. 26.     Mid Eum Park     최초 생성
 * </pre>
 */
@Mapper("vatInfoDAO")
public interface VatInfoDAO {

    public VatInfoVO selectVatByDate(VatInfoSearchVO vatInfoVO);

    public int selectVatByDateCnt(VatInfoSearchVO vatInfoVO);
}
