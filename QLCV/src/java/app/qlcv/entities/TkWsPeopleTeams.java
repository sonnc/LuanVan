package app.qlcv.entities;
// Generated Feb 26, 2021 4:00:01 PM by Hibernate Tools 4.3.1



/**
 * TkWsPeopleTeams generated by hbm2java
 */
public class TkWsPeopleTeams  implements java.io.Serializable {


     private int id;
     private TkWsPeople tkWsPeople;
     private TkWsTeams tkWsTeams;

    public TkWsPeopleTeams() {
    }

    public TkWsPeopleTeams(int id, TkWsPeople tkWsPeople, TkWsTeams tkWsTeams) {
       this.id = id;
       this.tkWsPeople = tkWsPeople;
       this.tkWsTeams = tkWsTeams;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public TkWsPeople getTkWsPeople() {
        return this.tkWsPeople;
    }
    
    public void setTkWsPeople(TkWsPeople tkWsPeople) {
        this.tkWsPeople = tkWsPeople;
    }
    public TkWsTeams getTkWsTeams() {
        return this.tkWsTeams;
    }
    
    public void setTkWsTeams(TkWsTeams tkWsTeams) {
        this.tkWsTeams = tkWsTeams;
    }




}

