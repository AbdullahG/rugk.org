/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MuhammedAbdullah
 */
public class Post {

    int postID;
    int categoryID;
    String postHeader = "";
    String postText = "";
    Category category;
    List<Comment> comments = new ArrayList<Comment>();
    RepoService repoService = new RepoServiceImp();

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    
    public Post() {
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
        
        List<Category> list = repoService.getCategories();
        for(Category category: list)
        {
            if(category.getID()==this.categoryID)
                this.setCategory(category);
        }
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public RepoService getRepoService() {
        return repoService;
    }

    public void setRepoService(RepoService repoService) {
        this.repoService = repoService;
    }

    public String getPostHeader() {
        return postHeader;
    }

    public void setPostHeader(String postHeader) {
        this.postHeader = postHeader;
    }

    public String getPostText() {
        return postText;
    }

    public void setPostText(String postText) {
        this.postText = postText;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public class Comment {

        int commentID;
        User user;
        String commentHeader = "";
        String commentText = "";

        public Comment(User user, String commentHeader, String commentText) {
            setUser(user);
            setCommentHeader(commentHeader);
            setCommentText(commentText);
        }

        public User getUser() {
            return user;
        }

        public void setUser(User user) {
            this.user = user;
        }

        public String getCommentHeader() {
            return commentHeader;
        }

        public void setCommentHeader(String commentHeader) {
            this.commentHeader = commentHeader;
        }

        public String getCommentText() {
            return commentText;
        }

        public void setCommentText(String commentText) {
            this.commentText = commentText;
        }

    }

    public String getCategoriesAsString() {
        String temp = "";
        List<Category> list= repoService.getCategories();
        for (Category category : list) {
            temp += " <option value=\"" + category.getID() + "\">" + category.getCategoryName() + "</option>";
        }
        return temp;
    }

    public boolean registerToDB(String templatePath) {
        Post post = new Post();
        post.setCategoryID(categoryID);
        post.setPostHeader(postHeader);
        post.setPostText(postText);

        this.createPageForPost(post,templatePath);

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

        pageName = postHeader.replaceAll("\\s", "-") + "-" + post.getPostID() + ".jsp";
        System.out.println("Gelen yol: "+templatePath+" açılacak folder yolu: "+folder.getAbsolutePath());
        File file = new File(folder.getAbsolutePath() + "\\" + pageName);
        File pageTemplate = new File(templatePath+"\\pageTemplate.jsp");
        System.out.println("Sayfa oluşturuldu: "+file.getAbsolutePath());
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
                    pw.println("rugk.org - " + post.postHeader);
                } else if (tempStr.trim().split(" ").length>0 && tempStr.trim().split(" ")[0].equals("<%@include")) {
                    pw.println(tempStr);
                    pw.println("<h3>"+post.postHeader+"</h3>");
                    pw.print(post.postText);
                    System.out.println("Posttext length: "+postText.length());
                }
                else
                    pw.println(tempStr);
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Post.class.getName()).log(Level.SEVERE, null, ex);
        }
        pw.close();
        scanFile.close();
        
        post.setPostText(templatePath + "\\" + pageName);
        return file;
    }
}
