package chn.bhmc.dms.cmm.apr.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : DocVO.java
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
public class DocVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3921408473795556690L;

    /**
     * 결재문서번호
     */
    private String signDocNo;

    /**
     * 결재양식아이디
     */
    @NotBlank
    private String signDocId;

    /**
     * 결재양식명
     */
    private String signDocNm;

    /**
     * 상신알람여부
     */
    private String signAlrtYn;

    /**
     * 콜백알람여부
     */
    private String signCallBackAlrtYn;

    /**
     * 사용여부
     */
    private String useYn;

    /**
     * 참조문서 URL
     */
    private String refDocViewUrlNm;

    /**
     * 결재양식 결재라인 목록
     */
    @Valid
    private List<DocLineVO> docLineList = new ArrayList<DocLineVO>();

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
     * @return the signAlrtYn
     */
    public String getSignAlrtYn() {
        return signAlrtYn;
    }

    /**
     * @param signAlrtYn the signAlrtYn to set
     */
    public void setSignAlrtYn(String signAlrtYn) {
        this.signAlrtYn = signAlrtYn;
    }

    /**
     * @return the signCallBackAlrtYn
     */
    public String getSignCallBackAlrtYn() {
        return signCallBackAlrtYn;
    }

    /**
     * @param signCallBackAlrtYn the signCallBackAlrtYn to set
     */
    public void setSignCallBackAlrtYn(String signCallBackAlrtYn) {
        this.signCallBackAlrtYn = signCallBackAlrtYn;
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
     * @return the docLineList
     */
    public List<DocLineVO> getDocLineList() {
        return docLineList;
    }

    /**
     * @param docLineList the docLineList to set
     */
    public void setDocLineList(List<DocLineVO> docLineList) {
        this.docLineList = docLineList;
    }
}
