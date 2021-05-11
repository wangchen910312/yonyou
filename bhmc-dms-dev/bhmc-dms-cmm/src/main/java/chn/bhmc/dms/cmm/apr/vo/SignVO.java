package chn.bhmc.dms.cmm.apr.vo;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SecuredDocVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 1. 18.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 18.     Kang Seok Han     최초 생성
 * </pre>
 */
public class SignVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2924692645434750515L;

    /**
     * 결재문서번호
     */
    private String signDocNo;

    /**
     * 결재양식ID
     */
    @NotBlank
    private String signDocId;

    /**
     * 결재양식명
     */
    private String signDocNm;
    
    /**
     * 참조문서 URL
     */
    private String refDocViewUrlNm;

    /**
     * 참조문서 파라메터
     */
    private String refDocParams;

    /**
     * 결재문서 결재진행상태
     * '01':대기
     * '02':진행
     * '03':결재
     * '04':반려
     */
    private String signStatCd;

    /**
     * 임시저장여부
     */
    @NotBlank
    @Pattern(regexp="[Y|N]")
    private String tempSaveYn;

    /**
     * 결재완료일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private String signEndDt;

    /**
     * 요청 사원번호
     */
    @NotBlank
    private String reqEmpNo;

    /**
     * 요청자ID
     */
    @NotBlank
    private String reqUsrId;

    /**
     * 요청자명
     */
    @NotBlank
    private String reqUsrNm;

    /**
     * 요청일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date reqDt;

    /**
     * 결재요청 제목
     */
    private String reqTitleNm;

    /**
     * 결재요청상세
     */
    @NotBlank
    private String reqCont;

    /**
     * 결재라인 정보
     */
    private SignLineVO signLine;

    /**
     * 결재라인 목록
     */
    private List<SignLineVO> signLines;

    /**
     * @return the signDocNo
     */
    public String getSignDocNo() {
        return signDocNo;
    }

    /**
     * @param signDocNo the signDocNo to set
     */
    public void setSignDocNo(String signDocNo) {
        this.signDocNo = signDocNo;
    }

    /**
     * @return the signDocId
     */
    public String getSignDocId() {
        return signDocId;
    }

    /**
     * @param signDocId the signDocId to set
     */
    public void setSignDocId(String signDocId) {
        this.signDocId = signDocId;
    }

    /**
     * @return the signDocNm
     */
    public String getSignDocNm() {
        return signDocNm;
    }

    /**
     * @param signDocNm the signDocNm to set
     */
    public void setSignDocNm(String signDocNm) {
        this.signDocNm = signDocNm;
    }
    
    /**
     * @return the refDocViewUrlNm
     */
    public String getRefDocViewUrlNm() {
		return refDocViewUrlNm;
	}
    
    /**
     * @param refDocViewUrlNm the refDocViewUrlNm to set
     */
	public void setRefDocViewUrlNm(String refDocViewUrlNm) {
		this.refDocViewUrlNm = refDocViewUrlNm;
	}

	/**
     * @return the refDocParams
     */
    public String getRefDocParams() {
        return refDocParams;
    }

    /**
     * @param refDocParams the refDocParams to set
     */
    public void setRefDocParams(String refDocParams) {
        this.refDocParams = refDocParams;
    }

    /**
     * @return the signStatCd
     */
    public String getSignStatCd() {
        return signStatCd;
    }

    /**
     * @param signStatCd the signStatCd to set
     */
    public void setSignStatCd(String signStatCd) {
        this.signStatCd = signStatCd;
    }

    /**
     * @return the tempSaveYn
     */
    public String getTempSaveYn() {
        return tempSaveYn;
    }

    /**
     * @param tempSaveYn the tempSaveYn to set
     */
    public void setTempSaveYn(String tempSaveYn) {
        this.tempSaveYn = tempSaveYn;
    }

    /**
     * @return the signEndDt
     */
    public String getSignEndDt() {
        return signEndDt;
    }

    /**
     * @param signEndDt the signEndDt to set
     */
    public void setSignEndDt(String signEndDt) {
        this.signEndDt = signEndDt;
    }

    /**
     * @return the reqEmpNo
     */
    public String getReqEmpNo() {
        return reqEmpNo;
    }

    /**
     * @param reqEmpNo the reqEmpNo to set
     */
    public void setReqEmpNo(String reqEmpNo) {
        this.reqEmpNo = reqEmpNo;
    }

    /**
     * @return the reqUsrId
     */
    public String getReqUsrId() {
        return reqUsrId;
    }

    /**
     * @param reqUsrId the reqUsrId to set
     */
    public void setReqUsrId(String reqUsrId) {
        this.reqUsrId = reqUsrId;
    }

    /**
     * @return the reqUsrNm
     */
    public String getReqUsrNm() {
        return reqUsrNm;
    }

    /**
     * @param reqUsrNm the reqUsrNm to set
     */
    public void setReqUsrNm(String reqUsrNm) {
        this.reqUsrNm = reqUsrNm;
    }

    /**
     * @return the reqDt
     */
    public Date getReqDt() {
        return reqDt;
    }

    /**
     * @param reqDt the reqDt to set
     */
    public void setReqDt(Date reqDt) {
        this.reqDt = reqDt;
    }

    /**
     * @return the reqTitleNm
     */
    public String getReqTitleNm() {
        return reqTitleNm;
    }

    /**
     * @param reqTitleNm the reqTitleNm to set
     */
    public void setReqTitleNm(String reqTitleNm) {
        this.reqTitleNm = reqTitleNm;
    }

    /**
     * @return the reqCont
     */
    public String getReqCont() {
        return reqCont;
    }

    /**
     * @param reqCont the reqCont to set
     */
    public void setReqCont(String reqCont) {
        this.reqCont = reqCont;
    }

    /**
     * @return the signLine
     */
    public SignLineVO getSignLine() {
        return signLine;
    }

    /**
     * @param signLine the signLine to set
     */
    public void setSignLine(SignLineVO signLine) {
        this.signLine = signLine;
    }

    /**
     * @return the signLines
     */
    public List<SignLineVO> getSignLines() {
        return signLines;
    }

    /**
     * @param signLines the signLines to set
     */
    public void setSignLines(List<SignLineVO> signLines) {
        this.signLines = signLines;
    }

    public void addSignLine(SignLineVO signLineVO){
        this.signLines.add(signLineVO);
    }
}
