/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.Post;
import com.team.project.repos.PostRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Makis
 */
@Service
public class PostService {
    
    @Autowired
    PostRepo pr;
    
    public List<Post> getTenLastsPosts(){
        int max_postid = pr.getMaxPostId();
        List<Post> lastten = pr.selectTenLastPosts(max_postid);
        return lastten;
    }
    public List<Post> get11to20Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select11to20Posts(max_postid);
        return elevento20;
    }
    public List<Post> get21to30Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select21to30Posts(max_postid);
        return elevento20;
    }
    public List<Post> get31to40Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select31to40Posts(max_postid);
        return elevento20;
    }
    public List<Post> get41to50Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select41to50Posts(max_postid);
        return elevento20;
    }
    public List<Post> get51to60Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select51to60Posts(max_postid);
        return elevento20;
    }
    public List<Post> get61to70Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select61to70Posts(max_postid);
        return elevento20;
    }
    public List<Post> get71to80Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select71to80Posts(max_postid);
        return elevento20;
    }
    public List<Post> get81to90Posts(){
        int max_postid = pr.getMaxPostId();
        List<Post> elevento20 = pr.select81to90Posts(max_postid);
        return elevento20;
    }
    
}
