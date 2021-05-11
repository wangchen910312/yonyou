package chn.bhmc.dms.par.ism.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 부품판매검색 검색 VO
 *
 * @ClassName   : PartsSaleOrdSearchVO.java
 * @Description : PartsSaleOrdSearchVO Class
 * @author Ju Won Lee
 * @since 2018. 2. 08.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 2. 08.     Ju Won Lee     최초 생성
 * </pre>
 */

public class PartsSaleOrdSearchVO extends SearchVO {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7827774505850579309L;

    /**
     * 딜러코드
     **/
    private String sDlrCd;

    /**
     * 딜러명
     **/
    private String sDlrNm;

    /**
     * 년월
     **/

    private String sYyMm;

    /**
     * 부품번호
     **/
    private String sItemCd;

    /**
     * 부품명
     **/
    private String sItemNm;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegStartDt;

    /**
     * 등록일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sRegEndDt;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sDlrNm
     */
    public String getsDlrNm() {
        return sDlrNm;
    }

    /**
     * @param sDlrNm the sDlrNm to set
     */
    public void setsDlrNm(String sDlrNm) {
        this.sDlrNm = sDlrNm;
    }

    /**
     * @return the sYyMm
     */
    public String getsYyMm() {
        return sYyMm;
    }

    /**
     * @param sYyMm the sYyMm to set
     */
    public void setsYyMm(String sYyMm) {
        this.sYyMm = sYyMm;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sItemNm
     */
    public String getsItemNm() {
        return sItemNm;
    }

    /**
     * @param sItemNm the sItemNm to set
     */
    public void setsItemNm(String sItemNm) {
        this.sItemNm = sItemNm;
    }

    /**
     * @return the sRegStartDt
     */
    public Date getsRegStartDt() {
        return sRegStartDt;
    }

    /**
     * @param sRegStartDt the sRegStartDt to set
     */
    public void setsRegStartDt(Date sRegStartDt) {
        this.sRegStartDt = sRegStartDt;
    }

    /**
     * @return the sRegEndDt
     */
    public Date getsRegEndDt() {
        return sRegEndDt;
    }

    /**
     * @param sRegEndDt the sRegEndDt to set
     */
    public void setsRegEndDt(Date sRegEndDt) {
        this.sRegEndDt = sRegEndDt;
    }
}
