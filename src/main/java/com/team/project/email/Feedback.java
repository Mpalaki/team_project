package com.team.project.email;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

public class Feedback {

    
    private String name;
    @NotNull
    @Email
    private String email;
    @NotNull
    private String serial;
    @NotNull
    @Min(10)
    private String feedback;

    
    public Feedback(String name, @NotNull @Email String email, @NotNull String serial, @NotNull @Min(10) String feedback) {
        this.name = name;
        this.email = email;
        this.serial = serial;
        this.feedback = feedback;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSerial() {
        return serial;
    }

    public void setSerial(String serial) {
        this.serial = serial;
    }

    String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
