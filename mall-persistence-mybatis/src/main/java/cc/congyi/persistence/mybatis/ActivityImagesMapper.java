package cc.congyi.persistence.mybatis;

import cc.congyi.model.ActivityImages;

import java.util.List;

public interface ActivityImagesMapper {
    int insert(ActivityImages record);

    int insertSelective(ActivityImages record);

    ActivityImages selectByPrimaryKey(Integer id);

    List<ActivityImages> selectByActivityId(Integer activityId);

    int updateByPrimaryKeySelective(ActivityImages record);

    int updateByPrimaryKey(ActivityImages record);
}