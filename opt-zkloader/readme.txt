1.编译打包
gradle build -x test
2.生成镜像
在本地生成镜像
docker build -t zkloader:1.0 .
docker build -t 10.1.245.4:5000/zkloader:1.0 .
docker push 10.1.245.4:5000/zkloader:1.0

3. 运行镜像
docker run -d --name zkloader-1.0  -e "ZK_ADDRESS=10.1.130.84:2181"  zkloader:1.0 
