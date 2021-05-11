package chn.bhmc.dms.core.datatype;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BaseFileItemVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 11.     Kang Seok Han     최초 생성
 * </pre>
 */

public class BaseFileItemVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7717300506310840352L;

    private String fileDocNo;
    private int fileNo;
    private String fileNm;
    private long fileSize;
    /**
     * @return the fileDocNo
     */
    public String getFileDocNo() {
        return fileDocNo;
    }
    /**
     * @param fileDocNo the fileDocNo to set
     */
    public void setFileDocNo(String fileDocNo) {
        this.fileDocNo = fileDocNo;
    }
    /**
     * @return the fileNo
     */
    public int getFileNo() {
        return fileNo;
    }
    /**
     * @param fileNo the fileNo to set
     */
    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }
    /**
     * @return the fileNm
     */
    public String getFileNm() {
        return fileNm;
    }
    /**
     * @param fileNm the fileNm to set
     */
    public void setFileNm(String fileNm) {
        this.fileNm = fileNm;
    }
    /**
     * @return the fileSize
     */
    public long getFileSize() {
        return fileSize;
    }
    /**
     * @param fileSize the fileSize to set
     */
    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }



}
