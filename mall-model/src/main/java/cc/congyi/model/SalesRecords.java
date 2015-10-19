package cc.congyi.model;

public class SalesRecords {

    private Integer id;

    private String code;

    private Integer dealerId;

    private String organizationName;

    private String createTime;

    private String lastEditTime;

    private String isDelete;

    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName == null ? null : organizationName.trim();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getDealerId() {
        return dealerId;
    }

    public void setDealerId(Integer dealerId) {
        this.dealerId = dealerId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getLastEditTime() {
        return lastEditTime;
    }

    public void setLastEditTime(String lastEditTime) {
        this.lastEditTime = lastEditTime == null ? null : lastEditTime.trim();
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete == null ? null : isDelete.trim();
    }

    @Override
    public String toString() {
        return "SalesRecords{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", dealerId=" + dealerId +
                ", organizationName='" + organizationName + '\'' +
                ", createTime='" + createTime + '\'' +
                ", lastEditTime='" + lastEditTime + '\'' +
                ", isDelete='" + isDelete + '\'' +
                '}';
    }
}