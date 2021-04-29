package day12;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Test1 {
	public static void main(String[] args) {
		Human h1 = new Human("박현빈", 39);
		Human h2 = new Human("현빈", 40);
		Human h3 = new Human("전혜빈", 36);
		Human h4 = new Human("원빈", 44);
		Human h5 = new Human("김우빈", 31);

		Human[] arr = new Human[] { h1, h2, h3, h4, h5 };
		List<Human> list = Arrays.asList(arr);
		
		System.out.println(list);	// 정렬 전
		
//		기본 정렬 형식은 클래스에 Comparable 인터페이스를 구현하도록 해서 만들어 줄 수 있다
//		기본 정렬 형식이 없거나, 기본 형식과 다르게 사용하고 싶으면 Comparator을 사용할 수 있다
				
		Collections.sort(list);		// 정의된 형식(나이순)으로 정렬
		
		System.out.println(list);	// 정렬 후
		
		Collections.sort(list, new Comparator<Human>() {
			@Override
			public int compare(Human o1, Human o2) {
				int diff = o1.getName().charAt(0) - o2.getName().charAt(0);
//				System.out.println(o1.getAge() + "," + o2.getAge() + " : " + diff);
				return diff;
			}
		});
		
		System.out.println(list);	// 정렬 후
	}
}
