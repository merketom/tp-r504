import java.io.*;
import java.net.*;

public class ClientTCP1 {
    public static void main(String[] args) {
        try {
            // Connexion au serveur local sur le port 1234
            Socket socket = new Socket("127.0.0.1", 1234);

            // Création du flux de sortie
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

            // Envoi du message
            dOut.writeUTF("Bonjour Serveur !");
            System.out.println("Message envoyé au serveur.");

            // Fermeture
            dOut.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

