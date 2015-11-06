for FILE in /usr/share/ca-certificates/mozilla/*.crt; do
  keytool -deststorepass changeit -import -trustcacerts -keystore /usr/lib/jvm/java-1.7-openjdk/jre/lib/security/cacerts -file $FILE -alias `basename ${FILE/.crt/}` -noprompt
done
