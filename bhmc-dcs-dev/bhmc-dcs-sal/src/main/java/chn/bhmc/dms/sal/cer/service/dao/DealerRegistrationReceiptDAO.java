package chn.bhmc.dms.sal.cer.service.dao;

import java.util.List;

import able.com.mybatis.Mapper;

import chn.bhmc.dms.sal.cer.vo.DealerReceiptSearchVO;
import chn.bhmc.dms.sal.cer.vo.DealerReceiptVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DealerRegistrationReceiptDAO
 * @Description : 딜러 영수증 등록 DAO
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

@Mapper("dealerRegistrationReceiptDAO")
public interface DealerRegistrationReceiptDAO {


    /**
      * 조회 조건에 해당하는  정보를 조회한다.
      */
    public List<DealerReceiptVO> selectDealerRegistrationReceiptByCondition(DealerReceiptSearchVO searchVO);

    /**
     *  조회 조건에 해당하는  총 갯수를 조회한다.
     */
    public int selectDealerRegistrationReceiptByConditionCnt(DealerReceiptSearchVO searchVO);

    /**
     * 영수증 정보를 등록한다.
     * @param DealerReceiptVO
     * @return
     */
    public int insertDealerRegistrationReceipt(DealerReceiptVO LocalVO);

    /**
     * 영수증 정보를 수정한다.
     * @param DealerReceiptVO
     * @return
     */
    public int updateDealerRegistrationReceipt(DealerReceiptVO LocalVO);

    /**
     * 영수증 정보를 삭제한다.
     * @param DealerReceiptVO
     * @return
     */
    public int deleteDealerRegistrationReceipt(DealerReceiptVO LocalVO);

}
