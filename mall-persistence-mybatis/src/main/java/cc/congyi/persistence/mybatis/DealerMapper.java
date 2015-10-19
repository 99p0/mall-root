package cc.congyi.persistence.mybatis;

import cc.congyi.model.Dealer;

import java.util.List;
import java.util.Map;

public interface DealerMapper {
    int insert(Dealer record);

    int insertSelective(Dealer record);

    Dealer selectByPrimaryKey(Integer id);

    List<Dealer> queryDealerListByConditionWithPage(Map<String, Object> paramsMap);

    int updateIntegralByDealerId(Map<String, Object> paramsMap);

    int queryDealerCountByCondition(Map<String, Object> paramsMap);

    int updateByPrimaryKeySelective(Dealer record);

    int updateByPrimaryKey(Dealer record);

}