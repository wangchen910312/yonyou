package chn.bhmc.dms.bat.sal.stk.service;

/**
 * 재고일배치
 *
 * @author Lee Seungmin
 * @since 2017. 2. 23.
 * @version 1.0
 * @see <pre>
 *
 *       수정일               수정자             수정내용
 *  ----------------    ------------    ---------------------------
 *   2017. 2. 23.         Lee Seungmin           최초 생성
 * </pre>
 */

public interface BatchStockDailyService {

    // 재고일배치
    public void callStockCntProcess() throws Exception;

}
