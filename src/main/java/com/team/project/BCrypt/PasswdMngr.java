package com.team.project.BCrypt;

import org.mindrot.jbcrypt.BCrypt;

public class PasswdMngr {

    BCrypt encryptor = new BCrypt();

    private String hashPassword(String plainTextPassword){
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());

    }

    private void checkPass(String plainPassword, String hashedPassword) {

        if (BCrypt.checkpw(plainPassword, hashedPassword))

            System.out.println("The password matches.");


        else

            System.out.println("The password does not match.");

    }


}
