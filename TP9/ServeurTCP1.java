import java.io.*;
import java.net.*;

public class ServeurTCP1 {
    public static void main(String[] args) {
        try {
            // Création du serveur sur le port 1234
            ServerSocket serveur = new ServerSocket(1234);
            System.out.println("Serveur TCP en attente de connexion...");

            // Acceptation d’un client
            Socket socket = serveur.accept();
            System.out.println("Client connecté !");

            // Création du flux d’entrée
            DataInputStream dIn = new DataInputStream(socket.getInputStream());

            // Lecture du message
            String message = dIn.readUTF();
            System.out.println("Message reçu : " + message);

            // Fermeture
            dIn.close();
            socket.close();
            serveur.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

