package chn.bhmc.dms.sal.cer.service.dao;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cer.vo.DealerReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerReceiptSearchEditDAO
 * @Description : 딜러 영수증 조회 및 수정 DAO
 * @author Bong
 * @since 2016. 5. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *       수정일               수정자                                 수정내용
 *  ----------------    ------------    ---------------------------
 *   2016.05.20         Bong            최초 생성
 * </pre>
 */

@Mapper("dealerReceiptSearchEditDAO")
public interface DealerReceiptSearchEditDAO {


    /**
     * 딜러 영수증 정보 업데이트.
     * @param DealerReceiptVO
     * @return
     */
    public int updateDealerReceiptSearchEdit(DealerReceiptVO LocalVO);


}
