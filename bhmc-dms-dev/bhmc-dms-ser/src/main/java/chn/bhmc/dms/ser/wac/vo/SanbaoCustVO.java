package chn.bhmc.dms.ser.wac.vo;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : SanbaoCustVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon ki hyun
 * @since 2016. 9. 14.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 14.     Kwon ki hyun     최초 생성
 * </pre>
 */

public class SanbaoCustVO  extends BaseVO{


    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8077972613573229596L;

    /**
     * 딜러코드
     */
    public String dlrCd;

    /**
     * 차대번호
     */
    public String vinNo;

    /**
     * 소유자ID
     */
    public String carOwnerId;

    /**
     * 소유자명
     */
    public String carOwnerNm;

    /**
     * 소유자 전화번호
     */
    public String carOwnerTelNo;

    /**
     * 소유자 핸드폰번호
     */
    public String carOwnerHpNo;

    /**
     * 소유자 이메일
     */
    public String carOwnerEmailNm;

    /**
     * 소유자 주민사업자등록번호
     */
    public String carOwnerSsnCrnNo;

    /**
     * 소유자 우편번호
     */
    public String carOwnerZipCd;

    /**
     * 소유자 주소
     */
    public String carOwnerAddr;

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the vinNo
     */
    public String getVinNo() {
        return vinNo;
    }

    /**
     * @param vinNo the vinNo to set
     */
    public void setVinNo(String vinNo) {
        this.vinNo = vinNo;
    }

    /**
     * @return the carOwnerId
     */
    public String getCarOwnerId() {
        return carOwnerId;
    }

    /**
     * @param carOwnerId the carOwnerId to set
     */
    public void setCarOwnerId(String carOwnerId) {
        this.carOwnerId = carOwnerId;
    }

    /**
     * @return the carOwnerNm
     */
    public String getCarOwnerNm() {
        return carOwnerNm;
    }

    /**
     * @param carOwnerNm the carOwnerNm to set
     */
    public void setCarOwnerNm(String carOwnerNm) {
        this.carOwnerNm = carOwnerNm;
    }

    /**
     * @return the carOwnerTelNo
     */
    public String getCarOwnerTelNo() {
        return carOwnerTelNo;
    }

    /**
     * @param carOwnerTelNo the carOwnerTelNo to set
     */
    public void setCarOwnerTelNo(String carOwnerTelNo) {
        this.carOwnerTelNo = carOwnerTelNo;
    }

    /**
     * @return the carOwnerHpNo
     */
    public String getCarOwnerHpNo() {
        return carOwnerHpNo;
    }

    /**
     * @param carOwnerHpNo the carOwnerHpNo to set
     */
    public void setCarOwnerHpNo(String carOwnerHpNo) {
        this.carOwnerHpNo = carOwnerHpNo;
    }

    /**
     * @return the carOwnerEmailNm
     */
    public String getCarOwnerEmailNm() {
        return carOwnerEmailNm;
    }

    /**
     * @param carOwnerEmailNm the carOwnerEmailNm to set
     */
    public void setCarOwnerEmailNm(String carOwnerEmailNm) {
        this.carOwnerEmailNm = carOwnerEmailNm;
    }

    /**
     * @return the carOwnerSsnCrnNo
     */
    public String getCarOwnerSsnCrnNo() {
        return carOwnerSsnCrnNo;
    }

    /**
     * @param carOwnerSsnCrnNo the carOwnerSsnCrnNo to set
     */
    public void setCarOwnerSsnCrnNo(String carOwnerSsnCrnNo) {
        this.carOwnerSsnCrnNo = carOwnerSsnCrnNo;
    }

    /**
     * @return the carOwnerZipCd
     */
    public String getCarOwnerZipCd() {
        return carOwnerZipCd;
    }

    /**
     * @param carOwnerZipCd the carOwnerZipCd to set
     */
    public void setCarOwnerZipCd(String carOwnerZipCd) {
        this.carOwnerZipCd = carOwnerZipCd;
    }

    /**
     * @return the carOwnerAddr
     */
    public String getCarOwnerAddr() {
        return carOwnerAddr;
    }

    /**
     * @param carOwnerAddr the carOwnerAddr to set
     */
    public void setCarOwnerAddr(String carOwnerAddr) {
        this.carOwnerAddr = carOwnerAddr;
    }



}
