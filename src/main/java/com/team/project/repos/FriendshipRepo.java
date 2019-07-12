/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Friendship;
import com.team.project.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface FriendshipRepo extends JpaRepository<Friendship, Integer>{
    
    @Query("Select f FROM Friendship f where f.user1=?1 and f.friend1accepts=1 and f.friend2accepts=0")
    public List<Friendship> getAllFriendRequests(User friend2);
    
    @Query("Select f FROM Friendship f where f.user=?1 and f.user1=?2")
    public Friendship getFriendship(User friend1, User friend2);
    
    @Query("Select f FROM Friendship f where f.user=?1 or f.user1=?1")
    public List<Friendship> getFriendsOrHalfFriends(User user);
    
    @Query("Select f FROM Friendship f where f.user=?1 or f.user1=?1 and f.friend1accepts=1 and friend2accepts=1")
    public List<Friendship> getFriends(User user);
    
}
