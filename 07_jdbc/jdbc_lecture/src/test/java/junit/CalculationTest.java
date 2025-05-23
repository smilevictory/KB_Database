package junit;

import static org.assertj.core.api.Assertions.assertThat;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


import java.util.Arrays;
import java.util.List;

// import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.junit.jupiter.api.Assertions.*;
/*
* JUnit5
* - Java 프로그래밍 언어용 단위 테스트 프레임워크
* */
class CalculationTest {
    @Test // 테스트 메서드를 의미하고, Junit이 메서드를 테스트 대상으로 인식
    @DisplayName("더하기 테스트") // 테스트 실행할 때 표시될 이름을 지정

    void additionTest(){
        int result = 2+3;
        assertEquals(5,result); // 예상값이 실제값과 동일한지 확인
    }

    @Test
    @Disabled("아직 구현되지 않음") // 테스트를 임시로 비활성화
    void add() {
        // given : 테스트에 필요한 준비
        Calculation calculation = new Calculation(); // 클래스 안에 있는 것을 사용하기 위해 객체 생성

        // when : 테스트 대상 메서드를 호출
        int result = calculation.add(2,3);

        // then : 결과 확인
        assertEquals(5, result);
    }

    /*
    * AssertJ
    * Java용 테스트 Assertion 라이브러리
    * Junit과 함께 사용되어 테스트 코드에서 좀 더 쉽고 퓨현력있는 검증 문법 사용 가능
    * */
    @Test
    public void assertJExample() {

        int num1 = 100;
        int num2 = 100;
        String text = "Hello, AssertJ!";
        List<String> fruits = Arrays.asList("apple", "banana", "orange");
        int number = 42;

        // 두 값이 같은지 비교
        assertThat(num1).isEqualTo(num2);

        // 문자열 검증
        assertThat(text)
                .isNotEmpty()              // 문자열이 비어 있지 않은지
                .startsWith("Hello")      // "Hello"로 시작하는지
                .endsWith("!")            // "!"로 끝나는지
                .contains("AssertJ");     // "AssertJ"를 포함하는지

        // 컬렉션 검증
        assertThat(fruits)
                .hasSize(3)                    // 크기가 3인지
                .contains("apple", "orange")  // "apple"과 "orange"를 포함하는지
                .doesNotContain("grape");     // "grape"는 포함하지 않는지

        // 숫자 검증
        assertThat(number)
                .isPositive()               // 양수인지
                .isGreaterThan(40)    // 40보다 큰지
                .isLessThan(50)       // 50보다 작은지
                .isEqualTo(42);     // 정확히 42인지
    }
}