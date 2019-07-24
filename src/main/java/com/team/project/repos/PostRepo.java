/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Post;
import com.team.project.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Makis
 */
public interface PostRepo extends JpaRepository<Post, Integer> {

    @Query("SELECT p FROM Post p ORDER BY p.idpost DESC")
    public List<Post> getLastPosts();

    @Query("select p from Post p where p.iduser=?1 ORDER BY p.idpost DESC")
    public List<Post> findByIduser(User user);

    public Post getPostByIdpost(int idpost);

    @Query("Select MAX(p.idpost) from Post p")
    public int getMaxPostId();

    @Query("Select p FROM Post p where p.idpost<= :maxidp and p.idpost>( :maxidp-10) ORDER BY p.idpost DESC ")
    public List<Post> selectTenLastPosts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-:lastpost) and p.idpost> (:maxidp-:firstpost) ORDER BY p.idpost DESC ")
    public List<Post> selectTenNextPosts(int firstpost, int lastpost, int maxidp);

    @Query("Select p FROM Post p where p.title LIKE CONCAT('%',:postText,'%') or p.description LIKE CONCAT('%',:postText,'%') ")
    public List<Post> getPostsLike(@Param("postText") String postText);
}
