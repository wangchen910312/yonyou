package chn.bhmc.dms.par.pmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 판매가 대상 선정 마스터 검색 VO
 *
 * @ClassName   : PartsVenderSalPriceTargetMasterSearchVO.java
 * @Description : PartsVenderSalPriceTargetMasterSearchVO Class
 * @author In Bo Shim
 * @since 2016. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 19.     In Bo Shim     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceTargetMasterSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8866355308327865865L;

    /**
     * 딜러코드
     */
    @NotEmpty
    private String sDlrCd;

    /**
     * 거래처유형
     */
    private String sBpTp;

    /**
     * 거래처 코드
     */
    private String sBpCd;

    /**
     * 거래처명
     */
    private String sBpNm;

    /**
     * 부품번호
     */
    private String sItemCd;

    /**
     * 부품번호 1개만
     */
    private String sItemCdOnly = "";

    /**
     * 부품명
     */
    private String sItemNm;

    /**
     * 부품구분코드
     **/
    private String sItemDstinCd;

    /**
     * 창고코드
     */
    private String sStrgeCd;

    /**
     * 차종
     **/
    private String sCarlineCd;

    /**
     * ABC Class
     **/
    private String sAbcInd;

    /**
     * 권장소비자가 From
     **/
    private double sBmpBasePriceFrom = 0.0;

    /**
     * 권장소비자가 From
     **/
    private double sBmpBasePriceTo = 0.0;

    /**
     * 기준가 구분
     **/
    private String sBasePrice;

    /**
     * 소매가 0 유무
     **/
    private String sSalePrcAmtZeroYn01 = "N";

    /**
     * 도매가 0 유무
     **/
    private String sSalePrcAmtZeroYn02 = "N";

    /**
     * 보험가 0 유무
     **/
    private String sSalePrcAmtZeroYn03 = "N";

    /**
     * 보증가 0 유무
     **/
    private String sSalePrcAmtZeroYn04 = "N";

    /**
     * 소매가 From
     **/
    private double sPrcTpFrom01 = 0.0;

    /**
     * 소매가 To
     **/
    private double sPrcTpTo01 = 0.0;

    /**
     * 판매가 From
     **/
    private double sPrcTpFrom02 = 0.0;

    /**
     * 판매가 To
     **/
    private double sPrcTpTo02 = 0.0;

    /**
     * 보험가 From
     **/
    private double sPrcTpFrom03 = 0.0;

    /**
     * 보험가 To
     **/
    private double sPrcTpTo03 = 0.0;

    /**
     * 보증가 From
     **/
    private double sPrcTpFrom04 = 0.0;

    /**
     * 보증가 To
     **/
    private double sPrcTpTo04 = 0.0;

    /**
     * 입고창고코드
     **/
    private String sGrStrgeCd;

    /**
     * 로케이션코드
     **/
    private String sLocCd;

    /**
     * 기준가격코드
     **/
    private String sStdPrcCd;

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
     * @return the sBpTp
     */
    public String getsBpTp() {
        return sBpTp;
    }

    /**
     * @param sBpTp the sBpTp to set
     */
    public void setsBpTp(String sBpTp) {
        this.sBpTp = sBpTp;
    }

    /**
     * @return the sBpCd
     */
    public String getsBpCd() {
        return sBpCd;
    }

    /**
     * @param sBpCd the sBpCd to set
     */
    public void setsBpCd(String sBpCd) {
        this.sBpCd = sBpCd;
    }

    /**
     * @return the sBpNm
     */
    public String getsBpNm() {
        return sBpNm;
    }

    /**
     * @param sBpNm the sBpNm to set
     */
    public void setsBpNm(String sBpNm) {
        this.sBpNm = sBpNm;
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
     * @return the sItemCdOnly
     */
    public String getsItemCdOnly() {
        return sItemCdOnly;
    }

    /**
     * @param sItemCdOnly the sItemCdOnly to set
     */
    public void setsItemCdOnly(String sItemCdOnly) {
        this.sItemCdOnly = sItemCdOnly;
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
     * @return the sItemDstinCd
     */
    public String getsItemDstinCd() {
        return sItemDstinCd;
    }

    /**
     * @param sItemDstinCd the sItemDstinCd to set
     */
    public void setsItemDstinCd(String sItemDstinCd) {
        this.sItemDstinCd = sItemDstinCd;
    }

    /**
     * @return the sStrgeCd
     */
    public String getsStrgeCd() {
        return sStrgeCd;
    }

    /**
     * @param sStrgeCd the sStrgeCd to set
     */
    public void setsStrgeCd(String sStrgeCd) {
        this.sStrgeCd = sStrgeCd;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sAbcInd
     */
    public String getsAbcInd() {
        return sAbcInd;
    }

    /**
     * @param sAbcInd the sAbcInd to set
     */
    public void setsAbcInd(String sAbcInd) {
        this.sAbcInd = sAbcInd;
    }

    /**
     * @return the sBmpBasePriceFrom
     */
    public double getsBmpBasePriceFrom() {
        return sBmpBasePriceFrom;
    }

    /**
     * @param sBmpBasePriceFrom the sBmpBasePriceFrom to set
     */
    public void setsBmpBasePriceFrom(double sBmpBasePriceFrom) {
        this.sBmpBasePriceFrom = sBmpBasePriceFrom;
    }

    /**
     * @return the sBmpBasePriceTo
     */
    public double getsBmpBasePriceTo() {
        return sBmpBasePriceTo;
    }

    /**
     * @param sBmpBasePriceTo the sBmpBasePriceTo to set
     */
    public void setsBmpBasePriceTo(double sBmpBasePriceTo) {
        this.sBmpBasePriceTo = sBmpBasePriceTo;
    }

    /**
     * @return the sBasePrice
     */
    public String getsBasePrice() {
        return sBasePrice;
    }

    /**
     * @param sBasePrice the sBasePrice to set
     */
    public void setsBasePrice(String sBasePrice) {
        this.sBasePrice = sBasePrice;
    }

    /**
     * @return the sSalePrcAmtZeroYn01
     */
    public String getsSalePrcAmtZeroYn01() {
        return sSalePrcAmtZeroYn01;
    }

    /**
     * @param sSalePrcAmtZeroYn01 the sSalePrcAmtZeroYn01 to set
     */
    public void setsSalePrcAmtZeroYn01(String sSalePrcAmtZeroYn01) {
        this.sSalePrcAmtZeroYn01 = sSalePrcAmtZeroYn01;
    }

    /**
     * @return the sSalePrcAmtZeroYn02
     */
    public String getsSalePrcAmtZeroYn02() {
        return sSalePrcAmtZeroYn02;
    }

    /**
     * @param sSalePrcAmtZeroYn02 the sSalePrcAmtZeroYn02 to set
     */
    public void setsSalePrcAmtZeroYn02(String sSalePrcAmtZeroYn02) {
        this.sSalePrcAmtZeroYn02 = sSalePrcAmtZeroYn02;
    }

    /**
     * @return the sSalePrcAmtZeroYn03
     */
    public String getsSalePrcAmtZeroYn03() {
        return sSalePrcAmtZeroYn03;
    }

    /**
     * @param sSalePrcAmtZeroYn03 the sSalePrcAmtZeroYn03 to set
     */
    public void setsSalePrcAmtZeroYn03(String sSalePrcAmtZeroYn03) {
        this.sSalePrcAmtZeroYn03 = sSalePrcAmtZeroYn03;
    }

    /**
     * @return the sSalePrcAmtZeroYn04
     */
    public String getsSalePrcAmtZeroYn04() {
        return sSalePrcAmtZeroYn04;
    }

    /**
     * @param sSalePrcAmtZeroYn04 the sSalePrcAmtZeroYn04 to set
     */
    public void setsSalePrcAmtZeroYn04(String sSalePrcAmtZeroYn04) {
        this.sSalePrcAmtZeroYn04 = sSalePrcAmtZeroYn04;
    }

    /**
     * @return the sPrcTpFrom01
     */
    public double getsPrcTpFrom01() {
        return sPrcTpFrom01;
    }

    /**
     * @param sPrcTpFrom01 the sPrcTpFrom01 to set
     */
    public void setsPrcTpFrom01(double sPrcTpFrom01) {
        this.sPrcTpFrom01 = sPrcTpFrom01;
    }

    /**
     * @return the sPrcTpTo01
     */
    public double getsPrcTpTo01() {
        return sPrcTpTo01;
    }

    /**
     * @param sPrcTpTo01 the sPrcTpTo01 to set
     */
    public void setsPrcTpTo01(double sPrcTpTo01) {
        this.sPrcTpTo01 = sPrcTpTo01;
    }

    /**
     * @return the sPrcTpFrom02
     */
    public double getsPrcTpFrom02() {
        return sPrcTpFrom02;
    }

    /**
     * @param sPrcTpFrom02 the sPrcTpFrom02 to set
     */
    public void setsPrcTpFrom02(double sPrcTpFrom02) {
        this.sPrcTpFrom02 = sPrcTpFrom02;
    }

    /**
     * @return the sPrcTpTo02
     */
    public double getsPrcTpTo02() {
        return sPrcTpTo02;
    }

    /**
     * @param sPrcTpTo02 the sPrcTpTo02 to set
     */
    public void setsPrcTpTo02(double sPrcTpTo02) {
        this.sPrcTpTo02 = sPrcTpTo02;
    }

    /**
     * @return the sPrcTpFrom03
     */
    public double getsPrcTpFrom03() {
        return sPrcTpFrom03;
    }

    /**
     * @param sPrcTpFrom03 the sPrcTpFrom03 to set
     */
    public void setsPrcTpFrom03(double sPrcTpFrom03) {
        this.sPrcTpFrom03 = sPrcTpFrom03;
    }

    /**
     * @return the sPrcTpTo03
     */
    public double getsPrcTpTo03() {
        return sPrcTpTo03;
    }

    /**
     * @param sPrcTpTo03 the sPrcTpTo03 to set
     */
    public void setsPrcTpTo03(double sPrcTpTo03) {
        this.sPrcTpTo03 = sPrcTpTo03;
    }

    /**
     * @return the sPrcTpFrom04
     */
    public double getsPrcTpFrom04() {
        return sPrcTpFrom04;
    }

    /**
     * @param sPrcTpFrom04 the sPrcTpFrom04 to set
     */
    public void setsPrcTpFrom04(double sPrcTpFrom04) {
        this.sPrcTpFrom04 = sPrcTpFrom04;
    }

    /**
     * @return the sPrcTpTo04
     */
    public double getsPrcTpTo04() {
        return sPrcTpTo04;
    }

    /**
     * @param sPrcTpTo04 the sPrcTpTo04 to set
     */
    public void setsPrcTpTo04(double sPrcTpTo04) {
        this.sPrcTpTo04 = sPrcTpTo04;
    }

    /**
     * @return the sGrStrgeCd
     */
    public String getsGrStrgeCd() {
        return sGrStrgeCd;
    }

    /**
     * @param sGrStrgeCd the sGrStrgeCd to set
     */
    public void setsGrStrgeCd(String sGrStrgeCd) {
        this.sGrStrgeCd = sGrStrgeCd;
    }

    /**
     * @return the sLocCd
     */
    public String getsLocCd() {
        return sLocCd;
    }

    /**
     * @param sLocCd the sLocCd to set
     */
    public void setsLocCd(String sLocCd) {
        this.sLocCd = sLocCd;
    }

    /**
     * @return the sStdPrcCd
     */
    public String getsStdPrcCd() {
        return sStdPrcCd;
    }

    /**
     * @param sStdPrcCd the sStdPrcCd to set
     */
    public void setsStdPrcCd(String sStdPrcCd) {
        this.sStdPrcCd = sStdPrcCd;
    }
}
