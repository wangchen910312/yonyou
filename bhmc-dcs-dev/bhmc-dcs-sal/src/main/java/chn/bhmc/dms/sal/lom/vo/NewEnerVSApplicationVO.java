package chn.bhmc.dms.sal.lom.vo;

import javax.validation.Valid;

import chn.bhmc.dms.core.datatype.BaseVO;


/**
 * 
 * @ClassName: NewEnergyVSApplicationVO 
 * @Description: TODO
 * @author: huyuansen
 * @date: 2019年4月3日 下午2:06:54
 */

public class NewEnerVSApplicationVO extends BaseVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Valid
    private NewEnergyVSApplicationVO newEnergyVSApplicationVO;

	public NewEnergyVSApplicationVO getNewEnergyVSApplicationVO() {
		return newEnergyVSApplicationVO;
	}

	public void setNewEnergyVSApplicationVO(NewEnergyVSApplicationVO newEnergyVSApplicationVO) {
		this.newEnergyVSApplicationVO = newEnergyVSApplicationVO;
	}

	

}
