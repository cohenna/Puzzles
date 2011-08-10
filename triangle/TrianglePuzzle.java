import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;

// ReverseFileLineReader reads lines in a file in reverse order.
// It seemed useful enough to jar and publicize.
// Please see: https://github.com/cohenna/reverse
import com.sif.reverse.ReverseFileLineReader;

/** 
 * TrianglePuzzle uses a bottom-up dynamic programming approach to solve the triangle problem.
 * The solution involves reading input in reverse order and bubbling up winning sums in each iteration.
 *
 * @author Nick Cohen (nick@nickcohen.com)
 */
public class TrianglePuzzle {
	private ReverseFileLineReader in;
	public TrianglePuzzle(String path) throws IOException {
		File f = new File(path);
		in = new ReverseFileLineReader(new File(path));
	}
	
	/**
	 * This function first builds a temporary array of size n, where n is the number of lines in the 
	 * input file and appropriately initializes the contents of the array to the last line of input.  
	 * The function then iterates over the remaining lines (in last-first order) using the temporary
	 * array as "memory" from all previous iterations.
	 */
	public int solve() throws IOException {
		String line;
		int [] sums = null;
		StringTokenizer st;
		
		// last line in file, populate the array
		if((line = in.readLine()) != null) {
			st = new StringTokenizer(line);
			sums = new int[st.countTokens()];
			int j = 0;
			while(st.hasMoreTokens()) {
				sums[j] = Integer.parseInt(st.nextToken());
				j++;
			}
		}
		
		// read rest of lines in reverse order, bubbling up the branch with the largest sum
		while((line = in.readLine()) != null) {
			st = new StringTokenizer(line);
			int j = 0;
			while(st.hasMoreTokens()) {
				int current = Integer.parseInt(st.nextToken());
				// previous interation sums are stored at j and j+1
				int index = j;
				int index_plus_one = index+1;
				if(sums[index] > sums[index_plus_one]) {
					sums[j] = current + sums[index];
				}
				else {
					sums[j] = current + sums[index_plus_one];
				}
				j++;
			}
		}
		
		if(sums == null) {
			return -1;
		}
		return sums[0];
	}
	
	public static void main(String[] args) throws Exception{
		if(args.length != 1) {
			return;
		}
		TrianglePuzzle p = new TrianglePuzzle(args[0]);
		int solution = p.solve();
		System.out.println(solution);
	}
}
