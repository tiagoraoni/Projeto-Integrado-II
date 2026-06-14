// 1. BIBLIOTECAS
#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include <ESP32Servo.h>

// ─────────────────────────────────────────────
// MODO TESTE: true  = simula aproximação automática (Wokwi)
//             false = usa sensor real (hardware físico)
#define MODO_TESTE false
// ─────────────────────────────────────────────

// 2. CONFIGURAÇÕES DE REDE E BROKER
const char* ssid        = "Wokwi-GUEST";
const char* password    = "";
const char* mqtt_server = "500e0d23a6204c628621b154e1e96146.s1.eu.hivemq.cloud";
const int   mqtt_port   = 8883;
const char* mqtt_user   = "lixeira_user";
const char* mqtt_pass   = "Projetointegrador2";

// Tópico MQTT — apenas publicação de status
const char* TOPICO_STATUS = "lixeira/status";

// 3. PINAGEM E INSTÂNCIAS
const int PIN_SERVO = 13;
const int PIN_TRIG  = 5;
const int PIN_ECHO  = 18;

WiFiClientSecure espClient;
PubSubClient     client(espClient);
Servo            meuServo;

// Variáveis de controle
bool          tampaAberta     = false;
unsigned long tempoAbertura   = 0;
unsigned long ultimoTentoMQTT = 0;
const unsigned long TEMPO_MANTER_ABERTA = 5000;

// ─────────────────────────────────────────────
// 4. LEITURA DO SENSOR (real ou simulada)
long medirDistancia() {
#if MODO_TESTE
  // Ciclo: 3s com objeto a 10cm, 8s longe a 200cm — repete
  unsigned long t = (millis() / 1000) % 11;
  return (t < 3) ? 10 : 200;
#else
  digitalWrite(PIN_TRIG, LOW);
  delayMicroseconds(2);
  digitalWrite(PIN_TRIG, HIGH);
  delayMicroseconds(10);
  digitalWrite(PIN_TRIG, LOW);
  long duracao = pulseIn(PIN_ECHO, HIGH, 30000);
  if (duracao == 0) return -1;
  return duracao / 58;
#endif
}

// ─────────────────────────────────────────────
// 5. ACIONAR TAMPA
void acionarTampa(bool abrir) {
  if (abrir && !tampaAberta) {
    meuServo.write(90);
    tempoAbertura = millis();
    tampaAberta   = true;
    if (client.connected()) client.publish(TOPICO_STATUS, "1");
    Serial.println("[Tampa] Aberta — aguardando " +
                   String(TEMPO_MANTER_ABERTA / 1000) + "s para fechar.");
  } else if (!abrir && tampaAberta) {
    meuServo.write(0);
    tampaAberta = false;
    if (client.connected()) client.publish(TOPICO_STATUS, "0");
    Serial.println("[Tampa] Fechada.");
  }
}

// ─────────────────────────────────────────────
// 6. SETUP
void setup() {
  Serial.begin(115200);
  randomSeed(micros());

  meuServo.attach(PIN_SERVO);
  pinMode(PIN_TRIG, OUTPUT);
  pinMode(PIN_ECHO, INPUT);
  meuServo.write(0);

#if MODO_TESTE
  Serial.println("[Modo] TESTE ativo — sensor simulado automaticamente.");
#else
  Serial.println("[Modo] PRODUCAO — usando sensor ultrassonico real.");
#endif

  WiFi.begin(ssid, password);
  espClient.setInsecure();
  client.setServer(mqtt_server, mqtt_port);
  Serial.println("[Init] Lixeira iniciada. Aguardando WiFi...");
}

// ─────────────────────────────────────────────
// 7. LOOP PRINCIPAL
void loop() {

  // Reconexão MQTT não bloqueante
  if (WiFi.status() == WL_CONNECTED && !client.connected()) {
    if (millis() - ultimoTentoMQTT > 5000) {
      String clientId = "SmartBin_" + String(micros(), HEX);
      Serial.print("[MQTT] Conectando... ");
      if (client.connect(clientId.c_str(), mqtt_user, mqtt_pass)) {
        Serial.println("OK! Publicando em lixeira/status");
      } else {
        Serial.print("Falhou, rc=");
        Serial.println(client.state());
      }
      ultimoTentoMQTT = millis();
    }
  } else if (client.connected()) {
    client.loop();
  }

  // Leitura do sensor (real ou simulada)
  long distancia = medirDistancia();

  // Sensor detectou aproximação
  if (distancia > 0 && distancia < 20) {
    acionarTampa(true);
    tempoAbertura = millis(); // renova timer enquanto objeto estiver perto
  }

  // Fechamento automático após TEMPO_MANTER_ABERTA
  if (tampaAberta && (millis() - tempoAbertura >= TEMPO_MANTER_ABERTA)) {
    acionarTampa(false);
  }

  delay(50);
}