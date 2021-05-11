package chn.bhmc.dms.dply.spec.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecFileSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 1.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecFileSaveVO {
    /**
     * SPEC FILE 추가 목록
     */
    private List<SpecFileVO> insertSpecFileList = new ArrayList<SpecFileVO>();

    /**
     * SPEC FILE 수정 목록
     */
    private List<SpecFileVO> updateSpecFileList = new ArrayList<SpecFileVO>();

    /**
     * SPEC FILE 삭제 목록
     */
    private List<SpecFileVO> deleteSpecFileList = new ArrayList<SpecFileVO>();

    /**
     * @param insertSpecFileList the insertSpecFileList to set
     */
    public void setInsertSpecFileList(List<SpecFileVO> insertSpecFileList) {
        this.insertSpecFileList = insertSpecFileList;
    }

    /**
     * @return the insertSpecFileList
     */
    public List<SpecFileVO> getInsertSpecFileList() {
        return insertSpecFileList;
    }

    /**
     * @param updateSpecFileList the updateSpecFileList to set
     */
    public void setUpdateSpecFileList(List<SpecFileVO> updateSpecFileList) {
        this.updateSpecFileList = updateSpecFileList;
    }

    /**
     * @return the updateSpecFileList
     */
    public List<SpecFileVO> getUpdateSpecFileList() {
        return updateSpecFileList;
    }

    /**
     * @param deleteSpecFileList the deleteSpecFileList to set
     */
    public void setDeleteSpecFileList(List<SpecFileVO> deleteSpecFileList) {
        this.deleteSpecFileList = deleteSpecFileList;
    }

    /**
     * @return the deleteSpecFileList
     */
    public List<SpecFileVO> getDeleteSpecFileList() {
        return deleteSpecFileList;
    }


}
