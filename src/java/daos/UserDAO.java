/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class UserDAO {
    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    
    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public UserDTO checkLogin(String userID,String password) throws SQLException{
        UserDTO user=null;
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            conn = DBUtils.getConnection();
            if(conn!=null){
                String sql="SELECT fullname,phone,address,status,roleID FROM TblUsers WHERE userID=? AND password=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs=stm.executeQuery();
                if(rs.next()){
                    String fullName=rs.getString("fullname");
                    String roleID=rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    boolean status = rs.getBoolean("status");
                    user =new UserDTO(userID, fullName, "", phone, address, roleID, status);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            closeConnection();
        }
        return user;
    }
    
    public List<UserDTO> getListUser(String search) throws SQLException{
        List<UserDTO> listUser=new ArrayList<>();
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql="SELECT userID , fullname ,phone,address,status FROM TblUsers WHERE fullname like ? AND roleID=? AND status=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1,"%"+search+"%");
                stm.setString(2,"US");
                stm.setString(3,"True");
                rs=stm.executeQuery();
                while(rs.next()){
                    String userID=rs.getString("userID");
                    String fullName=rs.getString("fullname");
                    String phone=rs.getString("phone");
                    String address=rs.getString("address");
                    String password="***";
                    listUser.add(new UserDTO(userID, fullName, password, phone, address, "", true));
                }
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return listUser;
    }
    
    public boolean delete(String userID) throws SQLException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql="UPDATE TblUsers SET status = 0 WHERE userID = ?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, userID);
                check=stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public boolean update(UserDTO user) throws SQLException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql="UPDATE TblUsers SET fullname=?,phone=?,address=? WHERE userID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getFullName());
                stm.setString(2, user.getPhone());
                stm.setString(3, user.getAddress());
                stm.setString(4, user.getUserID());
                check=stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public boolean insert(UserDTO user) throws SQLException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql="INSERT INTO TblUsers(userID,fullname,phone,address,status,roleID,password) VALUES(?,?,?,?,?,?,?)";
                stm=conn.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getFullName());
                stm.setString(3, user.getPhone());
                stm.setString(4, user.getAddress());
                stm.setBoolean(5, user.isStatus());
                stm.setString(6, user.getRoleID());
                stm.setString(7, user.getPassword());
                check=stm.executeUpdate()>0?true:false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
    
    public UserDTO getUserInfo(String userID) throws SQLException{
        UserDTO user= null;
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql="SELECT fullname,roleID FROM TblUsers WHERE userID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs=stm.executeQuery();
                if(rs.next()){
                    String fullName=rs.getString("fullname");
                    String roleID=rs.getString("roleID");
                    user=new UserDTO(userID, fullName, roleID, "", "", "", true);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return user;
    }
    
}
