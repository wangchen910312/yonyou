package chn.bhmc.dms.sal.cnt.service.impl;

import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

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

public class RetailContractOrdNoIdGenStrategy extends EgovIdGnrStrategyImpl {

    private String orgPrefix;
    private String carlineCd;


    @Override
    public void setPrefix(String prefix){
       this.orgPrefix = prefix;
       applyPrefix();
    }

    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
        applyPrefix();
    }

    private void applyPrefix(){
        //super.setPrefix(orgPrefix + LocalDate.now().toString("yyyyMM") + carlineCd);
        super.setPrefix(orgPrefix + LocalDate.now().toString("yyyy") + carlineCd);
    }

}
