import java.io.*;
import java.net.*;

public class ClientTCP2 {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("127.0.0.1", 1234);
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

            // Message pris depuis args[0]
            dOut.writeUTF(args[0]);
            System.out.println("Message envoyé au serveur : " + args[0]);

            dOut.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

