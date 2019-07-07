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

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-10) and p.idpost>( :maxidp-20) ORDER BY p.idpost DESC ")
    public List<Post> select11to20Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-20) and p.idpost>( :maxidp-30) ORDER BY p.idpost DESC ")
    public List<Post> select21to30Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-30) and p.idpost>( :maxidp-40) ORDER BY p.idpost DESC ")
    public List<Post> select31to40Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-40) and p.idpost>( :maxidp-50) ORDER BY p.idpost DESC ")
    public List<Post> select41to50Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-50) and p.idpost>( :maxidp-60) ORDER BY p.idpost DESC ")
    public List<Post> select51to60Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-60) and p.idpost>( :maxidp-70) ORDER BY p.idpost DESC ")
    public List<Post> select61to70Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-70) and p.idpost>( :maxidp-80) ORDER BY p.idpost DESC ")
    public List<Post> select71to80Posts(int maxidp);

    @Query("Select p FROM Post p where p.idpost<= (:maxidp-80) and p.idpost>( :maxidp-90) ORDER BY p.idpost DESC ")
    public List<Post> select81to90Posts(int maxidp);

//    public void deletePost(int idpost);
}
