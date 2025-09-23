import java.io.*;
import java.net.*;

public class ClientUDP {
	public static void main(String[] args) {
		try {
			String s = "Hello World";
			byte[] data = s.getBytes();

			InetAddress serveur = InetAddress.getByName("127.0.0.1");
			int port = 9876;

			DatagramSocket socket = new DatagramSocket();

			// Envoi Data
			DatagramPacket packet = new DatagramPacket(data, data.length, serveur, port);
			socket.send(packet);

			// Réception de la réponse
			byte[] buffer = new byte[1024];
			DatagramPacket response = new DatagramPacket(buffer, buffer.length);
			socket.receive(response);

			String msg = new String(response.getData(), 0, response.getLength());
			System.out.println("Réponse du serveur : " + msg);

			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

