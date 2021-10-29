export FLASK_APP=notejam
# export DBUSER=postgres
# export DBPASS=postgres
# export DBHOST=192.168.49.2
# export DBNAME=postgres
# export DBPORT=32280
# if ! [ -d "migrations/" ]; then
#   # Take action if $DIR exists. #
#   echo "db is not existed"
#   flask db init
# fi
source ven/bin/activate
flask db init
flask db migrate
flask db upgrade