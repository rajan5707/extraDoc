echo "==========BUILDING THE PRODUCTION FILES ================"
ng build
echo "==========BUILDING THE IMAGE    ================"
./buildImg.sh
echo "==========RUNNING THE CONATINER ================"
./createCont.sh
echo "========== DONE ================"
