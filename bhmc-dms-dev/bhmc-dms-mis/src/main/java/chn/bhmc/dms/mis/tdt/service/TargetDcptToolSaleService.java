package chn.bhmc.dms.mis.tdt.service;

import java.util.List;

import chn.bhmc.dms.mis.tdt.vo.TargetDcptToolSaleVO;

/**
 * <pre>
 * [딜러사] 목표분해도구(판매고문)
 * </pre>
 *
 * @ClassName   : TargetDcptToolSaleService.java
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

public interface TargetDcptToolSaleService {

    /**
     * 시장현황자료를 조회한다.
     *
     * @param targetDcptMgmtSearchVO
     * @return
     * @throws Exception
     */
    public List<TargetDcptToolSaleVO> selectTargetDcptToolSaleAll(TargetDcptToolSaleVO targetDcptToolSaleVO) throws Exception;

}
