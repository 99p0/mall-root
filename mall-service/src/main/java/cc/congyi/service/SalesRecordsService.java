package cc.congyi.service;

import cc.congyi.model.SalesRecords;
import cc.congyi.persistence.mybatis.SalesRecordsMapper;
import cc.congyi.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by final.young@hotmail.com on 2015/10/12.
 */
@Service
public class SalesRecordsService extends BaseService {

    @Autowired
    private SalesRecordsMapper salesRecordsMapper;

    /**
     *
     * @return
     */
    public int querySalesRecordsCountByCondition(){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        return salesRecordsMapper.querySalesRecordsCountByCondition(paramsMap);
    }

    /**
     *
     * @param offset
     * @param limit
     * @return
     */
    public List<SalesRecords> querySalesRecordsConditionWithPage(Integer offset, Integer limit){
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("isDelete", 'N');
        if (null != offset && null != limit && limit > 0) { // 分页
            paramsMap.put("offset", offset);
            paramsMap.put("limit", limit);
        }
        return salesRecordsMapper.querySalesRecordsConditionWithPage(paramsMap);
    }

    /**
     *
     * @param id
     * @return
     */
    public boolean deleteSalesRecordById(int id){
        SalesRecords record = new SalesRecords();
        record.setId(id);
        record.setIsDelete("Y");
        return salesRecordsMapper.updateByPrimaryKeySelective(record) == 1;
    }

    /**
     *
     * @param record
     * @return
     */
    public boolean addSalesRecord(SalesRecords record){
        record.setCreateTime(DateUtils.getCurrentDateStr());
        return salesRecordsMapper.insertSelective(record) == 1;
    }

    /**
     *
     * @param id
     * @return
     */
    public SalesRecords querySalesRecordById(int id){
        SalesRecords record = salesRecordsMapper.selectByPrimaryKey(id);
        if(record instanceof  SalesRecords && "N".equals(record.getIsDelete())){
            return record;
        }
        return null;
    }

    /**
     *
     * @param record
     * @return
     */
    public boolean updateSalesRecordsById(SalesRecords record){
        record.setLastEditTime(DateUtils.getCurrentDateStr());
        return salesRecordsMapper.updateByPrimaryKeySelective(record) ==1;
    }

}
