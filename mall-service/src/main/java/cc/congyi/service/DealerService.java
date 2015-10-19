package cc.congyi.service;

import cc.congyi.model.Dealer;
import cc.congyi.model.LogIntegralAction;
import cc.congyi.persistence.mybatis.DealerMapper;
import cc.congyi.persistence.mybatis.LogIntegralActionMapper;
import cc.congyi.utils.DateUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by final.young@hotmail.com on 2015/8/13.
 */
@Service
@Transactional
public class DealerService extends BaseService {

    @Autowired
    private DealerMapper dealerMapper;

    @Autowired
    private LogIntegralActionMapper logIntegralActionMapper;

    /**
     * 根据条件分页查询经销商信息
     *
     * @param offset
     * @param limit
     * @return
     */
    public List<Dealer> queryDealerListByConditionWithPage(Integer offset, Integer limit) {
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        if (null != offset && null != limit && limit > 0) { // 分页
            paramsMap.put("offset", offset);
            paramsMap.put("limit", limit);
        }
        return dealerMapper.queryDealerListByConditionWithPage(paramsMap);
    }

    /**
     * 查询 总数量
     *
     * @return
     */
    public int queryDealerCountByCondition(){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        return dealerMapper.queryDealerCountByCondition(paramsMap);
    }


    /**
     * 删除用户信息
     *
     * @param dealerId
     * @return
     */
    public boolean deleteDealerById(int dealerId){
        Dealer record = new Dealer();
        record.setId(dealerId);
        record.setIsDelete("Y");
        return dealerMapper.updateByPrimaryKeySelective(record) == 1;
    }

    /**
     *  更改用户的账号状态信息
     *
     * @param dealerId
     * @return
     */
    public boolean changeAccountStateById(int dealerId){
        Dealer dealer = dealerMapper.selectByPrimaryKey(dealerId);
        int state = dealer.getState() == 1 ? 2 : 1;
        Dealer record = new Dealer();
        record.setId(dealerId);
        record.setState(state);
        return dealerMapper.updateByPrimaryKeySelective(record) == 1;
    }

    /**
     * 查询经销商的信息
     *
     * @param dealerId
     * @return
     */
    public Dealer queryDealerById(int dealerId){
        Dealer dealer = dealerMapper.selectByPrimaryKey(dealerId);
        if(dealer != null && "N".equals(dealer.getIsDelete())){
            return dealer;
        }
        return null;
    }

    /**
     * 修改经销商的信息
     *
     * @param dealer
     * @return
     */
    public boolean updateDealerById(Dealer dealer){
        if(StringUtils.isNotEmpty(dealer.getLoginPwd())){
            String pwd = dealer.getLoginPwd();
            dealer.setLoginPwd(DigestUtils.md5Hex(pwd)); // MD5加密
        }
        dealer.setLastEditTime(DateUtils.getCurrentDateStr());
        return dealerMapper.updateByPrimaryKeySelective(dealer) == 1;
    }

    /**
     * 添加经销商
     *
     * @param dealer
     * @return
     */
    public boolean addDealer(Dealer dealer){
        dealer.setCreateTime(DateUtils.getCurrentDateStr());
        return dealerMapper.insertSelective(dealer) == 1;
    }

    /**
     * 积分操作
     *
     * @param dealerId
     * @param operator plus：添加 minus：减少
     * @param integralNum
     * @return
     */
    public boolean integralAction(int dealerId, String operator, int integralNum){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("id", dealerId);
        paramsMap.put("operator", operator);
        paramsMap.put("integralNum", integralNum);
        boolean flag = dealerMapper.updateIntegralByDealerId(paramsMap) == 1;
        if(flag){
            LogIntegralAction record = new LogIntegralAction();
            record.setDealerId(dealerId);
            record.setOperator(operator);
            record.setNumber(integralNum);
            record.setCreateTime(DateUtils.getCurrentDateStr());
            logIntegralActionMapper.insert(record);
        }
        return flag;
    }


}
