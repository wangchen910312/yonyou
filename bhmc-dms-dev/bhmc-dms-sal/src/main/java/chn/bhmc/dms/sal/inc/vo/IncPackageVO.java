package chn.bhmc.dms.sal.inc.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : IncPackageVO
 * @Description : 보험 패키지 VO
 * @author Kim JIN SUK
 * @since 2017. 2. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 11.    Kim JIN SUK             최초 생성
 *
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="dlrCd"         , mesgKey="a.lbl.dlrCd")
   ,@ValidField(field="packageNo"     , mesgKey="a.lbl.packageNo")
   })
public class IncPackageVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 1384113575718174341L;

    /**
     * 딜러코드     
     **/
    private  String         dlrCd;         
     
    /**
     * 패키지번호    
     **/
    private  String         packageNo;     
     
    /**
     * 패키지명     
     **/
    private  String         packageNm;     
     
    /**
     * 보험금액(수령액)
     **/
    private  Double         totValRecAmt;  
     
    /**
     * 사용여부     
     **/
    private  String         useYn;

    
    private  String         incTp;      //보험유형
    private  String         incTpNm;    //보험유형명
    private  double         valRecAmt;  //보험금액
    
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

    /**
     * @return the packageNo
     */
    public String getPackageNo() {
        return packageNo;
    }

    /**
     * @param packageNo the packageNo to set
     */
    public void setPackageNo(String packageNo) {
        this.packageNo = packageNo;
    }

    /**
     * @return the packageNm
     */
    public String getPackageNm() {
        return packageNm;
    }

    /**
     * @param packageNm the packageNm to set
     */
    public void setPackageNm(String packageNm) {
        this.packageNm = packageNm;
    }

    /**
     * @return the totValRecAmt
     */
    public Double getTotValRecAmt() {
        return totValRecAmt;
    }

    /**
     * @param totValRecAmt the totValRecAmt to set
     */
    public void setTotValRecAmt(Double totValRecAmt) {
        this.totValRecAmt = totValRecAmt;
    }

    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }

    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    
    /**
     * @return the incTp
     */
    public String getIncTp() {
        return incTp;
    }

    /**
     * @param incTp the incTp to set
     */
    public void setIncTp(String incTp) {
        this.incTp = incTp;
    }

    /**
     * @return the incTpNm
     */
    public String getIncTpNm() {
        return incTpNm;
    }

    /**
     * @param incTpNm the incTpNm to set
     */
    public void setIncTpNm(String incTpNm) {
        this.incTpNm = incTpNm;
    }

    /**
     * @return the valRecAmt
     */
    public double getValRecAmt() {
        return valRecAmt;
    }

    /**
     * @param valRecAmt the valRecAmt to set
     */
    public void setValRecAmt(double valRecAmt) {
        this.valRecAmt = valRecAmt;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }         
}