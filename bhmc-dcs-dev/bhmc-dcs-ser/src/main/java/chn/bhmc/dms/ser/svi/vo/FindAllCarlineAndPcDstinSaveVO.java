package chn.bhmc.dms.ser.svi.vo;

import chn.bhmc.dms.core.datatype.BaseSaveVO;

/**
 * <pre>
 * 所有车种和车辆用途信息 SaveVO
 * </pre>
 *
 * @ClassName   : FindAllCarlineAndPcDstinVO.java
 * @Description : 所有车种和车辆用途信息 SaveVO
 * @author chen shengan
 * @since 2021. 3. 31.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 3. 31.     chen shengan        所有车种和车辆用途信息
 * </pre>
 */
public class FindAllCarlineAndPcDstinSaveVO extends BaseSaveVO<FindAllCarlineAndPcDstinVO> {

	/**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = 3733267587634393426L;
    
    private String dlrCd;
    
    private String updateType;

	public String getDlrCd() {
		return dlrCd;
	}

	public void setDlrCd(String dlrCd) {
		this.dlrCd = dlrCd;
	}

	public String getUpdateType() {
		return updateType;
	}

	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}

	public FindAllCarlineAndPcDstinSaveVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FindAllCarlineAndPcDstinSaveVO(String dlrCd, String updateType) {
		super();
		this.dlrCd = dlrCd;
		this.updateType = updateType;
	}
    
    
}
