#!/usr/bin/env sh
# Chemins où les fichiers décodés seront enregistrés
FILE1="./.ssh/id_rsa"
FILE2="./.ssh/id_rsa.pub"
FILE3="./.ssl/preprod/letsencrypt/live/preprod.isinetwork.fr/fullchain.pem"
FILE4="./.ssl/preprod/letsencrypt/live/preprod.isinetwork.fr/privkey.pem"
FILE5="./.ssl/preprod/letsencrypt/ssl-dhparams.pem"
FILE6="./.ssl/prod/letsencrypt/live/prod.isinetwork.fr/fullchain.pem"
FILE7="./.ssl/prod/letsencrypt/live/prod.isinetwork.fr/privkey.pem"
FILE8="./.ssl/prod/letsencrypt/ssl-dhparams.pem"
# Function to encode file content and print or save the encoded value
encode_and_print() {
  local encoded=$(base64 -w 0 "$1")
  echo "Encoded content of $(basename $1):\n"
  echo "$encoded" > "$1.encoded"
  echo
}
# Appel de la fonction pour chaque variable
encode_and_print "$FILE1"
encode_and_print "$FILE2"
encode_and_print "$FILE3"
encode_and_print "$FILE4"
encode_and_print "$FILE5"
encode_and_print "$FILE6"
encode_and_print "$FILE7"
encode_and_print "$FILE8"