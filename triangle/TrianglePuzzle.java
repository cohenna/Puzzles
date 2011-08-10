import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;
import com.sif.reverse.ReverseFileLineReader;

public class TrianglePuzzle {
	private ReverseFileLineReader in;
	public TrianglePuzzle(String path) throws IOException {
		File f = new File(path);
		in = new ReverseFileLineReader(new File(path));
	}
	
	public int solve() throws IOException {
		String line;
		int [] sums = null;
		StringTokenizer st;
		while((line = in.readLine()) != null) {
			st = new StringTokenizer(line);
			int numTokens = st.countTokens();
			if(sums == null) {
				// allocate first time, if memory is an issue we can increase complexity and cut memory usage in half
				sums = new int[numTokens];
				int j = 0;
				while(st.hasMoreTokens()) {
					sums[j] = Integer.parseInt(st.nextToken());
					j++;
				}
				continue;
			}
			int j = 0;
			while(st.hasMoreTokens()) {
				int current = Integer.parseInt(st.nextToken());
				// previous interation sums are at j and j+1
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
