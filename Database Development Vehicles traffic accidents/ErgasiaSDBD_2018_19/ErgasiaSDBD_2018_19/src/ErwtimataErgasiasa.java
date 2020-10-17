import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import scala.Tuple2;

public class ErwtimataErgasiasa {
	
	private static final Pattern SPACE = Pattern.compile(" ");

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SparkConf conf=new SparkConf();
		conf.setAppName("javaWordCount").setMaster("local[*]");
		JavaSparkContext jsc =new JavaSparkContext(conf);
		JavaRDD<String>lines=jsc.textFile(System.getProperty("user.dir")+"/src/db2_Vehicle_Information_Spark.csv",4);
		
		JavaRDD<String>words=lines.flatMap(s -> Arrays.asList(SPACE.split(s)).iterator());
		
		
		//JavaPairRDD<String, Integer> ones = words.mapToPair(s -> new Tuple2<>(s, 1));
		
		JavaPairRDD<String, Integer> ones=words.mapToPair(s->{
		 String[] foo=s.split(",");	 
		 
		  
		 return new Tuple2<>(foo[0],1);
		});
		
	
		
		JavaPairRDD<String, Integer> counts=ones.reduceByKey((i1,i2)-> i1 + i2 );
		
		 //System.out.println(words.first()+"hello");
		 //System.out.println(words.take(22));
		int x=0;
		
		List<Tuple2<String, Integer>> output = counts.collect();
		for(Tuple2<?,?>tuple : output) {
			System.out.println(tuple._1()+": "+ tuple._2());
			x=x+1;
		}
		System.out.println("How many are the car manufacturers?");
		System.out.println("The car manufacturers are:"+x);
		jsc.close();
		
	}

}
