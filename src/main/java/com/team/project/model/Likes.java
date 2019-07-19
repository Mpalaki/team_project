/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
@Table(name = "likes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Likes.findAll", query = "SELECT l FROM Likes l")
    , @NamedQuery(name = "Likes.findByIdlikes", query = "SELECT l FROM Likes l WHERE l.idlikes = :idlikes")})
public class Likes implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idlikes")
    private Integer idlikes;
    @JoinColumn(name = "idpost", referencedColumnName = "idpost")
    @ManyToOne
    private Post idpost;
    @JoinColumn(name = "iduser", referencedColumnName = "iduser")
    @ManyToOne
    private User iduser;

    public Likes() {
    }

    public Likes(Integer idlikes) {
        this.idlikes = idlikes;
    }

    public Integer getIdlikes() {
        return idlikes;
    }

    public void setIdlikes(Integer idlikes) {
        this.idlikes = idlikes;
    }

    public Post getIdpost() {
        return idpost;
    }

    public void setIdpost(Post idpost) {
        this.idpost = idpost;
    }

    public User getIduser() {
        return iduser;
    }

    public void setIduser(User iduser) {
        this.iduser = iduser;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idlikes != null ? idlikes.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Likes)) {
            return false;
        }
        Likes other = (Likes) object;
        if ((this.idlikes == null && other.idlikes != null) || (this.idlikes != null && !this.idlikes.equals(other.idlikes))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.Likes[ idlikes=" + idlikes + " ]";
    }
    
}
