package nn;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class RowToBinary {
	
	private static void readFile1(String fin,String fout) throws IOException {
		int ln=0;
		File f = new File(fin);
		FileInputStream fis = new FileInputStream(f);
	 
		 
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));
	 
		PrintWriter   writer=null;
		
		try {
		    writer = new PrintWriter(fout);
		    
			String line = null;
			while ((line = br.readLine()) != null) {
				ln++;
				
				line = line.replaceAll("^(.*)===========", "");
				System.out.println(line);


				
				String testComplement = appendMissingStrings(line);
				String testBin = stringToBinary(testComplement);
				String testBinCsv = binaryToBinaryCSV(testBin);
				writer.println(testBinCsv);
				
				if(ln>1500) {
					break;
				}
				
			}
		    
		    
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
		     if (writer != null) {
		    	 writer.close(); // **** closing it flushes it and reclaims resources ****
		      }
		   }
		

	 
		br.close();
	}


	public static String stringToBinary(String input) {
		char[] myArray = input.toCharArray();
		StringBuffer sb = new StringBuffer();
		
		for (int i = 0; i < myArray.length; i++) {
	        String b = Integer.toBinaryString(myArray[i]);

	        if (b.length() < 8) {
	            b = "000000000".substring(0, 8 - b.length()).concat(b);
	        } else {
	            b = b.substring(b.length() - 8);
	        }
	        
	        sb.append(b);
	        
	        
	        //System.out.print(b + " ");
	        //System.out.print(binaryToBinaryCSV(b));
		}
		String out = sb.toString();
		return out;
	}
	
	public static String appendMissingStrings(String input) {
		StringBuffer sb = new StringBuffer();
		
	    int missingZeros = 1075 - input.length();

	    for(int i=0;i<missingZeros;i++) {
	    	
	    	sb.append("Z");
	    }
	    String out = (input+sb.toString());;
	    return out;
	}
	

	public static String binaryToBinaryCSV(String bInput) {
		bInput = bInput.replaceAll("", ",");
		bInput = bInput.replaceAll("^,","");
		bInput = bInput.replaceAll(",$","");
		bInput = bInput.replaceAll("(1|0)","$1.0");
		return bInput;
		
	}
	
	
	
	public static double[] readCSVLine(String csvStringInput) {
		String[] numbersString = csvStringInput.split(",");
		double[] returnVal= new double[numbersString.length];
		for(int i=0;i<numbersString.length;i++) {
			returnVal[i]=Double.valueOf(numbersString[i]);
		}
		
		return returnVal;
	}
	
	
	public static String arrayToString(double[] doubleValues) {
		StringBuffer sb = new StringBuffer();
		for(double val: doubleValues) {
			if(val > 0.5) {
				sb.append(1);
			} else {
				sb.append(0);
			}
		}
		
		return sb.toString();
	}
	
	
	public static String stringToLetters(String s) {
		 
	    String str = "";

	    for (int i = 0; i < s.length()/8; i++) {

	        int a = Integer.parseInt(s.substring(8*i,(i+1)*8),2);
	        str += (char)(a);
	    }

	    return str;
	}
	
	public static void main(String[] args) {
		/*try {
			readFile1("C:\\Users\\iqbal\\Downloads\\fasta.txt","C:\\Users\\iqbal\\Downloads\\training.txt");
			readFile1("C:\\Users\\iqbal\\Downloads\\disorder.txt","C:\\Users\\iqbal\\Downloads\\expected.txt");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
 
		String test="1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0";
		
		double[] toto=readCSVLine(test);	
		 System.out.println(readCSVLine(test));
		 
		 String test2=arrayToString(toto);
		 
		 System.out.println(test2);
		 
		 
		 String test3 = stringToLetters(test2);
		 System.out.println(test3);
		

	 }
 
}
