package chn.bhmc.dms.par.dlm.service;

import chn.bhmc.dms.par.dlm.vo.EndingStockVO;

/**
 * 수불유형 서비스
 *
 * @author Ju Won Lee
 * @since 2016. 1. 20.
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *      수정일                     수정자                     수정내용
 *  ===========    =============    ===========================
 *  2016. 1. 20.     Ju Won Lee      최초 생성
 * </pre>
 */

public interface EndingStockService {

    /**
     * Key에 해당하는 기말재고 정보를 조회한다.
     * @param dlrCd - 딜러코드
     * @param mvtTp - 수불유형코드
     * @return 조회한 기말재고 정보
     */
    public EndingStockVO selectEndingStockByKey(String dlrCd, String pltCd, String strgeCd, String itemCd);
}
