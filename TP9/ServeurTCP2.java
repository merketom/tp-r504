import java.io.*;
import java.net.*;

public class ServeurTCP2 {
	public static void main(String[] args) {
		try {
			ServerSocket serveur = new ServerSocket(1234);
			System.out.println("Serveur TCP en attente...");

			while (true) {
				// Attente du client
				Socket socket = serveur.accept();
				System.out.println("Client connecté !");

				// Lecture du message
				DataInputStream dIn = new DataInputStream(socket.getInputStream());
				String message = dIn.readUTF();
				System.out.println("Message reçu : " + message);

				// Fermeture du client
				dIn.close();
				socket.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

