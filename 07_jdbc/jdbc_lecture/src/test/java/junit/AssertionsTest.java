package junit;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class AssertionsTest {

    @Test
    void assertTests(){
        // 두 값이 동일한지 확인
        //assertEquals(5, 2*2, "곱셈 결과 확인");

        // 조건식이 true
        // assertTrue(5 == 1, "조건이 참인지 확인");

        // Object obj = new  Object();
        // assertNotNull(obj,"객체가 null이 아님을 확인"); // 객체가 생성됐는지 확인하는 것

        // 특정 예외가 발생하는지 확인
        assertThrows(ArithmeticException.class,()->{
            int result = 1/0;
        });

        // 예외 메시지 확인
        // assertEquals("/by zero", exception.getMessage());
    }
}
