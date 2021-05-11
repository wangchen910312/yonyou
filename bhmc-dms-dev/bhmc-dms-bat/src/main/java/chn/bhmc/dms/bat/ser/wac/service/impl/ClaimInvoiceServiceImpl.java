package chn.bhmc.dms.bat.ser.wac.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.ser.cmm.service.BatServiceCmmCamelService;
import chn.bhmc.dms.bat.ser.wac.service.ClaimInvoiceService;


/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : InvoiceBatchJobBean.java
 * @Description : 索赔发票信息跑批.
 * @author tianjiaxing
 * @since 2021. 4. 19.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2021. 4. 19.     tianjiaxing     索赔发票信息跑批
 * </pre>
 */
@Service("claimInvoiceService")
public class ClaimInvoiceServiceImpl extends HService implements ClaimInvoiceService{
	
	@Autowired
    BatServiceCmmCamelService batServiceCmmCamelService;

	@Override
	public void insertClaimInvoice() throws Exception {
		
		HashMap<String, Object> message = new HashMap<String, Object>();
		//索赔结算发票状态快递信息
		batServiceCmmCamelService.executeCamelClient(message, "SER141");
		//索赔结算发票信息
		batServiceCmmCamelService.executeCamelClient(message, "SER142");
	}
	
	
	
	
}
