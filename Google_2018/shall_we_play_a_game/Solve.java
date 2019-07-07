import java.util.Random;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

class Solve {
	public static void main(String[] args) {
		try {
			byte[] q = new byte[32];
			byte[] r = new byte[]{-61, 15, 25, -115, -46, -11, 65, -3, 34, 93, -39, 98, 123, 17, 42, -121, 60, 40, -60, -112, 77, 111, 34, 14, -31, -4, -7, 66, 116, 108, 114, -122};

			Random random = new Random(1416127776L + 1869507705L + 544696686L + 1852403303L + 544042870L + 1696622963L + 544108404L + 544501536L + 1886151033L);
			random.nextBytes(q);

			for (int i = 0; i < 1000000; i++) {
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				md.update(q);
				q = md.digest();
			}

			Cipher cipher = Cipher.getInstance("AES/ECB/NoPadding");
			SecretKeySpec spec = new SecretKeySpec(q, "AES");
			cipher.init(Cipher.DECRYPT_MODE, spec);
			byte[] flag = cipher.doFinal(r);
			System.out.println(new String(flag));
		} catch(Exception e) {
		}
	}
}
