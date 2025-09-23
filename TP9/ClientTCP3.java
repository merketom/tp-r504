import java.io.*;
import java.net.*;

public class ClientTCP3 {
	public static void main(String[] args) {
		try {
			Socket socket = new Socket("127.0.0.1", 1234);

			DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
			DataInputStream dIn = new DataInputStream(socket.getInputStream());

			// Message + argument
			String msg = args[0];
			dOut.writeUTF(msg);
			System.out.println("Message envoyé : " + msg);

			// Lecture de la réponse
			String response = dIn.readUTF();
			System.out.println("Réponse du serveur : " + response);

			dOut.close();
			dIn.close();
			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

