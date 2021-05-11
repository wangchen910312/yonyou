package chn.bhmc.dms.core.datatype;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BaseSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 5.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 5.     Kang Seok Han     최초 생성
 * </pre>
 */
public class BaseSaveVO<T> implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 2743614026416218862L;

    /**
     * 추가목록
     */
    @Valid
    private List<T> insertList = new ArrayList<T>();

    /**
     * 수정목록
     */
    @Valid
    private List<T> updateList = new ArrayList<T>();

    /**
     * 삭제목록
     */
    private List<T> deleteList = new ArrayList<T>();

    public List<T> getInsertList() {
        return insertList;
    }
    public void setInsertList(List<T> insertList) {
        this.insertList = insertList;
    }
    public List<T> getUpdateList() {
        return updateList;
    }
    public void setUpdateList(List<T> updateList) {
        this.updateList = updateList;
    }
    public List<T> getDeleteList() {
        return deleteList;
    }
    public void setDeleteList(List<T> deleteList) {
        this.deleteList = deleteList;
    }
}
