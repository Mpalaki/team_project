/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import java.math.BigInteger;
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
import javax.persistence.Lob;
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
@Table(name = "user")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
    , @NamedQuery(name = "User.findByIduser", query = "SELECT u FROM User u WHERE u.iduser = :iduser")
    , @NamedQuery(name = "User.findByFirstName", query = "SELECT u FROM User u WHERE u.firstName = :firstName")
    , @NamedQuery(name = "User.findByLastName", query = "SELECT u FROM User u WHERE u.lastName = :lastName")
    , @NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
    , @NamedQuery(name = "User.findByPassword", query = "SELECT u FROM User u WHERE u.password = :password")
    , @NamedQuery(name = "User.findByEmailAddress", query = "SELECT u FROM User u WHERE u.emailAddress = :emailAddress")
    , @NamedQuery(name = "User.findByTelephone", query = "SELECT u FROM User u WHERE u.telephone = :telephone")
    , @NamedQuery(name = "User.findByPostsNo", query = "SELECT u FROM User u WHERE u.postsNo = :postsNo")
    , @NamedQuery(name = "User.findByCommentsNo", query = "SELECT u FROM User u WHERE u.commentsNo = :commentsNo")
    , @NamedQuery(name = "User.findByRole", query = "SELECT u FROM User u WHERE u.role = :role")})
public class User implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 120)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 145)
    @Column(name = "email_address")
    private String emailAddress;
    @Lob
    @Column(name = "avatar")
    private byte[] avatar;
    @Basic(optional = false)
    @NotNull
    @Column(name = "signup_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date signupDate;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idreceiver")
    private Collection<Pm> pmCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idsender")
    private Collection<Pm> pmCollection1;

    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iduser")
    private Collection<Comment> commentCollection;
    @Column(name = "role")
    private Integer role;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "iduser")
    private Collection<Post> postCollection;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iduser")
    private Integer iduser;
    @Column(name = "telephone")
    private BigInteger telephone;
    @Column(name = "posts_no")
    private Integer postsNo;
    @Column(name = "comments_no")
    private Integer commentsNo;
    @Column(name = "facebook")
    private String facebook;
    @Column(name = "instagram")
    private String instagram;
    @Column(name = "twitter")
    private String twitter;
    @Column(name = "aboutme")
    private String aboutme;
    @Column(name = "email")
    private String email;
    @Transient
    private String base64Avatar;
    @Transient
    private String dispDate;

    public User() {
    }

    public User(Integer iduser) {
        this.iduser = iduser;
    }

    public User(Integer iduser, String firstName, String lastName, String username, String password, String emailAddress, int role) {
        this.iduser = iduser;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.password = password;
        this.emailAddress = emailAddress;
        this.role = role;
    }

    public String getBase64Avatar() {
        base64Avatar = Base64.getEncoder().encodeToString(this.avatar);
        return base64Avatar;
    }

    public void setBase64Avatar(String base64avatar) {
        this.base64Avatar = base64avatar;
    }

    public String getFacebook() {
        return facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public String getTwitter() {
        return twitter;
    }

    public String getAboutme() {
        return aboutme;
    }

    public String getEmail() {
        return email;
    }

    public Integer getIduser() {
        return iduser;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public void setAboutme(String aboutme) {
        this.aboutme = aboutme;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public BigInteger getTelephone() {
        return telephone;
    }

    public void setTelephone(BigInteger telephone) {
        this.telephone = telephone;
    }

    public Integer getPostsNo() {
        return postsNo;
    }

    public void setPostsNo(Integer postsNo) {
        this.postsNo = postsNo;
    }

    public Integer getCommentsNo() {
        return commentsNo;
    }

    public void setCommentsNo(Integer commentsNo) {
        this.commentsNo = commentsNo;
    }

    public String getDispDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY");
        String dispdate = sdf.format(this.signupDate);
        return dispdate;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iduser != null ? iduser.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.iduser == null && other.iduser != null) || (this.iduser != null && !this.iduser.equals(other.iduser))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.User[ iduser=" + iduser + " ]";
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
    }

    public Date getSignupDate() {
        return signupDate;
    }

    public void setSignupDate(Date signupDate) {
        this.signupDate = signupDate;
    }


    @XmlTransient
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    @XmlTransient
    public Collection<Pm> getPmCollection() {
        return pmCollection;
    }

    public void setPmCollection(Collection<Pm> pmCollection) {
        this.pmCollection = pmCollection;
    }

    @XmlTransient
    public Collection<Pm> getPmCollection1() {
        return pmCollection1;
    }

    public void setPmCollection1(Collection<Pm> pmCollection1) {
        this.pmCollection1 = pmCollection1;
    }

}
