
```angular2html
docker build -t loadscript-locust .
docker login
docker tag loadscript-locust XXX.azurecr.io/YYY/loadscript-locust
docker push XXX.azurecr.io/YYY/loadscript-locust
```