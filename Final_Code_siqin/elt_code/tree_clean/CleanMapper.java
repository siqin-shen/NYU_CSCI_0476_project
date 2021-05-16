import java.util.*;
import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
public class CleanMapper extends Mapper<LongWritable, Text, Text, Text> {
	private static final int MISSING = 9999;

	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String line = value.toString();
		String[] words= line.split(",");
		
		//Index of fields needed
		int id_index = 0;
		int status_index = 6;
		int health_index = 7;
		int brand_index = 9;
		int borough_index = 29;

		char c = words[borough_index].charAt(0);

		if (words.length == 45 && (c < '0' || c > '9')) {
			String info = words[status_index] + ", " + words[health_index] + ", " + words[borough_index] + ", " + words[brand_index];
			context.write(new Text(words[id_index]+","), new Text(info));
		}
	}
}
