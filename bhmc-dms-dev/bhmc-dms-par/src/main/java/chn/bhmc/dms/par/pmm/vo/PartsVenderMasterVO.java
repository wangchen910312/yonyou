package chn.bhmc.dms.par.pmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * 공급처별 부품 마스터 VO
 *
 * @ClassName   : PartsVenderMasterVO.java
 * @Description : PartsVenderMasterVO Class
 * @author In Bo Shim
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 11.     In Bo Shim     최초 생성
 * </pre>
 */

@ValidDescriptor({
   @ValidField(field="bpCd"            , mesgKey="par.lbl.bpCd")
   ,@ValidField(field="bpNm"            , mesgKey="par.lbl.bpNm")
   ,@ValidField(field="itemCd"          , mesgKey="par.lbl.itemCd")
   ,@ValidField(field="crnNo"           , mesgKey="par.lbl.crnNo")
   ,@ValidField(field="addr"            , mesgKey="par.lbl.addr")
   ,@ValidField(field="applyYn"         , mesgKey="par.lbl.applyYn")
   })
public class PartsVenderMasterVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4890283989591096542L;

    /**
     * 딜러코드
     */
    private String dlrCd;

    /**
     * 거래처 코드
     */
    private String bpCd;

    /**
     * 거래처명
     */
    private String bpNm;

    /**
     * 품목번호
     */
    private String itemCd;

    /**
     * 사업자등록번호
     */
    private String crnNo;

    /**
     * 주소
     */
    private String addr;

    /**
     * 적용여부
     */
    private String applyYn;

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
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the itemCd
     */
    public String getItemCd() {
        return itemCd;
    }

    /**
     * @param itemCd the itemCd to set
     */
    public void setItemCd(String itemCd) {
        this.itemCd = itemCd;
    }

    /**
     * @return the crnNo
     */
    public String getCrnNo() {
        return crnNo;
    }

    /**
     * @param crnNo the crnNo to set
     */
    public void setCrnNo(String crnNo) {
        this.crnNo = crnNo;
    }

    /**
     * @return the addr
     */
    public String getAddr() {
        return addr;
    }

    /**
     * @param addr the addr to set
     */
    public void setAddr(String addr) {
        this.addr = addr;
    }

    /**
     * @return the applyYn
     */
    public String getApplyYn() {
        return applyYn;
    }

    /**
     * @param applyYn the applyYn to set
     */
    public void setApplyYn(String applyYn) {
        this.applyYn = applyYn;
    }

}
