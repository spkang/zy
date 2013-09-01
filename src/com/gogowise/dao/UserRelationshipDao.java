package com.gogowise.dao;

import com.gogowise.domain.Pagination;
import com.gogowise.domain.UserRelationship;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 11-10-1
 * Time: 上午11:15
 * To change this template use File | Settings | File Templates.
 */
public interface UserRelationshipDao {
    public List<UserRelationship> queryFriendsByUserId(int id, Pagination page);

    public void addFriend(Integer inviter, Integer userId);

    public UserRelationship queryUserRelationshipByCode(String code);

    public void addUnknownFriends(Integer inviter, String invitedCode);
}
