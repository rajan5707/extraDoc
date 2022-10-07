echo "Creating Docker Image"
docker login rajan9886886836/second -u rajan9886886836 -p R@j@n5707
docker build -t testshell -f dockerfile.df .
#docker build . -f dockerfile.df -t shtestDoc:shd1
docker tag
if [ $? -ne 0 ] ; then
        echo "ERROR: Docker build failed"
        exit 1
fi
echo "Pushing Docker Image"
docker push testshell
if [ $? -ne 0 ] ; then
        echo "ERROR: Unable to PUSH the image to DOCKER REGISTRY!"
        exit 1
fi
