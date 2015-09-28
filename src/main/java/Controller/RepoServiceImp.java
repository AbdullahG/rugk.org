/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category;
import Model.Faculty;
import Model.Faculty.Department;
import Model.Post;
import Model.User;
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
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url + dbName+"?useUnicode=true&characterEncoding=UTF-8", username, password);

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
    public User loginUser(String email, String password) {
        String query = "SELECT * FROM rugk.users WHERE (email='" + email + "') AND password='" + password + "'";
        ResultSet resultSet = (ResultSet)this.executeQuery(query);
        try {
            if (resultSet.next()) {
                User user = new User();
                user.setID(resultSet.getInt("ID"));
                user.setName(resultSet.getString("name"));
                user.setSurName(resultSet.getString("surName"));
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
        String query="INSERT INTO rugk.users (name, surName, password, email, gsm, faculty, department, grade, status)"+
                " VALUES ('"+user.getName()+"', '"+user.getSurName()+"', '"+user.getPassword()+"', '"+user.getEmail()+"', '"+user.getGsm()+"', '"+user.getFaculty()+"', '"+user.getDepartment()+"', '"+user.getGrade()+"', '"+user.getStatus()+"')";
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

    @Override
    public List<Category> getCategories() {
    List<Category> categoryList = new ArrayList<>();
    
    String query = "SELECT * FROM rugk.categories";
        ResultSet resultSet = (ResultSet)this.executeQuery(query);

        try {
            Category tempCategory=null;
            while (resultSet.next()) {
                tempCategory=new Category();
                tempCategory.setID(resultSet.getInt("category_id"));
                tempCategory.setCategoryName(resultSet.getString("category_name"));
                categoryList.add(tempCategory);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            Logger.getLogger(RepoServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
    return categoryList;
    }
    
    @Override
    public boolean savePost(Post post)
    {
        String query="INSERT INTO rugk.posts (post_header, post_category_id, post_text_filename) VALUES ('"+post.getPostHeader()+"', "+post.getCategoryID()+", '"+post.getPostText()+"')";
        if((int)executeQuery(query)>0)
            return true;
        else
            return false;
    }

    @Override
    public List<Faculty> getFaculties() {
        Faculty faculty = null;
        Faculty.Department department = null;
        List<Faculty> facultyList=new ArrayList<>();
        
        String query="SELECT * FROM rugk.faculties";
        ResultSet resultSet = (ResultSet)executeQuery(query);
        
        try {
            ResultSet innerRS;
            while(resultSet.next())
            {
                faculty = new Faculty();
                faculty.setFacultyID(resultSet.getInt("faculty_id"));
                faculty.setFacultyName(resultSet.getString("faculty_name"));
                
                query = "SELECT * FROM rugk.departments WHERE departments.department_faculty_id="+faculty.getFacultyID();
                innerRS = (ResultSet)executeQuery(query);
                
                ArrayList<Department> departmentList = new ArrayList<>();
                while(innerRS.next())
                {
                    department = faculty.new Department();
                    
                    department.setDepartmentID(innerRS.getInt("department_id"));
                    department.setDepartmentName(innerRS.getString("department_name"));
                    department.setFacultyID(innerRS.getInt("department_faculty_id"));
                    
                    departmentList.add(department);
                }
                
                faculty.setDepartmentList(departmentList);
                facultyList.add(faculty);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RepoServiceImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return facultyList;
    }

}
