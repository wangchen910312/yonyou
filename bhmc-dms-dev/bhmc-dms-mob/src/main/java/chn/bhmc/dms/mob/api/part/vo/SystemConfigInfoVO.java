package chn.bhmc.dms.mob.api.part.vo;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.validator.constraints.NotBlank;

/**
 * 시스템설정정보 VO
 *
 * @ClassName   : SystemConfigInfoVO.java
 * @Description : 시스템설정정보 VO
 * @author Kang Seok Han
 * @since 2016. 1. 4.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 4.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SystemConfigInfoVO implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = -5044636903828362494L;


    /**
     * 시스템 설정 정보 키
     */
    @NotBlank
    private String prefKey;

    /**
     * 시스템 설정 정보
     */
    @NotBlank
    private String prefVal;

    /**
     * 시스템 설정 정보 명
     */
    private String prefNm;

    /**
     * 시스템 설정 정보의 Array 여부
     */
    @NotBlank
    private String multiYn;

    /**
     * 수정자 아이디
     */
    private String updtUsrId;

    /**
     * 수정일자
     */
    private Date updtDt;

    /**
     * 시스템 설정 정보 키를 리턴한다.
     * @return
     */
    public String getPrefKey() {
        return prefKey;
    }

    /**
     * 시스템 설정 정보 키를 설정한다.
     * @param prefKey 시스템 설정 정보 키
     */
    public void setPrefKey(String prefKey) {
        this.prefKey = prefKey;
    }

    /**
     * 시스템 설정 정보 값을 리턴한다.
     * @return 시스템 설정 정보 값
     */
    public String getPrefVal() {
        return prefVal;
    }

    /**
     * 시스템 설정 정보 값을 설정한다.
     * @param prefVal 시스템 설정 정보값
     */
    public void setPrefVal(String prefVal) {
        this.prefVal = prefVal;
    }

    /**
     * 시스템 설정 정보의 명칭을 리턴한다.
     * @return 시스템 설정 정보 명
     */
    public String getPrefNm() {
        return prefNm;
    }

    /**
     * 시스템 설정 정보의 명칭을 설정한다.
     * @param prefNm 시스템 설정 정보 명칭
     */
    public void setPrefNm(String prefNm) {
        this.prefNm = prefNm;
    }

    /**
     * 시스템 설정 정보의 Array 여부를 리턴한다.
     * @return Array 여부
     */
    public String getMultiYn() {
        return this.multiYn;
    }

    /**
     * 시스템 설정 정보의 Array 여부를 설정한다.
     * @param multiYn
     */
    public void setMultiYn(String multiYn) {
        this.multiYn = multiYn;
    }


    /**
     * 수정자 아이디를 리턴한다.
     * @return the updtUsrId
     */
    public String getUpdtUsrId() {
        return updtUsrId;
    }

    /**
     * 수정자 아이디를 설정한다.
     * @param updtUsrId the updtUsrId to set
     */
    public void setUpdtUsrId(String updtUsrId) {
        this.updtUsrId = updtUsrId;
    }

    /**
     * 수정일자를 리턴한다.
     * @return the updtDt
     */
    public Date getUpdtDt() {
        return updtDt;
    }

    /**
     * 수정일자를 설정한다.
     * @param updtDt the updtDt to set
     */
    public void setUpdtDt(Date updtDt) {
        this.updtDt = updtDt;
    }

    public String toString(){
        return ToStringBuilder.reflectionToString(this);
    }
}
