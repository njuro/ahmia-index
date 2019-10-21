echo "Installing requirements..."
pip3 install -r requirements.txt
echo "Starting ElasticSearch and Kibana"
docker-compose up -d
echo "Creating indices..."
bash setup_index.sh
sleep 5
bash fix_common_issues.sh