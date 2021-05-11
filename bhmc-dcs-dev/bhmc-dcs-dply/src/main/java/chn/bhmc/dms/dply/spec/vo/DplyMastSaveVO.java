package chn.bhmc.dms.dply.spec.vo;

import java.util.ArrayList;
import java.util.List;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DplyMastSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 7.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 7.     Kang Seok Han     최초 생성
 * </pre>
 */

public class DplyMastSaveVO extends BaseSaveVO<DplyMastVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -641854471351971340L;

    /**
     * SPEC Sql 추가 목록
     */
    private List<DplyMastVO> insertDplyMastList = new ArrayList<DplyMastVO>();

    /**
     * SPEC Sql 수정 목록
     */
    private List<DplyMastVO> updateDplyMastList = new ArrayList<DplyMastVO>();

    /**
     * SPEC Sql 삭제 목록
     */
    private List<DplyMastVO> deleteDplyMastList = new ArrayList<DplyMastVO>();

    /**
     * @param insertDplyMastList the insertDplyMastList to set
     */
    public void setInsertDplyMastList(List<DplyMastVO> insertDplyMastList) {
        this.insertDplyMastList = insertDplyMastList;
    }

    /**
     * @return the insertDplyMastList
     */
    public List<DplyMastVO> getInsertDplyMastList() {
        return insertDplyMastList;
    }

    /**
     * @param updateDplyMastList the updateDplyMastList to set
     */
    public void setUpdateDplyMastList(List<DplyMastVO> updateDplyMastList) {
        this.updateDplyMastList = updateDplyMastList;
    }

    /**
     * @return the updateDplyMastList
     */
    public List<DplyMastVO> getUpdateDplyMastList() {
        return updateDplyMastList;
    }

    /**
     * @param deleteDplyMastList the deleteDplyMastList to set
     */
    public void setDeleteDplyMastList(List<DplyMastVO> deleteDplyMastList) {
        this.deleteDplyMastList = deleteDplyMastList;
    }

    /**
     * @return the deleteDplyMastList
     */
    public List<DplyMastVO> getDeleteDplyMastList() {
        return deleteDplyMastList;
    }


}
