using System;
using System.Text;
using System.Security.Cryptography;

class Solve {
	static void Main() {
		AesCryptoServiceProvider aesCryptoServiceProvider = new AesCryptoServiceProvider();
		aesCryptoServiceProvider.BlockSize = 128;
		aesCryptoServiceProvider.KeySize = 256;
		byte[] b = {0x43, 0x54, 0x46, 0x34, 0x42, 0x37, 0x45, 0x31, 0x43, 0x54, 0x46, 0x34, 0x42, 0x37, 0x45, 0x31};
		aesCryptoServiceProvider.IV = b;
		byte[] B = {0x53 ,0x45 ,0x43 ,0x43 ,0x4F ,0x4E ,0x5F ,0x42 ,0x45 ,0x47 ,0x49 ,0x4E ,0x4E ,0x45 ,0x52 ,0x53};
		aesCryptoServiceProvider.Key = B;
		aesCryptoServiceProvider.Mode = CipherMode.ECB;
		aesCryptoServiceProvider.Padding = PaddingMode.PKCS7;

		string encodedFlag = "E3c0Iefcc2yUB5gvPWge1vHQK+TBuUYzST7hT+VrPDhjBt0HCAo5FLohfs/t2Vf5";
		byte[] inArray = Convert.FromBase64String(encodedFlag);
		byte[] bytes = aesCryptoServiceProvider.CreateDecryptor().TransformFinalBlock(inArray, 0, inArray.Length);

		Console.WriteLine(Encoding.ASCII.GetString(bytes));
	}
}
