/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.Friendship;
import com.team.project.model.User;
import com.team.project.repos.FriendshipRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Makis
 */
@Service
public class FriendshipService {

    @Autowired
    FriendshipRepo fr;
    

//    public List<Integer> listOfFriendsOrHalfFriendsIds(User user) {
//        List listOfFriendsOrHalfFriendsIds = null;
//        List friendships = fr.getFriendsOrHalfFriends(user);
//        for (int i = 0; i < friendships.size(); i++) {
//            int f = friendships.get(i).
//        }
//
//        return listOfFriendsOrHalfFriendsIds;
//    }

}
