#!/bin/bash

# Starte lokalen Webserver im Hintergrund
echo "Starte lokalen Python-HTTP-Server auf Port 8000..."
python3 -m http.server 8000 &

# Speichere die PID des Servers für späteres Beenden
SERVER_PID=$!

# Kurze Pause, damit der Server sicher läuft
sleep 2

# Starte ngrok Tunnel auf Port 8000 mit deiner Konfigurationsdatei
echo "Starte ngrok Tunnel..."
ngrok http --url=modest-instantly-bedbug.ngrok-free.app 8000

# Wenn ngrok beendet wurde, stoppe den lokalen Server
echo "Beende lokalen Server..."
kill $SERVER_PID

# https://modest-instantly-bedbug.ngrok-free.app
