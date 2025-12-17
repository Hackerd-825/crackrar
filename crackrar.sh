#!/bin/bash

echo "=== Crack RAR avec John the Ripper ==="
echo -n "Chemin du fichier RAR : "
read rarfile

if [ ! -f "$rarfile" ]; then
    echo "Erreur : fichier introuvable."
    exit 1
fi

# Extraire le hash
echo "[*] Extraction du hash..."
rar2john "$rarfile" > hash.txt

# Choix du dictionnaire
echo -n "Appuyez sur Entrée pour utiliser /usr/share/wordlists/rockyou.txt"
echo -n " ou entrez un autre chemin : "
read wordlist

if [ -z "$wordlist" ]; then
    wordlist="/usr/share/wordlists/rockyou.txt"
fi

if [ ! -f "$wordlist" ]; then
    echo "Erreur : dictionnaire introuvable."
    exit 1
fi

# Crack avec John
echo "[*] Lancement de John..."
john --format=RAR5 hash.txt --wordlist="$wordlist" --rules

# Récupérer le mot de passe
password=$(john --show hash.txt | grep -v ":$rarfile" | awk -F: '{print $2}')

if [ -n "$password" ]; then
    echo "[*] Mot de passe trouvé : $password"
    echo "Mot de passe pour $rarfile : $password" > resultat.txt
    echo "[*] Résultat enregistré dans resultat.txt"
else
    echo "[!] Aucun mot de passe trouvé."
fi
