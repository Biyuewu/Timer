package com.ecjtu.jy.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.ecjtu.jy.pojo.Interest;
import com.ecjtu.jy.service.IInterstService;
import com.ecjtu.jy.service.impl.InterstServiceImpl;

public class testInterService {

	@Test
	public void testInterSelect () {
		int userid = 1;
		List<Interest> iList = new ArrayList<>();
		IInterstService is = new InterstServiceImpl();
		iList = is.selectIntersts(userid);
		for (Interest interest : iList) {
			System.out.println(interest);
		}
	}
	
}
