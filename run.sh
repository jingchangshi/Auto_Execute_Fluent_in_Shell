echo "Start shell script!"
jou_file="run.jou"
jou_tmp="tmp.jou"
Ind=15000

for (( i=0; i<=40; i++ ))
    do
        echo "Iteration" ${i}
        Ind_New=$(expr ${Ind} + ${i} \* 10)
        echo "Ind_New is:" ${Ind_New}
        sed "/${Ind}/s/${Ind}/${Ind_New}/g" ${jou_file} > ${jou_tmp}
        if [ $? == 1 ]; then
            echo "sed not success!"
            read
        fi
        fluent -g 3d -i ${jou_tmp}
        ls | grep cleanup
        while [ $? == 1 ]; do
            sleep 0.5s
            ls | grep cleanup
        done
        while [ $? == 0 ]; do
            sleep 0.5s
            ls | grep cleanup > tmp
        done
    done
