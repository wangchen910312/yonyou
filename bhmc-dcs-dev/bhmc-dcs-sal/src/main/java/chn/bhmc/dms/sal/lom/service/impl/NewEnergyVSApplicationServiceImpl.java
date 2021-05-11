package chn.bhmc.dms.sal.lom.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.jxls.common.Context;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import able.com.service.HService;
import able.com.vo.HMap;
import chn.bhmc.dms.core.datatype.SearchResult;
import chn.bhmc.dms.core.support.excel.JxlsSupport;
import chn.bhmc.dms.core.support.idgen.TableIdGenService;
import chn.bhmc.dms.core.util.LoginUtil;
import chn.bhmc.dms.core.util.ObjectUtil;
import chn.bhmc.dms.sal.cmm.service.SalesCommonCamelService;
import chn.bhmc.dms.sal.lom.service.NewEnergyVSApplicationService;
import chn.bhmc.dms.sal.lom.service.dao.NewEnergyVSApplicationDAO;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationSearchVO;
import chn.bhmc.dms.sal.lom.vo.NewEnergyVSApplicationVO;

/**
 * 
 * @ClassName: NewEnergyVSApplicationServiceImpl 
 * @Description: TODO
 * @author: Administrator
 * @date: 2019年4月3日 下午2:04:45
 */

@Service("NewEnergyVSApplicationService")
public class NewEnergyVSApplicationServiceImpl extends HService implements NewEnergyVSApplicationService ,JxlsSupport{

	@Resource(name="retailContractOrdNoIdgenService")
    TableIdGenService retailContractOrdNoIdgenService;
	
	@Autowired
    SalesCommonCamelService salesCommonCamelService;
    /**
     * 배정관리 DAO 선언
     */
    @Resource(name="newEnergyVSApplicationDAO")
    NewEnergyVSApplicationDAO newEnergyVSApplicationDAO;

    /**
     * 조회 조건에 해당하는 이월판매취소결과를 조회한다.
     */
    @Override
    public List<NewEnergyVSApplicationVO> selectNewEnergyVSApplicationByCondition(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
        return newEnergyVSApplicationDAO.selectNewEnergyVSApplicationByCondition(searchVO);
    }

    
	@Override
	public int selectNewEnergyVSApplicationByConditionCnt(NewEnergyVSApplicationSearchVO searchVO) throws Exception {
		return newEnergyVSApplicationDAO.selectNewEnergyVSApplicationByConditionCnt(searchVO);
	}


