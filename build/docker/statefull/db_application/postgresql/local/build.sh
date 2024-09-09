# --build-arg HOST_UID=`id -u` - pass env variable to build process
# -t codecontest-app-laravel - create especialy named image 
docker build . -t codecontest-app-database
