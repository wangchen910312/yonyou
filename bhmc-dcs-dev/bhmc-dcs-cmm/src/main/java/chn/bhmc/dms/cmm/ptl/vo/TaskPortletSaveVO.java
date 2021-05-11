package chn.bhmc.dms.cmm.ptl.vo;

import java.util.List;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * 포틀릿 태스크 일괄저장 VO
 * </pre>
 *
 * @ClassName   : PortletSaveVO.java
 * @Description : 포틀릿 일괄저장 VO
 * @author
 * @since 2017. 2. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 24.                     최초 생성
 * </pre>
 */
@ValidDescriptor({
    @ValidField(field="taskCd", mesgKey="global.lbl.tsk")
    ,@ValidField(field="portlets", mesgKey="global.lbl.portlets")
})
public class TaskPortletSaveVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3100837682801696988L;

    @NotBlank
    private String taskCd;

    /**
     * 역할 목록
     */
    private List<String> portlets;

    /**
     * @return the taskCd
     */
    public String getTaskCd() {
        return taskCd;
    }

    /**
     * @param taskCd the taskCd to set
     */
    public void setTaskCd(String taskCd) {
        this.taskCd = taskCd;
    }

    /**
     * @return the portlets
     */
    public List<String> getPortlets() {
        return portlets;
    }

    /**
     * @param portletss the portlets to set
     */
    public void setPortletss(List<String> portlets) {
        this.portlets = portlets;
    }

}
