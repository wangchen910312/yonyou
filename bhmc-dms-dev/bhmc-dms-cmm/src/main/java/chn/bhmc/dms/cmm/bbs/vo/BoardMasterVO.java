package chn.bhmc.dms.cmm.bbs.vo;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BoardMasterVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 4. 12.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 12.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

public class BoardMasterVO extends BaseVO {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -1095836025415371290L;

    private String  bbsId;
    private String  nttId;
    @NotBlank
    private String  bbsNm;
    private String  useYn;
    private String  repTp;
    @NotBlank
    private String  cmntUseYn;
    private int     fileCnt         = 0;
    private int     fileMaxSizeVal  = 0;
    private String  usrNm;

    /**
     * @return the bbsId
     */
    public String getBbsId() {
        return bbsId;
    }
    /**
     * @param bbsId the bbsId to set
     */
    public void setBbsId(String bbsId) {
        this.bbsId = bbsId;
    }
    /**
     * @return the nttId
     */
    public String getNttId() {
        return nttId;
    }
    /**
     * @param nttId the nttId to set
     */
    public void setNttId(String nttId) {
        this.nttId = nttId;
    }
    /**
     * @return the bbsNm
     */
    public String getBbsNm() {
        return bbsNm;
    }
    /**
     * @param bbsNm the bbsNm to set
     */
    public void setBbsNm(String bbsNm) {
        this.bbsNm = bbsNm;
    }
    /**
     * @return the useYn
     */
    public String getUseYn() {
        return useYn;
    }
    /**
     * @param useYn the useYn to set
     */
    public void setUseYn(String useYn) {
        this.useYn = useYn;
    }
    /**
     * @return the repTp
     */
    public String getRepTp() {
        return repTp;
    }
    /**
     * @param repTp the repTp to set
     */
    public void setRepTp(String repTp) {
        this.repTp = repTp;
    }
    /**
     * @return the cmntUseYn
     */
    public String getCmntUseYn() {
        return cmntUseYn;
    }
    /**
     * @param cmntUseYn the cmntUseYn to set
     */
    public void setCmntUseYn(String cmntUseYn) {
        this.cmntUseYn = cmntUseYn;
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
     * @return the fileMaxSizeVal
     */
    public int getFileMaxSizeVal() {
        return fileMaxSizeVal;
    }
    /**
     * @param fileMaxSizeVal the fileMaxSizeVal to set
     */
    public void setFileMaxSizeVal(int fileMaxSizeVal) {
        this.fileMaxSizeVal = fileMaxSizeVal;
    }
    /**
     * @return the usrNm
     */
    public String getUsrNm() {
        return usrNm;
    }
    /**
     * @param usrNm the usrNm to set
     */
    public void setUsrNm(String usrNm) {
        this.usrNm = usrNm;
    }
}