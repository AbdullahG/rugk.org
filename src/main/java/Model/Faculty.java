/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author MuhammedAbdullah
 */
public class Faculty {

    private int facultyID;
    private String facultyName = "";
    private ArrayList<Department> departmentList = new ArrayList<>();

    public Faculty()
    {
        
    }
    
    public ArrayList<Department> getDepartmentList() {
        return departmentList;
    }

    public void setDepartmentList(ArrayList<Department> departmentList) {
        this.departmentList = departmentList;
    }

    public int getFacultyID() {
        return facultyID;
    }

    public void setFacultyID(int facultyID) {
        this.facultyID = facultyID;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public class Department {

        public Department()
        {
            
        }
        
        private int departmentID;
        private String departmentName;
        private int facultyID;

        public int getFacultyID() {
            return facultyID;
        }

        public void setFacultyID(int facultyID) {
            this.facultyID = facultyID;
        }

        public int getDepartmentID() {
            return departmentID;
        }

        public void setDepartmentID(int departmentID) {
            this.departmentID = departmentID;
        }

        public String getDepartmentName() {
            return departmentName;
        }

        public void setDepartmentName(String departmentName) {
            this.departmentName = departmentName;
        }
    }
}
