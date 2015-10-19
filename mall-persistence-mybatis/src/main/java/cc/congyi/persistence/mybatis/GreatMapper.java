package cc.congyi.persistence.mybatis;

import cc.congyi.model.Great;

import java.util.List;

public interface GreatMapper {

    int insert(Great record);
    /**
     * 查询活动点赞列表
     *
     * @param activityId
     * @return
     */
    List<Great> queryActivityGreatMembersByActivityId(int activityId);


}