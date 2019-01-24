import java.util.Scanner;
public class Kenny {
	//Main the Static Method
    public static void main(String[] args){
	Scanner scanner = new Scanner(System.in);
	String str= new String("Fart");
	Kenny ken= new Kenny(); //Here we create 'ken' a new instance of Kenny
	
			System.out.println("Great what Do yo want from santy claws");
			str= scanner.nextLine();
			ken.Output(str);
	}
	
	//Output non
	public String Output(String Temp){
		String Gift = Temp;
	System.out.printf("Wow you want %s? Maybe you should get Vbucks instead?", Gift);
    return("");
		
	}
}