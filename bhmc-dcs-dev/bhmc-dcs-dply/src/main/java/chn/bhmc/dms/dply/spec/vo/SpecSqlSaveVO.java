package chn.bhmc.dms.dply.spec.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecSqlSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 30.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecSqlSaveVO {


    /**
     * SPEC Sql 추가 목록
     */
    private List<SpecSqlVO> insertSpecSqlList = new ArrayList<SpecSqlVO>();

    /**
     * SPEC Sql 수정 목록
     */
    private List<SpecSqlVO> updateSpecSqlList = new ArrayList<SpecSqlVO>();

    /**
     * SPEC Sql 삭제 목록
     */
    private List<SpecSqlVO> deleteSpecSqlList = new ArrayList<SpecSqlVO>();

    /**
     * @param insertSpecSqlList the insertSpecSqlList to set
     */
    public void setInsertSpecSqlList(List<SpecSqlVO> insertSpecSqlList) {
        this.insertSpecSqlList = insertSpecSqlList;
    }

    /**
     * @return the insertSpecSqlList
     */
    public List<SpecSqlVO> getInsertSpecSqlList() {
        return insertSpecSqlList;
    }

    /**
     * @param updateSpecSqlList the updateSpecSqlList to set
     */
    public void setUpdateSpecSqlList(List<SpecSqlVO> updateSpecSqlList) {
        this.updateSpecSqlList = updateSpecSqlList;
    }

    /**
     * @return the updateSpecSqlList
     */
    public List<SpecSqlVO> getUpdateSpecSqlList() {
        return updateSpecSqlList;
    }

    /**
     * @param deleteSpecSqlList the deleteSpecSqlList to set
     */
    public void setDeleteSpecSqlList(List<SpecSqlVO> deleteSpecSqlList) {
        this.deleteSpecSqlList = deleteSpecSqlList;
    }

    /**
     * @return the deleteSpecSqlList
     */
    public List<SpecSqlVO> getDeleteSpecSqlList() {
        return deleteSpecSqlList;
    }
}
