package cc.congyi.model;

public class Member {
    private Integer id;

    private String nickname;

    private Integer sex;

    private String headImgUrl;

    private Integer thirdAccountType;

    private String thirdAccountId;

    private String unionId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getHeadImgUrl() {
        return headImgUrl;
    }

    public void setHeadImgUrl(String headImgUrl) {
        this.headImgUrl = headImgUrl == null ? null : headImgUrl.trim();
    }

    public Integer getThirdAccountType() {
        return thirdAccountType;
    }

    public void setThirdAccountType(Integer thirdAccountType) {
        this.thirdAccountType = thirdAccountType;
    }

    public String getThirdAccountId() {
        return thirdAccountId;
    }

    public void setThirdAccountId(String thirdAccountId) {
        this.thirdAccountId = thirdAccountId == null ? null : thirdAccountId.trim();
    }

    public String getUnionId() {
        return unionId;
    }

    public void setUnionId(String unionId) {
        this.unionId = unionId == null ? null : unionId.trim();
    }
}