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

    public List<Post> getTenLastsPosts() {
        List<Post> allposts = pr.getLastPosts();
        List<Post> lastten = allposts.subList(0, 10);
        return lastten;
    }

    public List<Post> getTenNextPosts(int pagenumber) {
        int fromIndex = (pagenumber - 1) * 10;
        int toIndex = pagenumber * 10;
        List<Post> nextten = null;
        List<Post> allposts = pr.getLastPosts();
        if (toIndex < allposts.size()) {
            nextten = allposts.subList(fromIndex, toIndex);
        } else {
            nextten = allposts.subList(fromIndex, allposts.size());
        }
        return nextten;
    }

}
