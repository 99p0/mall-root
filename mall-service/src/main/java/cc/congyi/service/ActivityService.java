package cc.congyi.service;

import cc.congyi.model.Activity;
import cc.congyi.model.Great;
import cc.congyi.persistence.mybatis.ActivityImagesMapper;
import cc.congyi.persistence.mybatis.ActivityMapper;
import cc.congyi.persistence.mybatis.GreatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by final.young@hotmail.com on 2015/10/8.
 */
@Service
public class ActivityService extends BaseService {

    @Autowired
    private ActivityImagesMapper activityImagesMapper;
    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private GreatMapper greatMapper;


    /**
     *
     * @return
     */
    public int queryActivitiesCountByCondition(){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        return activityMapper.queryDealerCountByCondition(paramsMap);
    }

    /**
     *
     * @param offset
     * @param limit
     * @return
     */
    public List<Activity> queryActivitiesByConditionWithPage(Integer offset, Integer limit){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        if (null != offset && null != limit && limit > 0) { // 分页
            paramsMap.put("offset", offset);
            paramsMap.put("limit", limit);
        }
        List<Activity> activities = activityMapper.queryDealerListByConditionWithPage(paramsMap);
        for (Activity activity: activities){
            activity.setActivityImages(activityImagesMapper.selectByActivityId(activity.getId()));
        }
        return activities;
    }

    /**
     *
     * @param id
     * @return
     */
    public boolean deleteActivityById(int id){
        Activity record = new Activity();
        record.setId(id);
        record.setIsDelete("Y");
        return activityMapper.updateByPrimaryKeySelective(record) == 1;
    }

    /**
     *
     * @param id
     * @return
     */
    public Activity queryActivityById(int id){
        Activity record = activityMapper.selectByPrimaryKey(id);
        record.setActivityImages(activityImagesMapper.selectByActivityId(record.getId()));
        return record;
    }

    /**
     *
     * @param activityId
     * @return
     */
    public List<Great> queryActivityGreatMembersByActivityId(int activityId){
        return greatMapper.queryActivityGreatMembersByActivityId(activityId);
    }

}
