package cc.congyi.controller;

import cc.congyi.model.Activity;
import cc.congyi.model.SalesRecords;
import cc.congyi.model.SysUser;
import cc.congyi.service.SalesRecordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 商品销售（即授权页面
 * Created by final.young@hotmail.com on 2015/8/12.
 */
@Controller
@RequestMapping("/sales/record")
public class SalesRecordsController extends BaseController {

    @Autowired
    private SalesRecordsService salesRecordsService;

    /**
     * 商品销售首页
     *
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String execute(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){ // 进入项目首页
            return "redirect:/frame";
        }
        return PATH_SALES + "manage";
    }
    /**
     * 查询经销商
     *
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> querySalesRecordsByPage(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            String offsetStr = request.getParameter("iDisplayStart");
            String limitStr = request.getParameter("iDisplayLength");
            String sEcho = request.getParameter("sEcho");
            Map<String, Object> retMap = new HashMap<>();
            int totalRecords = salesRecordsService.querySalesRecordsCountByCondition();
            retMap.put("aaData", salesRecordsService.querySalesRecordsConditionWithPage(Integer.parseInt(offsetStr), Integer.parseInt(limitStr)));
            retMap.put("iTotalRecords", totalRecords);
            retMap.put("iTotalDisplayRecords", totalRecords);
            retMap.put("sEcho", Integer.parseInt(sEcho)+1);
            return retMap;
        }
        return null;
    }

    /**
     * 删除活动
     *
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public String deleteSalesRecordById(HttpServletRequest request, @PathVariable Integer id){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){
            return "not-login";
        }
        if(salesRecordsService.deleteSalesRecordById(id)){
            return "success";
        }
        return "error";
    }

    /**
     * 添加销售记录
     *
     * @param request
     * @param record
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addSalesRecord(HttpServletRequest request, SalesRecords record){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        if(record instanceof SalesRecords){
            if(salesRecordsService.addSalesRecord(record))
                return "success";
            else
                return "error";
        }
        return "bugs";
    }

    /**
     * 查询
     *
     * @param request
     * @param id
     * @return
     */
    @RequestMapping(value = "/{id:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public SalesRecords queryActivityById(HttpServletRequest request, @PathVariable Integer id){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof SysUser){
            return salesRecordsService.querySalesRecordById(id);
        }
        return null;
    }

    /**
     * 修改经销商的信息
     *
     * @param request
     * @param record
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String updateDealer(HttpServletRequest request, SalesRecords record){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null) return "not-login";
        if(record instanceof SalesRecords && record.getId() != null){
            if(salesRecordsService.updateSalesRecordsById(record))
                return "success";
            else
                return "error";
        }
        return "bugs";
    }


}
