/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.jasypt.util.text.BasicTextEncryptor;
import org.jasypt.util.text.StrongTextEncryptor;

/**
 *
 * @author Makis
 */
public class UrlUtils {

//    public static String encodeValue(String value) throws UnsupportedEncodingException {
//        return URLEncoder.encode(value, StandardCharsets.UTF_8.toString());
//    }
//
//    public static String decode(String value) throws UnsupportedEncodingException {
//        return URLDecoder.decode(value, StandardCharsets.UTF_8.toString());
//
//    }
//    static StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
//    
//    public static String encrypt(String string){
//        return encryptor.encryptPassword(string);}
//    
//    public static StrongTextEncryptor textEncryptor = new StrongTextEncryptor();
//    
//    public static String decrypt(String encryptedstring){
//        return textEncryptor.decrypt(encryptedstring);}
    private static String password = "ant";
    
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
    
       }
