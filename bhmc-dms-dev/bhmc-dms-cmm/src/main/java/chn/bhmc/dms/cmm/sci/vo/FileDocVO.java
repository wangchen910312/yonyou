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

    /**
     * 첨부문서 번호
     */
    private String fileDocNo;

    /**
     * 첨부파일수
     */
    private int fileCnt;

    /**
     * 임시여부
     * 임시여부가 'Y'인 첨부 문서는 일정기일 이후에 자동으로 삭제 될 수 있습니다.
     * 첨부문서는 첨부문서를 포함하는 문서 저장시 임시여부를 반드시 'N' 상태로 변경해야 한다.
     * @see chn.bhmc.dms.cmm.sci.service.FileMgrService.updateFileDocEnabled()
     */
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
