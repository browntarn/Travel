import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.digest.DigestUtils;

public class SHA512 {

	public static String getSha512_2(String plainText) throws UnsupportedEncodingException {
        MessageDigest md;
        String message = "1234567890123456";
        String mes1 = "";
        String mes2 = "";
        try {
            md = MessageDigest.getInstance("SHA-512");
             
            md.update(message.getBytes("UTF-8"));
            byte[] mb = md.digest();
            for (int i = 0; i < mb.length; i++) {
                byte temp = mb[i];
                String s = Integer.toHexString(new Byte(temp));
                while (s.length() < 2) {
                    s = "0" + s;
                }
                s = s.substring(s.length() - 2);
                mes1 += s;
            }
            System.out.println(mes1.length());
            System.out.println("CRYPTO : " + mes1);
             
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
         
        mes2 = DigestUtils.sha512Hex(message);
        System.out.println(mes2.length());
        System.out.println("CRYPTO : " + mes2);
        if (mes1.equals(mes2)) {
            System.out.println("둘은 같다.");
        }
        return "aa";
    }
	
	public static String getSha512_3(String input) throws NoSuchAlgorithmException {
		
	     String output = "";  
	     StringBuffer sb = new StringBuffer();
	     MessageDigest md = MessageDigest.getInstance("SHA-512");
	     String mes2 = "";
	     
	     if(input != null && !"".equals(input)){
		     md.update(input.getBytes());
		     byte[] msgb = md.digest();  
		
		     for (int i = 0; i < msgb.length; i++) {
		         byte temp = msgb[i];
		         String str = Integer.toHexString(temp & 0xFF);
		        
		         while (str.length() < 2) {
		             str = "0" + str;
		         }
		
		         str = str.substring(str.length() - 2);
		         sb.append(str);
		     }
		
		     output = sb.toString();
	     }
	        mes2 = DigestUtils.sha512Hex(input);
	        System.out.println(mes2.length());
	        System.out.println("CRYPTO : " + mes2);
	        if (input.equals(mes2)) {
	            System.out.println("111111111 둘은 같다.");
	        }else{
	        	System.out.println("111111111 둘은 다름.");
	        }

	     return output;
    }	
	
	public static String get_SHA_512_SecurePassword(String passwordToHash, String salt) throws Exception {
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
	         md.update(salt.getBytes("UTF-8"));
	         byte[] bytes = md.digest(passwordToHash.getBytes("UTF-8"));
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < bytes.length; i++) {
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}	
	
	
	public static void main(String args[]) throws Exception{
		System.out.println(">>>>>:"+SHA512.getSha512_2("12345"));
		//System.out.println(">>>>>:"+SHA512.getSha512_3("12345"));
		//System.out.println(">>>>>:"+SHA512.get_SHA_512_SecurePassword("abcd","lotte"));
	}
}
