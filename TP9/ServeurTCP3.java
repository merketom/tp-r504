import java.io.*;
import java.net.*;

public class ServeurTCP3 {
	public static void main(String[] args) {
		try {
			ServerSocket serveur = new ServerSocket(1234);
			System.out.println("Serveur TCP en attente...");

			while (true) {
				Socket socket = serveur.accept();
				System.out.println("Client connecté !");

				DataInputStream dIn = new DataInputStream(socket.getInputStream());
				DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

				String message = dIn.readUTF();
				System.out.println("Message reçu : " + message);

				// Inversion de la chaîne
				String rev = new StringBuilder(message).reverse().toString();

				// Renvoi au client
				dOut.writeUTF(rev);
				System.out.println("Message renvoyé : " + rev);

				dIn.close();
				dOut.close();
				socket.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

