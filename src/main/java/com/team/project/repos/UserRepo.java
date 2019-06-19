/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface UserRepo  extends JpaRepository<User,Integer>{
    
    public User findByUsername(String username);
    
    @Query("SELECT COUNT(u) FROM User u WHERE u.username=?1")
    public Long countUsers(String username);
    
    public  User findByUsernameAndPassword(String username, String password);
    
}
