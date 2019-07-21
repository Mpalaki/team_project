/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.utils;

import org.jasypt.util.text.BasicTextEncryptor;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Makis
 */
public class EncryptUtils {

    private static String password = "ant";
    private static BCrypt encryptor = new BCrypt();

    public static String encrypt(String text) {
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword(password);
        String encryptedText = textEncryptor.encrypt(text);

        return encryptedText;
    }

    public static String decrypt(String text) {
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword(password);
        String decryptedText = textEncryptor.decrypt(text);

        return decryptedText;
    }

    public static String hashPassword(String plainTextPassword) {
        return encryptor.hashpw(plainTextPassword, BCrypt.gensalt());

    }

    public static boolean checkPass(String plainPassword, String hashedPassword) {

        return encryptor.checkpw(plainPassword, hashedPassword);
    }

}
