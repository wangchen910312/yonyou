package chn.bhmc.dms.sal.com.util;

public enum Code {

	force("force","交强险/车船税"),
	damage("damage","机动车辆损失险"),		
	third("third","第三者责任险"),   	
	driver("driver","司机险"),	
	passenger("passenger","乘客险"),		
	pilfer("pilfer","盗抢险"),		
	glass("glass","玻璃险"),		
	scratch("scratch","划痕险"),		
	combust("combust","自燃险"),		
	water("water","涉水险"),		
	third_party("third_party","机动车损失保险无法找到第三方特约险"),		
	rearview("rearview","倒车镜、车灯单独损坏险"),		
	factory("factory","指定专修厂"),		
	third_double("third_double","第三者责任险法定假日翻倍险"),		
	exempt_damage("exempt_damage","机动车辆损失险不计免赔"),		
	exempt_third("exempt_third","第三者责任险不计免赔"),		
	exempt_driver("exempt_driver","司机险不计免赔"), 		
	exempt_passenger("exempt_passenger","乘客险不计免赔"),		
	exempt_pilfer("exempt_pilfer","盗抢险不计免赔"),		
	exempt_scratch("exempt_scratch","划痕险不计免赔"),		
	exempt_combust("exempt_combust","自燃险不计免赔"),		
	exempt_water("exempt_water","涉水险不计免赔"),		
	exempt_rearview("exempt_rearview","倒车镜、车灯单独损坏险不计免赔"),
	//20200217 add 根据U车商api新增的进行添加险种
	new_device("new_device","新增设备损失险"),
	exempt_new_device("exempt_new_device","新增设备损失险不计免赔"),
	repire("repire","修理期间费用补偿险"),
	cargo("cargo","车上货物责任险"),
	moral_damage("moral_damage","精神损害抚慰金责任险"),
	exempt_moral_damage("exempt_moral_damage","精神损害抚慰金责任险不计免赔");
	
	
	public final String code;
	public final String desc;

	private Code(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public String getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	public static String getKeyByIndex(String code) {
		for (Code code2 : Code.values()) {
			String in = code2.getCode();
			if (in.equals(code)) {
				return code2.getDesc();
			}
		}
		return null;
	}
}
