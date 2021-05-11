package chn.bhmc.dms.par.pmm.vo;

import java.io.Serializable;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : CertificationListVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Eun Jung Jang
 * @since 2016. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 27.     Eun Jung Jang     최초 생성
 * </pre>
 */

public class CertificationListVO extends BaseVO implements Serializable{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2436027006485442775L;

    private CertificationVO certificationVO;

    private List<CertificationItemVO> certificationList;

    /**
     * @param certificationVO the certificationVO to set
     */
    public void setCertificationVO(CertificationVO certificationVO) {
        this.certificationVO = certificationVO;
    }

    /**
     * @return the certificationVO
     */
    public CertificationVO getCertificationVO() {
        return certificationVO;
    }


    /**
     * @param certificationList the certificationList to set
     */
    public void setCertificationList(List<CertificationItemVO> certificationList) {
        this.certificationList = certificationList;
    }

    /**
     * @return the certificationList
     */
    public List<CertificationItemVO> getCertificationList() {
        return certificationList;
    }




}
