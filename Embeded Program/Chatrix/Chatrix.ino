#include <FS.h>
#include <ESP8266WiFi.h>

const String DATAFILE = "/switchStates.txt";

//access point (Gateway) credential
#define SSID "Hoxie"
#define PASSWORD "ifpass==true:"

const int RELAYS[4] = {D5, D6, D7, D8};//relay pins
const int UNPINS[5] = {D1, D2, D3, D4};//unused pins

//storing relay states
char relay_states[4] = {'2','4','6','8'};//initialized with deactivate code (even numbers)

// Create a server object on port 80
WiFiServer server(80);

void setup() {

  // Serial.begin(9600);

  //set all unused and relay pins as output
  setPinMode(UNPINS);
  setPinMode(RELAYS);

  //set all unused pins as low to prevent malfunction
  setOff(UNPINS);

  //restore last state of relays
  initFS();
  readRelayState();
  rstateRestore(relay_states);
  
  //for(int i=0; i < 4; i++){Serial.print(i);Serial.print("=");Serial.print(relay_states[i]);Serial.print("\n");}

  //start wifi and listen
  startWifiServer();

}

void rstateRestore(char states[4]){
  for(int i = 0; i < 4; i++){
    int op = states[i] - '0';
    relayStateMGR(op);
  }
}

void loop() {
  listen();
}

//set pinmode as output
void setPinMode(const int pins[]){
    for(int i = 0; i < 4; i++){
      pinMode(pins[i],OUTPUT);

      // Serial.println("setting pin mode");
    }
}

//set digital signal low
void setOff(const int pins[]){
  for(int i = 0;i < 4; i++){
    digitalWrite(pins[i],LOW);
    
    // Serial.println("setting low mode");
  }
}

//Relay state manager
void relayStateMGR(char cmd){
//Serial.println(cmd);
  switch(cmd){
    case 1:
    digitalWrite(RELAYS[0],HIGH);
    if(relay_states[0] != '1'){
      relay_states[0] = '1';
      writeRelayState(relay_states);
      //Serial.println("relay 1 activated");
    }
    // else {
    // Serial.println("relay 1 activation skipped");
    // }
    break;

    case 2:
    digitalWrite(RELAYS[0],LOW);
    if(relay_states[0] != '2'){
      relay_states[0] = '2';
      writeRelayState(relay_states);
      //Serial.println("relay 1 de-activated");
    }
    // else {
    // Serial.println("relay 1 de-activation skipped");
    // }
    break;

    case 3:
    digitalWrite(RELAYS[1],HIGH);
    if(relay_states[1] != '3'){
      relay_states[1] = '3';
      writeRelayState(relay_states);
      //Serial.println("relay 2 activated");
    }
    // else {
    // Serial.println("relay 2 activation skipped");
    // }
    break;

    case 4:
    digitalWrite(RELAYS[1],LOW);
    if(relay_states[1] != '4'){
      relay_states[1] = '4';
      writeRelayState(relay_states);
      //Serial.println("relay 2 de-activated");
    }
    // else {
    // Serial.println("relay 2 de-activation skipped");
    // }
    break;

    case 5:
    digitalWrite(RELAYS[2],HIGH);
    if(relay_states[2] != '5'){
      relay_states[2] = '5';
      writeRelayState(relay_states);
      //Serial.println("relay 3 activated");
    }
    // else {
    // Serial.println("relay 3 activation skipped");
    // }
    break;

    case 6:
    digitalWrite(RELAYS[2],LOW);
    if(relay_states[2] != '6'){
      relay_states[2] = '6';
      writeRelayState(relay_states);
      //Serial.println("relay 3 de-activated");
    }
    // else {
    // Serial.println("relay 3 de-activation skipped");
    // }
    break;

    case 7:
    digitalWrite(RELAYS[3],HIGH);
    if(relay_states[3] != '7'){
      relay_states[3] = '7';
      writeRelayState(relay_states);
      //Serial.println("relay 4 activated");
    }
    // else {
    // Serial.println("relay 4 activation skipped");
    // }
    break;

    case 8:
    digitalWrite(RELAYS[3],LOW);
    if(relay_states[3] != '8'){
      relay_states[3] = '8';
      writeRelayState(relay_states);
      //Serial.println("relay 4 de-activated");
    }
    // else {
    // Serial.println("relay 4 de-activation skipped");
    // }
    break;
  }

}

//initialize SPIFFS file system
void initFS(){
   if (!SPIFFS.begin()) {
    // Serial.println("Failed to mount SPIFFS file system");
    return;
  }
}

//write relay_states to non-volatile memory
void writeRelayState(char relay_states[4]){
  
  File file = SPIFFS.open(DATAFILE, "w");
  
  if (file) {
    // write the string array to the file
    for (int i = 0; i < 4; i++) {
      file.println(relay_states[i]);
    }
    file.close();
    //Serial.println("All written");
  }
  // else {
  // Serial.println("Failed to open file in write op");
  // }
}

//read relay_states from non-volatile memory
void readRelayState(){
    
    // if(SPIFFS.exists(DATAFILE)){Serial.println("File exist");}
    // else{writeRelayState(relay_states);}

    File file = SPIFFS.open(DATAFILE, "r+");
    
    if (file) {
      // Read the array from the file
      char states[4] = {'2','4','6','8'};//deactivate codes temporarily
      for (int i = 0; i < 4; i++) {
        String temp = file.readStringUntil('\n');//assigning real prev states
        states[i] = temp[0];
      }
      file.close();

      for(int i = 0; i < 4; i++){
        relay_states[i] = states[i];  
      }
      //Serial.println("State were readed");
    }
    //else {
    // Serial.println("Failed to open file in read op");
    // }
}

//Establish connection to gateway(AP) and start server
void startWifiServer(){
  WiFi.begin(SSID, PASSWORD); // connect to  Wi-Fi 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    // Serial.print(".");
  }
  // Serial.println("Wifi connected");
  server.begin(); // Start server
}

//listen on incoming client request
void listen(){
  WiFiClient client = server.available(); // Check for incoming client connections
  if (client) {
    while(1){

      char buffer[1];
      char cmd;
      int op;
      int bytesRead = client.readBytes(buffer, 1);
      if (bytesRead > 0) {
        cmd = buffer[0];
        op = cmd - '0';
        // Serial.print("Received command: ");
        // Serial.println(op);
      }
      //Serial.print("converted cmd is ");
      if(op == 9){
        client.write(relay_states,4);
        client.flush();
        //Serial.println("state sent to client");
      }else{
      relayStateMGR(op);}
      if(cmd){
        client.stop();
        break;
      }
    }
  }
}