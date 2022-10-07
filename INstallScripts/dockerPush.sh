REG_USERNAME="rajan9886886836"
REG_PASSWORD="R@j@n5707"
echo "====> Logging into conatiner"
sudo docker login -u $REG_USERNAME -p $REG_PASSWORD
if [ $? -ne 0 ] ; then
        echo "ERROR: Docker Login failed"
        exit 1
fi
echo "====> Tagging the image"
docker tag api-gateway rajan9886886836/dockertry:api-gateway
docker tag mysql rajan9886886836/dockertry:mysql
docker tag build-bookings-management rajan9886886836/dockertry:build-bookings-management
docker tag build-email-service rajan9886886836/dockertry:build-email-service
docker tag build-chat-service rajan9886886836/dockertry:build-chat-service
docker tag build-payment-service rajan9886886836/dockertry:build-payment-service
docker tag build-user-service rajan9886886836/dockertry:build-user-service
docker tag build-authentication-service rajan9886886836/dockertry:build-authentication-service
docker tag build-eureka-server rajan9886886836/dockertry:build-eureka-server
docker tag build-eureka-server rajan9886886836/dockertry:build-product-webapp
docker tag rabbitmq:management rajan9886886836/dockertry:rabbitmq
docker tag mongo rajan9886886836/dockertry:mongo
docker tag config rajan9886886836/dockertry:config

if [ $? -ne 0 ] ; then
        echo "ERROR: Docker tagging images fialed"
        exit 1
fi


echo "====> Pushing the image to docker repositoy"
docker push  rajan9886886836/dockertry:api-gateway
docker push  rajan9886886836/dockertry:mysql
docker push  rajan9886886836/dockertry:build-bookings-management
docker push  rajan9886886836/dockertry:build-email-service
docker push  rajan9886886836/dockertry:build-chat-service
docker push  rajan9886886836/dockertry:build-payment-service
docker push  rajan9886886836/dockertry:build-user-service
docker push  rajan9886886836/dockertry:build-authentication-service
docker push  rajan9886886836/dockertry:build-eureka-server
docker push  rajan9886886836/dockertry:build-product-webapp
docker push  rajan9886886836/dockertry:rabbitmq
docker push  rajan9886886836/dockertry:mongo
docker push  rajan9886886836/dockertry:config

if [ $? -ne 0 ] ; then
        echo "ERROR: Docker Pushing the images failed"
        exit 1
fi

