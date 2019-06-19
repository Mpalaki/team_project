/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Makis
 */
public interface PostRepo extends JpaRepository<Post, Integer>{
    
}
