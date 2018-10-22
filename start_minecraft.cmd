@ECHO off
start /B "minecraft" docker exec -it -w /minecraft_server mc_shop_minecraft sh start.sh
start /B "LaunchServer" docker exec -it -w /minecraft_launch_server mc_shop_minecraft java -jar LaunchServer.jar
