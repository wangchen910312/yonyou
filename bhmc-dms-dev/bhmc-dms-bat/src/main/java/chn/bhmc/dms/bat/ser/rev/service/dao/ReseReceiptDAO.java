package chn.bhmc.dms.bat.ser.rev.service.dao;

import java.util.List;

import chn.bhmc.dms.bat.ser.rev.vo.ReseReceiptVO;
import able.com.mybatis.Mapper;

@Mapper("reseReceiptDAO")
public interface ReseReceiptDAO {
	
	public List<ReseReceiptVO> selectReservationReceiptList() throws Exception;
	
}
