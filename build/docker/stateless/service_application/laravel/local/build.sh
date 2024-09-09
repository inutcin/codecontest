# Building application image with comand line args
#   --build-arg HOST_UID=`id -u` - pass env variable to build process
#   -t codecontest-app-laravel - create especialy named image 

docker build . --build-arg HOST_UID=`id -u` -t codecontest-app-laravel 
