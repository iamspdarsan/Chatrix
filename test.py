import socket

def send_command(command: int):
    host = '192.168.29.23'
    port = 80

    # Connect to the server
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((host, port))

    # Send the command
    client_socket.send(b'9')

    # Receive and print the response
    response = client_socket.recv(1024).decode('utf-8').strip()
    print('Received:', response)

    # Close the connection
    client_socket.close()

if __name__ == '__main__':
    command = 9
    send_command(command)
