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
    
    public User findByIduser(int iduser);
        
    @Query("SELECT COUNT(u) FROM User u WHERE u.username=?1")
    public Long countUsers(String username);
    
    public  User findByUsernameAndPassword(String username, String password);
    
    @Query("SELECT u from User u where u.postsNo>0 ORDER BY u.postsNo DESC")
    public List<User> getUsersWherePostsNoGreaterThanZero();
    
}
