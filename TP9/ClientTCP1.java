import java.io.*;
import java.net.*;

public class ClientTCP1 {
	public static void main(String[] args) {
		try {
			// Connexion serveur local
			Socket socket = new Socket("127.0.0.1", 2016);

			// Création de la sortie
			DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

			// Envoi du message au serveur
			dOut.writeUTF("Bonjour Serveur !");
			System.out.println("Message envoyé au serveur.");

			// Fermeture du client
			dOut.close();
			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

