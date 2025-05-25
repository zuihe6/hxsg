package com.hxsg.core.tool;

import java.util.concurrent.atomic.AtomicInteger;
 
public class SequentialIdGenerator {
    private static final AtomicInteger counter = new AtomicInteger(1);
 
    /**
     * 自增ID（循环使用）
     */
    public static synchronized int nextId() {
        int id = counter.getAndIncrement(); 
        if (id > 99999) {
            counter.set(1); 
            return 1;
        }
        return id;
    }
}