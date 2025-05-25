package com.hxsg.core.tool;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.ThreadLocalRandom;

/**
 * 静态雪花算法生成器（32位Hex输出）
 * 结构：1位符号位 + 48位时间戳 + 16位机器ID + 16位序列号
 * 线程安全，支持时钟回拨自动恢复
 */
public final class Snowflake32 {
    // 基准时间戳（2025-05-25 00:00:00）
    private static final long START_STAMP = 1748198400000L;
    private static final int MACHINE_BITS = 16;
    private static final int SEQUENCE_BITS = 16;
    private static final long MAX_SEQUENCE = ~(-1L << SEQUENCE_BITS);

    // 静态初始化机器ID（支持环境变量配置）
    private static final long MACHINE_ID = initMachineId();
    private static final AtomicLong SEQUENCE = new AtomicLong(0);
    private static volatile long LAST_STAMP = -1L;

    // 私有构造器禁止实例化
    private Snowflake32() {
    }

    /**
     * 生成全局唯一ID（32位Hex字符串）
     */
    public static String nextId() {
        long currStamp = getCurrentStamp();

        // 时钟回拨保护（最大容忍500ms）
        if (currStamp < LAST_STAMP) {
            long offset = LAST_STAMP - currStamp;
            if (offset <= 500) {
                Thread.yield();
                return nextId(); // 重试
            }
            throw new IllegalStateException("时钟回拨超过阈值: " + offset + "ms");
        }

        // 序列号递增（同步块最小化）
        long sequence;
        synchronized (Snowflake32.class) {
            if (currStamp == LAST_STAMP) {
                sequence = SEQUENCE.incrementAndGet() & MAX_SEQUENCE;
                if (sequence == 0) { // 序列号溢出
                    currStamp = getNextMillis(LAST_STAMP);
                }
            } else {
                sequence = ThreadLocalRandom.current().nextLong(100);  // 随机起始序列
                SEQUENCE.set(sequence);
            }
            LAST_STAMP = currStamp;
        }

        // 组合ID并转为Hex
        long id = ((currStamp - START_STAMP) << (MACHINE_BITS + SEQUENCE_BITS))
                | (MACHINE_ID << SEQUENCE_BITS)
                | sequence;

        return String.format("%032x", id);
    }

    // 初始化机器ID（支持环境变量/系统属性）
    private static long initMachineId() {
        String idStr = System.getenv("SNOWFLAKE_MACHINE_ID");
        if (idStr == null) {
            idStr = System.getProperty("snowflake.machineId");
        }

        long id = (idStr != null) ? Long.parseLong(idStr)
                : ThreadLocalRandom.current().nextLong(1, 1 << MACHINE_BITS);

        if (id >= (1 << MACHINE_BITS)) {
            throw new IllegalArgumentException("机器ID必须小于 " + (1 << MACHINE_BITS));
        }
        return id;
    }


    /**
     * 获取下一个有效时间戳（JDK1.8兼容版）
     *
     * @param lastStamp 最后记录的时间戳
     * @return 确保大于lastStamp的时间戳
     */
    private static long getNextMillis(long lastStamp) {
        long stamp = System.currentTimeMillis();

        // 优化等待策略（JDK8替代Thread.onSpinWait() ）
        while (stamp <= lastStamp) {
            // 方案1：短暂休眠（平衡CPU占用与响应速度）
            try {
                Thread.sleep(1);  // 1ms休眠
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new RuntimeException("时间戳获取中断", e);
            }

            // 方案2：Yield+自旋（低延迟场景）
            // Thread.yield();

            stamp = System.currentTimeMillis();
        }
        return stamp;
    }

    // 获取当前时间戳（带时钟追赶）
    private static long getCurrentStamp() {
        long stamp = System.currentTimeMillis();
        return stamp < LAST_STAMP ? LAST_STAMP + 1 : stamp;
    }
}