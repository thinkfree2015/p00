package com.msxf.sso.util;

import java.util.Random;

public class VerificationCodeGenerator {
	public static String createVerificationCode() {
        StringBuffer code = new StringBuffer();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            int j = random.nextInt(10);
            code.append(j);
        }
        return code.toString();
    }
}
