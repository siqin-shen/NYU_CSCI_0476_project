import java.util.*;
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
public class BoroughCountsMapper extends Mapper<LongWritable, Text, Text, IntWritable> {
	private static final int MISSING = 9999;

	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {


		String line = value.toString();
		String[] words= line.split(",");
		
		context.write(new Text(words[3]), new IntWritable(1));
		
		
	}
}
