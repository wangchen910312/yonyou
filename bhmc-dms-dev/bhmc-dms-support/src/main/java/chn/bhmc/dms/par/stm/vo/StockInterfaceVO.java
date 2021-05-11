package chn.bhmc.dms.par.stm.vo;

import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;

/**
 * 현재고 인터페이스 VO
 *
 * @ClassName   : StockInterfaceVO.java
 * @Description : StockInterfaceVO Class
 * @author Ju Won Lee
 * @since 2016. 1. 21.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 1. 21.     Ju Won Lee     최초 생성
 * </pre>
 */

public class StockInterfaceVO extends BaseVO{

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3974860811306749868L;

    /**
     * PDC CODE
     */
    private String ivrPdc;

    /**
     * Company
     */
    private String ivrCmpKnd;

    /**
     * Part Number
     */
    private String ivrPno;

    /**
     * General On-Hand
     */
    private double ivrGenOhad;

    /**
     * 인터페이스결과코드
     */
    private String ifresult;

    /**
     * 인터페이스실패메세지
     */
    private String iffailmsg;

    /**
     * 인터페이스생성일자
     */
    private String createdate;

    /**
     * 인터페이스변경일자
     */
    private String updatedate;

    /**
     * 전국 수량 존재 여부
     */
    private String ivrPdAExist;

    /**
     * 전국 수량
     */
    private double ivrPdAGenOhad;

    /**
     * PdB 수량 존재여부
     */
    private String ivrPdBExist;

    /**
     * PdB 수량
     */
    private double ivrPdBGenOhad;

    /**
     * PdC 수량 존재여부
     */
    private String ivrPdCExist;

    /**
     * PdC 수량
     */
    private double ivrPdCGenOhad;

    /**
     * PdD 수량 존재여부
     */
    private String ivrPdDExist;

    /**
     * PdD 수량
     */
    private double ivrPdDGenOhad;

    /**
     * PdE 수량 존재여부
     */
    private String ivrPdEExist;

    /**
     * PdE 수량
     */
    private double ivrPdEGenOhad;

    /**
     * PdF 수량 존재여부
     */
    private String ivrPdFExist;

    /**
     * PdF 수량
     */
    private double ivrPdFGenOhad;

    /**
     * PdG 수량 존재여부
     */
    private String ivrPdGExist;

    /**
     * PdG 수량
     */
    private double ivrPdGGenOhad;

    /**
     * PdH 수량 존재여부
     */
    private String ivrPdHExist;

    /**
     * PdH 수량
     */
    private double ivrPdHGenOhad;

    /**
     * PdI 수량 존재여부
     */
    private String ivrPdIExist;

    /**
     * PdI 수량
     */
    private double ivrPdIGenOhad;

    /**
     * PdJ 수량 존재여부
     */
    private String ivrPdJExist;

    /**
     * PdJ 수량
     */
    private double ivrPdJGenOhad;


    /**
     * 인터페이스등록일자
     */
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date ifRegDt;


    /**
     * @return the ivrPdc
     */
    public String getIvrPdc() {
        return ivrPdc;
    }


    /**
     * @param ivrPdc the ivrPdc to set
     */
    public void setIvrPdc(String ivrPdc) {
        this.ivrPdc = ivrPdc;
    }


    /**
     * @return the ivrCmpKnd
     */
    public String getIvrCmpKnd() {
        return ivrCmpKnd;
    }


    /**
     * @param ivrCmpKnd the ivrCmpKnd to set
     */
    public void setIvrCmpKnd(String ivrCmpKnd) {
        this.ivrCmpKnd = ivrCmpKnd;
    }


    /**
     * @return the ivrPno
     */
    public String getIvrPno() {
        return ivrPno;
    }


    /**
     * @param ivrPno the ivrPno to set
     */
    public void setIvrPno(String ivrPno) {
        this.ivrPno = ivrPno;
    }


    /**
     * @return the ivrGenOhad
     */
    public double getIvrGenOhad() {
        return ivrGenOhad;
    }


    /**
     * @param ivrGenOhad the ivrGenOhad to set
     */
    public void setIvrGenOhad(double ivrGenOhad) {
        this.ivrGenOhad = ivrGenOhad;
    }


