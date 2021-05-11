package chn.bhmc.dms.ser.ro.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : WorkProcessSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Ki hyun Kwon
 * @since 2017. 3. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 3. 18.     Ki hyun Kwon     최초 생성
 * </pre>
 */

public class WorkProcessSaveVO extends BaseSaveVO<Object> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7697973570410021326L;

    private List<WorkProcessVO> workProcessListVO;

    private List<WorkPauseVO> workPauseListVO;


    /**
     * @return the workProcessListVO
     */
    public List<WorkProcessVO> getWorkProcessListVO() {
        return workProcessListVO;
    }

    /**
     * @param workProcessListVO the workProcessListVO to set
     */
    public void setWorkProcessListVO(List<WorkProcessVO> workProcessListVO) {
        this.workProcessListVO = workProcessListVO;
    }

    /**
     * @return the workPauseListVO
     */
    public List<WorkPauseVO> getWorkPauseListVO() {
        return workPauseListVO;
    }

    /**
     * @param workPauseListVO the workPauseListVO to set
     */
    public void setWorkPauseListVO(List<WorkPauseVO> workPauseListVO) {
        this.workPauseListVO = workPauseListVO;
    }






}
