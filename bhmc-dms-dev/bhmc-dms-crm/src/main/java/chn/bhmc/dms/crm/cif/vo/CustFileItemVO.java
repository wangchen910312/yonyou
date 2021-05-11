package chn.bhmc.dms.crm.cif.vo;

import chn.bhmc.dms.core.datatype.BaseFileItemVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileItemVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 22.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 22.     Kang Seok Han     최초 생성
 * </pre>
 */

public class CustFileItemVO extends BaseFileItemVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7591946651262399054L;

    /**
     * Document Type
     */
    private String docTp;
    private String docTpNm;
    private String fileTp;
    private String fileData;


    /**
     * @return the fileTp
     */
    public String getFileTp() {
        return fileTp;
    }
    /**
     * @param fileTp the fileTp to set
     */
    public void setFileTp(String fileTp) {
        this.fileTp = fileTp;
    }
    /**
     * @return the fileData
     */
    public String getFileData() {
        return fileData;
    }
    /**
     * @param fileData the fileData to set
     */
    public void setFileData(String fileData) {
        this.fileData = fileData;
    }
    /**
     * @return the docTp
     */
    public String getDocTp() {
        return docTp;
    }
    /**
     * @param docTp the docTp to set
     */
    public void setDocTp(String docTp) {
        this.docTp = docTp;
    }
    /**
     * @return the docTpNm
     */
    public String getDocTpNm() {
        return docTpNm;
    }
    /**
     * @param docTpNm the docTpNm to set
     */
    public void setDocTpNm(String docTpNm) {
        this.docTpNm = docTpNm;
    }

}
