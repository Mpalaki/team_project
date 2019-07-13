/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.team.project.repos;

import com.team.project.model.Pm;
import com.team.project.model.User;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Makis
 */
public interface PmRepo extends JpaRepository<Pm, Integer> {
//TODO: change the name of the method, currently misleading
    @Query("SELECT p FROM Pm p WHERE p.idreceiver=?1 ORDER BY p.idpm DESC")
    public List<Pm> getCommentsByIdreceiver(User receiver);

    public Pm findByIdpm(int idpm);

}
