/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Comment;
import com.team.project.model.Post;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface CommentRepo extends JpaRepository<Comment, Integer>{
    
    @Query("SELECT c FROM Comment c WHERE c.idpost=?1 ORDER BY c.idcomment DESC")
    public List<Comment> getCommentsByIdpost(Post post);
    
}
