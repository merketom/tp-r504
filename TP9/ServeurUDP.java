import java.io.*;
import java.net.*;

public class ServeurUDP {
	public static void main(String[] args) {
		try {
			DatagramSocket socket = new DatagramSocket(9876);
			byte[] buffer = new byte[1024];
			while (true){

			System.out.println("Serveur UDP en attente...");

			// Réception Data
			DatagramPacket packet = new DatagramPacket(buffer, buffer.length);
			socket.receive(packet);

			String msg = new String(packet.getData(), 0, packet.getLength());
			System.out.println("Message reçu : " + msg);

			// Renvoi chaîne client
			InetAddress clientAddr = packet.getAddress();
			int clientPort = packet.getPort();
			DatagramPacket retour = new DatagramPacket(msg.getBytes(), msg.length(), clientAddr, clientPort);
			socket.send(retour);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

