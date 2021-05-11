package chn.bhmc.dms.sal.svo.vo;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;


/**
 * @ClassName   : PolicyVO
 * @Description : 특수차 정책 조회 VO
 * @author Kang Seok Han
 * @since 2016. 1. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author           description
 *  ===========    =============    ===========================
 *  2016. 9. 30.    Kim Jin Suk           최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="policyTp"  , mesgKey="sal.lbl.policyTp")
   ,@ValidField(field="seq"       , mesgKey="sal.lbl.seq")
   ,@ValidField(field="policyCont", mesgKey="sal.lbl.policyCont")
   })
public class PolicyVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8596173864855545276L;

    /**
     * 정책유형
     **/
    private  String     policyTp;

    /**
     * 일련번호
     **/
    private  int        seq;

    /**
     * 정책내용
     **/
    //POLICY_CONT
    private  String     policyCont;

    /**
     * @return the policyTp
     */
    public String getPolicyTp() {
        return policyTp;
    }

    /**
     * @param policyTp the policyTp to set
     */
    public void setPolicyTp(String policyTp) {
        this.policyTp = policyTp;
    }

    /**
     * @return the seq
     */
    public int getSeq() {
        return seq;
    }

    /**
     * @param seq the seq to set
     */
    public void setSeq(int seq) {
        this.seq = seq;
    }

    /**
     * @return the policyCont
     */
    public String getPolicyCont() {
        return policyCont;
    }

    /**
     * @param policyCont the policyCont to set
     */
    public void setPolicyCont(String policyCont) {
        this.policyCont = policyCont;
    }

    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }

}
