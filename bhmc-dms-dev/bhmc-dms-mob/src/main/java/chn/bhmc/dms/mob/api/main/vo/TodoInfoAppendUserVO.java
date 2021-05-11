package chn.bhmc.dms.mob.api.main.vo;

import java.io.Serializable;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoAppendUserVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 5. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class TodoInfoAppendUserVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7976119691185280370L;

    /**
     * To-do 번호
     */
    private int todoNo;

    /**
     * 사용자 ID
     */
    private String usrId;

    public TodoInfoAppendUserVO(){
    }

    public TodoInfoAppendUserVO(String usrId){
        this.usrId = usrId;
    }

    /**
     * @return the todoNo
     */
    public int getTodoNo() {
        return todoNo;
    }

    /**
     * @param todoNo the todoNo to set
     */
    public void setTodoNo(int todoNo) {
        this.todoNo = todoNo;
    }

    /**
     * @return the usrId
     */
    public String getUsrId() {
        return usrId;
    }

    /**
     * @param usrId the usrId to set
     */
    public void setUsrId(String usrId) {
        this.usrId = usrId;
    }
}
