package com.peeinn.uni_bowl;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.peeinn.domain.MemberVO;
import com.peeinn.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {

	@Autowired
	private MemberDAO dao;
	
	@Test
	public void insertTest() {
//		dao.insertMem(new MemberVO(0, "mlmlml", "mlml3434", "김믜믜", "1999-03-03", "010-1234-1234", "mlml@mlml.ml", new Date(), null));
	}
	
	
}//MemberDAOTest
