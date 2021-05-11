package chn.bhmc.dms.cmm.sci.vo;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.datatype.SearchVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ChargingPileVO.java
 * @Description : 클래스 설명을 기술합니다.
 * @author kim yewon
 * @since 2019. 4. 4.
 * @version 1.0
 * @see
 * @Modification Information
 */

public class PcaVo implements Serializable {

   
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//字段
    private String nameText;       			//名称
    private String valueText;               //名称对应value
    private String parentId;                //上级编号
    private String parentName;              //上级名称
    
    
	public String getNameText() {
		return nameText;
	}
	public void setNameText(String nameText) {
		this.nameText = nameText;
	}
	public String getValueText() {
		return valueText;
	}
	public void setValueText(String valueText) {
		this.valueText = valueText;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
    
    
   
}
