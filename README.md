# 🔐 CrackRAR - Automatisation avec John the Ripper

Ce projet fournit un script Bash (`crackrar.sh`) qui permet de **casser le mot de passe d’un fichier RAR (RAR5)** en utilisant [John the Ripper](https://www.openwall.com/john/).  
Il automatise les étapes : extraction du hash, choix du dictionnaire, lancement de l’attaque et sauvegarde du résultat.

---

## 🚀 Fonctionnalités

- Demande le chemin du fichier `.rar` à analyser.
- Extrait automatiquement le hash avec `rar2john`.
- Propose d’utiliser le dictionnaire **rockyou.txt** (par défaut) ou un chemin personnalisé.
- Lance John the Ripper avec le bon format (`RAR5`) et les règles de transformation.
- Affiche le mot de passe trouvé directement dans le terminal.
- Sauvegarde le mot de passe dans un fichier `resultat.txt`.

---

## 📦 Compatibilité

⚠️ **Actuellement disponible uniquement sur Kali Linux**  
Le script est conçu pour fonctionner sur Kali Linux, où John the Ripper et ses utilitaires (`rar2john`) sont déjà intégrés.  

👉 Des versions plus compatibles (Debian, Ubuntu, Arch, etc.) seront développées plus tard afin de faciliter l’utilisation sur d’autres distributions.

---

## 📦 Prérequis

- **Kali Linux** avec John the Ripper installé.
- Paquet `john` et ses utilitaires (`rar2john`).
- Un dictionnaire de mots de passe (par défaut : `/usr/share/wordlists/rockyou.txt`).

---

## ⚙️ Installation

Copiez le script dans votre répertoire de travail et rendez-le exécutable :

```bash
chmod +x crackrar.sh
```

---

## 🖥️ Utilisation

1. Lancez le script :
   ```bash
   ./crackrar.sh
   ```

2. Indiquez le chemin du fichier RAR (exemple : `/home/kali/Desktop/crackme.rar`).

3. Appuyez sur **Entrée** pour utiliser le dictionnaire par défaut :
   ```
   /usr/share/wordlists/rockyou.txt
   ```
   ou entrez un autre chemin vers votre dictionnaire.

4. Le script lance John the Ripper et affiche le mot de passe trouvé :
   ```
   [*] Mot de passe trouvé : test123
   ```

5. Le mot de passe est également sauvegardé dans `resultat.txt`.

---

## 📂 Exemple de sortie

```
=== Crack RAR avec John the Ripper ===
Chemin du fichier RAR : /home/kali/Desktop/crackme.rar
[*] Extraction du hash...
[*] Lancement de John...
[*] Mot de passe trouvé : test123
[*] Résultat enregistré dans resultat.txt
```

---

## ⚠️ Avertissement

Ce script est destiné à un usage **éthique et éducatif** uniquement.  
N’utilisez John the Ripper que sur vos propres fichiers ou dans des environnements de test (CTF, laboratoires).  
L’utilisation sur des fichiers tiers sans autorisation est **illégale**.

---

## 🛠️ Améliorations prévues

- Support de plusieurs formats (ZIP, 7z, etc.).
- Compatibilité étendue à d’autres distributions Linux et systèmes.

---

## 📜 Licence

Projet libre sous licence MIT.  
Vous pouvez l’utiliser, le modifier et le partager librement.
