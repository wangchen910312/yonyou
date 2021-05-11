package chn.bhmc.dms.bat.sal.rcp.service.impl;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import able.com.service.HService;
import chn.bhmc.dms.bat.ImgUtils.ImagUtil;
import chn.bhmc.dms.bat.sal.rcp.service.BatchInvImgInfoService;
import chn.bhmc.dms.bat.sal.rcp.service.dao.BatchInvImgInfoDAO;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchInvImgInfoVo;
import chn.bhmc.dms.bat.sal.rcp.vo.BatchInvImgOutInfoVo;

@Service("batchInvImgInfoService")
public class BatchInvImgInfoServiceImpl extends HService implements BatchInvImgInfoService {


	@Resource(name="batchInvImgInfoDAO")
	BatchInvImgInfoDAO batchInvImgInfoDAO;
	
	//图片存放路径
	//private static final String PATH = "C:\\tianjx\\img\\";
	private static final String PATH = "/home/jeus/data/webapps/receipt/img/";
	

   /**
    * 将数据库中的blob转化为图片存放
    */
    @Override
    public void readBlod2Pictures() {
        try{
            //查询需要转化的图片信息
            List<BatchInvImgInfoVo> batchInvBlobList = batchInvImgInfoDAO.selectBatchInvBlobInfo();
            if(!batchInvBlobList.isEmpty()) {
            	for(BatchInvImgInfoVo listVO : batchInvBlobList){
            		if(null != listVO.getReceiptImg()) {
            			byte[] receiptImg = listVO.getReceiptImg();
                		String regYear = listVO.getRegYear();  //年
                		String regMonth = listVO.getRegMonth();  //月
                		String regDay = listVO.getRegDay(); //日
                		String dlrCd = listVO.getDlrCd(); //经销商id
                		String receiptNo = listVO.getReceiptNo(); //发票号
                		
                		String path = PATH + regYear + File.separator + regMonth + File.separator + regDay + File.separator + dlrCd;
                		
                		File file = new File(path);
                        
                        synchronized (BatchInvImgInfoServiceImpl.class) {
                            if (!file.exists()) {
                                file.mkdirs();
                            }
                        }
                        
                        String s1=  path +File.separator +receiptNo +"_" +UUID.randomUUID().toString().replace("-","") +".jpg";

                        String strImg = new String(receiptImg,"utf-8");
                        
                        //图片区分jpg || jpeg 不同情况区分截取长度
                         if(strImg.substring(11,14).equals("jpg")) {
                            ImagUtil.GenerateImage(strImg.substring(22), s1);
                        }else {
                        	ImagUtil.GenerateImage(strImg.substring(23), s1);
                        }
                        //修改状态 &删除数据库中的图片信息
                        BatchInvImgOutInfoVo batchInvImgOutInfoVo = new BatchInvImgOutInfoVo();
                        batchInvImgOutInfoVo.setDlrCd(dlrCd);
                        batchInvImgOutInfoVo.setVinNo(listVO.getVinNo());
                        batchInvImgOutInfoVo.setReceiptNo(receiptNo);
                        batchInvImgOutInfoVo.setImgPath(s1);
                        batchInvImgOutInfoVo.setDelImg("Y");
                       
                        batchInvImgInfoDAO.updateBatchInvBlobInfo(batchInvImgOutInfoVo);
            		}
            		
            	}
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
