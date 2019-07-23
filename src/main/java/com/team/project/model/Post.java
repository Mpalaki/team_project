/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Makis
 */
@Entity
@Table(name = "post")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Post.findAll", query = "SELECT p FROM Post p")
    , @NamedQuery(name = "Post.findByIdpost", query = "SELECT p FROM Post p WHERE p.idpost = :idpost")
    , @NamedQuery(name = "Post.findByTitle", query = "SELECT p FROM Post p WHERE p.title = :title")
    , @NamedQuery(name = "Post.findByDate", query = "SELECT p FROM Post p WHERE p.date = :date")
    , @NamedQuery(name = "Post.findByEditdate", query = "SELECT p FROM Post p WHERE p.editdate = :editdate")
})
public class Post implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "title")
    private String title;
    @Lob
    @Column(name = "photo")
    private byte[] photo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1845)
    @Column(name = "description")
    private String description;
    @Column(name = "url_image")
    private String urlImage;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idpost")
    private Collection<Comment> commentCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpost")
    private Integer idpost;

//    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Column(name = "editdate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date editdate;
    @JoinColumn(name = "iduser", referencedColumnName = "iduser")
    @ManyToOne(optional = false)
    private User iduser;
    @Column(name = "comments_no")
    private Integer commentsNo;
    @Transient
    private String base64Photo;

    @Transient
    private String dispDate;
    @Transient
    private String dispeditDate;

    public Post() {
    }

    public Post(Integer idpost) {
        this.idpost = idpost;
    }

    public Post(Integer idpost, String title, Date date) {
        this.idpost = idpost;
        this.title = title;
        this.date = date;
    }

    public Integer getCommentsNo() {
        return commentsNo;
    }

    public void setCommentsNo(Integer commentsNo) {
        this.commentsNo = commentsNo;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public String getBase64Photo() {
        base64Photo = Base64.getEncoder().encodeToString(this.photo);
        return base64Photo;
    }

    public void setBase64Photo(String base64Image) {
        this.base64Photo = base64Image;
    }

    public Integer getIdpost() {
        return idpost;
    }

    public void setIdpost(Integer idpost) {
        this.idpost = idpost;
    }

    public Date getDate() {
        return date;
    }

    public Date getEditdate() {
        return editdate;
    }

    public String getDispeditDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY, HH:mm");
        String dispdate1 = sdf.format(this.editdate);
        return dispdate1;
    }

    public String getDispDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY, HH:mm");
        String dispdate = sdf.format(this.date);
        return dispdate;
    }

    public void setEditdate(Date editdate) {
        this.editdate = editdate;
    }

    public void setDate(Date date) {
        this.date = date;
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
        hash += (idpost != null ? idpost.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Post)) {
            return false;
        }
        Post other = (Post) object;
        if ((this.idpost == null && other.idpost != null) || (this.idpost != null && !this.idpost.equals(other.idpost))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.Post[ idpost=" + idpost + " ]";
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

//    public String getStringPhoto() {
//        return convertBinImageToString(photo);
//    }
//
//    public static String convertBinImageToString(byte[] accPicture) {
//        if (accPicture != null && accPicture.length > 0) {
//            return Base64.getEncoder().encodeToString(accPicture);
//        } else {
//            return "";
//        }
//    }
}