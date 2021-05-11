package chn.bhmc.dms.crm.cif.service.impl;

import org.joda.time.LocalDate;

import chn.bhmc.dms.core.support.idgen.TableNameStrategy;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PublishNoTableNameStrategy
 * @Description : 클래스 설명을 기술합니다.
 * @author Ju Won Lee
 * @since 2016. 1. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 2. 16.     In Bo Shim     최초 생성
 * </pre>
 */

public class PublishNoTableNameStrategy implements TableNameStrategy {

    private String dcCd = "";
    private String dcUseTp = "";
    private String dlrCd = "";

    /*
     * @see chn.bhmc.dms.core.support.idgen.TableNameStrategy#makeTableName(java.lang.String)
     */
    @Override
    public String makeTableName(String originalTableName) {
        //return originalTableName + LocalDate.now().toString("yyyyMM") + carlineCd;
        //return originalTableName + LocalDate.now().toString("yyyy") + carlineCd;
        return originalTableName + dlrCd + dcCd + dcUseTp + LocalDate.now().toString("yyyyMMdd");
        //return originalTableName + LocalDate.now().toString("yyyyMM");
    }

    /**
     * @return the dcCd
     */
    public String getDcCd() {
        return dcCd;
    }


    /**
     * @param dcCd the dcCd to set
     */
    public void setDcCd(String dcCd) {
        this.dcCd = dcCd;
    }


    /**
     * @return the dcUseTp
     */
    public String getDcUseTp() {
        return dcUseTp;
    }


    /**
     * @param dcUseTp the dcUseTp to set
     */
    public void setDcUseTp(String dcUseTp) {
        this.dcUseTp = dcUseTp;
    }

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }
}
