package chn.bhmc.dms.crm.css.vo;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import chn.bhmc.dms.core.datatype.BaseSaveVO;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;

/**
 * 설문 사용자 답변  VO  VO
 *
 * @ClassName   : SatisFactionMobileSaveVO.java
 * @Description : SatisFactionMobileSaveVO Class
 * @author hyun ho kim
 * @since 2016. 3. 17.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 17.     hyun ho kim     최초 생성
 * </pre>
 */

@ValidDescriptor({
})
public class SatisFactionMobileSaveVO extends BaseSaveVO<SatisFactionMobileVO> {



    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 4277328049145772312L;
    
    private SatisFactionMobileResultVO satisFactionMobileResultVO;//만족도조사결과VO




    /**
     * @return the satisFactionMobileResultVO
     */
    public SatisFactionMobileResultVO getSatisFactionMobileResultVO() {
        return satisFactionMobileResultVO;
    }




    /**
     * @param satisFactionMobileResultVO the satisFactionMobileResultVO to set
     */
    public void setSatisFactionMobileResultVO(SatisFactionMobileResultVO satisFactionMobileResultVO) {
        this.satisFactionMobileResultVO = satisFactionMobileResultVO;
    }




    /*
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
        return ReflectionToStringBuilder.toString(this);
    }

}