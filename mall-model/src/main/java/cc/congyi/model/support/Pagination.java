package cc.congyi.model.support;

import java.util.List;

/**
 * Created by final.young@hotmail.com on 2015/10/12.
 */
public class Pagination {
    /**
     * 总共的数据量
     */
    private int total;
    /**
     * 每页显示多少条
     */
    private int pageSize;
    /**
     * 共有多少页
     */
    private int totalPage;
    /**
     * 当前是第几页
     */
    private int index;
    /**
     * 数据集
     */
    private List<?> data;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public List<?> getData() {
        return data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Pagination{" +
                "total=" + total +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                ", index=" + index +
                ", data=" + data +
                '}';
    }
}
