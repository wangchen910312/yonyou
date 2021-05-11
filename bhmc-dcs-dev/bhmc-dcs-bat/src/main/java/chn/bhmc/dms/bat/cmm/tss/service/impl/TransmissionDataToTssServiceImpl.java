package chn.bhmc.dms.bat.cmm.tss.service.impl;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.bat.cmm.tss.service.TransmissionDataToTssService;
import chn.bhmc.dms.bat.cmm.tss.service.dao.TransmissionDataToTssDAO;

/**
 *
 * @ClassName : TransmissionDataToTssServiceImpl
 * @Description : DCS往TSS通过DBlink传输数据.
 * @author Jia Ming
 * @since 2019. 4. 30.
 * @version 1.0
 * @see
 * @Modification Information
 * 
 *               <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2019. 4. 30.     Jia Ming
 * </pre>
 */
@Service("transmissionDataToTssService")
public class TransmissionDataToTssServiceImpl extends HService implements
		TransmissionDataToTssService {

	@Resource(name = "transmissionDataToTssDAO")
	TransmissionDataToTssDAO transmissionDataToTssDAO;

	@Override
	public void getDCSDataToTSS() throws Exception {
		transmissionDataToTssDAO.getDCSDataToTSS();
	}

}
