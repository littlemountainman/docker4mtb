# Docker for ModusToolBox 

Primarily for CI/CD purposes

Build: 
```
docker buildocker build --build-arg MTB_VERSION=3.3 -t docker-mtb .
```

Run: 
```
docker run --name mtb -it docker-mtb /bin/bash
```
