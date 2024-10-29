package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.MemberVo;
import vo.MoneyVo;

public class TestDao {
	
	public ArrayList<MemberVo> memberList() {
		ArrayList<MemberVo> list = new ArrayList<MemberVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT custno, custname, phone, address, joindate, city,\r\n"
					+ "DECODE (grade, 'A', 'VIP', 'B', '일반', 'C', '직원') AS grade\r\n"
					+ "FROM member_2024 order by custno asc"
			);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<MoneyVo> moneyList() {
		ArrayList<MoneyVo> list = new ArrayList<MoneyVo>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT A.custno, A.custname,\r\n"
					+ "	case when A.grade = 'A' then 'VIP'\r\n"
					+ "	when A.grade = 'B' then '일반'\r\n"
					+ "	when A.grade = 'C' then '직원'\r\n"
					+ "	end grade, sum(B.price) price\r\n"
					+ "FROM member_2024 A\r\n"
					+ "join money_2024 B on A.custno = B.custno\r\n"
					+ "group by A.custno, A.custname, A.grade\r\n"
					+ "order by price desc"
			);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MoneyVo vo = new MoneyVo();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setGrade(rs.getString("grade"));
				vo.setPrice(rs.getInt("price"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int getMaxCustNo() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int custno = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("select max(custno) + 1 custno from member_2024");
			rs = ps.executeQuery();
			if (rs.next()) {
				custno = rs.getInt("custno");
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return custno;
	}
	
	public int memberInput(MemberVo memberVo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("INSERT INTO member_2024 VALUES(?, ?, ?, ?, ?, ?, ?)");
			
			ps.setInt(1, memberVo.getCustno());
			ps.setString(2, memberVo.getCustname());
			ps.setString(3, memberVo.getPhone());
			ps.setString(4, memberVo.getAddress());
			ps.setDate(5, memberVo.getJoindate());
			ps.setString(6, memberVo.getGrade());
			ps.setString(7, memberVo.getCity());
			n = ps.executeUpdate();
			if (n > 0) {
				con.commit();
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	
	public MemberVo getMember(int custno) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVo vo = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT * FROM member_2024 WHERE custno = ?");
			ps.setInt(1, custno);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				vo = new MemberVo();
				vo.setCustno(rs.getInt("custno"));
				vo.setCustname(rs.getString("custname"));
				vo.setPhone(rs.getString("phone"));
				vo.setAddress(rs.getString("address"));
				vo.setJoindate(rs.getDate("joindate"));
				vo.setGrade(rs.getString("grade"));
				vo.setCity(rs.getString("city"));
			}
			con.close();
			ps.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int memberUpdate(MemberVo member) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"UPDATE member_2024\r\n"
					+ "	SET custname = ?, phone = ?, address = ?, joindate = ?,\r\n"
					+ "	grade = ?, city = ? WHERE custno = ?"
			);
			
			ps.setString(1, member.getCustname());
			ps.setString(2, member.getPhone());
			ps.setString(3, member.getAddress());
			ps.setDate(4, member.getJoindate());
			ps.setString(5, member.getGrade());
			ps.setString(6, member.getCity());
			ps.setInt(7, member.getCustno());
			
			n = ps.executeUpdate();
			
			if (n >= 0) {
				con.commit();
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	public int memberDelete(int custno) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("delete from member_2024 where custno = ?");
			ps.setInt(1, custno);
			n = ps.executeUpdate();
			
			if (n > 0) {
				con.commit();
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return n;
	}
	
	
}
