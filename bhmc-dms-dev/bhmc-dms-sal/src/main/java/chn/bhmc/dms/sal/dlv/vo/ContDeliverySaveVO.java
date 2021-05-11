package chn.bhmc.dms.sal.dlv.vo;

import java.util.List;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ContDeliverySaveVO.java
 * @Description : 출고취소
 * @author Kim yewon
 * @since 2016. 10. 24
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 10. 24     Kim yewon     최초 생성
 * </pre>
 */

public class ContDeliverySaveVO extends BaseSaveVO<ContDeliveryVO> {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 6766567829277392502L;


    ContDeliveryVO contDeliveryVO;

    BaseSaveVO<ContDeliveryVO> lineVo;


    @Valid
    private List<ContDeliveryVO> insertContDeliveryVO;






	public List<ContDeliveryVO> getInsertContDeliveryVO() {
		return insertContDeliveryVO;
	}

	public void setInsertContDeliveryVO(List<ContDeliveryVO> insertContDeliveryVO) {
		this.insertContDeliveryVO = insertContDeliveryVO;
	}

	public ContDeliveryVO getContDeliveryVO() {
		return contDeliveryVO;
	}

	public void setContDeliveryVO(ContDeliveryVO contDeliveryVO) {
		this.contDeliveryVO = contDeliveryVO;
	}

	public BaseSaveVO<ContDeliveryVO> getLineVo() {
		return lineVo;
	}

	public void setLineVo(BaseSaveVO<ContDeliveryVO> lineVo) {
		this.lineVo = lineVo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}




}
