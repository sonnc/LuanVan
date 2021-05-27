/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

import app.qlcv.entities.TkUser;
import app.qlcv.entities.TkWsTask;
import app.qlcv.entities.TkWsTasklist;
import java.util.Date;
import java.util.Set;

/**
 *
 * @author sonng
 */
public class TkWsTaskCustom {

    private TkWsTask task;
    private TkUser assigneeUser;
    private TkUser reviewByUser;

    public TkWsTaskCustom() {
    }

    public TkWsTask getTask() {
        return task;
    }

    public void setTask(TkWsTask task) {
        this.task = task;
    }
    
    public TkUser getAssigneeUser() {
        return assigneeUser;
    }

    public void setAssigneeUser(TkUser assigneeUser) {
        this.assigneeUser = assigneeUser;
    }

    public TkUser getReviewByUser() {
        return reviewByUser;
    }

    public void setReviewByUser(TkUser reviewByUser) {
        this.reviewByUser = reviewByUser;
    }

}
