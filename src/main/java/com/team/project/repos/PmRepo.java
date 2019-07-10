/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Pm;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Makis
 */
public interface PmRepo extends JpaRepository<Pm, Integer> {

//    @Query("SELECT c FROM Comment c WHERE c.idpost=?1 ORDER BY c.idcomment DESC")
//    public List<Comment> getCommentsByIdpost(Post post);
}
