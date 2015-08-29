/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import Model.Category;
import Model.Post;
import Model.RepoService;
import Model.RepoServiceImp;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MuhammedAbdullah
 */
public class PostView {
    
    public PostView()
    {
        
    }
    
    RepoService repoService = new RepoServiceImp();
    
    public String getCategoriesAsString() {
        String temp = "";
        List<Category> list = repoService.getCategories();
        for (Category category : list) {
            temp += " <option value=\"" + category.getID() + "\">" + category.getCategoryName() + "</option>";
        }
        return temp;
    }
    
    public boolean registerToDB(String templatePath, Post post) {
        this.createPageForPost(post, templatePath);

        return repoService.savePost(post);
    }

    public int getLastPostID() {
        String query = "SELECT * FROM rugk.posts ORDER BY post_id DESC LIMIT 0,1";
        ResultSet rSet = (ResultSet) repoService.executeQuery(query);
        try {
            if (rSet != null && rSet.next()) {
                return rSet.getInt("post_id");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public File createPageForPost(Post post, String templatePath) {

        String pageName = "";
        File folder = new File(templatePath);
        folder.mkdir();

        post.setPostID(this.getLastPostID() + 1);

        pageName = post.getPostHeader().replaceAll("\\s", "-") + "-" + post.getPostID() + ".jsp";
        File file = new File(folder.getAbsolutePath() + "\\" + pageName);
        File pageTemplate = new File(templatePath + "\\pageTemplate.jsp");
        PrintWriter pw = null;
        Scanner scanFile = null;

        try {
            scanFile = new Scanner(pageTemplate);
            pw = new PrintWriter(file);
            String tempStr;
            while (scanFile.hasNext()) {
                tempStr = scanFile.nextLine();
                if (tempStr.trim().equals("<title>")) {
                    pw.println(tempStr);
                    pw.println("rugk.org - " + post.getPostHeader());
                } else if (tempStr.trim().split(" ").length > 0 && tempStr.trim().split(" ")[0].equals("<%@include")) {
                    pw.println(tempStr);
                    pw.println("<h3>" + post.getPostHeader() + "</h3>");
                    pw.print(post.getPostText());
                } else {
                    pw.println(tempStr);
                }
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
        }
        pw.close();
        scanFile.close();

        post.setPostText(pageName);
        return file;
    }

    public List<Post> getPostList(String categoryName) {
        String query = "SELECT * FROM rugk.posts LEFT JOIN categories ON posts.post_category_id=categories.category_id";

        if (!categoryName.equals("")) {
            query += (" WHERE category_name=\"" + categoryName + "\"");
        }

        ResultSet rSet = (ResultSet) repoService.executeQuery(query);
        
        List<Post> list = new ArrayList<>();
        Post tempPost = null;
        try {
            while (rSet.next()) {
                tempPost = new Post();
                tempPost.setCategoryID(rSet.getInt("categories.category_id"));
                tempPost.setPostHeader(rSet.getString("post_header"));
                tempPost.setPostID(rSet.getInt("post_id"));
                tempPost.setPostText(rSet.getString("post_text_filename"));
                list.add(tempPost);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
}
