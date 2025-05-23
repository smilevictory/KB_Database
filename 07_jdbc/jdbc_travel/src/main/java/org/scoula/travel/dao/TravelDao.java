package org.scoula.travel.dao;

import org.scoula.travel.domain.TravelImageVO;
import org.scoula.travel.domain.TravelVO;

public interface TravelDao {
    void insert(TravelVO travelVO);
    void insertImage(TravelImageVO travelImageVO);
}
