/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Makis
 */
@Entity
@Table(name = "pm")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pm.findAll", query = "SELECT p FROM Pm p")
    , @NamedQuery(name = "Pm.findByIdpm", query = "SELECT p FROM Pm p WHERE p.idpm = :idpm")
    , @NamedQuery(name = "Pm.findByDate", query = "SELECT p FROM Pm p WHERE p.date = :date")
    , @NamedQuery(name = "Pm.findByTitle", query = "SELECT p FROM Pm p WHERE p.title = :title")
    , @NamedQuery(name = "Pm.findByText", query = "SELECT p FROM Pm p WHERE p.text = :text")})
public class Pm implements Serializable {
        
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpm")
    private Integer idpm;
    @Basic(optional = false)
    @NotNull
    @Column(name = "date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;
    @Size(max = 45)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1545)
    @Column(name = "text")
    private String text;
    @JoinColumn(name = "idreceiver", referencedColumnName = "iduser")
    @ManyToOne(optional = false)
    private User idreceiver;
    @JoinColumn(name = "idsender", referencedColumnName = "iduser")
    @ManyToOne(optional = false)
    private User idsender;

    public Pm() {
    }

    public Pm(Integer idpm) {
        this.idpm = idpm;
    }

    public Pm(Integer idpm, Date date, String text) {
        this.idpm = idpm;
        this.date = date;
        this.text = text;
    }

    public Integer getIdpm() {
        return idpm;
    }

    public Pm(Date date, String title, String text, User idreceiver, User idsender) {
        this.date = date;
        this.title = title;
        this.text = text;
        this.idreceiver = idreceiver;
        this.idsender = idsender;
    }

    public void setIdpm(Integer idpm) {
        this.idpm = idpm;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getIdreceiver() {
        return idreceiver;
    }

    public void setIdreceiver(User idreceiver) {
        this.idreceiver = idreceiver;
    }

    public User getIdsender() {
        return idsender;
    }

    public void setIdsender(User idsender) {
        this.idsender = idsender;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idpm != null ? idpm.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pm)) {
            return false;
        }
        Pm other = (Pm) object;
        if ((this.idpm == null && other.idpm != null) || (this.idpm != null && !this.idpm.equals(other.idpm))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.team.project.model.Pm[ idpm=" + idpm + " ]";
    }
    
}
