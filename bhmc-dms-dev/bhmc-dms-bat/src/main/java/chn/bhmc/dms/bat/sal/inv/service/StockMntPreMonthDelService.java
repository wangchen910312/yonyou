package chn.bhmc.dms.bat.sal.inv.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : StockMntPreMonthDelService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 6. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 6. 6.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public interface StockMntPreMonthDelService {

    /**
    *
    * 이전 전략 출고 신청 , 거절건 삭제
    *
    * @param day
    * @return
    * @throws Exception
    */
    public int updateStockMntPreMonthDel(int day)throws Exception;
}
