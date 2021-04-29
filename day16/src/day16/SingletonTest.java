package day16;

public class SingletonTest {

	private static SingletonTest instance;
	
	private SingletonTest() {	// 외부에서는 생성자를 호출할 수 없다	
		System.out.println("생성자 호출");
	}
	
	public static SingletonTest getInstance() {
		if(instance == null) {					// instance가 없으면
			instance = new SingletonTest();		// 새로 생성한다
		}										// 이미 있으면 곧바로 반환한다
		return instance;
	}
}
