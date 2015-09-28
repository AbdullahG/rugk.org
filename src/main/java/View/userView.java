/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package View;

import Controller.RepoService;
import Controller.RepoServiceImp;
import Model.User;
import java.util.List;

/**
 *
 * @author MuhammedAbdullah
 */
public class userView {

    private User user;
    private RepoService repoService = new RepoServiceImp();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public RepoService getRepoService() {
        return repoService;
    }

    public void setRepoService(RepoService repoService) {
        this.repoService = repoService;
    }

    public String registerToDB() {

        user.setStatus("activeForAWeek");
        if (repoService.registerUser(user)) {
            return "Üye olma işleminiz başarıyla tamamlandı.";
        } else {
            return "Geçici bir hata oluştu, lütfen daha sonra tekrar deneyin.";
        }

    }

    public boolean checkInput(String input) {
        if (input.contains("'") || input.contains("\"") || input.contains("<") || input.contains(">") || input.contains("\\") || input.contains("!")
                || input.equals("") || input.equals(" ") || input.contains(";") || input.contains(",") || input.contains("=")) {
            return false;
        } else {
            return true;
        }
    }
    
    public List<Model.Faculty> getFacultyList()
    {
        return this.getRepoService().getFaculties();
    }
}
