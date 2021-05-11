package chn.bhmc.dms.crm.cif.service.impl;


import org.joda.time.LocalDate;

import egovframework.rte.fdl.idgnr.impl.strategy.EgovIdGnrStrategyImpl;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PublishNoIdGenStrategy
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

public class PublishNoIdGenStrategy extends EgovIdGnrStrategyImpl {


    private String orgPrefix;
    private String dcCd;
    private String dcUseTp;
    private String dlrCd;


    @Override
    public void setPrefix(String prefix){
       this.orgPrefix = prefix;
       applyPrefix();
    }

    private void applyPrefix(){
        //super.setPrefix(orgPrefix + LocalDate.now().toString("yyyyMM") + carlineCd);
        //super.setPrefix(orgPrefix + LocalDate.now().toString("yyyy") + carlineCd);
        //super.setPrefix(orgPrefix + LoginUtil.getDlrCd() + dcCd + dcUseTp + LocalDate.now().toString("yyyyMMdd"));
        super.setPrefix(orgPrefix + dlrCd + dcCd + dcUseTp + LocalDate.now().toString("yyyyMMdd"));
        //super.setPrefix(orgPrefix + LocalDate.now().toString("yyyyMM"));
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
        applyPrefix();
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
        applyPrefix();
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
        applyPrefix();
    }

}
