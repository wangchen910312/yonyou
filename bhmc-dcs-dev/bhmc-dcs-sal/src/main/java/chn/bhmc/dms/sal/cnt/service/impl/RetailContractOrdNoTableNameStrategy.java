package chn.bhmc.dms.sal.cnt.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContractOrdNoTableNameStratgegy.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 2. 15.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 15.     Kang Seok Han     최초 생성
 * </pre>
 */

public class RetailContractOrdNoTableNameStrategy implements TableNameStrategy {
    private String carlineCd = "";  // 차종

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        //return originalTableName + LocalDate.now().toString("yyyyMM") + carlineCd;
        return originalTableName + LocalDate.now().toString("yyyy") + carlineCd;
    }


    // @param carlineCd the carlineCd to set
    public void setCarlineCd(String carlineCd) {
        this.carlineCd = carlineCd;
    }


}