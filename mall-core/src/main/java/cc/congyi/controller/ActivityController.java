package cc.congyi.controller;

import cc.congyi.model.Activity;
import cc.congyi.model.Dealer;
import cc.congyi.model.Great;
import cc.congyi.model.SysUser;
import cc.congyi.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 活动管理
 * <p>
 * Created by final.young@hotmail.com on 2015/8/12.
 */
@Controller
@RequestMapping("/activity")
public class ActivityController extends BaseController {

    @Autowired
    private ActivityService activityService;

    /**
     * 活动管理页面
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
        return PATH_ACTIVITY + "manage";
    }

    /**
     * 查询经销商
     *
     * @param request
     * @return
     */
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryActivitiesByPage(HttpServletRequest request) {
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof  SysUser){
            String offsetStr = request.getParameter("iDisplayStart");
            String limitStr = request.getParameter("iDisplayLength");
            String sEcho = request.getParameter("sEcho");
            Map<String, Object> retMap = new HashMap<>();
            int totalRecords = activityService.queryActivitiesCountByCondition();
            retMap.put("aaData", activityService.queryActivitiesByConditionWithPage(Integer.parseInt(offsetStr), Integer.parseInt(limitStr)));
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
    public String deleteActivityById(HttpServletRequest request, @PathVariable Integer id){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser == null){
            return "not-login";
        }
        if(activityService.deleteActivityById(id)){
            return "success";
        }
        return "error";
    }

    /**
     * 查询活动
     *
     * @param request
     * @param dealerId
     * @return
     */
    @RequestMapping(value = "/{dealerId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public Activity queryActivityById(HttpServletRequest request, @PathVariable Integer dealerId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof SysUser){
            return activityService.queryActivityById(dealerId);
        }
        return null;
    }

    /**
     *  查询活动点赞用户列表
     *
     * @param request
     * @param activityId
     * @return
     */
    @RequestMapping(value = "/great/{activityId:^[1-9]\\d*$}", method = RequestMethod.POST)
    @ResponseBody
    public List<Great> queryActivityGreatMembersById(HttpServletRequest request, @PathVariable Integer activityId){
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysUser");
        if(sysUser instanceof SysUser){
            return activityService.queryActivityGreatMembersByActivityId(activityId);
        }
        return null;
    }



}
