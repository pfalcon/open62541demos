all:
	gcc -DUSE_AMALGAMATION server.c open62541.c -o server
	gcc -DUSE_AMALGAMATION client.c open62541.c -o client

clean:
	rm -rf outdir open62541/BUILD
