/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.Post;
import com.team.project.repos.PostRepo;

import java.util.Collections;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    public Page<Post> findPaginated(Pageable pageable) {
        final List<Post> postsAllDesc =pr.getLastPosts();
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;

        List<Post> list;


        if (postsAllDesc.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, postsAllDesc.size());
            list = postsAllDesc.subList(startItem, toIndex);
        }

        Page<Post> postPage
                = new PageImpl<Post>(list, PageRequest.of(currentPage, pageSize), postsAllDesc.size());

        return postPage;
    }

}
