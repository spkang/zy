package com.gogowise.dao;

import com.gogowise.domain.Pagination;
import com.gogowise.domain.ShowNewEvent;

import java.util.List;

public interface ShowNewEventDao extends ModelDao<ShowNewEvent>{

    public List<ShowNewEvent> findLatestNews(Pagination pagination);

    public List<ShowNewEvent> findByShowID(Integer showID, Pagination pagination);
}
