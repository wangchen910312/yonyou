package chn.bhmc.dms.par.cpm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 기술자문 검색 VO
 *
 * @ClassName   : SkillAndQnaSearchVO.java
 * @Description : SkillAndQnaSearchVO Class
 * @author In Bo Shim
 * @since 2016. 8. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 8. 24.     In Bo Shim     최초 생성
 * </pre>
 */
public class SkillAndQnaSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 2501163610225205145L;

    /**
     * 딜러번호
     **/
    private String sDlrCd;

    /**
     * 문제번호
     **/
    private String sPblmNo;

    /**
     * 답변문제번호
     **/
    private String sAnswPblmNo;

    /**
     * 모델코드(차종)
     **/
    private String sCarlineCd;

    /**
     * 차대번호
     **/
    private String sVinNo;

    /**
     * 제목명
     **/
    private String sTitleNm;

    /**
     * 품목코드
     **/
    private String sItemCd;

    /**
     * 문제내용
     **/
    private String sPblmCont;

    /**
     * 문제상태코드
     **/
    private String sPblmStatCd;

    /**
     * 질문자ID
     **/
    private String sQestId;

    /**
     * 딜러회사코드
     **/
    private String sDlrCmpCd;

    /**
     * 첨부파일명
     **/
    private String sFileNm;

    /**
     * 추가질문내용
     **/
    private String sAddQestCont;

    /**
     * 딜러문제코드
     **/
    private String sDlrPblmCd;

    /**
     * 기술자문시작일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPblmStartSendDt;

    /**
     * 기술자문종료일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date sPblmEndSendDt;

    /**
     * @return the sDlrCd
     */
    public String getsDlrCd() {
        return sDlrCd;
    }

    /**
     * @param sDlrCd the sDlrCd to set
     */
    public void setsDlrCd(String sDlrCd) {
        this.sDlrCd = sDlrCd;
    }

    /**
     * @return the sPblmNo
     */
    public String getsPblmNo() {
        return sPblmNo;
    }

    /**
     * @param sPblmNo the sPblmNo to set
     */
    public void setsPblmNo(String sPblmNo) {
        this.sPblmNo = sPblmNo;
    }

    /**
     * @return the sAnswPblmNo
     */
    public String getsAnswPblmNo() {
        return sAnswPblmNo;
    }

    /**
     * @param sAnswPblmNo the sAnswPblmNo to set
     */
    public void setsAnswPblmNo(String sAnswPblmNo) {
        this.sAnswPblmNo = sAnswPblmNo;
    }

    /**
     * @return the sCarlineCd
     */
    public String getsCarlineCd() {
        return sCarlineCd;
    }

    /**
     * @param sCarlineCd the sCarlineCd to set
     */
    public void setsCarlineCd(String sCarlineCd) {
        this.sCarlineCd = sCarlineCd;
    }

    /**
     * @return the sVinNo
     */
    public String getsVinNo() {
        return sVinNo;
    }

    /**
     * @param sVinNo the sVinNo to set
     */
    public void setsVinNo(String sVinNo) {
        this.sVinNo = sVinNo;
    }

    /**
     * @return the sTitleNm
     */
    public String getsTitleNm() {
        return sTitleNm;
    }

    /**
     * @param sTitleNm the sTitleNm to set
     */
    public void setsTitleNm(String sTitleNm) {
        this.sTitleNm = sTitleNm;
    }

    /**
     * @return the sItemCd
     */
    public String getsItemCd() {
        return sItemCd;
    }

    /**
     * @param sItemCd the sItemCd to set
     */
    public void setsItemCd(String sItemCd) {
        this.sItemCd = sItemCd;
    }

    /**
     * @return the sPblmCont
     */
    public String getsPblmCont() {
        return sPblmCont;
    }

    /**
     * @param sPblmCont the sPblmCont to set
     */
    public void setsPblmCont(String sPblmCont) {
        this.sPblmCont = sPblmCont;
    }

    /**
     * @return the sPblmStatCd
     */
    public String getsPblmStatCd() {
        return sPblmStatCd;
    }

    /**
     * @param sPblmStatCd the sPblmStatCd to set
     */
    public void setsPblmStatCd(String sPblmStatCd) {
        this.sPblmStatCd = sPblmStatCd;
    }

    /**
     * @return the sQestId
     */
    public String getsQestId() {
        return sQestId;
    }

    /**
     * @param sQestId the sQestId to set
     */
    public void setsQestId(String sQestId) {
        this.sQestId = sQestId;
    }

    /**
     * @return the sDlrCmpCd
     */
    public String getsDlrCmpCd() {
        return sDlrCmpCd;
    }

    /**
     * @param sDlrCmpCd the sDlrCmpCd to set
     */
    public void setsDlrCmpCd(String sDlrCmpCd) {
        this.sDlrCmpCd = sDlrCmpCd;
    }

    /**
     * @return the sFileNm
     */
    public String getsFileNm() {
        return sFileNm;
    }

    /**
     * @param sFileNm the sFileNm to set
     */
    public void setsFileNm(String sFileNm) {
        this.sFileNm = sFileNm;
    }

    /**
     * @return the sAddQestCont
     */
    public String getsAddQestCont() {
        return sAddQestCont;
    }

    /**
     * @param sAddQestCont the sAddQestCont to set
     */
    public void setsAddQestCont(String sAddQestCont) {
        this.sAddQestCont = sAddQestCont;
    }

    /**
     * @return the sDlrPblmCd
     */
    public String getsDlrPblmCd() {
        return sDlrPblmCd;
    }

    /**
     * @param sDlrPblmCd the sDlrPblmCd to set
     */
    public void setsDlrPblmCd(String sDlrPblmCd) {
        this.sDlrPblmCd = sDlrPblmCd;
    }

    /**
     * @return the sPblmStartSendDt
     */
    public Date getsPblmStartSendDt() {
        return sPblmStartSendDt;
    }

    /**
     * @param sPblmStartSendDt the sPblmStartSendDt to set
     */
    public void setsPblmStartSendDt(Date sPblmStartSendDt) {
        this.sPblmStartSendDt = sPblmStartSendDt;
    }

    /**
     * @return the sPblmEndSendDt
     */
    public Date getsPblmEndSendDt() {
        return sPblmEndSendDt;
    }

    /**
     * @param sPblmEndSendDt the sPblmEndSendDt to set
     */
    public void setsPblmEndSendDt(Date sPblmEndSendDt) {
        this.sPblmEndSendDt = sPblmEndSendDt;
    }
}
