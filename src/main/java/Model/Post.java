/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MuhammedAbdullah
 */
public class Post {
    int postID;
    String postHeader="";
    String postText="";
    String category="";
    List<Comment> comments = new ArrayList<Comment>();
    
    public Post(String postHeader, String postText) {
        setPostHeader(postHeader);
        setPostText(postText);
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
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