    /**
     * @return the ifresult
     */
    public String getIfresult() {
        return ifresult;
    }


    /**
     * @param ifresult the ifresult to set
     */
    public void setIfresult(String ifresult) {
        this.ifresult = ifresult;
    }


    /**
     * @return the iffailmsg
     */
    public String getIffailmsg() {
        return iffailmsg;
    }


    /**
     * @param iffailmsg the iffailmsg to set
     */
    public void setIffailmsg(String iffailmsg) {
        this.iffailmsg = iffailmsg;
    }


    /**
     * @return the createdate
     */
    public String getCreatedate() {
        return createdate;
    }


    /**
     * @param createdate the createdate to set
     */
    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }


    /**
     * @return the updatedate
     */
    public String getUpdatedate() {
        return updatedate;
    }


    /**
     * @param updatedate the updatedate to set
     */
    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }


    /**
     * @return the ivrPdAExist
     */
    public String getIvrPdAExist() {
        return ivrPdAExist;
    }


    /**
     * @param ivrPdAExist the ivrPdAExist to set
     */
    public void setIvrPdAExist(String ivrPdAExist) {
        this.ivrPdAExist = ivrPdAExist;
    }


    /**
     * @return the ivrPdAGenOhad
     */
    public double getIvrPdAGenOhad() {
        return ivrPdAGenOhad;
    }


    /**
     * @param ivrPdAGenOhad the ivrPdAGenOhad to set
     */
    public void setIvrPdAGenOhad(double ivrPdAGenOhad) {
        this.ivrPdAGenOhad = ivrPdAGenOhad;
    }


    /**
     * @return the ivrPdBExist
     */
    public String getIvrPdBExist() {
        return ivrPdBExist;
    }


    /**
     * @param ivrPdBExist the ivrPdBExist to set
     */
    public void setIvrPdBExist(String ivrPdBExist) {
        this.ivrPdBExist = ivrPdBExist;
    }


    /**
     * @return the ivrPdBGenOhad
     */
    public double getIvrPdBGenOhad() {
        return ivrPdBGenOhad;
    }


    /**
     * @param ivrPdBGenOhad the ivrPdBGenOhad to set
     */
    public void setIvrPdBGenOhad(double ivrPdBGenOhad) {
        this.ivrPdBGenOhad = ivrPdBGenOhad;
    }


    /**
     * @return the ivrPdCExist
     */
    public String getIvrPdCExist() {
        return ivrPdCExist;
    }


    /**
     * @param ivrPdCExist the ivrPdCExist to set
     */
    public void setIvrPdCExist(String ivrPdCExist) {
        this.ivrPdCExist = ivrPdCExist;
    }


    /**
     * @return the ivrPdCGenOhad
     */
    public double getIvrPdCGenOhad() {
        return ivrPdCGenOhad;
    }


    /**
     * @param ivrPdCGenOhad the ivrPdCGenOhad to set
     */
    public void setIvrPdCGenOhad(double ivrPdCGenOhad) {
        this.ivrPdCGenOhad = ivrPdCGenOhad;
    }


    /**
     * @return the ivrPdDExist
     */
    public String getIvrPdDExist() {
        return ivrPdDExist;
    }


    /**
     * @param ivrPdDExist the ivrPdDExist to set
     */
    public void setIvrPdDExist(String ivrPdDExist) {
        this.ivrPdDExist = ivrPdDExist;
    }


    /**
     * @return the ivrPdDGenOhad
     */
    public double getIvrPdDGenOhad() {
        return ivrPdDGenOhad;
    }


    /**
     * @param ivrPdDGenOhad the ivrPdDGenOhad to set
     */
    public void setIvrPdDGenOhad(double ivrPdDGenOhad) {
        this.ivrPdDGenOhad = ivrPdDGenOhad;
    }


    /**
     * @return the ivrPdEExist
     */
    public String getIvrPdEExist() {
        return ivrPdEExist;
    }


    /**
     * @param ivrPdEExist the ivrPdEExist to set
     */
    public void setIvrPdEExist(String ivrPdEExist) {
        this.ivrPdEExist = ivrPdEExist;
    }


    /**
     * @return the ivrPdEGenOhad
     */
    public double getIvrPdEGenOhad() {
        return ivrPdEGenOhad;
    }


    /**
     * @param ivrPdEGenOhad the ivrPdEGenOhad to set
     */
    public void setIvrPdEGenOhad(double ivrPdEGenOhad) {
        this.ivrPdEGenOhad = ivrPdEGenOhad;
    }


    /**
     * @return the ivrPdFExist
     */
    public String getIvrPdFExist() {
        return ivrPdFExist;
    }


    /**
     * @param ivrPdFExist the ivrPdFExist to set
     */
    public void setIvrPdFExist(String ivrPdFExist) {
        this.ivrPdFExist = ivrPdFExist;
    }


    /**
     * @return the ivrPdFGenOhad
     */
    public double getIvrPdFGenOhad() {
        return ivrPdFGenOhad;
    }


    /**
     * @param ivrPdFGenOhad the ivrPdFGenOhad to set
     */
    public void setIvrPdFGenOhad(double ivrPdFGenOhad) {
        this.ivrPdFGenOhad = ivrPdFGenOhad;
    }


    /**
     * @return the ivrPdGExist
     */
    public String getIvrPdGExist() {
        return ivrPdGExist;
    }


    /**
     * @param ivrPdGExist the ivrPdGExist to set
     */
    public void setIvrPdGExist(String ivrPdGExist) {
        this.ivrPdGExist = ivrPdGExist;
    }


    /**
     * @return the ivrPdGGenOhad
     */
    public double getIvrPdGGenOhad() {
        return ivrPdGGenOhad;
    }


    /**
     * @param ivrPdGGenOhad the ivrPdGGenOhad to set
     */
    public void setIvrPdGGenOhad(double ivrPdGGenOhad) {
        this.ivrPdGGenOhad = ivrPdGGenOhad;
    }


    /**
     * @return the ivrPdHExist
     */
    public String getIvrPdHExist() {
        return ivrPdHExist;
    }


    /**
     * @param ivrPdHExist the ivrPdHExist to set
     */
    public void setIvrPdHExist(String ivrPdHExist) {
        this.ivrPdHExist = ivrPdHExist;
    }


    /**
     * @return the ivrPdHGenOhad
     */
    public double getIvrPdHGenOhad() {
        return ivrPdHGenOhad;
    }


    /**
     * @param ivrPdHGenOhad the ivrPdHGenOhad to set
     */
    public void setIvrPdHGenOhad(double ivrPdHGenOhad) {
        this.ivrPdHGenOhad = ivrPdHGenOhad;
    }


    /**
     * @return the ivrPdIExist
     */
    public String getIvrPdIExist() {
        return ivrPdIExist;
    }


    /**
     * @param ivrPdIExist the ivrPdIExist to set
     */
    public void setIvrPdIExist(String ivrPdIExist) {
        this.ivrPdIExist = ivrPdIExist;
    }


    /**
     * @return the ivrPdIGenOhad
     */
    public double getIvrPdIGenOhad() {
        return ivrPdIGenOhad;
    }


    /**
     * @param ivrPdIGenOhad the ivrPdIGenOhad to set
     */
    public void setIvrPdIGenOhad(double ivrPdIGenOhad) {
        this.ivrPdIGenOhad = ivrPdIGenOhad;
    }


    /**
     * @return the ivrPdJExist
     */
    public String getIvrPdJExist() {
        return ivrPdJExist;
    }


    /**
     * @param ivrPdJExist the ivrPdJExist to set
     */
    public void setIvrPdJExist(String ivrPdJExist) {
        this.ivrPdJExist = ivrPdJExist;
    }


    /**
     * @return the ivrPdJGenOhad
     */
    public double getIvrPdJGenOhad() {
        return ivrPdJGenOhad;
    }


    /**
     * @param ivrPdJGenOhad the ivrPdJGenOhad to set
     */
    public void setIvrPdJGenOhad(double ivrPdJGenOhad) {
        this.ivrPdJGenOhad = ivrPdJGenOhad;
    }


    /**
     * @return the ifRegDt
     */
    public Date getIfRegDt() {
        return ifRegDt;
    }


    /**
     * @param ifRegDt the ifRegDt to set
     */
    public void setIfRegDt(Date ifRegDt) {
        this.ifRegDt = ifRegDt;
    }





}
