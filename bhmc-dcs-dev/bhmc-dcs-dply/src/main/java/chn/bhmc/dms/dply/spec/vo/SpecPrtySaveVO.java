package chn.bhmc.dms.dply.spec.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecPrtySaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 31.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecPrtySaveVO {

    /**
     * SPEC PROPERTY 추가 목록
     */
    private List<SpecPrtyVO> insertSpecPrtyList = new ArrayList<SpecPrtyVO>();

    /**
     * SPEC PROPERTY 수정 목록
     */
    private List<SpecPrtyVO> updateSpecPrtyList = new ArrayList<SpecPrtyVO>();

    /**
     * SPEC PROPERTY 삭제 목록
     */
    private List<SpecPrtyVO> deleteSpecPrtyList = new ArrayList<SpecPrtyVO>();

    /**
     * @param insertSpecPrtyList the insertSpecPrtyList to set
     */
    public void setInsertSpecPrtyList(List<SpecPrtyVO> insertSpecPrtyList) {
        this.insertSpecPrtyList = insertSpecPrtyList;
    }

    /**
     * @return the insertSpecPrtyList
     */
    public List<SpecPrtyVO> getInsertSpecPrtyList() {
        return insertSpecPrtyList;
    }

    /**
     * @param updateSpecPrtyList the updateSpecPrtyList to set
     */
    public void setUpdateSpecPrtyList(List<SpecPrtyVO> updateSpecPrtyList) {
        this.updateSpecPrtyList = updateSpecPrtyList;
    }

    /**
     * @return the updateSpecPrtyList
     */
    public List<SpecPrtyVO> getUpdateSpecPrtyList() {
        return updateSpecPrtyList;
    }

    /**
     * @param deleteSpecPrtyList the deleteSpecPrtyList to set
     */
    public void setDeleteSpecPrtyList(List<SpecPrtyVO> deleteSpecPrtyList) {
        this.deleteSpecPrtyList = deleteSpecPrtyList;
    }

    /**
     * @return the deleteSpecPrtyList
     */
    public List<SpecPrtyVO> getDeleteSpecPrtyList() {
        return deleteSpecPrtyList;
    }


}
