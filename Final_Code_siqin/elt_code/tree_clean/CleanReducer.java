import java.util.*;
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
public class CleanReducer extends Reducer<Text, Text, Text, Text> {

	
	public void reduce(Text key, Iterator<Text> values, Context context) throws IOException, InterruptedException {

		String temp ="";
        while (values.hasNext()) {
            temp = temp + values.next().toString();     

        }

		context.write(key, new Text(temp));
	}
}
