import java.io.*;
import java.net.*;

public class ServeurTCP1 {
	public static void main(String[] args) {
		try {
			// Création serveur
			ServerSocket serveur = new ServerSocket(2016 );
			System.out.println("Serveur TCP en attente de connexion...");

			// Connexion Client
			Socket socket = serveur.accept();
			System.out.println("Client connecté !");

			// Création de l'entrée
			DataInputStream dIn = new DataInputStream(socket.getInputStream());

			// Lecture du message
			String message = dIn.readUTF();
			System.out.println("Message reçu : " + message);

			// Fermeture du serveur
			dIn.close();
			socket.close();
			serveur.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

