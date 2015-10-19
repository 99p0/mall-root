package cc.congyi.persistence.mybatis;

import cc.congyi.model.SalesRecords;

import java.util.List;
import java.util.Map;

public interface SalesRecordsMapper {

    int insert(SalesRecords record);

    int insertSelective(SalesRecords record);

    SalesRecords selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SalesRecords record);

    int updateByPrimaryKey(SalesRecords record);

    int querySalesRecordsCountByCondition(Map<String, Object> paramsMap);

    List<SalesRecords> querySalesRecordsConditionWithPage(Map<String, Object> paramsMap);

}