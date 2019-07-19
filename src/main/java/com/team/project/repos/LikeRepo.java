/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Likes;
import com.team.project.model.Post;
import com.team.project.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface LikeRepo  extends JpaRepository<Likes, Integer>{
    
    @Query("SELECT COUNT(l) FROM Likes l WHERE l.idpost=?1")
    public Long countLikes(Post post);
    
    @Query("SELECT l.iduser FROM Likes l WHERE l.idpost=?1")
    public List<User> usersThatHaveLikedThePost(Post post);
    
}
