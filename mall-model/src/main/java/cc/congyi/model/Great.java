package cc.congyi.model;

public class Great {
    private Integer id;

    private Integer memberId;
    private Member member;

    private Integer activityId;

    private String createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    @Override
    public String toString() {
        return "Great{" +
                "id=" + id +
                ", memberId=" + memberId +
                ", member=" + member +
                ", activityId=" + activityId +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}