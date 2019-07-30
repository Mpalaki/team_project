/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.Comment;
import com.team.project.model.Post;
import com.team.project.repos.CommentRepo;
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
public class CommentService {

    @Autowired
    CommentRepo cr;

    public Page<Comment> findPaginated(Pageable pageable, Post post) {
        final List<Comment> commentsAllDesc = cr.getCommentsByIdpost(post);
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Comment> list;
        if (commentsAllDesc.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, commentsAllDesc.size());
            list = commentsAllDesc.subList(startItem, toIndex);
        }
        Page<Comment> postPage = new PageImpl<Comment>(list, PageRequest.of(currentPage, pageSize), commentsAllDesc.size());
        return postPage;
    }

}
