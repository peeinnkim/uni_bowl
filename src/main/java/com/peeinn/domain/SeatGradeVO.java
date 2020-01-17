package com.peeinn.domain;

public class SeatGradeVO {
	private static final String[] sgNmArr = { "", "일반", "프리미엄 싱글", "프리미엄 더블", "이선좌", "비좌석" };
	private static final int[] sgPriceArr = { 0, 16000, 21000, 42000, 0, 0 };
	private static final String[] sgClassArr = { "", "seat-empty", "premiumSingle-empty", "premiumDouble-empty",
			"seat-none", "seat-disabled" };

	public static String[] getSgnmarr() {
		return sgNmArr;
	}

	public static int[] getSgpricearr() {
		return sgPriceArr;
	}

	public static String[] getSgclassarr() {
		return sgClassArr;
	}

}// SeatGradeVO
