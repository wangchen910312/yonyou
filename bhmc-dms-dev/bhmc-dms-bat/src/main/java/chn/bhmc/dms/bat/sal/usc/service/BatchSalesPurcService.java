package chn.bhmc.dms.bat.sal.usc.service;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : BatchSalesUsedVehiclePurcDateService.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Lee Seungmin
 * @since 2017. 2. 1.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 2. 1.     Lee Seungmin     최초 생성
 * </pre>
 */

public interface BatchSalesPurcService {

    public void selectUscTargetItem() throws Exception;
    /**
     * 生成二手车收购信息接口数据
     * @throws Exception
     */
    public void insertPurcInterfaceData() throws Exception;
}
