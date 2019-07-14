/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.service;

import com.team.project.model.Friendship;
import com.team.project.model.FriendshipPK;
import com.team.project.model.User;
import com.team.project.repos.FriendshipRepo;
import java.util.ArrayList;
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
    public List<Integer> usersNotEligibleToSendFriendRequest(User user) {
        int idprofileowner = user.getIduser();
        List<Integer> alreadyFriendRequested = new ArrayList<Integer>();
        List<Friendship> frs = fr.getFriendsOrHalfFriends(user);
        for (int i = 0; i < frs.size(); i++) {
            FriendshipPK fpk = frs.get(i).getFriendshipPK();// brings couples of idusers that are already friendrequested
            int iduser1 = fpk.getFriend1();
            int iduser2 = fpk.getFriend2();
            if (iduser1 == idprofileowner) {
                alreadyFriendRequested.add(iduser2);
            } else if((iduser2 == idprofileowner) ){
                alreadyFriendRequested.add(iduser1);
            }

        }
        return alreadyFriendRequested;
    }

}
