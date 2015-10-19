package cc.congyi.persistence.mybatis;

import cc.congyi.model.LogIntegralAction;

public interface LogIntegralActionMapper {
    int insert(LogIntegralAction record);

    int insertSelective(LogIntegralAction record);

    LogIntegralAction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogIntegralAction record);

    int updateByPrimaryKey(LogIntegralAction record);
}