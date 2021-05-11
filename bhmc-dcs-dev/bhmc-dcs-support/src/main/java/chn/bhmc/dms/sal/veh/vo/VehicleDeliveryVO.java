package chn.bhmc.dms.sal.veh.vo;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : VehicleDeliveryVO.java
 * @Description : 차량출고이력 VO
 * @author kim jin suk
 * @since 2017. 3. 24.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 28.     Jin Suk Kim        최초 생성
 *
 * </pre>
 */

public class VehicleDeliveryVO extends BaseVO {

    /**
     * Statements
     * (long)serialVersionUID 
     */
    private static final long serialVersionUID = 4667927950543646992L;


    /**
     * DMS->ERP전송일YYYYMMDD       
     **/
    private  String     kmtrdy;    
     
    /**
     * DMS->ERP전송시간HHMMSS        
     **/
    private  String     kmtrtm;    
     
    /**
     * 시퀀스 1~999999              
     **/
    private  int        kmseq;     
     
    /**
     * 구분코드 J1-소매, J2 소매취소       
     **/
    private  String     kmopt;     
     
    /**
     * 일자(딜러입고일,딜러입고취소일)         
     **/
    private  String     kmdate;    
     
    /**
     * 일자(소매일,소매취소일)KMSTDY,KMDCDY
     **/
    private  String     kmstdy;    
     
    /**
     * 시간(소매일,소매취소일)KMDCDY,KMDCDY
     **/
    private  String     kmdcdy;    
     
    /**
     * 소매취소사유코드                  
     **/
    private  String     kmcncd;    
     
    /**
     * VIN-NO(KMVIN1+KMVIN2      
     **/
    private  String     kmvin;     
     
    /**
     * 딜러코드                      
     **/
    private  String     kmdelr;    
     
    /**
     * 2급딜러코드                    
     **/
    private  String     kmctcd;    
     
    /**
     * 판매사원ID                    
     **/
    private  String     kmrgno;    
     
    /**
     * 차량용도(승용-P/택시-C)           
     **/
    private  String     kmotit;    
     
    /**
     * DMS계약번호                   
     **/
    private  String     kmcont;    
     
    /**
     * 보증수리시작일                   
     **/
    private  String     kmstdy2;   
     
    /**
     * 소매유형                      
     **/
    private  String     kmprop;    
     
    /**
     * DMS사용자ID                  
     **/
    private  String     kmuser;    
     
    /**
     * 계약번호                      
     **/
    private  String     contractNo;
     
    /**
     * 고객명                       
     **/
    private  String     custnm;

    /**
     * @return the kmtrdy
     */
    public String getKmtrdy() {
        return kmtrdy;
    }

    /**
     * @param kmtrdy the kmtrdy to set
     */
    public void setKmtrdy(String kmtrdy) {
        this.kmtrdy = kmtrdy;
    }

    /**
     * @return the kmtrtm
     */
    public String getKmtrtm() {
        return kmtrtm;
    }

    /**
     * @param kmtrtm the kmtrtm to set
     */
    public void setKmtrtm(String kmtrtm) {
        this.kmtrtm = kmtrtm;
    }

    /**
     * @return the kmseq
     */
    public int getKmseq() {
        return kmseq;
    }

    /**
     * @param kmseq the kmseq to set
     */
    public void setKmseq(int kmseq) {
        this.kmseq = kmseq;
    }

    /**
     * @return the kmopt
     */
    public String getKmopt() {
        return kmopt;
    }

    /**
     * @param kmopt the kmopt to set
     */
    public void setKmopt(String kmopt) {
        this.kmopt = kmopt;
    }

    /**
     * @return the kmdate
     */
    public String getKmdate() {
        return kmdate;
    }

    /**
     * @param kmdate the kmdate to set
     */
    public void setKmdate(String kmdate) {
        this.kmdate = kmdate;
    }

    /**
     * @return the kmstdy
     */
    public String getKmstdy() {
        return kmstdy;
    }

    /**
     * @param kmstdy the kmstdy to set
     */
    public void setKmstdy(String kmstdy) {
        this.kmstdy = kmstdy;
    }

    /**
     * @return the kmdcdy
     */
    public String getKmdcdy() {
        return kmdcdy;
    }

    /**
     * @param kmdcdy the kmdcdy to set
     */
    public void setKmdcdy(String kmdcdy) {
        this.kmdcdy = kmdcdy;
    }

    /**
     * @return the kmcncd
     */
    public String getKmcncd() {
        return kmcncd;
    }

    /**
     * @param kmcncd the kmcncd to set
     */
    public void setKmcncd(String kmcncd) {
        this.kmcncd = kmcncd;
    }

    /**
     * @return the kmvin
     */
    public String getKmvin() {
        return kmvin;
    }

    /**
     * @param kmvin the kmvin to set
     */
    public void setKmvin(String kmvin) {
        this.kmvin = kmvin;
    }

    /**
     * @return the kmdelr
     */
    public String getKmdelr() {
        return kmdelr;
    }

    /**
     * @param kmdelr the kmdelr to set
     */
    public void setKmdelr(String kmdelr) {
        this.kmdelr = kmdelr;
    }

    /**
     * @return the kmctcd
     */
    public String getKmctcd() {
        return kmctcd;
    }

    /**
     * @param kmctcd the kmctcd to set
     */
    public void setKmctcd(String kmctcd) {
        this.kmctcd = kmctcd;
    }

    /**
     * @return the kmrgno
     */
    public String getKmrgno() {
        return kmrgno;
    }

    /**
     * @param kmrgno the kmrgno to set
     */
    public void setKmrgno(String kmrgno) {
        this.kmrgno = kmrgno;
    }

    /**
     * @return the kmotit
     */
    public String getKmotit() {
        return kmotit;
    }

    /**
     * @param kmotit the kmotit to set
     */
    public void setKmotit(String kmotit) {
        this.kmotit = kmotit;
    }

    /**
     * @return the kmcont
     */
    public String getKmcont() {
        return kmcont;
    }

    /**
     * @param kmcont the kmcont to set
     */
    public void setKmcont(String kmcont) {
        this.kmcont = kmcont;
    }

    /**
     * @return the kmstdy2
     */
    public String getKmstdy2() {
        return kmstdy2;
    }

    /**
     * @param kmstdy2 the kmstdy2 to set
     */
    public void setKmstdy2(String kmstdy2) {
        this.kmstdy2 = kmstdy2;
    }

    /**
     * @return the kmprop
     */
    public String getKmprop() {
        return kmprop;
    }

    /**
     * @param kmprop the kmprop to set
     */
    public void setKmprop(String kmprop) {
        this.kmprop = kmprop;
    }

    /**
     * @return the kmuser
     */
    public String getKmuser() {
        return kmuser;
    }

    /**
     * @param kmuser the kmuser to set
     */
    public void setKmuser(String kmuser) {
        this.kmuser = kmuser;
    }

    /**
     * @return the contractNo
     */
    public String getContractNo() {
        return contractNo;
    }

    /**
     * @param contractNo the contractNo to set
     */
    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    /**
     * @return the custnm
     */
    public String getCustnm() {
        return custnm;
    }

    /**
     * @param custnm the custnm to set
     */
    public void setCustnm(String custnm) {
        this.custnm = custnm;
    }
    
    /**
     * @return the serialversionuid
     */
    public static long getSerialversionuid() {
        return serialVersionUID;
    }    
}