package chn.bhmc.dms.dply.spec.vo;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SpecMngSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 24.     Kang Seok Han     최초 생성
 * </pre>
 */

public class SpecMngSaveVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8554342892265044212L;

    // Spec 기본정보
    private SpecBasicVO specBasicVO;

    //
    private SpecBundleSaveVO specBundleSaveVO;

    // Spec sql 정보
    private SpecSqlVO specSqlVO;

    //
    private SpecSqlSaveVO specSqlSaveVO;

    //
    private SpecPrtyVO specPrtyVO;

    //
    private SpecPrtySaveVO specPrtySaveVO;

    //
    private SpecFileVO specFileVO;

    //
    private SpecFileSaveVO specFileSaveVO;

    //
    private DplyMastSaveVO dplyMastSaveVO;


    private SpecRepositorySaveVO specRepositorySaveVO;


    private SpecCommandSaveVO specCommandSaveVO;


    // create, update Flag
    private String multiFlag = "";




    /**
     * @param specBasicVO the specBasicVO to set
     */
    public void setSpecBasicVO(SpecBasicVO specBasicVO) {
        this.specBasicVO = specBasicVO;
    }

    /**
     * @return the specBasicVO
     */
    public SpecBasicVO getSpecBasicVO() {
        return specBasicVO;
    }

    /**
     * @param multiFlag the multiFlag to set
     */
    public void setMultiFlag(String multiFlag) {
        this.multiFlag = multiFlag;
    }

    /**
     * @return the multiFlag
     */
    public String getMultiFlag() {
        return multiFlag;
    }

    /**
     * @param specSqlVO the specSqlVO to set
     */
    public void setSpecSqlVO(SpecSqlVO specSqlVO) {
        this.specSqlVO = specSqlVO;
    }

    /**
     * @return the specSqlVO
     */
    public SpecSqlVO getSpecSqlVO() {
        return specSqlVO;
    }

    /**
     * @param specSqlSaveVO the specSqlSaveVO to set
     */
    public void setSpecSqlSaveVO(SpecSqlSaveVO specSqlSaveVO) {
        this.specSqlSaveVO = specSqlSaveVO;
    }

    /**
     * @return the specSqlSaveVO
     */
    public SpecSqlSaveVO getSpecSqlSaveVO() {
        return specSqlSaveVO;
    }

    /**
     * @param specPrtyVO the specPrtyVO to set
     */
    public void setSpecPrtyVO(SpecPrtyVO specPrtyVO) {
        this.specPrtyVO = specPrtyVO;
    }

    /**
     * @return the specPrtyVO
     */
    public SpecPrtyVO getSpecPrtyVO() {
        return specPrtyVO;
    }

    /**
     * @param specPrtySaveVO the specPrtySaveVO to set
     */
    public void setSpecPrtySaveVO(SpecPrtySaveVO specPrtySaveVO) {
        this.specPrtySaveVO = specPrtySaveVO;
    }

    /**
     * @return the specPrtySaveVO
     */
    public SpecPrtySaveVO getSpecPrtySaveVO() {
        return specPrtySaveVO;
    }

    /**
     * @param specFileVO the specFileVO to set
     */
    public void setSpecFileVO(SpecFileVO specFileVO) {
        this.specFileVO = specFileVO;
    }

    /**
     * @return the specFileVO
     */
    public SpecFileVO getSpecFileVO() {
        return specFileVO;
    }

    /**
     * @param specFileSaveVO the specFileSaveVO to set
     */
    public void setSpecFileSaveVO(SpecFileSaveVO specFileSaveVO) {
        this.specFileSaveVO = specFileSaveVO;
    }

    /**
     * @return the specFileSaveVO
     */
    public SpecFileSaveVO getSpecFileSaveVO() {
        return specFileSaveVO;
    }

    /**
     * @param dplyMastSaveVO the dplyMastSaveVO to set
     */
    public void setDplyMastSaveVO(DplyMastSaveVO dplyMastSaveVO) {
        this.dplyMastSaveVO = dplyMastSaveVO;
    }

    /**
     * @return the dplyMastSaveVO
     */
    public DplyMastSaveVO getDplyMastSaveVO() {
        return dplyMastSaveVO;
    }

    /**
     * @param specBundleSaveVO the specBundleSaveVO to set
     */
    public void setSpecBundleSaveVO(SpecBundleSaveVO specBundleSaveVO) {
        this.specBundleSaveVO = specBundleSaveVO;
    }

    /**
     * @return the specBundleSaveVO
     */
    public SpecBundleSaveVO getSpecBundleSaveVO() {
        return specBundleSaveVO;
    }

    /**
     * @param specRepositorySaveVO the specRepositorySaveVO to set
     */
    public void setSpecRepositorySaveVO(SpecRepositorySaveVO specRepositorySaveVO) {
        this.specRepositorySaveVO = specRepositorySaveVO;
    }

    /**
     * @return the specRepositorySaveVO
     */
    public SpecRepositorySaveVO getSpecRepositorySaveVO() {
        return specRepositorySaveVO;
    }

    /**
     * @param specCommandSaveVO the specCommandSaveVO to set
     */
    public void setSpecCommandSaveVO(SpecCommandSaveVO specCommandSaveVO) {
        this.specCommandSaveVO = specCommandSaveVO;
    }

    /**
     * @return the specCommandSaveVO
     */
    public SpecCommandSaveVO getSpecCommandSaveVO() {
        return specCommandSaveVO;
    }


}
