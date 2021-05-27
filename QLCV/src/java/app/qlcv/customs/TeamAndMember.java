/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWsTeams;
import java.util.List;

/**
 *
 * @author sonng
 */
public class TeamAndMember {
    private TkWsTeams teams;
    private List<TkUser> lstUser;
    private List<Integer> lstUserId;

    public TkWsTeams getTeams() {
        return teams;
    }

    public void setTeams(TkWsTeams teams) {
        this.teams = teams;
    }

    public List<TkUser> getLstUser() {
        return lstUser;
    }

    public void setLstUser(List<TkUser> lstUser) {
        this.lstUser = lstUser;
    }

    public List<Integer> getLstUserId() {
        return lstUserId;
    }

    public void setLstUserId(List<Integer> lstUserId) {
        this.lstUserId = lstUserId;
    }
    
    
}
