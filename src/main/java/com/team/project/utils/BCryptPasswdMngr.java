package com.team.project.utils;

import org.mindrot.jbcrypt.BCrypt;

public class BCryptPasswdMngr {
    public BCryptPasswdMngr(){}
    public BCryptPasswdMngr(BCrypt encryptor) {
        this.encryptor = encryptor;
    }

    private BCrypt encryptor = new BCrypt();


    public static String hashPassword(String plainTextPassword){
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());

    }

    public static boolean checkPass(String plainPassword, String hashedPassword) {

        return BCrypt.checkpw(plainPassword, hashedPassword);
    }


}
