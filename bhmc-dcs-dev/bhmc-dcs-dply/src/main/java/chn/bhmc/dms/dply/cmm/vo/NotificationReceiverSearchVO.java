package chn.bhmc.dms.dply.cmm.vo;

import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : NotificationReceiverSearchVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2016. 4. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 4. 25.     Kang Seok Han     최초 생성
 * </pre>
 */

public class NotificationReceiverSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 7536802898764550603L;

    /**
     * 일련번호
     */
    private int sSeq               ;


    /**
     * 이메일명
     */
    private String sEmailNm        ;

    /**
     * 휴대폰번호
     */
    private String sHpNo           ;

    /**
     * @param sSeq the sSeq to set
     */
    public void setsSeq(int sSeq) {
        this.sSeq = sSeq;
    }

    /**
     * @return the sSeq
     */
    public int getsSeq() {
        return sSeq;
    }

    /**
     * @param sEmailNm the sEmailNm to set
     */
    public void setsEmailNm(String sEmailNm) {
        this.sEmailNm = sEmailNm;
    }

    /**
     * @return the sEmailNm
     */
    public String getsEmailNm() {
        return sEmailNm;
    }

    /**
     * @param sHpNo the sHpNo to set
     */
    public void setsHpNo(String sHpNo) {
        this.sHpNo = sHpNo;
    }

    /**
     * @return the sHpNo
     */
    public String getsHpNo() {
        return sHpNo;
    }


}
