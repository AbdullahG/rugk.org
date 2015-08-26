/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author MuhammedAbdullah
 */
public class User {

    int ID;
    String userName = "";
    String password = "";
    String name = "";
    String surName = "";
    String email = "";
    String gsm = "";
    String faculty = "";
    String department = "";
    String grade = "";
    String status = "";
    String auth = "";
    RepoService repoService = new RepoServiceImp();

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public RepoService getRepoService() {
        return repoService;
    }

    public void setRepoService(RepoService repoService) {
        this.repoService = repoService;
    }

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        this.ID = iD;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurName() {
        return surName;
    }

    public void setSurName(String surName) {
        this.surName = surName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGsm() {
        return gsm;
    }

    public void setGsm(String gsm) {
        this.gsm = gsm;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean validate() {
        if (userName != null && !userName.equals("") && (password != null && !password.equals("") && name != null && !name.equals("")) && (surName != null && !surName.equals(""))
                && (faculty != null && !faculty.equals("")) && (department != null && !department.equals(""))
                && (gsm != null && !gsm.equals("")) && (email != null && !email.equals(""))) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkInput(String input) {
        if (input.contains("'") || input.contains("\"") || input.contains("<") || input.contains(">") || input.contains("\\") || input.contains("!")
                || input.contains(" ") || input.contains(";") || input.contains(",") || input.contains("=")) {
            return false;
        } else {
            return true;
        }
    }

    public String registerToDB() {
        User user = new User();
        user.setName(name);
        user.setSurName(surName);
        user.setEmail(email);
        user.setGsm(gsm);
        user.setDepartment(department);
        user.setFaculty(faculty);
        user.setGrade(grade);
        user.setID(ID);
        user.setUserName(userName);
        user.setPassword(password);
        user.setStatus("activeForAWeek");
        if (repoService.registerUser(user)) {
            return "Üye olma işleminiz başarıyla tamamlandı.";
        } else {
            return "Geçici bir hata oluştu, lütfen daha sonra tekrar deneyin.";
        }

        //SESSION SET EDILECEK
    }

}
