package chn.bhmc.dms.crm.css.vo;

//import java.util.Date;

//import org.hibernate.validator.constraints.NotEmpty;

//import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SatisFactionCrmTargExtractSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author lee in moon
 * @since 2017.08.01.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017.08.01.     lee in moon     최초 생성
 * </pre>
 */


public class SatisFactionCrmTargExtractSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2429630987553004169L;

    private String sDlrCd;  //딜러코드
    private  int sSeq;      //만족도조사 일련번호
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
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }
    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

}
