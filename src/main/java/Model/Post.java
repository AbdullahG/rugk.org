/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.RepoServiceImp;
import Controller.RepoService;
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
        for (Category category : list) {
            if (category.getID() == this.categoryID) {
                this.setCategory(category);
            }
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

}
