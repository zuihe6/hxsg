package com.hxsg.core.tool;

import java.util.concurrent.ThreadLocalRandom;

public class IdGenerator {
    /**
     * 生成1-99999的随机ID（线程安全）
     */
    public static int generate5DigitId() {
        return ThreadLocalRandom.current().nextInt(1, 100000);
    }
}