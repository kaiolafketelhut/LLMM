import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        try {
            List<String> command = new ArrayList<>();
            command.add("./dist/D16S");
            command.addAll(Arrays.asList(args));

            ProcessBuilder pb = new ProcessBuilder(command);
            pb.inheritIO();
            
            Process process = pb.start();
            System.exit(process.waitFor());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
}
