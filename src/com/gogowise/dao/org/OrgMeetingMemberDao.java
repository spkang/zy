package com.gogowise.dao.org;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-4-19
 * Time: 上午11:57
 * To change this template use File | Settings | File Templates.
 */
import com.gogowise.dao.ModelDao;
import com.gogowise.domain.OrgMeetingMember;

import java.util.List;

public interface OrgMeetingMemberDao extends ModelDao<OrgMeetingMember> {

    public List<OrgMeetingMember> findByMeeting(Integer mid);
}