	@Override
	public void insertNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO)
			throws Exception {
		newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
		newEnergyVSApplicationDAO.insertNewEnVSApplication(newEnergyVSApplicationVO);/*
		 * if(newEnergyVSApplicationVO.getApproveCd().equals("B")){ try{ Map<String,
		 * Object> message = new HashMap<String, Object>();
		 * salesCommonCamelService.executeCamelClent(message,"SAL222"); //집단오더 헤더
		 * SA_0414IS }catch(Exception e){
		 * //groupSalesApplicationDAO.procFleetSaleFigureReq1RollBack(grpSaleAppVO);
		 * log.error(e.getMessage(),e); throw e; } }
		 */
	}


	@Override
	public void updateNewEnVSApplication(NewEnergyVSApplicationVO newEnergyVSApplicationVO) throws Exception {
		newEnergyVSApplicationVO.setAuditDt(new Date());
		//R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28 start
		newEnergyVSApplicationVO.setReviewerId(LoginUtil.getUserId());
		newEnergyVSApplicationVO.setReviewerNm(LoginUtil.getUserNm());
		//R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28 end
		newEnergyVSApplicationDAO.updateNewEnVSApplication(newEnergyVSApplicationVO);
		newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
		/*
		 * if(newEnergyVSApplicationVO.getApproveCd().equals("B")){ try{ Map<String,
		 * Object> message = new HashMap<String, Object>();
		 * salesCommonCamelService.executeCamelClent(message,"SAL222"); //집단오더 헤더
		 * SA_0414IS }catch(Exception e){
		 * //groupSalesApplicationDAO.procFleetSaleFigureReq1RollBack(grpSaleAppVO);
		 * log.error(e.getMessage(),e); throw e; } }
		 */
	}


	@Override
    public void initJxlsContext(Context context, HMap params) throws Exception {

		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();

        ObjectUtil.convertMapToObject(params, searchVO, "beanName", "templateFile", "fileName");
        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
		  if (StringUtils.isNotEmpty((String)params.get("applStartDt"))) {
		  searchVO.setApplStartDt((Date)params.get("applStartDt"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("applEndDt"))) {
			  searchVO.setApplEndDt((Date)params.get("applEndDt"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("invoStartDt"))) {
			  searchVO.setInvoStartDt((Date)params.get("invoStartDt"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("invoEndDt"))) {
			  searchVO.setInvoEndDt((Date)params.get("invoEndDt"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("custTp"))) {
			  searchVO.setCustTp((String)params.get("custTp"));
		  }
		  if (StringUtils.isNotEmpty((String)params.get("sStatusNo"))) {
			  searchVO.setStatusNo((String)params.get("sStatusNo"));
		  }
		  //chenming 2019-10-12 在审核画面增加每辆车的最新补贴申请记录 start
		if (StringUtils.isNotEmpty((String)params.get("appliRecode"))) {
        	searchVO.setAppliRecode((String)params.get("appliRecode"));
        }
        //chenming 2019-10-12 在审核画面增加每辆车的最新补贴申请记录 end
       List<NewEnergyVSApplicationVO> list = selectNewEnergyVSApplicationByCondition(searchVO);
        context.putVar("items", list);
    }


	@Override
	public void updateNewEnVSApplicationTc(String vinNo) throws Exception {
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		vinNo = "22";
		if (StringUtils.isNotEmpty(vinNo)) {
			SearchResult result = new SearchResult();
	        searchVO.setsDlrCd(LoginUtil.getDlrCd());      // 딜러코드
	        searchVO.setsLangCd(LocaleContextHolder.getLocale().getLanguage());
	        searchVO.setVinNo(vinNo);
	        result.setTotal(this.selectNewEnergyVSApplicationByConditionCnt(searchVO));
			if(result.getTotal() != 0){
	            result.setData(this.selectNewEnergyVSApplicationByCondition(searchVO));
	            List <NewEnergyVSApplicationVO> list = (List<NewEnergyVSApplicationVO>) result.getData();
	            NewEnergyVSApplicationVO newEnergyVSApplicationVO = list.get(0);
	            newEnergyVSApplicationVO.setStatusNo("05");
	            Date date = new Date();
	            newEnergyVSApplicationVO.setIfRegDt(date);
	            newEnergyVSApplicationDAO.updateNewEnVSApplicationIs(newEnergyVSApplicationVO);
	    		newEnergyVSApplicationDAO.updateNewEnVSApplication(newEnergyVSApplicationVO);
	    		/*
	    		 * if(newEnergyVSApplicationVO.getApproveCd().equals("B")){ try{ Map<String,
	    		 * Object> message = new HashMap<String, Object>();
	    		 * salesCommonCamelService.executeCamelClent(message,"SAL222"); //집단오더 헤더
	    		 * SA_0414IS }catch(Exception e){
	    		 * //groupSalesApplicationDAO.procFleetSaleFigureReq1RollBack(grpSaleAppVO);
	    		 * log.error(e.getMessage(),e); throw e; } }
	    		 */
	        }
	      }
		
	}


	@Override
	public void passNewEnergyVSApplication(String[] split,NewEnergyVSApplicationVO newEnergy) throws Exception {
		NewEnergyVSApplicationSearchVO searchVO = new NewEnergyVSApplicationSearchVO();
		
		for(String str : split){
			searchVO.setsApplicationNo(str);
			List<NewEnergyVSApplicationVO> vo = newEnergyVSApplicationDAO.selectNewEnergyVSApplicationByCondition(searchVO);
			if(vo.size()>0){
				NewEnergyVSApplicationVO newEnergyVSApplicationVO = vo.get(0);
				if("Y".equals(newEnergy.getStatusNo())){//审批通过
					newEnergyVSApplicationVO.setStatusNo("03");
				}else{
					newEnergyVSApplicationVO.setStatusNo("04");
				}
				//R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28 start
				newEnergyVSApplicationVO.setReviewerId(LoginUtil.getUserId());
				newEnergyVSApplicationVO.setReviewerNm(LoginUtil.getUserNm());
				//R19082701043 张伟丽提报：DCS新能源补贴审批画面，最后一列加一个“审批人“ 贾明 2019-8-28 end
				newEnergyVSApplicationVO.setReason(newEnergy.getReason());
				newEnergyVSApplicationVO.setAuditDt(new Date());
				newEnergyVSApplicationDAO.updateNewEnVSApplication(newEnergyVSApplicationVO);
				newEnergyVSApplicationDAO.insertNewEnVSApplicationIs(newEnergyVSApplicationVO);
			}
		}
	}


}
