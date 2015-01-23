# Start MySQL
echo Starting MySQL container...
docker run --name orthomcl-mysql -e MYSQL_ROOT_PASSWORD=asdf1234 -e MYSQL_USER=orthomcl_user -e MYSQL_PASSWORD=shhh_this_is_secret -e MYSQL_DATABASE=orthomcl -d mysql | tee .ortho_mcl_db_container_id | tail -n +2

# Only keep container id in temporary file
echo `head -n 1 .ortho_mcl_db_container_id` > .ortho_mcl_db_container_id

sleep 10

# Start OrthoMCL container
echo Starting OrthoMCL container...
docker run -it --name orthomcl-run --link orthomcl-mysql:mysql -v `pwd`/test_run:/ortho_mcl_run tedsta/orthomcl /bin/bash # | tee .ortho_mcl_container_id | tail -n +2

# Only keep container id in temporary file
echo `head -n 1 .ortho_mcl_container_id` > .ortho_mcl_container_id

# Clean up after MySQL container
docker kill `cat .ortho_mcl_db_container_id`
docker rm `cat .ortho_mcl_db_container_id`
#rm .ortho_mcl_db_container_id

# Clean up after OrthoMCL container
docker kill `cat .ortho_mcl_container_id`
docker rm `cat .ortho_mcl_container_id`
#rm .ortho_mcl_container_id
