import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


public class test {

	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		Map<Integer, Object> map = new HashMap<Integer, Object>();
        map.put(1, "AAA");
        map.put(2, "BBB");
        map.put(3, "CCC");
         
        System.out.println("\n ##### 방법1 #####");
        for(int key : map.keySet()){
            System.out.println("key:"+key+" value:"+map.get(key));
        }
         
        System.out.println("\n ##### 방법2 #####");
        for(Map.Entry<Integer, Object> data : map.entrySet()){
            System.out.println("key:"+data.getKey()+" value:"+data.getValue());
        }
         
        System.out.println("\n ##### 방법3 #####");
        Iterator<Integer> iterater1 = map.keySet().iterator();
        while(iterater1.hasNext()){
            int key = iterater1.next();
            System.out.println("key:"+key+" value:"+map.get(key));
        }
         
        System.out.println("\n ##### 방법4 #####");
        Set<Integer> keySet = map.keySet();
        Iterator<Integer> iterator2 = keySet.iterator();
        while(iterator2.hasNext()){
            int key = iterator2.next();
            System.out.println("key:"+key+" value:"+map.get(key));
        }

	}

}
