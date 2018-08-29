package com.baizhi.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
public class BannerDto implements Serializable {
    private Integer total;
    private List<Banner> rows;

    public BannerDto(Integer total, List<Banner> rows) {
        this.total = total;
        this.rows = rows;
    }

    public BannerDto() {
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<Banner> getRows() {
        return rows;
    }

    public void setRows(List<Banner> rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "BannerDto{" +
                "total=" + total +
                ", rows=" + rows +
                '}';
    }
}
