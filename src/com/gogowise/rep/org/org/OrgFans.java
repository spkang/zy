package com.gogowise.rep.org.org;

import com.gogowise.rep.AbstractPersistence;
import com.gogowise.rep.user.user.BaseUser;

import javax.persistence.Entity;
import javax.persistence.OneToOne;
import java.util.Calendar;

@Entity
public class OrgFans extends AbstractPersistence {
    @OneToOne
    private Organization organization;
    @OneToOne
    private BaseUser fan;
    private Calendar focusTime;

    public Organization getOrganization() {
        return organization;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public BaseUser getFan() {
        return fan;
    }

    public void setFan(BaseUser fan) {
        this.fan = fan;
    }

    public Calendar getFocusTime() {
        return focusTime;
    }

    public void setFocusTime(Calendar focusTime) {
        this.focusTime = focusTime;
    }
}