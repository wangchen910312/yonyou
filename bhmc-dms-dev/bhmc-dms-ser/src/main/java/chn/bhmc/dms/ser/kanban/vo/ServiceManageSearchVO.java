package chn.bhmc.dms.ser.kanban.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CarCheckSearchVO.java
 * @Description : 정비관리칸반
 * @author Kim Yun Seung
 * @since 2017. 4. 26.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 4. 26.   Kim Yun Seung    최초 생성
 * </pre>
 */

public class ServiceManageSearchVO extends SearchVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8712178744696955866L;

    private String sDlrCd;

    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sBaseDt;         // 기준일자

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
     * @return the sBaseDt
     */
    public Date getsBaseDt() {
        return sBaseDt;
    }

    /**
     * @param sBaseDt the sBaseDt to set
     */
    public void setsBaseDt(Date sBaseDt) {
        this.sBaseDt = sBaseDt;
    }



}
