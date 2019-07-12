/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Makis
 */
@Embeddable
public class FriendshipPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "friend1")
    private int friend1;
    @Basic(optional = false)
    @NotNull
    @Column(name = "friend2")
    private int friend2;

    public FriendshipPK() {
    }

    public FriendshipPK(int friend1, int friend2) {
        this.friend1 = friend1;
        this.friend2 = friend2;
    }

    public int getFriend1() {
        return friend1;
    }

    public void setFriend1(int friend1) {
        this.friend1 = friend1;
    }

    public int getFriend2() {
        return friend2;
    }

    public void setFriend2(int friend2) {
        this.friend2 = friend2;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) friend1;
        hash += (int) friend2;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof FriendshipPK)) {
            return false;
        }
        FriendshipPK other = (FriendshipPK) object;
        if (this.friend1 != other.friend1) {
            return false;
        }
        if (this.friend2 != other.friend2) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.FriendshipPK[ friend1=" + friend1 + ", friend2=" + friend2 + " ]";
    }
    
}
