# Start MySQL
echo Starting MySQL container...
docker run --name orthomcl-mysql -e MYSQL_ROOT_PASSWORD=asdf1234 -e MYSQL_USER=orthomcl_user -e MYSQL_PASSWORD=shhh_this_is_secret -e MYSQL_DATABASE=orthomcl -d mysql | tee .ortho_mcl_db_container_id | head -n -1

# Only keep container id in temporary file
echo `tail -n 1 .ortho_mcl_db_container_id` > .ortho_mcl_db_container_id

sleep 10

# Start OrthoMCL container
echo Starting OrthoMCL container...
docker run -it --name orthomcl-run --link orthomcl-mysql:mysql -v `pwd`/Feb20:/ortho_mcl_run orthomcl /bin/bash

# Clean up after MySQL container
#docker kill `cat .ortho_mcl_db_container_id`
#docker rm `cat .ortho_mcl_db_container_id`
#rm .ortho_mcl_db_container_id
