/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MuhammedAbdullah
 */
public class RepoServiceImp implements RepoService {

    @Override
    public Connection connectToDB() {
        String url = "jdbc:mysql://178.62.115.220:3306/";                     //"jdbc:mysql://localhost:3306/";
        String dbName = "rugk";
        //String driver="com.mysql.jdbc.Driver";
        String username = "rugkDev";
        String password = "rugk.DEV.2";
 // 
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url + dbName, username, password);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }

    @Override
    public Object executeQuery(String query) {
        Connection connection = this.connectToDB();

        Statement st = null;
        Object rSet = null;

        try {
            st = connection.createStatement();
            if(query.split(" ")[0].equals("SELECT"))
                rSet=st.executeQuery(query);
            else
            rSet = st.executeUpdate(query);
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(RepoServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return rSet;
    }

    @Override
    public List<User> getUserList() {
        List<User> list = new ArrayList<>();
        User user = null;
        String query = "SELECT * FROM rugk.users";
        ResultSet resultSet = (ResultSet)this.executeQuery(query);

        try {
            while (resultSet.next()) {
                user = new User();
                user.setID(resultSet.getInt("ID"));
                user.setName(resultSet.getString("name"));
                user.setSurName(resultSet.getString("surName"));
                user.setUserName(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setGsm(resultSet.getString("gsm"));
                user.setFaculty(resultSet.getString("faculty"));
                user.setGrade(resultSet.getString("grade"));
                user.setDepartment(resultSet.getString("department"));
                user.setStatus(resultSet.getString("status"));

                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RepoServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public User loginUser(String userName, String password) {
        String query = "SELECT * FROM rugk.users WHERE (userName='" + userName + "' OR email='" + userName + "') AND password='" + password + "'";
        ResultSet resultSet = (ResultSet)this.executeQuery(query);
        try {
            if (resultSet.next()) {
                User user = new User();
                user.setID(resultSet.getInt("ID"));
                user.setName(resultSet.getString("name"));
                user.setSurName(resultSet.getString("surName"));
                user.setUserName(resultSet.getString("userName"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setGsm(resultSet.getString("gsm"));
                user.setFaculty(resultSet.getString("faculty"));
                user.setGrade(resultSet.getString("grade"));
                user.setDepartment(resultSet.getString("department"));
                user.setStatus(resultSet.getString("status"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RepoServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean registerUser(User user) {
        String query="INSERT INTO rugk.users (name, surName, userName, password, email, gsm, faculty, department, grade, status)"+
                " VALUES ('"+user.getName()+"', '"+user.getSurName()+"', '"+user.getUserName()+"', '"+user.getPassword()+"', '"+user.getEmail()+"', '"+user.getGsm()+"', '"+user.getFaculty()+"', '"+user.getDepartment()+"', '"+user.getGrade()+"', '"+user.getStatus()+"')";
        if((int)executeQuery(query)>0)
            return true;
        else
            return false;
    }

    @Override
    public boolean banUser(User user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void rememberPassword(String email) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
