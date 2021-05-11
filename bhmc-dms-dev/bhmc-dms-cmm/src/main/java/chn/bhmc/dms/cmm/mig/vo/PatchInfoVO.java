package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 14.     Kang Seok Han     최초 생성
 * </pre>
 */
@XmlRootElement(name="PatchInfo")
@XmlAccessorType(XmlAccessType.FIELD)
public class PatchInfoVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8495456827251083497L;

    @XmlElementWrapper(name="PatchItems")
    @XmlElement(name="PatchItem")
    List<PatchItemVO> patchItems = new ArrayList<PatchItemVO>();

    /**
     * @return the patchItems
     */
    public List<PatchItemVO> getPatchItems() {
        return patchItems;
    }

    /**
     * @param patchItems the patchItems to set
     */
    public void setPatchItems(List<PatchItemVO> patchItems) {
        this.patchItems = patchItems;
    }

    /**
     * @return the patchItems count
     */
    public int getTotal(){
        return this.patchItems.size();
    }
}
