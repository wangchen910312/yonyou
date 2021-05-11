package chn.bhmc.dms.cmm.sci.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : UserDefinedSaveVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Byoung Chul Jeon
 * @since 2016. 5. 19.
 * @version 1.0
 * @param <T>
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 5. 19.     Byoung Chul Jeon     최초 생성
 * </pre>
 */

@ValidDescriptor({
    @ValidField(field="atcNm", mesgKey="문항명을 입력 하시기 바랍니다.")
   ,@ValidField(field="atcTp", mesgKey="문항 유형을 선택 하시기 바랍니다.")
   ,@ValidField(field="etcInsUseYn", mesgKey="기타 출력 여부를 입력 하시기 바랍니다.")
})
public class UserDefinedSaveVO extends BaseSaveVO<UserDefinedMasterVO> {
    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -8640139104243569074L;

    private String usrDefReqDocId;
    private String usrDefReqDocNm;
    private String usrDefReqCont;
    private String startDt;
    private String endDt;
    private String tempYn;
    private String docRefYn;
    private String delYn;
    private String usrNm;

    /**
     * 전체 목록 (Target)
     */
    @Valid
    private List<UserDefinedTargetVO> allTargetList = new ArrayList<UserDefinedTargetVO>();

    /**
     * 전체 목록 (Survey)
     */
    @Valid
    private List<UserDefinedDetailVO> allSurveyList = new ArrayList<UserDefinedDetailVO>();

    /**
     * @return the usrDefReqDocId
     */
    public String getUsrDefReqDocId() {
        return usrDefReqDocId;
    }

    /**
     * @param usrDefReqDocId the usrDefReqDocId to set
     */
    public void setUsrDefReqDocId(String usrDefReqDocId) {
        this.usrDefReqDocId = usrDefReqDocId;
    }

    /**
     * @return the usrDefReqDocNm
     */
    public String getUsrDefReqDocNm() {
        return usrDefReqDocNm;
    }

    /**
     * @param usrDefReqDocNm the usrDefReqDocNm to set
     */
    public void setUsrDefReqDocNm(String usrDefReqDocNm) {
        this.usrDefReqDocNm = usrDefReqDocNm;
    }

    /**
     * @return the usrDefReqCont
     */
    public String getUsrDefReqCont() {
        return usrDefReqCont;
    }

    /**
     * @param usrDefReqCont the usrDefReqCont to set
     */
    public void setUsrDefReqCont(String usrDefReqCont) {
        this.usrDefReqCont = usrDefReqCont;
    }

    /**
     * @return the startDt
     */
    public String getStartDt() {
        return startDt;
    }

    /**
     * @param startDt the startDt to set
     */
    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }

    /**
     * @return the endDt
     */
    public String getEndDt() {
        return endDt;
    }

    /**
     * @param endDt the endDt to set
     */
    public void setEndDt(String endDt) {
        this.endDt = endDt;
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

    /**
     * @return the docRefYn
     */
    public String getDocRefYn() {
        return docRefYn;
    }

    /**
     * @param docRefYn the docRefYn to set
     */
    public void setDocRefYn(String docRefYn) {
        this.docRefYn = docRefYn;
    }

    /**
     * @return the delYn
     */
    public String getDelYn() {
        return delYn;
    }

    /**
     * @param delYn the delYn to set
     */
    public void setDelYn(String delYn) {
        this.delYn = delYn;
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

    /**
     * @return the allTargetList
     */
    public List<UserDefinedTargetVO> getAllTargetList() {
        return allTargetList;
    }

    /**
     * @param allTargetList the allTargetList to set
     */
    public void setAllTargetList(List<UserDefinedTargetVO> allTargetList) {
        this.allTargetList = allTargetList;
    }

    /**
     * @return the allSurveyList
     */
    public List<UserDefinedDetailVO> getAllSurveyList() {
        return allSurveyList;
    }

    /**
     * @param allSurveyList the allSurveyList to set
     */
    public void setAllSurveyList(List<UserDefinedDetailVO> allSurveyList) {
        this.allSurveyList = allSurveyList;
    }
}