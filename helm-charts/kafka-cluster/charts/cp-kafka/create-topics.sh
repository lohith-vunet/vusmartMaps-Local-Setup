#! /bin/bash
export KAFKA_OPTS=''
for topic in $(echo ${KAFKA_TOPIC})
do

    kafka-topics  --bootstrap-server broker:9092 --list | grep -w ${topic}
    if [ $? -eq 0 ];then
        echo -e "${YELLOW}$topic topic already exists in the kafka broker${NC}"
    else
        echo "Creating $topic in kafka broker"
        kafka-topics --create --bootstrap-server broker:9092  --topic ${topic} --partitions 4
        if [ $? -ne 0 ]; then
            echo -e "${RED} Not able to create ${topic} in kafka broker.${NC}"
            exit 1
        fi
    fi
done
