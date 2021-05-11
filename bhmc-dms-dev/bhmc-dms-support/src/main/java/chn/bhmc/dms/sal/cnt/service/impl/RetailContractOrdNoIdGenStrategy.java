package chn.bhmc.dms.sal.cnt.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.AbstractIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : RetailContractOrdNoIdGenStrategy.java
 * @Description : 소매판매 주문번호 ID Gen Stractegy
 * @author Jin Suk Kim
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Jin Suk Kim     최초 생성
 * </pre>
 */

public class RetailContractOrdNoIdGenStrategy extends AbstractIdGnrStrategyImpl {

    private String carlineCd;

    /**
     * @return the carlineCd
     */
    public String getCarlineCd() {
        return carlineCd;
    }

    /**
     * @param carlineCd the carlineCd to set
     */
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }

    @Override
    public String buildPrefix(String prefix) {
        //return prefix + LocalDate.now().toString("yyyyMM") + carlineCd;
        //return prefix + LocalDate.now().toString("yyyy") + carlineCd;
        return prefix + LocalDate.now().toString("yyyyMM");
    }
}
