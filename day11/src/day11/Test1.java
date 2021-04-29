package day11;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class Test1 {
	public static void main(String[] args) {
		// 여러 속성을 갖고 있는 객체를 정렬할 때, 어떤 속성값을 기준으로 정렬할 것인가에 대한 구체적인 내용이 필요하다
		// 정렬의 순서는 어떻게 결정할 것인가? (오름차순, 내림차순)
		List<VO> list = Arrays.asList(new VO[] {
			new VO("영웅이", "2021-04-19", "내꺼야"),	
			new VO("단비", "2021-04-19", "단비꺼야"),	
			new VO("테스트", "2021-04-20", "테스트"),
			new VO("영웅이", "2021-04-04", "내꺼야"),	
			new VO("영웅이", "2021-04-05", "내꺼야"),	
		});
		
		System.out.println(list);
		
//		Collections.sort(list, new Comparator<VO>() {
//			@Override
//			public int compare(VO o1, VO o2) {	// 두개의 서로 다른 객체가 주어질 때
		
				// 객체의 어떤 값을 기준으로 정렬할지, 크기 비교를 어떤 값으로 처리할지
//				int ret = o1.getWriter().charAt(0) - o2.getWriter().charAt(0);
//				System.out.println(o1 + ", " + o2 + " : " + ret);
//				return ret;	// 반환되는 값의 부호에 따라서 자리바꿈을 수행할지 말지 결정한다
//				// 1 or 0 or -1
//			}
//		});
		
		Collections.sort(list, (VO o1, VO o2) -> {
			return o1.getWriter().charAt(0) - o2.getWriter().charAt(0);
		});
		
		System.out.println(list);
	}
}
