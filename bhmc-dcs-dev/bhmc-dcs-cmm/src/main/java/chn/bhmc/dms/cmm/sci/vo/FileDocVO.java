package chn.bhmc.dms.cmm.sci.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : FileDocVO.java
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

public class FileDocVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -7047387930056418351L;

    private String fileDocNo;
    private int fileCnt;
    private String tempYn;

    public FileDocVO(){
    }

    public FileDocVO(String fileDocNo, String updtUsrId){
        this.fileDocNo = fileDocNo;
        super.setUpdtUsrId(updtUsrId);
    }

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
     * @return the fileCnt
     */
    public int getFileCnt() {
        return fileCnt;
    }
    /**
     * @param fileCnt the fileCnt to set
     */
    public void setFileCnt(int fileCnt) {
        this.fileCnt = fileCnt;
    }
    /**
     * @return the tempYn
     */
    public String getTempYn() {
        return tempYn;
    }
    /**
     * @param tempYn the tempYn to set
     */
    public void setTempYn(String tempYn) {
        this.tempYn = tempYn;
    }





}
