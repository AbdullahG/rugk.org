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
    static int idGenerator = 0;
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

    public int getID() {
        return ID;
    }

    public void setID(int iD) {
        ID = ++idGenerator;
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

    public static int getIdGenerator() {
        return idGenerator;
    }

    public static void setIdGenerator(int idGenerator) {
        User.idGenerator = idGenerator;
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
        if ((name != null && !name.equals("")) && (surName != null && !surName.equals(""))
                && (faculty != null && !faculty.equals("")) && (department != null && !department.equals(""))
                && (gsm != null && !gsm.equals("")) && (email != null && !email.equals(""))) {
            return true;
        } else {
            return false;
        }
    }

    public void registerToDB() {

    }

}
