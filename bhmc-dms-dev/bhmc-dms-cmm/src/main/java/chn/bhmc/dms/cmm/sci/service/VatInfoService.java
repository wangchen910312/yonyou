package chn.bhmc.dms.cmm.sci.service;
import chn.bhmc.dms.cmm.sci.vo.VatInfoSearchVO;
import chn.bhmc.dms.cmm.sci.vo.VatInfoVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VatInfoService.java
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

public interface VatInfoService {

    public VatInfoVO selectVatByDate(VatInfoSearchVO vatInfoVO) throws Exception;

    public int selectVatByDateCnt(VatInfoSearchVO vatInfoVO) throws Exception;
}
