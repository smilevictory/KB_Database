package org.scoula.travel.dao;

import org.scoula.common.JDBCUtil;
import org.scoula.travel.domain.TravelImageVO;
import org.scoula.travel.domain.TravelVO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TravelDaoImpl implements TravelDao{

    Connection conn = JDBCUtil.getConnection();

    @Override
    public void insert(TravelVO travelVO) {
        // database crate
        String sql = "insert into tbl_travel(no, district, title, description, address, phone) values(?,?,?,?,?,?)";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){

            // query 완성시키기
            pstmt.setLong(1,travelVO.getNo());
            pstmt.setString(2,travelVO.getDistrict());
            pstmt.setString(3, travelVO.getTitle());
            pstmt.setString(4, travelVO.getDescription());
            pstmt.setString(5, travelVO.getAddress());
            pstmt.setString(6, travelVO.getPhone());

             int count = pstmt.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void insertImage(TravelImageVO travelImageVO) {
        String sql = "insert into tbl_travel_image(filename, travel_no) values(?,?)";
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, travelImageVO.getFilename());
            pstmt.setLong(2, travelImageVO.getTravelNo());

            int row = pstmt.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
