package chn.bhmc.dms.mob.api.main.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TodoInfoVO.java
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

public class TodoInfoVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -6954387009504342143L;

    /**
     * To-do 번호
     */
    private int todoNo;

    /**
     * To-do 정책ID
     */
    private String todoPolicyId;

    /**
     * To-do 내역
     */
    private String todoDesc;

    /**
     * 처리여부
     */
    private String hndlYn;

    /**
     * 처리자ID
     */
    private String hndlUsrId;

    /**
     * 처리일시
     */
    private Date hndlDt;

    /**
     * 확인여부
     */
    private String openYn;

    /**
     * 확인자ID
     */
    private String openUsrId;

    /**
     * 확인일시
     */
    private Date openDt;

    /**
     * 액션타켓구분
     */
    private String actionTargetTp;

    /**
     * 액션URL 웹
     */
    private String actionUrlWeb;

    /**
     * 액션URL 모바일
     */
    private String actionUrlMob;

    /**
     * 액션 파라메터
     */
    private String actionParams;

    /**
     * 추가 사용자 목록
     */
    @JsonIgnore
    private List<TodoInfoAppendUserVO> appendUsers = new ArrayList<TodoInfoAppendUserVO>();

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
     * @return the todoPolicyId
     */
    public String getTodoPolicyId() {
        return todoPolicyId;
    }

    /**
     * @param todoPolicyId the todoPolicyId to set
     */
    public void setTodoPolicyId(String todoPolicyId) {
        this.todoPolicyId = todoPolicyId;
    }

    /**
     * @return the todoDesc
     */
    public String getTodoDesc() {
        return todoDesc;
    }

    /**
     * @param todoDesc the todoDesc to set
     */
    public void setTodoDesc(String todoDesc) {
        this.todoDesc = todoDesc;
    }

    /**
     * @return the hndlYn
     */
    public String getHndlYn() {
        return hndlYn;
    }

    /**
     * @param hndlYn the hndlYn to set
     */
    public void setHndlYn(String hndlYn) {
        this.hndlYn = hndlYn;
    }

    /**
     * @return the hndlUsrId
     */
    public String getHndlUsrId() {
        return hndlUsrId;
    }

    /**
     * @param hndlUsrId the hndlUsrId to set
     */
    public void setHndlUsrId(String hndlUsrId) {
        this.hndlUsrId = hndlUsrId;
    }

    /**
     * @return the hndlDt
     */
    public Date getHndlDt() {
        return hndlDt;
    }

    /**
     * @param hndlDt the hndlDt to set
     */
    public void setHndlDt(Date hndlDt) {
        this.hndlDt = hndlDt;
    }

    /**
     * @return the openYn
     */
    public String getOpenYn() {
        return openYn;
    }

    /**
     * @param openYn the openYn to set
     */
    public void setOpenYn(String openYn) {
        this.openYn = openYn;
    }

    /**
     * @return the openUsrId
     */
    public String getOpenUsrId() {
        return openUsrId;
    }

    /**
     * @param openUsrId the openUsrId to set
     */
    public void setOpenUsrId(String openUsrId) {
        this.openUsrId = openUsrId;
    }

    /**
     * @return the openDt
     */
    public Date getOpenDt() {
        return openDt;
    }

    /**
     * @param openDt the openDt to set
     */
    public void setOpenDt(Date openDt) {
        this.openDt = openDt;
    }

    /**
     * @return the actionTargetTp
     */
    public String getActionTargetTp() {
        return actionTargetTp;
    }

    /**
     * @param actionTargetTp the actionTargetTp to set
     */
    public void setActionTargetTp(String actionTargetTp) {
        this.actionTargetTp = actionTargetTp;
    }

    /**
     * @return the actionUrlWeb
     */
    public String getActionUrlWeb() {
        return actionUrlWeb;
    }

    /**
     * @param actionUrlWeb the actionUrlWeb to set
     */
    public void setActionUrlWeb(String actionUrlWeb) {
        this.actionUrlWeb = actionUrlWeb;
    }

    /**
     * @return the actionUrlMob
     */
    public String getActionUrlMob() {
        return actionUrlMob;
    }

    /**
     * @param actionUrlMob the actionUrlMob to set
     */
    public void setActionUrlMob(String actionUrlMob) {
        this.actionUrlMob = actionUrlMob;
    }

    /**
     * @return the actionParams
     */
    public String getActionParams() {
        return actionParams;
    }

    /**
     * @param actionParams the actionParams to set
     */
    public void setActionParams(String actionParams) {
        this.actionParams = actionParams;
    }

    /**
     * @return the appendUsers
     */
    public List<TodoInfoAppendUserVO> getAppendUsers() {
        return appendUsers;
    }

    /**
     * @param appendUsers the appendUsers to set
     */
    public void setAppendUsers(List<TodoInfoAppendUserVO> appendUsers) {
        this.appendUsers = appendUsers;
    }
}
