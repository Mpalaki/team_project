/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Makis
 */
@Entity
@Table(name = "friendship")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Friendship.findAll", query = "SELECT f FROM Friendship f")
    , @NamedQuery(name = "Friendship.findByFriend1", query = "SELECT f FROM Friendship f WHERE f.friendshipPK.friend1 = :friend1")
    , @NamedQuery(name = "Friendship.findByFriend2", query = "SELECT f FROM Friendship f WHERE f.friendshipPK.friend2 = :friend2")
    , @NamedQuery(name = "Friendship.findByFriend1accepts", query = "SELECT f FROM Friendship f WHERE f.friend1accepts = :friend1accepts")
    , @NamedQuery(name = "Friendship.findByFriend2accepts", query = "SELECT f FROM Friendship f WHERE f.friend2accepts = :friend2accepts")})
public class Friendship implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected FriendshipPK friendshipPK;
    @Column(name = "friend1accepts")
    private Integer friend1accepts;
    @Column(name = "friend2accepts")
    private Integer friend2accepts;
    @JoinColumn(name = "friend1", referencedColumnName = "iduser", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user;
    @JoinColumn(name = "friend2", referencedColumnName = "iduser", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private User user1;

    public Friendship() {
    }

    public Friendship(FriendshipPK friendshipPK) {
        this.friendshipPK = friendshipPK;
    }

    public Friendship(int friend1, int friend2) {
        this.friendshipPK = new FriendshipPK(friend1, friend2);
    }

    public Friendship(FriendshipPK friendshipPK, Integer friend1accepts, Integer friend2accepts, User user, User user1) {
        this.friendshipPK = friendshipPK;
        this.friend1accepts = friend1accepts;
        this.friend2accepts = friend2accepts;
        this.user = user;
        this.user1 = user1;
    }

    public Friendship(Integer friend1accepts, Integer friend2accepts, User user, User user1) {
        this.friend1accepts = friend1accepts;
        this.friend2accepts = friend2accepts;
        this.user = user;
        this.user1 = user1;
    }

    public FriendshipPK getFriendshipPK() {
        return friendshipPK;
    }

    public void setFriendshipPK(FriendshipPK friendshipPK) {
        this.friendshipPK = friendshipPK;
    }

    public Integer getFriend1accepts() {
        return friend1accepts;
    }

    public void setFriend1accepts(Integer friend1accepts) {
        this.friend1accepts = friend1accepts;
    }

    public Integer getFriend2accepts() {
        return friend2accepts;
    }

    public void setFriend2accepts(Integer friend2accepts) {
        this.friend2accepts = friend2accepts;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (friendshipPK != null ? friendshipPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Friendship)) {
            return false;
        }
        Friendship other = (Friendship) object;
        if ((this.friendshipPK == null && other.friendshipPK != null) || (this.friendshipPK != null && !this.friendshipPK.equals(other.friendshipPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.Friendship[ friendshipPK=" + friendshipPK + " ]";
    }
    
}
