package chn.bhmc.dms.ser.cmm.vo;

import org.hibernate.validator.constraints.NotEmpty;

import chn.bhmc.dms.core.datatype.BaseVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : TrobleDescVO.java
 * @Description : 고장서술 VO
 * @author Kwon Ki Hyun
 * @since 2016. 7. 6.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 7. 6.     Kwon Ki Hyun     최초 생성
 * </pre>
 */

public class TrobleDescVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 8508610715086517518L;

    /**
     * PREFIX ID
     **/
    @NotEmpty
    private String preFixId;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 업무번호
     **/
    @NotEmpty
    private String jobNo;

    /**
     * 라인번호
     **/
    private int lineNo;

    /**
     * 도로조건코드1(고속도로)
     **/
    private String roadTermCd1;

    /**
     * 도로조건코드2(아스팔트)
     **/
    private String roadTermCd2;
    /**
     * 도로조건코드3(시멘트)
     */
    private String roadTermCd3;

    /**
     * 도로조건코드4(모래돌도로)
     **/
    private String roadTermCd4;

    /**
     * 도로조건코드4(흙도로)
     **/
    private String roadTermCd5;

    /**
     * 도로조건내용
     **/
    private String roadTermCont;

    /**
     * 도로현황코드1(수평)
     **/
    private String roadPrcnCd1;

    /**
     * 도로현황코드2(오르막)
     **/
    private String roadPrcnCd2;

    /**
     * 도로현황코드3(내리막)
     **/
    private String roadPrcnCd3;

    /**
     * 도로현황코드4(코너,급)
     **/
    private String roadPrcnCd4;

    /**
     * 도로현황코드5(코너,일반)
     **/
    private String roadPrcnCd5;

    /**
     * 도로현황내용
     **/
    private String roadPrcnCont;

    /**
     * 날씨조건코드1(맑음)
     **/
    private String wetrTermCd1;

    /**
     * 날씨조건코드2(바람)
     **/
    private String wetrTermCd2;

    /**
     * 날씨조건코드3(비)
     **/
    private String wetrTermCd3;

    /**
     * 날씨조건코드4(눈)
     **/
    private String wetrTermCd4;

    /**
     * 날씨조건코드5(온도)
     **/
    private String wetrTermCd5;

    /**
     * 날씨조건내용
     **/
    private String wetrTermCont;

    /**
     * 발생빈도코드1(한번)
     **/
    private String occrFreqCd1;

    /**
     * 발생빈도코드2(자주)
     **/
    private String occrFreqCd2;

    /**
     * 발생빈도코드3(정기적)
     **/
    private String occrFreqCd3;

    /**
     * 발생빈도코드4(비정기적)
     **/
    private String occrFreqCd4;

    /**
     * 발생빈도코드5(차수)
     **/
    private String occrFreqCd5;

    /**
     * 발생빈도내용
     **/
    private String occrFreqCont;

    /**
     * 운전상태코드1(가속_급)
     **/
    private String driveStatCd1;

    /**
     * 운전상태코드2(가속_일반)
     **/
    private String driveStatCd2;

    /**
     * 운전상태코드3(감속_급)
     **/
    private String driveStatCd3;

    /**
     * 운전상태코드4(감속_일반)
     **/
    private String driveStatCd4;

    /**
     * 운전상태코드5(속도)
     **/
    private String driveStatCd5;

    /**
     * 운전상태내용
     **/
    private String driveStatCont;

    /**
     * 작업상태코드1(냉강)
     **/
    private String operStatCd1;

    /**
     * 작업상태코드2(열강)
     **/
    private String operStatCd2;

    /**
     * 작업상태코드3(시동)
     **/
    private String operStatCd3;

    /**
     * 작업상태코드4(에어컨가동)
     **/
    private String operStatCd4;

    /**
     * 작업상태코드5(단계)
     **/
    private String operStatCd5;

    /**
     * 작업상태내용
     **/
    private String operStatCont;




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
     * @return the jobNo
     */
    public String getJobNo() {
        return jobNo;
    }

    /**
     * @param jobNo the jobNo to set
     */
    public void setJobNo(String jobNo) {
        this.jobNo = jobNo;
    }

    /**
     * @return the lineNo
     */
    public int getLineNo() {
        return lineNo;
    }

    /**
     * @param lineNo the lineNo to set
     */
    public void setLineNo(int lineNo) {
        this.lineNo = lineNo;
    }

    /**
     * @return the roadTermCd1
     */
    public String getRoadTermCd1() {
        return roadTermCd1;
    }

    /**
     * @param roadTermCd1 the roadTermCd1 to set
     */
    public void setRoadTermCd1(String roadTermCd1) {
        this.roadTermCd1 = roadTermCd1;
    }

    /**
     * @return the roadTermCd2
     */
    public String getRoadTermCd2() {
        return roadTermCd2;
    }

    /**
     * @param roadTermCd2 the roadTermCd2 to set
     */
    public void setRoadTermCd2(String roadTermCd2) {
        this.roadTermCd2 = roadTermCd2;
    }

    /**
     * @return the roadTermCd3
     */
    public String getRoadTermCd3() {
        return roadTermCd3;
    }

    /**
     * @param roadTermCd3 the roadTermCd3 to set
     */
    public void setRoadTermCd3(String roadTermCd3) {
        this.roadTermCd3 = roadTermCd3;
    }

    /**
     * @return the roadTermCd4
     */
    public String getRoadTermCd4() {
        return roadTermCd4;
    }

    /**
     * @param roadTermCd4 the roadTermCd4 to set
     */
    public void setRoadTermCd4(String roadTermCd4) {
        this.roadTermCd4 = roadTermCd4;
    }

    /**
     * @return the roadTermCd5
     */
    public String getRoadTermCd5() {
        return roadTermCd5;
    }

    /**
     * @param roadTermCd5 the roadTermCd5 to set
     */
    public void setRoadTermCd5(String roadTermCd5) {
        this.roadTermCd5 = roadTermCd5;
    }

    /**
     * @return the roadTermCont
     */
    public String getRoadTermCont() {
        return roadTermCont;
    }

    /**
     * @param roadTermCont the roadTermCont to set
     */
    public void setRoadTermCont(String roadTermCont) {
        this.roadTermCont = roadTermCont;
    }

    /**
     * @return the roadPrcnCd1
     */
    public String getRoadPrcnCd1() {
        return roadPrcnCd1;
    }

    /**
     * @param roadPrcnCd1 the roadPrcnCd1 to set
     */
    public void setRoadPrcnCd1(String roadPrcnCd1) {
        this.roadPrcnCd1 = roadPrcnCd1;
    }

    /**
     * @return the roadPrcnCd2
     */
    public String getRoadPrcnCd2() {
        return roadPrcnCd2;
    }

    /**
     * @param roadPrcnCd2 the roadPrcnCd2 to set
     */
    public void setRoadPrcnCd2(String roadPrcnCd2) {
        this.roadPrcnCd2 = roadPrcnCd2;
    }

    /**
     * @return the roadPrcnCd3
     */
    public String getRoadPrcnCd3() {
        return roadPrcnCd3;
    }

    /**
     * @param roadPrcnCd3 the roadPrcnCd3 to set
     */
    public void setRoadPrcnCd3(String roadPrcnCd3) {
        this.roadPrcnCd3 = roadPrcnCd3;
    }

    /**
     * @return the roadPrcnCd4
     */
    public String getRoadPrcnCd4() {
        return roadPrcnCd4;
    }

    /**
     * @param roadPrcnCd4 the roadPrcnCd4 to set
     */
    public void setRoadPrcnCd4(String roadPrcnCd4) {
        this.roadPrcnCd4 = roadPrcnCd4;
    }

    /**
     * @return the roadPrcnCd5
     */
    public String getRoadPrcnCd5() {
        return roadPrcnCd5;
    }

    /**
     * @param roadPrcnCd5 the roadPrcnCd5 to set
     */
    public void setRoadPrcnCd5(String roadPrcnCd5) {
        this.roadPrcnCd5 = roadPrcnCd5;
    }

    /**
     * @return the roadPrcnCont
     */
    public String getRoadPrcnCont() {
        return roadPrcnCont;
    }

    /**
     * @param roadPrcnCont the roadPrcnCont to set
     */
    public void setRoadPrcnCont(String roadPrcnCont) {
        this.roadPrcnCont = roadPrcnCont;
    }

    /**
     * @return the wetrTermCd1
     */
    public String getWetrTermCd1() {
        return wetrTermCd1;
    }

    /**
     * @param wetrTermCd1 the wetrTermCd1 to set
     */
    public void setWetrTermCd1(String wetrTermCd1) {
        this.wetrTermCd1 = wetrTermCd1;
    }

    /**
     * @return the wetrTermCd2
     */
    public String getWetrTermCd2() {
        return wetrTermCd2;
    }

    /**
     * @param wetrTermCd2 the wetrTermCd2 to set
     */
    public void setWetrTermCd2(String wetrTermCd2) {
        this.wetrTermCd2 = wetrTermCd2;
    }

    /**
     * @return the wetrTermCd3
     */
    public String getWetrTermCd3() {
        return wetrTermCd3;
    }

    /**
     * @param wetrTermCd3 the wetrTermCd3 to set
     */
    public void setWetrTermCd3(String wetrTermCd3) {
        this.wetrTermCd3 = wetrTermCd3;
    }

    /**
     * @return the wetrTermCd4
     */
    public String getWetrTermCd4() {
        return wetrTermCd4;
    }

    /**
     * @param wetrTermCd4 the wetrTermCd4 to set
     */
    public void setWetrTermCd4(String wetrTermCd4) {
        this.wetrTermCd4 = wetrTermCd4;
    }

    /**
     * @return the wetrTermCd5
     */
    public String getWetrTermCd5() {
        return wetrTermCd5;
    }

    /**
     * @param wetrTermCd5 the wetrTermCd5 to set
     */
    public void setWetrTermCd5(String wetrTermCd5) {
        this.wetrTermCd5 = wetrTermCd5;
    }

    /**
     * @return the wetrTermCont
     */
    public String getWetrTermCont() {
        return wetrTermCont;
    }

    /**
     * @param wetrTermCont the wetrTermCont to set
     */
    public void setWetrTermCont(String wetrTermCont) {
        this.wetrTermCont = wetrTermCont;
    }

    /**
     * @return the occrFreqCd1
     */
    public String getOccrFreqCd1() {
        return occrFreqCd1;
    }

    /**
     * @param occrFreqCd1 the occrFreqCd1 to set
     */
    public void setOccrFreqCd1(String occrFreqCd1) {
        this.occrFreqCd1 = occrFreqCd1;
    }

    /**
     * @return the occrFreqCd2
     */
    public String getOccrFreqCd2() {
        return occrFreqCd2;
    }

    /**
     * @param occrFreqCd2 the occrFreqCd2 to set
     */
    public void setOccrFreqCd2(String occrFreqCd2) {
        this.occrFreqCd2 = occrFreqCd2;
    }

    /**
     * @return the occrFreqCd3
     */
    public String getOccrFreqCd3() {
        return occrFreqCd3;
    }

    /**
     * @param occrFreqCd3 the occrFreqCd3 to set
     */
    public void setOccrFreqCd3(String occrFreqCd3) {
        this.occrFreqCd3 = occrFreqCd3;
    }

    /**
     * @return the occrFreqCd4
     */
    public String getOccrFreqCd4() {
        return occrFreqCd4;
    }

    /**
     * @param occrFreqCd4 the occrFreqCd4 to set
     */
    public void setOccrFreqCd4(String occrFreqCd4) {
        this.occrFreqCd4 = occrFreqCd4;
    }

    /**
     * @return the occrFreqCd5
     */
    public String getOccrFreqCd5() {
        return occrFreqCd5;
    }

    /**
     * @param occrFreqCd5 the occrFreqCd5 to set
     */
    public void setOccrFreqCd5(String occrFreqCd5) {
        this.occrFreqCd5 = occrFreqCd5;
    }

    /**
     * @return the occrFreqCont
     */
    public String getOccrFreqCont() {
        return occrFreqCont;
    }

    /**
     * @param occrFreqCont the occrFreqCont to set
     */
    public void setOccrFreqCont(String occrFreqCont) {
        this.occrFreqCont = occrFreqCont;
    }

    /**
     * @return the driveStatCd1
     */
    public String getDriveStatCd1() {
        return driveStatCd1;
    }

    /**
     * @param driveStatCd1 the driveStatCd1 to set
     */
    public void setDriveStatCd1(String driveStatCd1) {
        this.driveStatCd1 = driveStatCd1;
    }

    /**
     * @return the driveStatCd2
     */
    public String getDriveStatCd2() {
        return driveStatCd2;
    }

    /**
     * @param driveStatCd2 the driveStatCd2 to set
     */
    public void setDriveStatCd2(String driveStatCd2) {
        this.driveStatCd2 = driveStatCd2;
    }

    /**
     * @return the driveStatCd3
     */
    public String getDriveStatCd3() {
        return driveStatCd3;
    }

    /**
     * @param driveStatCd3 the driveStatCd3 to set
     */
    public void setDriveStatCd3(String driveStatCd3) {
        this.driveStatCd3 = driveStatCd3;
    }

    /**
     * @return the driveStatCd4
     */
    public String getDriveStatCd4() {
        return driveStatCd4;
    }

    /**
     * @param driveStatCd4 the driveStatCd4 to set
     */
    public void setDriveStatCd4(String driveStatCd4) {
        this.driveStatCd4 = driveStatCd4;
    }

    /**
     * @return the driveStatCd5
     */
    public String getDriveStatCd5() {
        return driveStatCd5;
    }

    /**
     * @param driveStatCd5 the driveStatCd5 to set
     */
    public void setDriveStatCd5(String driveStatCd5) {
        this.driveStatCd5 = driveStatCd5;
    }

    /**
     * @return the driveStatCont
     */
    public String getDriveStatCont() {
        return driveStatCont;
    }

    /**
     * @param driveStatCont the driveStatCont to set
     */
    public void setDriveStatCont(String driveStatCont) {
        this.driveStatCont = driveStatCont;
    }

    /**
     * @return the operStatCd1
     */
    public String getOperStatCd1() {
        return operStatCd1;
    }

    /**
     * @param operStatCd1 the operStatCd1 to set
     */
    public void setOperStatCd1(String operStatCd1) {
        this.operStatCd1 = operStatCd1;
    }

    /**
     * @return the operStatCd2
     */
    public String getOperStatCd2() {
        return operStatCd2;
    }

    /**
     * @param operStatCd2 the operStatCd2 to set
     */
    public void setOperStatCd2(String operStatCd2) {
        this.operStatCd2 = operStatCd2;
    }

    /**
     * @return the operStatCd3
     */
    public String getOperStatCd3() {
        return operStatCd3;
    }

    /**
     * @param operStatCd3 the operStatCd3 to set
     */
    public void setOperStatCd3(String operStatCd3) {
        this.operStatCd3 = operStatCd3;
    }

    /**
     * @return the operStatCd4
     */
    public String getOperStatCd4() {
        return operStatCd4;
    }

    /**
     * @param operStatCd4 the operStatCd4 to set
     */
    public void setOperStatCd4(String operStatCd4) {
        this.operStatCd4 = operStatCd4;
    }

    /**
     * @return the operStatCd5
     */
    public String getOperStatCd5() {
        return operStatCd5;
    }

    /**
     * @param operStatCd5 the operStatCd5 to set
     */
    public void setOperStatCd5(String operStatCd5) {
        this.operStatCd5 = operStatCd5;
    }

    /**
     * @return the operStatCont
     */
    public String getOperStatCont() {
        return operStatCont;
    }

    /**
     * @param operStatCont the operStatCont to set
     */
    public void setOperStatCont(String operStatCont) {
        this.operStatCont = operStatCont;
    }


}
