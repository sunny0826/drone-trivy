# drone-trivy
![](https://img.shields.io/docker/cloud/automated/guoxudongdocker/drone-trivy.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/guoxudongdocker/drone-trivy.svg)

该镜像用于 `drone` CI ，使用 `trivy` 在 CI 中进行镜像安全扫描

使用方法：

```yaml
- name: 镜像安全扫描
  image: guoxudongdocker/drone-trivy    # 使用 trivy 进行镜像安全扫描，详见：https://github.com/knqyf263/trivy
  volumes:
  - name: trivy
    path: /root/.cache
  - name: docker
    path: /var/run/docker.sock
  commands: 
    - docker save {your-docker-image}:${DRONE_BUILD_NUMBER} -o {your-docker-image}-${DRONE_BUILD_NUMBER}.tar
    - trivy --exit-code 1 --quiet --severity CRITICAL --input {your-docker-image}-${DRONE_BUILD_NUMBER}.tar

volumes:
- name: docker
  host:
    path: /var/run/docker.sock
- name: trivy   # trivy 缓存挂载
  host:
    path: /tmp/cache/.trivy

trigger:
  branch:
  - master
```