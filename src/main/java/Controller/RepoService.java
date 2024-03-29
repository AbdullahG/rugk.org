/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category;
import Model.Post;
import Model.User;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author MuhammedAbdullah
 */
public interface RepoService {
    
    public Connection connectToDB();
    
    public Object executeQuery(String query);
    
    public List<User> getUserList();
    
    public User loginUser(String name, String password);
    
    public boolean registerUser(User user);
    
    public boolean banUser(User user);
    
    public void rememberPassword(String email);
    
    public List<Category> getCategories();
    
    public boolean savePost(Post post);
    
    public List<Model.Faculty> getFaculties();
}
