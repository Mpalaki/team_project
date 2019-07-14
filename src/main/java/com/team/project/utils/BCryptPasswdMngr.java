package com.team.project.utils;

import org.mindrot.jbcrypt.BCrypt;

public class BCryptPasswdMngr {
    public BCryptPasswdMngr(){}
    public BCryptPasswdMngr(BCrypt encryptor) {
        this.encryptor = encryptor;
    }

    private static BCrypt encryptor = new BCrypt();


    public static String hashPassword(String plainTextPassword){
        return encryptor.hashpw(plainTextPassword, BCrypt.gensalt());

    }

    public static boolean checkPass(String plainPassword, String hashedPassword) {

        return encryptor.checkpw(plainPassword, hashedPassword);
    }


}
