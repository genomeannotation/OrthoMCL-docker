# Start MySQL
echo Starting MySQL container...
docker run --name orthomcl-mysql -e MYSQL_ROOT_PASSWORD=asdf1234 -e MYSQL_USER=orthomcl_user -e MYSQL_PASSWORD=shhh_this_is_secret -e MYSQL_DATABASE=orthomcl -d mysql

sleep 30

# Start OrthoMCL container
echo Starting OrthoMCL container...
docker run -it --name orthomcl-run --link orthomcl-mysql:mysql -v `pwd`/test_run:/ortho_mcl_run tedsta/orthomcl /bin/bash 
