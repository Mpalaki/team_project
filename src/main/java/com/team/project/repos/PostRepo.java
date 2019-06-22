/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Post;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface PostRepo extends JpaRepository<Post, Integer>{
    
    @Query("SELECT p FROM Post p ORDER BY p.idpost DESC")        
    public List<Post> getLastPosts();
    
    public Post getPostByIdpost(int idpost);
    
}
