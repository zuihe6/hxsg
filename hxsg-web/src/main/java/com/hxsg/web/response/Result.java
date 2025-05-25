package com.hxsg.web.response;

import lombok.Data;

// 标准响应体
@Data
public class Result<T> {
    private int code;
    private String msg;
    private T data;

    public static <T> Result<T> success(T data) {
        Result<T> r = new Result<>();
        r.code = 200;
        r.data = data;
        return r;
    }
}