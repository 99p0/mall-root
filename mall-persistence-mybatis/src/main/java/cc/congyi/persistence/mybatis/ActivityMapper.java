package cc.congyi.persistence.mybatis;

import cc.congyi.model.Activity;

import java.util.List;
import java.util.Map;

public interface ActivityMapper {
    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);

    int queryDealerCountByCondition(Map<String, Object> paramsMap);

    List<Activity> queryDealerListByConditionWithPage(Map<String, Object> paramsMap);

}