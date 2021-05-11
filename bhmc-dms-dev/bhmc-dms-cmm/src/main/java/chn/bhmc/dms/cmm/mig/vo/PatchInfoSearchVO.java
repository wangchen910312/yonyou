package chn.bhmc.dms.cmm.mig.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : PatchInfoSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 12. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 12. 14.     Kang Seok Han     최초 생성
 * </pre>
 */

//@ValidDescriptor({
//    @ValidField(field="repositoryUrl", mesgKey="global.lbl.repositoryUrl")
//    ,@ValidField(field="patchFileName", mesgKey="global.lbl.patchFileName")
//})
public class PatchInfoSearchVO implements Serializable {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 5642903976487312786L;

    /**
     * 패치정보 리포지토리 URL
     */
    @NotBlank
    private String repositoryUrl;

    /**
     * 패치정보 XML 파일명
     */
    @NotBlank
    private String patchFileName;

    /**
     * @return the repositoryUrl
     */
    public String getRepositoryUrl() {
        return repositoryUrl;
    }
    /**
     * @param repositoryUrl the repositoryUrl to set
     */
    public void setRepositoryUrl(String repositoryUrl) {
        this.repositoryUrl = repositoryUrl;
    }
    /**
     * @return the patchFileName
     */
    public String getPatchFileName() {
        return patchFileName;
    }
    /**
     * @param patchFileName the patchFileName to set
     */
    public void setPatchFileName(String patchFileName) {
        this.patchFileName = patchFileName;
    }

}
