package chn.bhmc.dms.ser.cmm.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


public class ServiceCmmVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 65922722044102429L;

    /**
     * PREFIX_ID
     **/
    private String preFixId;

    /**
     * 공통문서번호
     **/
    private String docNo;

    /**
     * RO문서번호
     **/
    private String roDocNo;

    /**
     * 예약번호
     **/
    private String resvDocNo;

    /**
     * 운전자ID
     **/
    private String driverId;

    /**
     * 운전자명
     **/
    private String driverNm;

    /**
     * VIN
     **/
    private String vinNo;

    /**
     * 차량번호
     **/
    private String carRegNo;

    /**
     * SA ID
     **/
    private String saId;

    /**
     * 부품요청 유형(SR:예약, RO:RO, SP:부품예약)
     **/
    private String partReqType;

    /**
     * 부품요청 상태코드(01:예약, 부품예약, 02:RO)
     **/
    private String parReqStatCd;

    /**
     * 부품요청 준비코드
     **/
    private String readyStatCd;

    /**
     * 삭제여부
     **/
    private String delStatCd;
    /**
     * RO유형
     **/
    private String roTp;

    /**
     * PDI 여부
     */
    private String pdiYn;

    /**
     * RO상태
     */
    private String roStatCd;

    /**
     * 이전 RO유형
     */
    private String pastRoTp;

    /**
     * @return the preFixId
     */
    public String getPreFixId() {
        return preFixId;
    }
    /**
     * @param preFixId the preFixId to set
     */
    public void setPreFixId(String preFixId) {
        this.preFixId = preFixId;
    }
    /**
     * @return the docNo
     */
    public String getDocNo() {
        return docNo;
    }
    /**
     * @param docNo the docNo to set
     */
    public void setDocNo(String docNo) {
        this.docNo = docNo;
    }
    /**
     * @return the roDocNo
     */
    public String getRoDocNo() {
        return roDocNo;
    }
    /**
     * @param roDocNo the roDocNo to set
     */
    public void setRoDocNo(String roDocNo) {
        this.roDocNo = roDocNo;
    }
    /**
     * @return the resvDocNo
     */
    public String getResvDocNo() {
        return resvDocNo;
    }
    /**
     * @param resvDocNo the resvDocNo to set
     */
    public void setResvDocNo(String resvDocNo) {
        this.resvDocNo = resvDocNo;
    }
    /**
     * @return the driverId
     */
    public String getDriverId() {
        return driverId;
    }
    /**
     * @param driverId the driverId to set
     */
    public void setDriverId(String driverId) {
        this.driverId = driverId;
    }
    /**
     * @return the driverNm
     */
    public String getDriverNm() {
        return driverNm;
    }
    /**
     * @param driverNm the driverNm to set
     */
    public void setDriverNm(String driverNm) {
        this.driverNm = driverNm;
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
     * @return the carRegNo
     */
    public String getCarRegNo() {
        return carRegNo;
    }
    /**
     * @param carRegNo the carRegNo to set
     */
    public void setCarRegNo(String carRegNo) {
        this.carRegNo = carRegNo;
    }
    /**
     * @return the saId
     */
    public String getSaId() {
        return saId;
    }
    /**
     * @param saId the saId to set
     */
    public void setSaId(String saId) {
        this.saId = saId;
    }
    /**
     * @return the partReqType
     */
    public String getPartReqType() {
        return partReqType;
    }
    /**
     * @param partReqType the partReqType to set
     */
    public void setPartReqType(String partReqType) {
        this.partReqType = partReqType;
    }
    /**
     * @return the parReqStatCd
     */
    public String getParReqStatCd() {
        return parReqStatCd;
    }
    /**
     * @param parReqStatCd the parReqStatCd to set
     */
    public void setParReqStatCd(String parReqStatCd) {
        this.parReqStatCd = parReqStatCd;
    }
    /**
     * @return the readyStatCd
     */
    public String getReadyStatCd() {
        return readyStatCd;
    }
    /**
     * @param readyStatCd the readyStatCd to set
     */
    public void setReadyStatCd(String readyStatCd) {
        this.readyStatCd = readyStatCd;
    }
    /**
     * @return the delStatCd
     */
    public String getDelStatCd() {
        return delStatCd;
    }
    /**
     * @param delStatCd the delStatCd to set
     */
    public void setDelStatCd(String delStatCd) {
        this.delStatCd = delStatCd;
    }
    /**
     * @return the roTp
     */
    public String getRoTp() {
        return roTp;
    }
    /**
     * @param roTp the roTp to set
     */
    public void setRoTp(String roTp) {
        this.roTp = roTp;
    }
    /**
     * @return the pdiYn
     */
    public String getPdiYn() {
        return pdiYn;
    }
    /**
     * @param pdiYn the pdiYn to set
     */
    public void setPdiYn(String pdiYn) {
        this.pdiYn = pdiYn;
    }
    /**
     * @return the roStatCd
     */
    public String getRoStatCd() {
        return roStatCd;
    }
    /**
     * @param roStatCd the roStatCd to set
     */
    public void setRoStatCd(String roStatCd) {
        this.roStatCd = roStatCd;
    }
    /**
     * @return the pastRoTp
     */
    public String getPastRoTp() {
        return pastRoTp;
    }
    /**
     * @param pastRoTp the pastRoTp to set
     */
    public void setPastRoTp(String pastRoTp) {
        this.pastRoTp = pastRoTp;
    }

}